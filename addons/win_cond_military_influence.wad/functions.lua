include("scripting/coroutine.lua")
include("scripting/richtext.lua")
include("scripting/messages.lua")
include("scripting/win_conditions/win_condition_functions.lua")

include(path.dirname(__file__) .. "helpers.lua")

local wc_dir = "win_cond_military_influence.wad"
push_textdomain(wc_dir, true)

local max_area = 0
local soldier_descrs = {}
local max_soldier_levels = {}
local max_soldier_strengths = {}
local min_soldier_strengths = {}

local num_to_idx = {}
local all_points = {}
local last_calculation_time = 0
local function update_wc_info() end

local function calculate_points()
   local game = wl.Game()

   local gametime = game.time
   if last_calculation_time > 0 and gametime < (last_calculation_time + 10000) then
      return
   end

   last_calculation_time = gametime

   -- oops, general statistics is not exported to lua

   local owned_fields = game.map:count_owned_valuable_fields()

   for idx,plr in ipairs(game.players) do
      local num_milsites = 0
      local guarded_area = 0
      local guards_strength = 0
      local total_capacity = 0
      local num_guards = 0
      local soldierstat = 0
      local soldier_levels = 0
      local found_soldiers = 0
      local heroes = 0

      -- Walk all militarysites, calculate total strength of garrisoned soldiers and
      -- guarded area weighted by the strength of the garrisoned soldiers.
      -- Also calculate the soldier statistics from soldiers in all buildings.
      local plr_buildings = plr:get_buildings("all")
      for n,bt in pairs(plr_buildings) do
         if #bt > 0 then
            local bd = bt[1].descr
            local is_milsite = bd.type_name == "militarysite"

            if is_milsite or bd.type_name == "warehouse" or bd.type_name == "trainingsite" then
               local conquer_area = 0

               if is_milsite then
                  num_milsites = num_milsites + #bt
                  conquer_area = controlled_fields(bd.conquers)
                  guarded_area = guarded_area + #bt * conquer_area
                  total_capacity = total_capacity + #bt * bd.max_number_of_soldiers
               end

               for j,b in ipairs(bt) do
                  local sums = soldiersums(b, is_milsite, max_soldier_levels[idx], soldier_descrs[idx])
                  found_soldiers = found_soldiers + sums.count
                  soldier_levels = soldier_levels + sums.levels
                  soldierstat = soldierstat + sums.stats
                  heroes = heroes + sums.heroes

                  if is_milsite then
                     guards_strength = guards_strength + sums.strength
                     num_guards = num_guards + sums.count
                     if sums.count == 0 then
                        -- no cheating with empty buildings
                        guarded_area = guarded_area - conquer_area
                     end
                  end
               end
            end
         end
      end

--[[
-- needs v1.4~
      local plr_ships = plr:get_ships()
      for n,ship in pairs(plr_ships) do
         local sums = soldiersums(ship, false, max_soldier_levels[idx], nil)
         found_soldiers = found_soldiers + sums.count
         soldier_levels = soldier_levels + sums.levels
         soldierstat = soldierstat + sums.stats
      end
]]

      local total_soldiers = plr:get_workers(soldier_descrs[idx].name)
      -- soldiers on the roads
-- and ships, see above
      local uncounted_soldiers = total_soldiers - found_soldiers

      all_points[idx] = {
         total_area = owned_fields[plr.number],
         num_milsites = num_milsites,
         total_capacity = total_capacity,
         guarded_area = guarded_area,
         guards_strength = guards_strength,
         soldierstat = soldierstat,
         total_levels = soldier_levels,
         total_soldiers = total_soldiers,
         found_soldiers = found_soldiers,
         num_guards = num_guards,
         uncounted_soldiers = uncounted_soldiers,
         heroes = heroes,

         points = math.exp(math.log(owned_fields[plr.number] * guarded_area) / 6 +
                           math.log(soldierstat * guards_strength) / 3),
      }
   end

   update_wc_info()
end


local function li_d(t)
   return p("•" .. space() .. t)
end

-- this is not right, but these are the only colours accessible by styles.color()
local function score_colour(sc)
   return font("color=" .. styles.color("campaign_bar_thron"), string.bformat("%d", sc))
end

