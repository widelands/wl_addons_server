push_textdomain("editor_analyse_map.wad", true)

include "scripting/richtext.lua"
include "scripting/table.lua"
include "addons/editor_analyse_map.wad/helper_functions.lua"

local map = wl.Editor().map
local map_view = wl.ui.MapView()
local settings_window = map_view:get_child("choose_statistic_window")
local progress_window = map_view:get_child("progress_window")

local note1 = _("Calculating all the data for a whole map can take some time. For really big maps, like Europe v1.2, investigating needs also round about 1.5 GB free memory!")
local note2 = _("The Editor does not react for this time!")
local note3 = _("If you are sure click the button below and be patient …")
settings_window:get_child("whole_map_hint").text=rt(
                                          p(note1)..
                                          p_font("color=ff9999", note2)..
                                          p(note3)
                                          )

-- Restrict the spinbox max value for plr_radius to the half of smallest map dimension
settings_window:get_child("plr_radius"):set_interval(2, (map.width < map.height and map.width or map.height) // 2)

map_view:get_child("result_window").visible = false
progress_window.visible = false

if settings_window.visible == false then
   settings_window.visible = true
end

-- Change spinbox title
local children = settings_window:get_child("players_box").children
local count = 0
for i, box in ipairs(children) do
   for j, child in ipairs(box.children) do
      if child.state == true then
         count = count + 1
      end
   end
end
settings_window:get_child("spinbox_label").text = npgettext("around_player_position:", "Investigate around the player position:", "Investigate around the player positions:", count)


function update_progressbar(s, mem)
   progress_window.visible = true
   if settings_window:get_child("show_mem").state then
      progress_window:get_child("progress_title").text = _("Memory usage: %1$10.2f MB"):bformat(mem/1024)
   end
   progress_window:get_child("progressbar").state = progress_window:get_child("progressbar").state + s
   progress_window:force_redraw()
end


local richtext = p(
                  -- TRANSLATORS: Placeholder is "this post in the Widelands forum"
                  _("For information about the results look at %s"):bformat(a(
                  -- TRANSLATORS: Will be inserted into "For information about the results look at %s"
                  _("this post in the Widelands forum"),
                  "url", "https://www.widelands.org/forum/post/41426/"))
                  )

function whole_map()

   settings_window.visible = false
   local results = {}
   local title = _("Statistic for the whole map")
   local all_plrs = {}
   local fields = get_all_fields()

   for i, pl_slot in ipairs(wl.Editor().map.player_slots) do
      results = analyse_plr_pos(pl_slot)
      table.insert(all_plrs, results)
   end

   richtext = richtext .. h2(_("Players on this map"))
   richtext = richtext .. get_plr_table_rt(all_plrs)
   richtext = richtext .. h2(_("Other findings on this map"))

   progress_window:get_child("progress_title").text = _("Analysing %1$d map fields"):bformat(#fields)

   results = analyse(fields)
   richtext = richtext .. get_other_data_rt(results,
                                            settings_window:get_child("mountain_percent").state,
                                            settings_window:get_child("calc_rocks").state
                                           )

   show_result(title, richtext)
end

function players()

   settings_window.visible = false

   local count = 0
   local radius = settings_window:get_child("plr_radius").value

   for i, pl_slot in ipairs(wl.Editor().map.player_slots) do
      if settings_window:get_child("player_"..i).state == true then
         local results = {}
         local all_players = {}
         local fields = pl_slot.starting_field:region(radius)

         progress_window:get_child("progress_title").text = _("Analysing %1$d map fields for player %2$s"):bformat(#fields, pl_slot.name)
                              -- TRANSLATORS: Placeholder is a number
         richtext = richtext .. h2(_("Vicinity of Player %1$d"):bformat(i)) -- Not players name!

         results = analyse_plr_pos(pl_slot)
         table.insert(all_players, results)
         richtext = richtext .. get_plr_table_rt(all_players)

         richtext = richtext .. h3(_("Findings up to %1$d Fields around this players starting position:"):bformat(radius))
         results = analyse(fields)
         richtext = richtext .. get_other_data_rt(results, 
                                                  settings_window:get_child("mountain_percent").state,
                                                  settings_window:get_child("calc_rocks").state
                                                )
         count = i
      end
   end

   local title = npgettext("statistic_for", "Statistic for a player", "Statistic for players", count)
   show_result(title, richtext)
end

function show_result(title, richtext)

   progress_window.visible = false
   local result_window = map_view:get_child("result_window")
   result_window:get_child("result_text").text = rt(richtext)
   result_window:get_child("title").text = title
   result_window.visible = true

end

-- End GUI functionality


-- Start of analyse methods
-- ========================

-- Gather some descriptions
local rocks_descr = {}
local trees_descr = {}
for i, im in ipairs(wl.Descriptions().immovable_descriptions) do
   -- Rocks
   if im:has_attribute("rocks") then
      table.insert(rocks_descr, im.name)
   end
   -- Trees
   if im.terrain_affinity ~= nil then
      table.insert(trees_descr, im.name)
   end
end

local mountain_res = {"resource_gold", "resource_iron", "resource_coal", "resource_stones"}
local fish_water_res_set = {}   -- Resource names for set fish and water 
local fish_water_ter_def = {}   -- Terrain names for default fish and water
for i, t in ipairs(wl.Descriptions().terrain_descriptions) do
   for j, v_res in ipairs(t.valid_resources) do
      if not is_in(v_res.name, mountain_res) then
         table.insert(fish_water_res_set, v_res.name)
      end
   end
   if t.default_resource then
      -- Default resources are only available on terrains
      table.insert(fish_water_ter_def, t.name)
   end
end
-- End initialization

-- Functions to call
-- =================

function analyse_plr_pos(pl_slot)
   -- Search for the first occurrence of a mineable resource and calculate
   -- the amount of this resource within a radius of 2.
   -- It is not taken into account if the found resource is reachable by
   -- roads or ships.
   -- Returns a table with information about the players vicinity
   -- See get_plr_table_rt() in helper_functions.lua

   local plr_and_vicinity = {}
   plr_and_vicinity[pl_slot.name]={}

   local function get_amount(node, res)
      local amount = 0
      for i, f in ipairs(node:region(2)) do
         if f.resource == res then
            amount = amount + f.resource_amount
         end
      end
      return amount
   end

   local function find_res(res)
      local distance = 0
      local res_found = false
      while not res_found do
         distance = distance + 1
         local region = pl_slot.starting_field:region(distance + 1, distance)
         local amount = 0
         for i, f in ipairs(region) do
            if f.resource == res and f.resource_amount > 0 then
               amount = get_amount(f, res)
               if amount > 0 then
                  -- Apply resource only if found
                  -- We need the players name as key to make ordered_pairs() work properly
                  plr_and_vicinity[pl_slot.name][res]={Start_f=pl_slot.starting_field, Amount=amount, Distance=distance+1, Field=f}
                  res_found = true
               end
               break -- Exit for-loop
            end
         end

         if distance == math.floor(map.width / 2) or distance == math.floor(map.height / 2) then
            plr_and_vicinity[pl_slot.name][res]={Start_f=pl_slot.starting_field, Amount=0, Distance=0, Field=""}
            break    -- Exit while-loop
         end
      end
   end

   for i, resource in ipairs(mountain_res) do
      find_res(resource)
   end
   return plr_and_vicinity
end

function get_all_fields()
   local fields = {}
   for x=0, map.width -1 do
      for y=0, map.height - 1 do
         table.insert(fields, map:get_field(x, y))
      end
   end

   return fields
end
-- End functions to call

-- Main analyse function
-- =====================
function analyse(fields)
   -- Go over given fields and gather some data
   -- Returns the collected data

   print("Mem Analyse start              :", string.format('%12.2f kb', collectgarbage("count")))

   progress_window:get_child("progressbar").state = 0

   local amounts = { mineable_res = {},
                     trees = {},
                     rocks = {},
                     build_plots = {},
                     fish_water = {}
                   }

   local show_progress_at = 100  -- update progressbar only for every 100 fields

   if #fields > 0 then
      map_view:get_child("progress_window"):get_child("progressbar").total = #fields
   end

   for i, f in ipairs(fields) do

      -- Update progressbar
      if math.fmod(i, show_progress_at) == 0 then
         update_progressbar(show_progress_at, collectgarbage("count"))
      end

      -- Mineable Resources
      if is_in(f.resource, mountain_res) then
         -- Prevent bug https://codeberg.org/wl/widelands/issues/4598
         if f.resource_amount > 0 then
            local res = wl.Editor():get_resource_description(f.resource)
            local img = "coal4.png"
            if res.name == "resource_gold" then img = "gold4.png" end
            if res.name == "resource_stones" then img = "stones4.png" end
            if res.name == "resource_iron" then img = "iron4.png" end
            table_add(amounts["mineable_res"], "addons/editor_analyse_map.wad/img/"..img, f.resource_amount)
         end
      end

      -- Terrain resources (Fish, Water)
      -- Needs special treating because of default resources
      -- Resources set with resources tool:
      if is_in(f.resource, fish_water_res_set) then
         if f.resource_amount > 0 then
            local res = wl.Editor():get_resource_description(f.resource)
            local img = "addons/editor_analyse_map.wad/img/fish.png"
            if res.name == "resource_water" then
               img = "addons/editor_analyse_map.wad/img/water.png"
            end
            table_add(amounts["fish_water"], img, f.resource_amount)
         end
      end
      -- Default resources:
      if is_in(f.terr, fish_water_ter_def) then
         local ter_descr = wl.Editor():get_terrain_description(f.terr)
            local img = "fish.png"
            if ter_descr.default_resource.name == "resource_water" then
               img = "water.png"
            end
         table_add(amounts["fish_water"], "addons/editor_analyse_map.wad/img/"..img, ter_descr.default_resource_amount)
      end

      -- Rocks resources
      if f.immovable and is_in(f.immovable.descr.name, rocks_descr) then
         local size = tonumber(string.match(f.immovable.descr.name, '%d'))
         local img = "addons/editor_analyse_map.wad/img/rocks6.png"
         table_add(amounts["rocks"], img, size)
      end

      -- Trees
      if f.immovable and is_in(f.immovable.descr.name, trees_descr) then
         table_add(amounts["trees"], "addons/editor_analyse_map.wad/img/trees.png", 1)
      end

      if settings_window:get_child("build_plots").state then
         -- Building plots
         if f:has_max_caps('mine') then
            table_add(amounts["build_plots"], "addons/editor_analyse_map.wad/img/4_mine_1.png", 1)
         elseif f:has_max_caps('port') then
            table_add(amounts["build_plots"], "addons/editor_analyse_map.wad/img/5_port_1.png", 1)
         elseif f:has_max_caps('big') then
            table_add(amounts["build_plots"], "addons/editor_analyse_map.wad/img/1_big_1.png", 1)
         elseif f:has_max_caps('medium') then
            table_add(amounts["build_plots"], "addons/editor_analyse_map.wad/img/2_medium_1.png", 1)
         elseif f:has_max_caps('small') then
            table_add(amounts["build_plots"], "addons/editor_analyse_map.wad/img/3_small_1.png", 1)
         end
      end
   end

   print("Mem after collecting field data:", string.format('%12.2f kb', collectgarbage("count")))
   fields = nil
   print("Mem after fields=nil           :", string.format('%12.2f kb', collectgarbage("count")))
   collectgarbage()
   print("Mem after collectgarbage      *:", string.format('%12.2f kb', collectgarbage("count")))
   collectgarbage()
   print("Mem after 2. collectgarbage   *:", string.format('%12.2f kb', collectgarbage("count")))

   return amounts

end
pop_textdomain()
