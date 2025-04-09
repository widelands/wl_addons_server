-- =======================================================================
--    ''Castaways'' starting conditions for Amazons
-- =======================================================================

include "scripting/starting_conditions.lua"

push_textdomain("castaways.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Castaways"),
   -- TRANSLATORS: This is the tooltip for the "Castaways" starting condition
   tooltip = _("Start the game with one ships on the ocean, the bare minimum of ware and few workers. Warning: the AI can’t successfully start from this. You will need to find a portspace with direct access to rocks and trees and dismantle some buildings to spare your building material. Be careful, you have only one quartz for one tool you will need to start your economy. For unknown maps, game without fog of war recommended. A higher game speed is also recommended."),
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
         log = 4,
         rubber = 1, -- rope weaver
         quartz = 1, -- amazons_charcoal_burner = 1,
         amazons_woodcutter = 1,
         amazons_jungle_preserver = 1,
         amazons_stonecutter = 1,
         amazons_stone_carver = 1,
         amazons_liana_cutter = 1,
         amazons_soldier = 1,
      },
   })
end
}

pop_textdomain()
return init