local function generate_score_info(pidx)
   local game = wl.Game()
   local plr = game.players[pidx]

   calculate_points()
   local stats = all_points[pidx]
   local hours = last_calculation_time // (3600 * 1000)
   local minutes = last_calculation_time // (60 * 1000) % 60
   local seconds = last_calculation_time // 1000 % 60
   
   local average_fill = 0
   local average_strength = 0
   if stats.total_capacity > 0.01 then
      average_fill = 100 * stats.num_guards / stats.total_capacity
      average_strength = 100 * stats.guards_strength / stats.total_capacity / max_soldier_strengths[pidx]
   end

   push_textdomain(wc_dir, true)

   -- TRANSLATORS: Gametime as hours:minutes, e.g. 2:30
   local timestr = _("%1$d:%2$02d:%3$02d"):bformat(hours, minutes, seconds)

   local infotxt =
      -- TRANSLATORS: first placeholder is player name, second is game time, third is tribe
      h2(_("Military Influence Score for %1$s at %2$s with %3$s:"):bformat(
         plr.name, timestr, plr.tribe.descname)
      ) ..
      div("width=100%",
         p("align=center", styles.as_font_from_p("wui_heading_1", score_colour(stats.points)))
      ) ..

      h3(_("Area info")) ..
      li_d(b(_("Area score: ") ..
         score_colour(math.sqrt(stats.total_area * stats.guarded_area))
      )) ..
      li_d(b(_("Total area: %d"):bformat(stats.total_area))) ..
      li_d(b(_("Area controlled by military buildings: %d"):bformat(stats.guarded_area))) ..
      li_d(_("Conquerable map area: %d"):bformat(max_area)) ..
      li_d(_("Player owns %.1f%% of the conquerable map area"):bformat(100 * stats.total_area / max_area)) ..
      li_d(_("Number of military buildings: %d"):bformat(stats.num_milsites)) ..

      h3(_("Soldiers info")) ..
      li_d(b(_("Soldiers score: ") ..
         score_colour(math.sqrt(stats.soldierstat * stats.guards_strength))
      )) ..
      li_d(b(_("Soldiers statistics score: %d"):bformat(stats.soldierstat))) ..
      li_d(b(_("Total effective strength of guards: %d"):bformat(stats.guards_strength))) ..
      li_d(_("Total number of soldiers: %d"):bformat(stats.total_soldiers)) ..
      li_d(_("Soldiers in buildings: %d"):bformat(stats.found_soldiers)) ..
      li_d(_("Soldiers on roads and ships: %d"):bformat(stats.uncounted_soldiers)) ..
      li_d(_("Number of heroes: %d"):bformat(stats.heroes)) ..
      li_d(_("Sum of all soldier levels: %d"):bformat(stats.total_levels)) ..
      li_d(_("Total number of guards: %d"):bformat(stats.num_guards)) ..
      li_d(_("%.1f%% of available positions"):bformat(average_fill)) ..
      li_d(_("Average strength of garrisons: %.1f%%"):bformat(average_strength))

   pop_textdomain()

   return infotxt
end


local helptext_common =
   h2(_("Calculation method")) ..
   p(_("The final score is a weighted geometric mean of four scores:")) ..
   li(_("the total owned area")) ..
   li(_("the sum of conquer areas of military sites")) ..
   li(_("the total soldier statistics score")) ..
   li(_("the total effective strength of soldiers in military sites")) ..
   p(_("The areas are counted with half weight. That means that first the area score is " ..
       "calculated as the square root of the product of the two partial area scores, then " ..
       "the final score is the third root of the product of the area score and the two " ..
       "partial soldier scores.")) ..
   p(_("The soldier statistics assigns a score to each soldier between 1 and 20 depending on " ..
       "the sum of training levels, using a quadratic formula. Please note that soldiers on " ..
       "roads and ships are not counted in the calculation because of technical limitations.")) ..
   p(_("The theoretical effective strength is calculated from the actual battle values:")) ..
   p(space(styles.get_size("ui_default_indent")) ..
     _("strength = a * h / (1 - d / 100) / (1 - e / 100) / 10000000")) ..
   p(_("(a: average attack, h: health, d: defense, e: evade)"))
-- end of helptext_common


local function helptext_strength(pidx)
   push_textdomain(wc_dir, true)

   local strength_info
   if pidx == nil then
      strength_info =
         p(_("The effective strength of the soldiers is different for each tribe. It is between " ..
             "around 2.7 for rookies and around 30 for heroes for the official tribes."))
   else
      strength_info =
         p(_("Effective strength of soldiers of the %s tribe:"):bformat(
            wl.Game().players[pidx].tribe.descname)
         ) ..
         li(_("Rookie: %.2f"):bformat(min_soldier_strengths[pidx])) ..
         li(_("Hero: %.2f"):bformat(max_soldier_strengths[pidx]))
   end

   pop_textdomain()

   return strength_info
