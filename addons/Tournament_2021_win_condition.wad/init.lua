include "scripting/coroutine.lua"
include "scripting/messages.lua"
include "scripting/richtext.lua"
include "scripting/win_conditions/win_condition_functions.lua"
include "scripting/win_conditions/win_condition_texts.lua"

local debug = false
local function d_print(text)
   if debug then print(text) end
end
local function t_print(tbl)
   if debug then
      local t = ""
      for i,v in ipairs(tbl) do
         t = t .. v .. ", "
      end
      return "{"..t.."}"
   end
   return ""
end

-- If changing this value remember to change it also in the addons-file
local MAXHEROES = 10

local textdomain = "Tournament_2021_win_condition.wad"

push_textdomain(textdomain, true)

local wc_name = "Tournament 2021 Win Condition"
-- This needs to be exactly like wc_name, but localized, because wc_name
-- will be used as the key to fetch the translation in C++
local wc_descname = _("Tournament 2021 Win Condition")
local wc_version = 1
local wc_desc = ngettext(
   "The player who has at least %1% fully trained soldier in his warehouses wins the game.",
   "The player who has at least %1% fully trained soldiers in his warehouses wins the game.",
   MAXHEROES):bformat(MAXHEROES)
local wc_first_hero = "Number of heroes"
-- This needs to be exactly like wc_first_hero, but localized, because wc_first_hero
-- will be used as the key to fetch the translation in C++
local wc_first_hero_i18n = _("Number of heroes")

local r = {
   name = wc_name,
   description = wc_desc,
   peaceful_mode_allowed = true,
   textdomain = textdomain,
   func = function()
      local plr_data = {}
      local plrs = wl.Game().players
      for i, plr in ipairs(plrs) do
         plr_data[plr.number] = {warehouses = {},
                                 nr_heroes  = 0,
                                 hero       = {}
                                }
         for j, w in pairs(plr.tribe.workers) do
            if w.type_name == "soldier" then
               plr_data[plr.number].hero = {w.max_health_level,
                                            w.max_attack_level,
                                            w.max_defense_level,
                                            w.max_evade_level
                                           }
            end
         end
         local buildings = plr.tribe.buildings
         local names = {}
         for k, building in pairs(buildings) do
            if building.type_name == "warehouse" then
               table.insert(names, building.name)
            end
         end
         plr_data[plr.number].warehouses = names
         d_print("plr_data for: "..tostring(plr))
         d_print("  warehouses:      "..t_print(plr_data[plr.number].warehouses))
         d_print("  hero definition: "..t_print(plr_data[plr.number].hero))
         d_print("  nr. of soldiers: "..tostring(plr_data[plr.number].nr_heroes))
      end

      -- set the objective with the game type for all players
      broadcast_objective("win_condition", wc_descname, wc_desc)

      -- Install statistics hook
      hooks.custom_statistic = {
         name = wc_first_hero,
         pic = "images/wui/buildings/prefer_heroes.png",
         calculator = function(p)
            return plr_data[p.number].nr_heroes
         end,
      }

      -- Create inbox message with statistic
      local function _get_statistic_msg(opponent)
         opponent = opponent or nil
         local title = ""
         local msg = ""
         push_textdomain(textdomain, true)
         if opponent then
            title = _("Hero created!")
            msg = msg .. p(_("%1% has created a hero!"):bformat(opponent.name))
         else
            title = _("You have a new Hero!")
         end
         msg = msg .. h2(_("Hero Statistics:"))
         for i, plr in ipairs(plrs) do
            -- TRANSLATORS: "Player x has y Heroes"
            msg = msg .. li(_("%1% has %2%"):bformat(plr.name, ngettext("%1% hero", "%1% heroes", plr_data[plr.number].nr_heroes):bformat(plr_data[plr.number].nr_heroes)))
         end
         pop_textdomain()
         return title, msg
      end

      -- Create message of result screen
      -- The result screen don't like wl richtext
      local function _get_result_msg()
         push_textdomain(textdomain, true)
         local scores= "\n"
         for i, plr in ipairs(plrs) do
            -- TRANSLATORS: This is an item in a list in the form "Player Name: 3 heroes"
            scores = scores .. ngettext("%1%: %2% hero", "%1%: %2% heroes", plr_data[plr.number].nr_heroes):bformat(plr.name, plr_data[plr.number].nr_heroes) .. "\n"
         end
         pop_textdomain()
         return scores
      end

      local function inform_players(hero_creator)
         for i, plr in ipairs(plrs) do
            d_print("hero creator ".. tostring(hero_creator).."; plr nr: ".. tostring(plr))
            if hero_creator == plr then
               local title, msg = _get_statistic_msg()
               d_print("send NO popup to player: ".. plr.name)
               send_to_inbox(plr, title, "", {popup=false, heading = msg})
            else
               local title, msg = _get_statistic_msg(hero_creator)
               d_print("send POPUP to player: ".. plr.name)
               send_to_inbox(plr, title, "", {popup=true, heading = msg})
            end
         end
      end

      local game_end = false
      local show_msg = false

      -- Main loop
      repeat
         sleep(5000)
         check_player_defeated(plrs, lost_game_over.title, lost_game_over.body, wc_name, wc_version)
         if #plrs < 2 then
            game_end = true
         else
            for i, plr in ipairs(plrs) do
               local nr_heroes = 0
               -- Check all warehouses for heroes
               for name, warehouses in pairs(plr:get_buildings(plr_data[plr.number].warehouses)) do
                  for j, warehouse in pairs(warehouses) do
                     d_print("Cheat for: ".. tostring(plr) .. " with warehouse: "..warehouse.descr.name.." at: ".. tostring(warehouse.fields[1]))
                     d_print("  wl.Game().map:get_field(".. tostring(warehouse.fields[1].x)..", ".. tostring(warehouse.fields[1].y) .. ").immovable:set_soldiers("..t_print(plr_data[plr.number].hero)..",1 )\n")
                     nr_heroes = nr_heroes + warehouse:get_soldiers(plr_data[plr.number].hero)
                  end
               end
               if nr_heroes > plr_data[plr.number].nr_heroes then
                  -- Amount of created heroes changed
                  plr_data[plr.number].nr_heroes = nr_heroes
                  show_msg = true
               end
               if plr_data[plr.number].nr_heroes >= MAXHEROES then
                  -- This player has reached goal
                  game_end = true
                  show_msg = false
               end
               if show_msg then
                  inform_players(plr)
                  show_msg = false
               end
            end
         end
      until game_end

      -- The game has ended. Show a window with results to all players
      local scores = _get_result_msg()
      for i, plr in ipairs(plrs) do
         if plr_data[plr.number].nr_heroes >= MAXHEROES or #plrs < 2 then
            -- Game won
            wl.game.report_result(plr, 1, make_extra_data(plr, wc_name, wc_version, {score = scores }))
         else
            -- Game lost
            wl.game.report_result(plr, 0, make_extra_data(plr, wc_name, wc_version, {score = scores }))
         end
      end
   end
}
pop_textdomain()
return r
