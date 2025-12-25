-- =======================================================================
--               Castaways starting conditions for Gauls
-- =======================================================================

include "scripting/starting_conditions.lua"

push_textdomain("gauls.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Castaways"),
   -- TRANSLATORS: This is the tooltip for the "Castaways" starting condition
   tooltip = _("Start the game with one ships on the ocean, the bare minimum of ware and few workers. Warning: the AI can’t successfully start from this. You will need to find a portspace with direct access to rocks and trees. For unknown maps, game without fog of war recommended."),
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
         log = 3,
         brick = 5,
         planks = 2,
         reed = 3,
         gauls_woodcutter = 2,
         gauls_forester = 1,
         gauls_brickmaker = 1,
         gauls_soldier = 1,
         gauls_stonecutter = 1,
         gauls_farmer = 2,
         gauls_miller = 1,
         gauls_geologist = 1,
         gauls_miner = 1,
         gauls_smelter = 1,
         gauls_claydigger = 1,
         gauls_craftsman = 1,
         gauls_cook = 1,
         gauls_baker = 1,
         gauls_charcoal_burner = 1,
      },
   })
end
}

pop_textdomain()
return init