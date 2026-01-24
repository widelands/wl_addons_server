-- =======================================================================
--    Hardcore (Struggling Outpost) starting conditions for Sumatrans
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("sumatran_tribe.wad", true)

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

   hq = prefilled_buildings(player, { "sumatran_headquarters", sf.x, sf.y,
      wares = {
         log = 10,
         granite = 24,
         diamond = 1,
         copper = 1,
      },
      workers = {
         sumatran_craftsman = 2,
         sumatran_smelter = 1,
         sumatrans_builder = 2,
         sumatrans_carrier = 10,
         sumatran_reedcutter = 1,
         sumatran_geologist = 1,
         sumatran_leaf_gatherer = 1,
         sumatran_woodcutter = 3,
         sumatran_miner = 2,
         sumatran_forester = 2,
         sumatran_stonecutter = 1,
         sumatran_hunter = 1,
         sumatran_water_carrier = 1,
         sumatran_cook = 2,
         sumatran_farmer = 1,
         sumatran_tribal_chief = 1,
      },
      soldiers = {
         [{0,0,0,0}] = 2,
      }
   })
end
}

pop_textdomain()
return init
