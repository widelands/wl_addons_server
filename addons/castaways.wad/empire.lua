-- =======================================================================
--    ''Castaways'' starting conditions for Empire
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
         log = 2,
         granite = 1,
         planks = 2,
         empire_lumberjack = 1,
         empire_stonemason = 1,
         empire_carpenter = 1,
         empire_innkeeper = 1,
         empire_toolsmith = 1,
         empire_farmer = 1,
         empire_fisher = 1, -- not necessary
         empire_geologist = 1,
         empire_miner = 1,
         empire_smelter = 1,
         empire_soldier = 1,
      },
   })
end
}

pop_textdomain()
return init