end


local helptext_rationale =
   h3(_("Rationale")) ..
   p(_("The total area and the soldier statistics are meant to be the same as the corresponding " ..
       "values in the general statistics, with the mentioned limitation of the soldier score. " ..
       "The military site scores are meant to measure the actual military strength in case of " ..
       "battles.")) ..
   p(_("Using the geometric mean of the two partial area scores means that guarded areas are " ..
       "worth more than unguarded areas, and new buildings that expand your territory are " ..
       "worth more than ones in already guarded areas. Similarly, soldiers in military sites " ..
       "are worth more than ones in warehouses.")) ..
   p(_("Two kinds of soldier points are used because the effective strength makes comparison " ..
       "between different tribes more realistic, but the soldier statistics rewards training " ..
       "more.")) ..
   p(_("The area score gets less weight than the soldier score because it is usually much " ..
       "easier, faster and cheaper to expand your territory than to train your soldiers, " ..
       "but it is the strength of your army that decides battles in the end, so a strong " ..
       "army can easily take large territories from a weak one."))


local table_row = table_row_format(10, 12)
local building_info_header = h3(_("Buildings")) .. table_row:bformat(
   b(_("Military site")),
   b(_("Max. soldiers")),
   b(_("Max. soldier strength")),
   b(_("Conquer area")),
   b(_("Conquer area / soldier")),
   b(_("Max. strength / conquer area")),
   b(_("Score with all heroes")),
   b(_("Score / hero")),
   b(_("Score with all rookies")),
   b(_("Score / rookie"))
)

local function soldier_and_building_strengths(pidx)
   push_textdomain(wc_dir, true)

   local milsites = {}

   for i,bd in ipairs(wl.Game().players[pidx].tribe.buildings) do
      if bd.type_name == "militarysite" then
         local conquer_area = controlled_fields(bd.conquers)
         local max_guards_strength = max_soldier_strengths[pidx] * bd.max_number_of_soldiers
         local max_pts = math.sqrt(conquer_area * max_guards_strength)
         local all_rookies_strength = min_soldier_strengths[pidx] * bd.max_number_of_soldiers
         local all_rookies_pts = math.sqrt(conquer_area * all_rookies_strength)

         table.insert(milsites, {
            info = table_row:bformat(
               bd.descname,
               string.bformat("%d", bd.max_number_of_soldiers),
               string.bformat("%.1f", max_guards_strength),
               string.bformat("%d", conquer_area),
               string.bformat("%.1f", conquer_area / bd.max_number_of_soldiers),
               string.bformat("%.2f", max_guards_strength / conquer_area),
               string.bformat("%.1f", max_pts),
               string.bformat("%.1f", max_pts / bd.max_number_of_soldiers),
               string.bformat("%.1f", all_rookies_pts),
               string.bformat("%.1f", all_rookies_pts / bd.max_number_of_soldiers)
            ),
            max_pts = max_pts,
         })
      end
   end

   table.sort(milsites, function(a, b)
      return a.max_pts < b.max_pts
   end)

   local building_info = building_info_header
   for i,b in ipairs(milsites) do
      building_info = building_info .. b.info
   end

   local strength_info =
      h2(_("Background information")) ..
      h3(_("Soldiers")) ..
      helptext_strength(pidx) ..
      li(_("Rookie is %.1f%% of hero"):bformat(100 * min_soldier_strengths[pidx] / max_soldier_strengths[pidx])) ..
      li(_("Hero is %.1f times as strong as rookie"):bformat(max_soldier_strengths[pidx] / min_soldier_strengths[pidx])) ..
      building_info ..
      vspace() ..
      p(_("(The building scores are only indicative of the potential strength of each building itself, " ..
          "they are not directly related to the scoring of the win condition.)"))

   pop_textdomain()

   return strength_info
end


-- Info window functions
local info_window_name = "military_influence_info"
local info_window_scoretxt = "plrscoretxt"

