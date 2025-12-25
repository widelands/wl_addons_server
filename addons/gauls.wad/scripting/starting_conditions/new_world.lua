	-- =======================================================================
--              New World starting conditions for Gauls
-- =======================================================================

include "scripting/starting_conditions.lua"

push_textdomain("gauls.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("New World"),
   -- TRANSLATORS: This is the tooltip for the "New World" starting condition
   tooltip = _("Start the game with seven ships full of wares on the ocean"),
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
         log = 2,
         planks = 1,
         reed = 1,
         granite = 1,
         brick = 1,
         iron = 1,
         gauls_woodcutter = 1,
         gauls_forester = 1,
         gauls_claydigger = 1,
         gauls_soldier = 1,
         gauls_stonecutter = 1,
         gauls_toiler = 1,
      },
      {
         log = 2,
         planks = 1,
         reed = 1,
         granite = 1,
         brick = 1,
         iron = 1,
         gauls_woodcutter = 1,
         gauls_forester = 1,
         gauls_soldier = 1,
         gauls_claydigger = 1,
         gauls_miner = 1,
         gauls_charcoal_burner = 1,
      },
      {
         log = 2,
         planks = 1,
         reed = 1,
         granite = 1,
         brick = 1,
         iron = 1,
         gauls_woodcutter = 1,
         gauls_soldier = 1,
         gauls_breeder = 1,
         gauls_water_carrier = 1,
         gauls_fisher = 1,
         gauls_farmer = 1,
      },
      {
         log = 2,
         planks = 1,
         reed = 1,
         granite = 1,
         brick = 1,
         iron = 1,
         gauls_woodcutter = 1,
         gauls_forester = 1,
         gauls_craftsman = 1,
         gauls_soldier = 1,
         gauls_stonecutter = 1,
         gauls_miller = 1,
      },
      {
         log = 2,
         planks = 1,
         reed = 1,
         brick = 1,
         iron = 1,
         gauls_woodcutter = 1,
         gauls_forester = 1,
         gauls_stonecutter = 1,
         gauls_cook = 1,
         gauls_baker = 1,
         gauls_soldier = 1,
         gauls_miner = 1,
      },
      {
         log = 2,
         planks = 1,
         reed = 1,
         brick = 1,
         iron = 1,
         gauls_woodcutter = 1,
         gauls_soldier = 1,
         gauls_geologist = 1,
         gauls_miner = 1,
         gauls_cook = 1,
         gauls_farmer = 1,
         gauls_brickmaker = 1,
      },
      {
         log = 2,
         planks = 1,
         reed = 1,
         granite = 1,
         brick = 1,
         gauls_soldier = 2,
         gauls_geologist = 1,
         gauls_hunter = 1,
         gauls_smelter = 1,
         gauls_craftsman = 1,
         gauls_farmer = 1,
      },
   })
end
}

pop_textdomain()
return init
