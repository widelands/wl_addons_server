-- =======================================================================
--                       Wood Gnome win condition
-- =======================================================================

include "scripting/coroutine.lua" -- for sleep
include "scripting/table.lua"
include "scripting/win_conditions/win_condition_functions.lua"

include "scripting/win_conditions/win_condition_texts.lua"

-- Add-ons need to specify this
local wc_textdomain = "1001-wells.wad"

push_textdomain(wc_textdomain, true)

local wc_name = "1001 Wells"
-- This needs to be exactly like wc_name, but localized, because wc_name
-- will be used as the key to fetch the translation in C++
local wc_descname = _("1001 Wells")
local wc_version = 1
local wc_desc = _([[The first player who builds 1001 wells wins]])

local r = {
   name = wc_name,
   description = wc_desc,
   textdomain = wc_textdomain,
   peaceful_mode_allowed = true,
   func = function()
   local plrs = wl.Game().players
   broadcast_objective("win_condition", wc_descname, wc_desc)
   while true do
      sleep(1000)
      check_player_defeated(plrs, lost_game.title, lost_game.body, wc_descname, wc_version)
      for i,p in pairs(plrs) do
         if #p:get_buildings(p.tribe.name .. "_well") > 1000 then
            wl.game.report_result(p, 1)
            for j,loser in pairs(plrs) do
               if p.player_number ~= loser.player_number then
                  wl.game.report_result(loser, 0)
               end
            end
            return
         end
      end
   end
end
}
pop_textdomain()
return r
