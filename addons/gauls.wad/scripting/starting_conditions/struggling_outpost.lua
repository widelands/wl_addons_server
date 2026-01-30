-- =======================================================================
--    Hardcore (Struggling Outpost) starting conditions for Gauls
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("gauls.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Struggling Outpost"),
   -- TRANSLATORS: This is the tooltip for the "Hardcore" starting condition
   tooltip = _("Start the game with just your headquarters and very few wares for bootstrapping an economy. Warning: the AI can’t successfully start from this."),
   func = function(player, shared_in_start)

   local sf = wl.Game().map.player_slots[player.number].starting_field
   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   hq = prefilled_buildings(player, { "gauls_headquarters", sf.x, sf.y,
      wares = {
         log = 8,
         planks = 2,
         granite = 2,
         brick = 4,
         reed = 2,
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
         [{0,0,0,0}] = 2,
      }
   })
end
}

pop_textdomain()
return init
