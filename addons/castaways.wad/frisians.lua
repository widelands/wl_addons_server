-- =======================================================================
--    ''Castaways'' starting conditions for Frisians
-- =======================================================================

include "scripting/starting_conditions.lua"

push_textdomain("castaways.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Castaways"),
   -- TRANSLATORS: This is the tooltip for the "Castaways" starting condition
   tooltip = _("Start the game with one ships on the ocean, the bare minimum of ware and few workers. Warning: the AI can’t successfully start from this. You will need to find a portspace with direct access to trees and dismantle some buildings to spare your building material. For unknown maps, game without fog of war recommended. A higher game speed is also recommended."),
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
         brick = 8, -- quarry to be dismantled
         reed = 2,
         log = 1,
--         coal = 1, -- charcoal burner to be built before brick kiln then dismantled
         frisians_soldier = 1,
         frisians_woodcutter = 1,
         frisians_claydigger = 1,
         frisians_brickmaker = 1,
         frisians_stonemason = 1,
         frisians_reed_farmer = 1,
         frisians_berry_farmer = 1,
         frisians_geologist = 1,
         frisians_miner = 1,
         frisians_smelter = 1,
         frisians_blacksmith = 1,
         frisians_landlady = 1,
      },
   })
end
}

pop_textdomain()
return init