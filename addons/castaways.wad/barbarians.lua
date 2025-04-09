-- =======================================================================
--    ''Castaways'' starting conditions for Barbarians
-- =======================================================================

include "scripting/starting_conditions.lua"

push_textdomain("castaways.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Castaways"),
   -- TRANSLATORS: This is the tooltip for the "Castaways" starting condition
   tooltip = _("Start the game with one ships on the ocean, the bare minimum of ware and few workers. Warning: the AI can’t successfully start from this. You will need to find a portspace with direct access to rocks and trees. For unknown maps, game without fog of war recommended."),
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
         log = 3,
         barbarians_lumberjack = 1,
         barbarians_gardener = 1,
         barbarians_stonemason = 1,
         barbarians_soldier = 1,
         barbarians_geologist = 1,
         barbarians_miner = 1,
         barbarians_smelter = 1,
         barbarians_innkeeper = 1,
         barbarians_fisher = 1,
         barbarians_blacksmith = 1,
      },
   })
end
}

pop_textdomain()
return init