-- =======================================================================
--    ''Basic Outpost'' starting conditions for Frisians
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("basic-outpost.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Basic Outpost"),
   -- TRANSLATORS: This is the tooltip for the "Basics" starting condition
   tooltip = _("Start the game with your headquarters and a small selection of wares - just enough to create a few tools to help establish a full economy."),
   func = function(player, shared_in_start)

   local sf = wl.Game().map.player_slots[player.number].starting_field
   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   prefilled_buildings(player, { "frisians_headquarters", sf.x, sf.y,
      wares = {
         reed = 6,
         log = 14,
         brick = 20,
         coal = 8,
         granite = 12,
         iron = 4,
         iron_ore = 3,
      },
      workers = {
         frisians_baker = 1,
         frisians_fruit_collector = 1,
         frisians_builder = 2,
         frisians_brickmaker = 1,
         frisians_carrier = 10,
         frisians_charcoal_burner = 1,
         frisians_farmer = 1,
         frisians_fisher = 1,
         frisians_forester = 1,
         frisians_geologist = 1,
         frisians_hunter = 1,
         frisians_landlady = 1,
         frisians_woodcutter = 1,
         frisians_claydigger = 1,
         frisians_miner = 2,
         frisians_smelter = 1,
         frisians_stonemason = 1,
         frisians_blacksmith = 1,
         frisians_reed_farmer = 1,
         frisians_berry_farmer = 1
      },
      soldiers = {
         [{0,0,0,0}] = 6,
      }
   })
end
}
pop_textdomain()
return init
