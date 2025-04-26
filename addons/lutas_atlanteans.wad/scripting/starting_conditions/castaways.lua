-- =======================================================================
--               Castaways starting conditions for Lutas’ Atlanteans
-- =======================================================================

include "scripting/starting_conditions.lua"

push_textdomain("lutas_atlanteans.wad", true)

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
         log = 2,
	 planks = 2,
         spidercloth = 1,
         lutas_atlanteans_woodcutter = 2, -- only one necessary
         lutas_atlanteans_forester = 1, -- not necessary
         lutas_atlanteans_stonecutter = 1,
         lutas_atlanteans_miner = 3, -- only two necessary
         lutas_atlanteans_sawyer = 1,
         lutas_atlanteans_fisher = 1, --not necesary
         lutas_atlanteans_smoker = 1,
         lutas_atlanteans_blackroot_farmer = 1,
         lutas_atlanteans_spiderbreeder = 1,
         lutas_atlanteans_baker = 1,
         lutas_atlanteans_farmer = 1,
         lutas_atlanteans_geologist = 1,
         lutas_atlanteans_smelter = 1,
         lutas_atlanteans_toolsmith = 1,
         lutas_atlanteans_soldier = 1,
      },
   })
end
}

pop_textdomain()
return init