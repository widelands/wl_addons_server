include "scripting/coroutine.lua"
include "scripting/messages.lua"
include "scripting/richtext.lua"
include "scripting/win_conditions/win_condition_functions.lua"
include "scripting/set.lua"

-- If changing this value remember to change the description in the addons-file
local MAXHEROES = 4

local textdomain = "fast_explorer_wins.wad"

push_textdomain(textdomain, true)

local wc_name = "Fast Explorer Wins"
-- This needs to be exactly like wc_name, but localized, because wc_name
-- will be used as the key to fetch the translation in C++
local wc_descname = _("Fast Explorer Wins")
local wc_version = 1
local wc_desc = _("The player who has at least 4 fully trained soldiers in a warship wins the game.")
local wc_first_hero = "Number of heroes"
-- This needs to be exactly like wc_first_hero, but localized, because wc_first_hero
-- will be used as the key to fetch the translation in C++
local wc_first_hero_i18n = _("Number of heroes")

local points = { 
                  ship = 100,
                  hero = 200
               }

local r = {

   name = wc_name,
   description = wc_desc,
   peaceful_mode_allowed = true,
   textdomain = textdomain,
   func = function()

      ----------------------------
      -- Initialization of game --
      ----------------------------

      -- Set the objective with the game type for all players
      broadcast_objective("win_condition", wc_descname, wc_desc)

      -- This needs to be set here, because Game() isn't available prior
      wl.Game().allow_diplomacy = false
      wl.Game().allow_naval_warfare = true

      local plrs = wl.Game().players
      local plr_data = {}

      -- Get some definitions of a tribe used by the player
      for i, plr in ipairs(plrs) do
         plr_data[plr.number] = {
                                 tr_sites   = {},  -- internal names of a players tribe training sites
                                 hero_def   = {},  -- the tribes definition of a hero
                                 ship_time  = "",  -- the time the first ship was created
                                 hero_times = {},  -- stores tables like {hero, time}
                                 points     = 0
                                }

         -- Get the definition of a players tribe hero
         for j, w in pairs(plr.tribe.workers) do
            if w.type_name == "soldier" then
               plr_data[plr.number].hero_def = {w.max_health_level,
                                                w.max_attack_level,
                                                w.max_defense_level,
                                                w.max_evade_level
                                               }
            end
         end

         for k, b in ipairs(plr.tribe.buildings) do
            if b.type_name == "trainingsite" then
               table.insert(plr_data[plr.number].tr_sites, b.name)
            end
         end
      end

      ----------------------
      -- Helper functions --
      ----------------------

      local function _is_hero(worker, plr)
         if worker.descr.type_name == "soldier" then
            if worker.health_level == plr_data[plr.number].hero_def[1] and
                  worker.attack_level == plr_data[plr.number].hero_def[2] and
                  worker.defense_level == plr_data[plr.number].hero_def[3] and
                  worker.evade_level == plr_data[plr.number].hero_def[4] then
   
               return true
            end
         end
         return false
      end

      -- Find heroes around training sites
      local function _find_heroes(plr)

         local function _has_hero(plr, hero)
            for i, t in ipairs(plr_data[plr.number].hero_times) do
               for h, time in pairs(t) do
                  if h == hero then
                     return true
                  end
               end
            end
            return false
         end

         for name, tr_sites in pairs(plr:get_buildings(plr_data[plr.number].tr_sites)) do
            for i, ts in ipairs(tr_sites) do
               local fields = ts.fields[1]:region(4)
               for j, f in ipairs(fields) do
                  local bobs = f.bobs
                  for k, bob in ipairs(bobs) do
                     if _is_hero(bob, plr) then
                        -- A hero was found
                        if not _has_hero(plr, bob) then
                           -- This hero is really new, e.g. didn't walks around
                           -- the trainingsite while going from a warehouse to
                           -- another warehouse
                           table.insert(plr_data[plr.number].hero_times, {[bob] = wl.Game().time})
                           plr_data[plr.number].points = plr_data[plr.number].points + points.hero
                           return true
                        end
                     end
                  end
               end
            end
         end
         return false
      end

      -- Get warships and check for heroes inside this ship
      local function _get_hero_on_warships(plr)
         local ships = plr:get_ships()
         local hero_on_board = 0

         for i, ship in ipairs(ships) do
            if ship.type == "warship" then
               local workers = ship:get_workers("")
               for j, w in ipairs(workers) do
                  if _is_hero(w, plr) then
                     hero_on_board = hero_on_board + 1
                  end
               end
            end
         end
         return hero_on_board
      end

      -- Create message of result screen
      local function _get_result_msg()

         push_textdomain(textdomain, true)

         local no_time = pgettext("sign indicating no time value", "-")

         local function _format_time(ms)
            if ms == "" then return no_time end
            local hh = (ms // (60 * 60 * 1000)) % 24
            local mm = (ms // (60 * 1000)) % 60
            local ss = (ms // 1000) % 60
   
            -- TRANSLATORS: A time string hh:mm:ss like 10:03:55
            return _("%1$02d:%2$02d:%3$02d"):bformat(hh, mm, ss)
         end

         local title = _("Game Over!")
         local text = p("align=center", h1(_("Time: %1$s (hh:mm:ss)"):bformat(_format_time(wl.Game().time))))

         -- Create a table like summary with 4 columns
         local col1 = "width=40%"   -- Name of player
         local col2 = "width=20%"   -- Used tribe
         local col3 = "width=20%"   -- Time of ship creation
         local col4 = "width=20%"   -- Times of heroes

         -- Used for the space of the three columns
         -- col1 + col2 + col3
         local spacer = div("width=80%", "")
         local row_height = 20
         local abs_height = row_height
         local plr_vspace = 5
         local plr_results = ""
         local headers = div("width=95% background=333333",
                                                      -- TRANSLATORS: Header of table column Playername
                              div(col1, p("align=left", styles.as_font("wui_info_panel_heading", _("Player")))) ..
                                                      -- TRANSLATORS: Header of table column Tribename
                              div(col2, p("align=left", styles.as_font("wui_info_panel_heading", _("Tribe"))))..
                                                      -- TRANSLATORS: Header of table column the time a ship was created
                              div(col3, styles.as_font("wui_info_panel_heading", _("Ship at"))) ..
                                                      -- TRANSLATORS: Header of table column of times heroes were created
                              div(col4, styles.as_font("wui_info_panel_heading", _("Heroes at")))
                            )

         -- Sort the players
         local sorted_plrs = {}
         for nr, data in pairs(plr_data) do
            sorted_plrs[nr] = data.points
         end
         
         sorted_plrs = rank_players(sorted_plrs, plrs)
         
         for i, sorted in ipairs(sorted_plrs) do

            -- We need to loop the players because indexing wl.Game().players
            -- won't work if a playerslot is not set.
            local plr = ""
            for j, p in ipairs(plrs) do
               if p.number == sorted.players[1].number then
                  plr = p
               end
            end

            abs_height = abs_height + row_height

            local plr_rows = div(col1, p("align=left", plr.name)) ..
                             div(col2, p("align=left", plr.tribe.descname)) ..
                             div(col3, p(_format_time(plr_data[plr.number].ship_time)))

            if #plr_data[plr.number].hero_times < 1 then
               -- no hero
               plr_rows = plr_rows .. div(col4, p(no_time))
            else
               for j, times in ipairs(plr_data[plr.number].hero_times) do
                  for h, time in pairs(times) do
                     abs_height = abs_height + row_height
                     if j == 1 then
                        plr_rows = plr_rows .. div(col4, p(_format_time(time)))
                     else
                        plr_rows = plr_rows .. spacer .. div(col4, p(_format_time(time)))
                     end
                  end
               end
            end

            plr_results = plr_results .. div("width=95% background=444444", plr_rows)
            plr_results = plr_results .. vspace(plr_vspace)
            abs_height = abs_height + plr_vspace

         end

         abs_height = abs_height + 140  -- 140 = Place needed for text below
         text = text ..  div("width=100% background=333333", p("align=center", headers .. plr_results))
         text = text .. vspace(10) .. p("align=center", _("Widelands Version: %1$s"):bformat(get_build_id()))
         text = text .. p("align=center",
                  -- TRANSLATORS: Placeholder is "this topic in the Widelands forum"
                  _("Please make a screenshot by pressing %1$s and post it in %2$s"):bformat(wl.ui.get_shortcut("screenshot"), a(
                  -- TRANSLATORS: Will be inserted into "... and post it in %2$s"
                  _("this topic in the Widelands forum"),
                  "url", "https://www.widelands.org/forum/topic/6084/"))
                  )

         pop_textdomain()

         return title, text, abs_height
      end

      -- Create inbox message with statistic
      local function _get_statistic_msg(subj, opponent)
         opponent = opponent or nil
         local title = ""
         local msg = ""

         push_textdomain(textdomain, true)

         if opponent then
            if subj == "ship" then
               title = _("Ship created!")
               msg = msg .. p(_("%1$s has created a ship!"):bformat(opponent.name))
            else
               title = _("Hero created!")
               msg = msg .. p(_("%1$s has created a hero!"):bformat(opponent.name))
            end
         else
            if subj == "ship" then
               title = _("You have a new ship!")
            else
               title = _("You have a new hero!")
            end
         end

         msg = msg .. h2(_("Statistics:"))

         for i, plr in ipairs(plrs) do
            -- TRANSLATORS: "Player: Name of player"
            msg = msg .. h3(_("Player: %1$s"):bformat(plr.name))
            -- TRANSLATORS: "Heroes: Amount of heroes"
            msg = msg .. li(_("Heroes: %1$d "):bformat(#plr_data[plr.number].hero_times))

            local ships = plr:get_ships()
            -- TRANSLATORS: "Ships: Amount of ships"
            msg = msg .. li(_("Ships: %1$d"):bformat(#ships))
         end

         pop_textdomain()

         return title, msg
      end

      local function _inform_players(hero_creator, subj)
         for i, plr in ipairs(plrs) do
            if hero_creator == plr then
               local title, msg = _get_statistic_msg(subj)
               send_to_inbox(plr, title, "", {popup=false, heading = msg})
            else
               local title, msg = _get_statistic_msg(subj, hero_creator)
               send_to_inbox(plr, title, "", {popup=true, heading = msg})
            end
         end
      end

      local game_end = false
      local show_msg = false

      -- Main loop
      repeat
         sleep(1000)

         for i, plr in ipairs(plrs) do

            -- Check for ships
            local ships = plr:get_ships()
            if #ships >= 1 and plr_data[plr.number].ship_time == "" then

               plr_data[plr.number].ship_time = wl.Game().time
               plr_data[plr.number].points = plr_data[plr.number].points + points.ship
               _inform_players(plr, "ship")

            end

            -- Check for new heroes
            if _find_heroes(plr) then
               _inform_players(plr, "hero")
            end

            -- Check heroes on ships
            local hero_on_board = _get_hero_on_warships(plr)
            if hero_on_board >= MAXHEROES then
               game_end = true
            end

         end
      until game_end

      -- The game has ended. Show a window with results to all players
      -- wl.game.report_result() and wl.ui.show_messagebox() prevent
      -- using shortcut F11 to make a screenshot

      -- Pause the game
      wl.Game().desired_speed = 0

      local title, text, height = _get_result_msg()
      for i, plr in ipairs(plrs) do
         if plr.number == wl.Game().interactive_player then
            plr:message_box(title, rt(text), {w=500, h=height, modal=false})
         end
      end
   end
}
pop_textdomain()
return r
