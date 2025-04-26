-- =======================================================================
--    ''Basic Outpost'' starting conditions for Lutas’ Atlanteans
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("lutas_atlanteans.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Basic Outpost"),
   -- TRANSLATORS: This is the tooltip for the "Basics" starting condition
   tooltip = _("Start the game with your headquarters and a small selection of wares - just enough to create a few tools to help establish a full economy. Warning: the AI can’t successfully start from this."),

   func = function(player, shared_in_start)

   local sf = wl.Game().map.player_slots[player.number].starting_field
   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   prefilled_buildings(player, { "lutas_atlanteans_headquarters", sf.x, sf.y,
      wares = {
         log = 24,
         planks = 14,
         spidercloth = 4,
         granite = 35, --10
         iron = 4,
         iron_ore = 3,
         coal = 4,
      },
      workers = {
         lutas_atlanteans_baker = 1,
         lutas_atlanteans_blackroot_farmer = 1,
         lutas_atlanteans_builder = 2,
         lutas_atlanteans_charcoal_burner = 1,
         lutas_atlanteans_carrier = 10,
         lutas_atlanteans_farmer = 1,
         lutas_atlanteans_fisher = 1,
         lutas_atlanteans_forester = 1,
         lutas_atlanteans_geologist = 1,
         lutas_atlanteans_hunter = 1,
         lutas_atlanteans_miller = 1,
         lutas_atlanteans_miner = 6,
         lutas_atlanteans_sawyer = 1,
         lutas_atlanteans_smelter = 1,
         lutas_atlanteans_smoker = 1,
         lutas_atlanteans_spiderbreeder = 1,
         lutas_atlanteans_stonecutter = 1,
         lutas_atlanteans_toolsmith = 1,
         lutas_atlanteans_woodcutter = 1,
         lutas_atlanteans_weaver = 1,
      },
      soldiers = {
         [{0,0,0,0}] = 8,
      }
   })
end
}

pop_textdomain()
return init