-- =======================================================================
--               Discovery starting conditions for Sumatrans
-- =======================================================================

include "scripting/starting_conditions.lua"

push_textdomain("sumatran_tribe.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Discovery"),
   -- TRANSLATORS: This is the tooltip for the "Discovery" starting condition
   tooltip = _("Start the game with three ships on the ocean and only a handful of supplies"),
   map_tags = {"seafaring"},
   incompatible_wc = {"scripting/win_conditions/hq_hunter.lua"},
   uses_map_starting_position = false,

   func = function(player, shared_in_start)

   local map = wl.Game().map
   local sf = map.player_slots[player.number].starting_field
   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   launch_expeditions(player, {
      {
         log = 5,
         palmleaves = 3,
         stone = 1,
         diamond = 1,
         copper = 1,
         sumatran_woodcutter = 1,
         sumatran_forester = 1,
         sumatran_leaf_gatherer = 1,
         sumatran_soldier = 1,
      },
      {
         tropicalwood = 2,
         palmleaves = 2,
         stone = 1,
         log = 4,
         sumatran_woodcutter = 1,
         sumatran_forester = 1,
         sumatran_stonecutter = 1,
         sumatran_farmer = 1,
         sumatran_reedcutter = 1,
         sumatran_soldier = 1,
      },
      {
         log = 3,
         iron = 1,
         sumatran_woodcutter = 1,
         sumatran_soldier = 1,
         sumatran_geologist = 1,
         sumatran_miner = 2,
         sumatran_smelter = 1,
         sumatran_water_carrier = 1,
         sumatran_craftsman = 1,
         sumatran_cook = 1,
         sumatran_tribal_chief = 1,
         sumatran_hunter = 1,
      },
   })
end
}

pop_textdomain()
return init
