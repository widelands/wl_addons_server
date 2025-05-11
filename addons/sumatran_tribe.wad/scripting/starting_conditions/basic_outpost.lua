-- =======================================================================
--    ''Basic Outpost'' starting conditions for Sumatrans
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("sumatran_tribe.wad", true)

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

   prefilled_buildings(player, { "sumatran_headquarters", sf.x, sf.y,
      wares = {
         log = 28,
         tropicalwood = 7,
         stone = 18,
         diamond = 2,
         cloth = 4	,
         palmleaves = 10, 
         reed = 5,
         iron = 4,
         iron_ore = 4,
         copper = 2,
         copper_ore = 1,
         coal = 5,
      },
      workers = {
         sumatran_craftsman = 2,
         sumatran_smelter = 1,
         sumatrans_builder = 2,
         sumatrans_carrier = 10,
         sumatran_reedcutter = 1,
         sumatran_geologist = 1,
         sumatran_leaf_gatherer = 1,
         sumatran_water_carrier = 1,
         sumatran_woodcutter = 2,
         sumatran_miner = 2,
         sumatran_forester = 2,
         sumatran_stonecutter = 1,
         sumatran_hunter = 2,
         sumatran_cook = 1,
         sumatran_farmer = 1,
         sumatran_tribal_chief = 1
      },
      soldiers = {
         [{0,0,0,0}] = 8,
      }
   })
end
}

pop_textdomain()
return init
