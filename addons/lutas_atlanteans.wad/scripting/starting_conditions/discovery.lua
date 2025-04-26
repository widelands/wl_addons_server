-- =======================================================================
--               Discovery starting conditions for Lutas’ Atlanteans
-- =======================================================================

include "scripting/starting_conditions.lua"

push_textdomain("lutas_atlanteans.wad", true)

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
         log = 2,
         granite = 1,
         planks = 1,
         iron = 2,
         quartz = 1,
         spidercloth = 1,
         lutas_atlanteans_woodcutter = 1,
         lutas_atlanteans_forester = 1,
         lutas_atlanteans_sawyer = 1,
         lutas_atlanteans_fisher = 1,
         lutas_atlanteans_fishbreeder = 1,
         lutas_atlanteans_smoker = 1,
         lutas_atlanteans_soldier = 1,
      },
      {
         log = 2,
         granite = 1,
         planks = 1,
         iron = 1,
         lutas_atlanteans_woodcutter = 1,
         lutas_atlanteans_forester = 1,
         lutas_atlanteans_stonecutter = 1,
         lutas_atlanteans_toolsmith = 1,
         lutas_atlanteans_miner = 2,
         lutas_atlanteans_soldier = 1,
         lutas_atlanteans_blackroot_farmer = 1,
         lutas_atlanteans_baker = 1,
         lutas_atlanteans_farmer = 1,
      },
      {
         log = 2,
         planks = 1,
         granite = 1,
         iron = 1,
         lutas_atlanteans_woodcutter = 1,
         lutas_atlanteans_stonecutter = 1,
         lutas_atlanteans_soldier = 1,
         lutas_atlanteans_spiderbreeder = 1,
         lutas_atlanteans_geologist = 1,
         lutas_atlanteans_miner = 2,
         lutas_atlanteans_smelter = 1,
         lutas_atlanteans_toolsmith = 1,
         lutas_atlanteans_farmer = 1,
      },
   })
end
}

pop_textdomain()
return init