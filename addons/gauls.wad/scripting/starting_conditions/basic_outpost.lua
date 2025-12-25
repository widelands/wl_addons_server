-- =======================================================================
--    ''Basic Outpost'' starting conditions for Gauls
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("gauls.wad", true)

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

   prefilled_buildings(player, { "gauls_headquarters", sf.x, sf.y,
      wares = {
         log = 32,
         planks = 6,
         granite = 25,
         brick = 6,
         reed = 4,
         iron = 4,
         iron_ore = 5,
         coal = 6,
      },
      workers = {
         gauls_craftsman = 1,
         gauls_smelter = 1,
         gauls_charcoal_burner = 1,
         gauls_builder = 2,
         gauls_hunter = 1,
         gauls_geologist = 1,
         gauls_claydigger = 1,
         gauls_brickmaker = 1,
         gauls_water_carrier = 2,
         gauls_woodcutter = 2,
         gauls_miner = 2,
         gauls_forester = 1,
         gauls_stonecutter = 1,
         gauls_toiler = 1,
         gauls_miller = 1,
         gauls_baker = 1,
         gauls_cook = 1,
         gauls_farmer = 2,
      },
      soldiers = {
         [{0,0,0,0}] = 8,
      }
   })
end
}

pop_textdomain()
return init