-- this probably has to be global for the keyboard shortcut
function show_wc_info(keep)
   local game = wl.Game()
   local mv = wl.ui.MapView()

   local w = mv.windows[info_window_name]
   if w and keep ~= true then
      w:close()
      return
   end

   push_textdomain(wc_dir, true)
   local title = _("Score Info")

   -- tab definitions
   local tabs = {}

   local ipidx = nil

   for i,p in ipairs(game.players) do
      if game.interactive_player == 0 or p.number == game.interactive_player then
         local postfix = ""
         local title = _("Score")
         if game.interactive_player == 0 then
            postfix = "_" .. i
            title = p.name
         end

         table.insert(tabs, {
            name = "plrscoreinfo" .. postfix,
            title = title,
            panel = {
               widget = "multilinetextarea",
               name = info_window_scoretxt .. postfix,
               w = messagebox_w_step(0),
               h = messagebox_h_step(3),
               scroll_mode = "normal",
               text = rt(generate_score_info(i)),
            },
         })

         if p.number == game.interactive_player then
            ipidx = i
            break
         end
      end
   end

   if ipidx ~= nil then
      table.insert(tabs, {
         name = "plrstrengths",
         title = _("Background Info"),
         panel = {
            widget = "multilinetextarea",
            name = "plrsoldiersbuildingstxt",
            w = math.min(2 * styles.get_size("campaign_message_box_default_w"), mv.width - 100),
            h = messagebox_h_step(3),
            scroll_mode = "normal",
            text = rt(soldier_and_building_strengths(ipidx)),
         },
      })
   end

   table.insert(tabs,  {
      name = "commonhelp",
      title = _("Help"),
      panel = {
         widget = "multilinetextarea",
         name = "plrhelptxt",
         w = messagebox_w_step(5),
         h = messagebox_h_step(6),
         scroll_mode = "normal",
         text = rt(helptext_common .. helptext_strength(ipidx) .. helptext_rationale),
      },
   })

   pop_textdomain()

   -- window definition
   mv:create_child({
      widget = "unique_window",
      registry = info_window_name,
      name = info_window_name,
      title = title,
      content = {
         widget = "tabpanel",
         name = "mil_inf_tabs",
         active = tabs[1].name,
         tabs = tabs,
      },
   })
end

update_wc_info = function()
   local game = wl.Game()
   local w = wl.ui.MapView().windows[info_window_name]
   if w == nil then
      return
   end

   local ipidx
   for i,p in ipairs(game.players) do
      if game.interactive_player == 0 or p.number == game.interactive_player then
         local postfix = ""
         if game.interactive_player == 0 then
            postfix = "_" .. i
         end

         w:get_child(info_window_scoretxt .. postfix).text = rt(generate_score_info(i))

         if p.number == game.interactive_player then
            break
         end
      end
   end
end


-- Only create hourly saves in singleplayer challenge mode
local function save(game, timestamp)
   if #game.players == 1 and game.players[1].number == game.interactive_player then
      local tribe
      for i,p in ipairs(game.players) do
         if p.number == game.interactive_player then
            tribe = p.tribe.name
            break
         end
      end
      game:save(string.bformat("military_influence_%s_%s", tribe, timestamp))
   end
end


-- End of game
local function warn_before_end()
   local game = wl.Game()

   local before = 15
   if game.win_condition_duration <= 60 then
      before = 5
   end

   wake_me((game.win_condition_duration - before) * 60 * 1000)

   push_textdomain(wc_dir, true)
   broadcast(game.players, _("The End is Near!"), format_remaining_time(before), {popup = true})
   pop_textdomain()
end


local function game_over()
   local game = wl.Game()

   local teams = {}
   local active_teams = {}
   local solo_players = {}
   local best_score = 0

   for idx,p in ipairs(game.players) do
      local t = p.team
      if t == 0 then
         table.insert(solo_players, idx)
         if all_points[idx].points > best_score then
            best_score = all_points[idx].points
         end
      else
         if teams[t] == nil then
            table.insert(active_teams, t)
            teams[t] = { players = { idx }, points = all_points[idx].points }
         else
            table.insert(teams[t].players, idx)
            teams[t].points = teams[t].points + all_points[idx].points
         end

         if teams[t].points > best_score then
            best_score = teams[t].points
         end
      end
   end

   for i,idx in ipairs(solo_players) do
      local result = 1
      if all_points[idx].points < best_score then
         result = 0
      end
      if game.players[idx].end_result == 255 then
         wl.game.report_result(game.players[idx], result,
            string.bformat("score=%.1f", all_points[idx].points)
         )
      end
   end

   for i,t in ipairs(active_teams) do
      local result = 1
      if teams[t].points < best_score then
         result = 0
      end
      for j,idx in ipairs(teams[t].players) do
         if game.players[idx].end_result == 255 then
            wl.game.report_result(game.players[idx], result,
               string.bformat("score=%.1f;team_score=%.1f", all_points[idx].points, teams[t].points)
            )
         end
      end
   end
end


