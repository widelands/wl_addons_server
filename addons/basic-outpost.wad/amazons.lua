-- =======================================================================
--    ''Basic Outpost'' starting conditions for Amazons
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("basic-outpost.wad", true)

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

   prefilled_buildings(player, { "amazons_headquarters", sf.x, sf.y,
      wares = {
         log = 34,
         ironwood = 3,
         rubber = 6,
         balsa = 2,
         rope = 4,
         granite = 10,
         quartz = 4,
         coal = 4,
      },
      workers = {
         amazons_cook = 2,
         amazons_builder = 2,
         amazons_gold_digger = 1,
         amazons_gold_smelter = 1,
         amazons_carrier = 10,
         amazons_cassava_farmer = 1,
         amazons_cocoa_farmer = 1,
         amazons_stone_carver = 1,
         amazons_geologist = 1,
         amazons_woodcutter = 1,
         amazons_liana_cutter = 2,
         amazons_jungle_preserver = 1,
         amazons_hunter_gatherer = 1,
         amazons_stonecutter = 1,
         amazons_dressmaker = 1,
         amazons_charcoal_burner = 1,
      },
      soldiers = {
         [{0,0,0,0}] = 8,
      }
   })
end
}

pop_textdomain()
return init
