include "scripting/coroutine.lua"
include "scripting/win_conditions/win_condition_functions.lua"
include "scripting/win_conditions/win_condition_texts.lua"
include "scripting/richtext.lua"

local debug = true
local function d_print(text)
   if debug then print(text) end
end

-- If changing this value remember to change it also in the addons-file
local MAXHEROES = 4

push_textdomain("first_hero_wins.wad", true)

local wc_name = "First Heroes Wins"
-- This needs to be exactly like wc_name, but localized, because wc_name
-- will be used as the key to fetch the translation in C++
local wc_descname = _[[First Heroes Wins]]
local wc_version = 1
local wc_desc = _[[The player who has at least %1s heroes in his warehouses wins the game.]]:bformat(MAXHEROES)
local wc_first_hero = "Number of heroes"
-- This needs to be exactly like wc_first_hero, but localized, because wc_first_hero
-- will be used as the key to fetch the translation in C++
local wc_first_hero_i18n = _[[Number of heroes]]

local r = {
   name = wc_name,
   description = wc_desc,
   peaceful_mode_allowed = true,
   func = function()
      local plr_data = {}
      local plrs = wl.Game().players
      for i, plr in pairs(plrs) do
         plr_data[plr] = {
                          warehouses = {},
                          nr_heroes  = 0,
                          hero       = {}
                         }
         for j, w in pairs(plr.tribe.workers) do
            if w.type_name == "soldier" then
               d_print("Hero levels for: ".. plr.name..  "; Using tribe:".. plr.tribe.name)
               d_print("{".. w.max_health_level..",".. w.max_attack_level..","..w.max_defense_level..",".. w.max_evade_level.."}")
               plr_data[plr].hero = {w.max_health_level,
                           w.max_attack_level,
                           w.max_defense_level,
                           w.max_evade_level}
            end
         end
         local buildings = plr.tribe.buildings
         local names = {}
         for j, building in pairs(buildings) do
            if building.type_name == "warehouse" then
               table.insert(names, building.name)
            end
         end
         plr_data[plr].warehouses = names
      end

      -- set the objective with the game type for all players
      broadcast_objective("win_condition", wc_descname, wc_desc)

      -- Table and Function for statistic hook
      local heroes_per_player = {}
      local function _count_heroes()
         for i, plr in pairs(plrs) do
            heroes_per_player[plr.number] = plr_data[plr].nr_heroes
         end
      end
      -- Install statistics hook
      hooks.custom_statistic = {
         name = wc_first_hero,
         pic = "images/wui/buildings/prefer_heroes.png",
         calculator = function(p)
            _count_heroes()
            return heroes_per_player[p.number] or 0
            
         end,
      }

      local function _get_statistic()
         local msg = h1(_[[Hero Statistic:]])
         for i, plr in pairs(plrs) do
            -- Translators: "Player # has # Heroe(s)"
            msg = msg .. li(_[[Player %1s has ]]:bformat(i)..npgettext("nr_heroes", "%1% hero", "%1% heroes",1):bformat(plr_data[plr].nr_heroes))
         end
         return msg
      end

      local game_end = false
      local show_msg = false
      repeat
         sleep(5000)
         check_player_defeated(plrs, lost_game_over.title, lost_game_over.body, wc_name, wc_version)
         if #plrs < 2 then 
            game_end = true 
            break 
         end
         for i, plr in pairs(plrs) do
            local data = plr_data[plr]
            local nr_heroes = 0
            local buildings = plr:get_buildings(data.warehouses)
            for name, tbl in pairs(buildings) do
               for j, building in pairs(tbl) do
                  d_print("found wh: ".. name .. " at: " .. tostring(building.fields[1]) .. " for: "..plr.name)
                  nr_heroes = nr_heroes + building:get_soldiers(data.hero)
               end
            end
            if nr_heroes > data.nr_heroes then
               data.nr_heroes = nr_heroes
               show_msg = true
            end
            if data.nr_heroes >= MAXHEROES then
               game_end = true
               show_msg = false
            end
            if show_msg then
               local msg = _get_statistic()
               if plr.number ~= wl.Game().interactive_player then
                  local title = _[[Hero created!]]
                  broadcast(plrs, title, "", {popup=true, heading = msg})
               else
                  local title = _[[You have a new Hero!]]
                  broadcast(plrs, title, "", {heading = msg})
               end
               show_msg = false
            end
         end
      until game_end

      for i, plr in pairs(plrs) do
         local data = plr_data[plr]
         _count_heroes()
         -- Looks like report_result() does not accept wl-richtext
         local scores= "\n"
         for i, nr in pairs(heroes_per_player) do
            -- Translators: Player #: # heroe(s)
            scores = scores.._[[Player %1s: ]]:bformat(i)..npgettext("nr_heroes", "%1% hero", "%1% heroes",1):bformat(nr).."\n"
         end
         if data.nr_heroes >= MAXHEROES then
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
