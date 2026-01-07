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

local textdomain = "field_army.wad"
push_textdomain(textdomain, true)

local wc_name = "Field Army"
local wc_version = 1
local wc_desc = "First player, who has an army, which is in strength equivalent to the selected number of fully trained heroes, stationed in military sites of his own tribe, wins the game. THIS STARTING CONDITION IS NOT LIMITED BY TIME! WITH EVERY 5 MINUTES YOU SELECT 1 HERO. One hero has a value of approximately 11 new untrained soldiers (or points)."
local wc_field_army = "Field Army"
-- This needs to be exactly like wc_name, but localized, because wc_name
-- will be used as the key to fetch the translation in C++
local wc_descname = _("Field Army")
local wc_field_army_i18n = _("Field Army")

local r = {
   name = wc_name,
   description = wc_desc,
   configurable_time = true,
   peaceful_mode_allowed = true,
   textdomain = textdomain,
   func = function()
      local game = wl.Game()
      local A_STRENGTH = math.floor(game.win_condition_duration/5 * 11) -- point limit for winning the game
      local wc_desc1 = _(ngettext("First player, who has an army, which is in strength equivalent to approximately %1% fully trained hero, stationed in military sites of his own tribe, wins the game. One hero has a value of approximately 11 new untrained soldiers (or points).", "First player, who has an army, which is in strength equivalent to approximately %1% fully trained heroes, stationed in military sites of his own tribe, wins the game. One hero has a value of approximately 11 new untrained soldiers (or points).",math.floor(A_STRENGTH/11)):bformat(math.floor(A_STRENGTH/11)))
      local milest_d = 0 -- point interval, in which is the player informed about reached points
      if A_STRENGTH < 115 then
      	milest_d = 25
      elseif A_STRENGTH < 230 then
      	milest_d = 50
      else
      	milest_d = 100
      end
      local last_milestone = 0 -- last milestone (interval) reached
      local whs = 0 -- number of warehouses to check whether the player is still active or not
      local cycle = false -- is not 1. cycle of the main loop?
      local plr_lost = {} -- for names of defeated players
      local plrs = wl.Game().players
      local plr_data = {}
      for i, plr in ipairs(plrs) do
         plr_data[plr.number] = {militarysites = {},
                                 warehouses = {},
                                 army_str  = 0,
                                 milestone  = 0,
                                 naval_sc  = 0, -- start without a warehouse
                                 hero       = {},
                                 base       = {},
                                 incr       = {},
                                }
         for j, w in pairs(plr.tribe.workers) do
            if w.type_name == "soldier" then
               plr_data[plr.number].hero = {w.max_health_level,
                                            w.max_attack_level,
                                            w.max_defense_level,
                                            w.max_evade_level
                                           }
               plr_data[plr.number].base = {w.base_health,
                                            (w.base_min_attack + w.base_max_attack)/2,
                                            w.base_defense,
                                            w.base_evade
                                           }
               plr_data[plr.number].incr = {w.health_incr_per_level,
                                            w.attack_incr_per_level,
                                            w.defense_incr_per_level,
                                            w.evade_incr_per_level
                                           }
            end
         end
         local buildings = plr.tribe.buildings
         local names_ms = {}
         local names_wh = {}
         for k, building in pairs(buildings) do
            if building.type_name == "militarysite" then
               table.insert(names_ms, building.name)
            elseif building.type_name == "warehouse" then
               table.insert(names_wh, building.name)
            end
         end
         plr_data[plr.number].militarysites = names_ms
         plr_data[plr.number].warehouses = names_wh
         d_print("plr_data for: "..tostring(plr))
         d_print("  militarysites:      "..t_print(plr_data[plr.number].militarysites))
         d_print("  hero definition: "..t_print(plr_data[plr.number].hero))
         d_print("  nr. of soldiers: "..tostring(plr_data[plr.number].army_str))
      end

      -- set the objective with the game type for all players
      broadcast_objective("win_condition", wc_descname, wc_desc1)

      -- Install statistics hook
      hooks.custom_statistic = {
         name = wc_field_army,
         pic = "images/wui/buildings/prefer_heroes.png",
         calculator = function(p)
            return plr_data[p.number].army_str
         end,
      }

      -- Create inbox message with statistic when milestone reached
      local function _get_statistic_msg(opponent)
         opponent = opponent or nil
         local title = ""
         local msg = ""
         push_textdomain(textdomain, true)
         if opponent then
            -- TRANSLATORS: "Player x: y points"
            title = _("%1%: %2%"):bformat(opponent.name, ngettext("%1$d point", "%1$d points", last_milestone):bformat(last_milestone))
            -- TRANSLATORS: "Player x has reached y points."
            msg = msg .. _("%1% has reached %2%."):bformat(opponent.name, ngettext("%1$d point", "%1$d points", last_milestone):bformat(last_milestone))
         else
            title = _(ngettext("%1$d point!", "%1$d points!", last_milestone):bformat(last_milestone))
            -- TRANSLATORS: "You have reached x points."
            msg = msg .. _("You have reached %1%."):bformat(ngettext("%1$d point", "%1$d points", last_milestone):bformat(last_milestone))
         end
         msg = msg .. h2(_("Player points:"))
         for i, plr in ipairs(plrs) do
            -- TRANSLATORS: "Player x has y out of z points"
            msg = msg .. li(_("%1% has %2% out of %3%"):bformat(plr.name, plr_data[plr.number].army_str, ngettext("%1$d point", "%1$d points", A_STRENGTH):bformat(A_STRENGTH)))
         end
         pop_textdomain()
         return title, msg
      end

      -- Send inbox message with statistic when milestone reached
      local function inform_players(advanced_player)
         for i, plr in ipairs(plrs) do
            d_print("advanced player ".. tostring(advanced_player).."; plr nr: ".. tostring(plr))
            if advanced_player == plr then
               local title, msg = _get_statistic_msg()
               d_print("send NO popup to player: ".. plr.name)
               send_to_inbox(plr, title, "", {popup=false, heading = msg})
            else
               local title, msg = _get_statistic_msg(advanced_player)
               d_print("send POPUP to player: ".. plr.name)
               send_to_inbox(plr, title, "", {popup=true, heading = msg})
            end
         end
      end

      -- Create message of result screen
      local function _get_result_msg()
         push_textdomain(textdomain, true)
         local scores= "\n"
         for i, plr in ipairs(plrs) do
            -- TRANSLATORS: "Player x: y points"
            scores = scores .. ngettext("%1%: %2% point", "%1%: %2% points", plr_data[plr.number].army_str):bformat(plr.name, plr_data[plr.number].army_str) .. "\n"
         end
         pop_textdomain()
         return scores
      end

      local game_end = false
      local show_msg = false

      -- --------- -------------------------------------------------------------------------------
      -- Main loop -------------------------------------------------------------------------------
      -- --------- -------------------------------------------------------------------------------
      repeat
         sleep(10000)

         -- For a player without warehouses reset army_str and save his name for send_to_inbox
         for i, plr in ipairs(plrs) do
            whs = 0 + plr_data[plr.number].naval_sc
            for j, warehouses in pairs(plr:get_buildings(plr_data[plr.number].warehouses)) do
               for k, warehouse in pairs(warehouses) do
                  whs = whs + 1
               end
            end
            if whs == 0 and not cycle then 
               plr_data[plr.number].naval_sc = 1 -- player starts without a warehouse!
            elseif whs == 0 then
               plr_data[plr.number].army_str = 0
               table.insert(plr_lost, plr.name)
            elseif whs ~= plr_data[plr.number].naval_sc then
               plr_data[plr.number].naval_sc = 0 -- player has a warehouse and plays in the standard mode now
            end
         end

         check_player_defeated(plrs, lost_game_over.title, lost_game_over.body, wc_name, wc_version)
         if #plrs < 2 then
            game_end = true
         else
            for i, plr in pairs(plrs) do

               -- Inform about players who lost
               for o, lost in pairs(plr_lost) do
                  send_to_inbox(plr, _("%1% defeated."):bformat(lost), li(_(ngettext("%1% player remains.", "%1% players remain.",#plrs):bformat(#plrs))), {popup=true})
               end

               -- Check all military sites for soldiers and calculate strength
               local army_str = 0
               for name, militarysites in pairs(plr:get_buildings(plr_data[plr.number].militarysites)) do
                  for j, militarysite in pairs(militarysites) do
                     for k=0, plr_data[plr.number].hero[1] do
                  	for l=0, plr_data[plr.number].hero[2] do
                  	   for m=0, plr_data[plr.number].hero[3] do
                  	      for n=0, plr_data[plr.number].hero[4] do
                                 army_str = army_str + militarysite:get_soldiers({k, l, m, n})*(plr_data[plr.number].base[1]+plr_data[plr.number].incr[1]*k)*(plr_data[plr.number].base[2]+plr_data[plr.number].incr[2]*l)/(2750*(100-(plr_data[plr.number].base[3]+plr_data[plr.number].incr[3]*m))*(100-(plr_data[plr.number].base[4]+plr_data[plr.number].incr[4]*n)))
                  	      end
                  	   end
                  	end
                     end
                  end
               end

               -- Update variables
               -- Army strength changed
               if math.floor(0.5 + army_str) ~= plr_data[plr.number].army_str or not cycle then
                  plr_data[plr.number].army_str = math.floor(0.5 + army_str)
               end
               -- Milestone reached
               if math.floor((0.5 + army_str)/milest_d) > math.floor(plr_data[plr.number].milestone/milest_d) then
                  plr_data[plr.number].milestone = math.floor((0.5 + army_str)/milest_d)*milest_d
                  if cycle then
                  	last_milestone = plr_data[plr.number].milestone
                  	show_msg = true
                  end
               end
               -- Milestone lost
               -- elseif math.floor((0.5 + army_str)/milest_d) < math.floor(plr_data[plr.number].milestone/milest_d) then
                  -- plr_data[plr.number].milestone = math.floor((0.5 + army_str)/milest_d)*milest_d
                  -- show_msg = false
               -- end

               -- Check if there is a winner
               if plr_data[plr.number].army_str >= A_STRENGTH then
                  -- This player won
                  game_end = true
               end

               -- If milestone reached then send a message
               if show_msg then
                  inform_players(plr)
                  show_msg = false
               end
            end -- next player
            plr_lost = {}
            cycle = true
         end
      until game_end

      -- -----------------------------------------------------------------------------------------
      -- The game has ended. Show a window with results to all players.
      -- -----------------------------------------------------------------------------------------
      local scores = _get_result_msg()
      for i, plr in ipairs(plrs) do
         if plr_data[plr.number].army_str >= A_STRENGTH or #plrs < 2 then
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