-- Side quests
local side_quest_conquer_title = _("Side quest: Conquer the whole map area")
local side_quest_conquer_text = _(
   "Conquer the whole area of the map as fast as you can. It only counts if you guard it too: " ..
   "the sum of the conquer areas of military sites has to be 120% of the owned area."
)
local side_quest_conquer_done_title = _("Map conquered")
local side_quest_conquer_done = _("Congratulations! You have conquered the whole map.")

local function side_quest_conquer()
   local game = wl.Game()

   local obj = game.players[1]:add_objective(
      "sq_conquer", side_quest_conquer_title, side_quest_conquer_text
   )

   -- actually only 99%
   local needed_area = max_area * 99 // 100
   local needed_guarded = needed_area * 120 // 100

   while not obj.done do
      sleep(12867)
      calculate_points()
      for i,p in ipairs(game.players) do
         if all_points[i].total_area >= needed_area and
            all_points[i].guarded_area >= needed_guarded
         then
            obj.done = true
            if #game.players == 1 then
               game.desired_speed = 0
               show_wc_info(true)
            end
            p:message_box(side_quest_conquer_done_title, side_quest_conquer_done,
               { w = messagebox_w_step(0), h = messagebox_h_step(-5), modal = false }
            )
            break
         end
      end
   end
end


local needed_heroes = 50
local side_quest_heroes_title = _("Side quest: Train heroes")
local side_quest_heroes_text = _("Train %d heroes as fast as you can."):bformat(needed_heroes)
local side_quest_heroes_done_title = _("Heroes trained")
local side_quest_heroes_done = _("Congratulations! You have trained %d heroes."):bformat(needed_heroes)

local function side_quest_heroes()
   local game = wl.Game()

   local obj = game.players[1]:add_objective(
      "sq_heroes", side_quest_heroes_title, side_quest_heroes_text
   )

   while not obj.done do
      sleep(13793)
      calculate_points()
      for i,p in ipairs(game.players) do
         if all_points[i].heroes >= needed_heroes then
            obj.done = true
            if #game.players == 1 then
               game.desired_speed = 0
               show_wc_info(true)
            end
            p:message_box(side_quest_heroes_done_title, side_quest_heroes_done,
               { w = messagebox_w_step(0), h = messagebox_h_step(-5), modal = false }
            )
            break
         end
      end
   end
end


-- Main win condition scripts

--- Initialisation

local wc_stats = _("Military Influence")
local stats_icon = path.dirname(__file__) .. "stats_mil_inf.png"

local function wc_init()
   local game = wl.Game()

   max_area = game.map:count_conquerable_fields()

   for idx,player in ipairs(game.players) do
      num_to_idx[player.number] = idx

      local sd
      for wi,d in ipairs(player.tribe.workers) do
         if d.type_name == "soldier" then
            sd = d
            break
         end
      end
      soldier_descrs[idx] = sd
      max_soldier_levels[idx] = sd.max_attack_level + sd.max_health_level +
                                sd.max_defense_level + sd.max_evade_level
      max_soldier_strengths[idx] = max_strength(sd)
      min_soldier_strengths[idx] = min_strength(sd)
   end

   hooks.custom_statistic = {
      name = wc_stats,
      pic = stats_icon,
      calculator = function(p)
         calculate_points()
         return math.floor(all_points[num_to_idx[p.number]].points)
      end,
   }
end

--- Main function

 -- This must be exactly the same as name in init.lua, but localized, because name
 -- will be used as the key to fetch the translation in C++.
local wc_descname = _("Military Influence")

local wc_message = _(
   "Expand your territory, train your soldiers, and guard your territory with military sites " ..
   "filled with heroes. You have to do all of them to get a really good score. " ..
   "Highest score after %s wins."
)



local result_title = _("Final Score")

local function wc_func()
   local game = wl.Game()

   broadcast_objective("win_condition", wc_descname,
      wc_message:bformat(format_remaining_raw_time(game.win_condition_duration))
   )

   run(side_quest_conquer)
   run(side_quest_heroes)

   run(warn_before_end)

   local hour = 1
   local lasthour = (game.win_condition_duration - 1) // 60
   while hour <= lasthour do
      local next_save_time = hour * 3600 * 1000
      wake_me(next_save_time)
      save(game, string.bformat("%02dh", hour))
      hour = hour + 1
   end
   wake_me(game.win_condition_duration * 60 * 1000)
   save(game, "end_of_game")

   game.desired_speed = 0

   last_calculation_time = 0  -- force fresh calculation
   calculate_points()

   show_wc_info(true)
   if #game.players > 1 then
      game_over()
   end
end

pop_textdomain()
return { wc_init, wc_func }
