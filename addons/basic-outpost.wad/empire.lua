-- =======================================================================
--    ''Basic Outpost'' starting conditions for Empire
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

   prefilled_buildings(player, { "empire_headquarters", sf.x, sf.y,
      wares = {
         log = 20,
         planks = 14,
         granite = 10,
         iron = 4,
         iron_ore = 3,
         coal = 4,
         marble = 7,
         marble_column = 1,
      },
      workers = {
         empire_baker = 1,
         empire_brewer = 1,
         empire_builder = 2,
         empire_carpenter = 1,
         empire_carrier = 10,
         empire_charcoal_burner = 1,
         empire_farmer = 1,
         empire_fisher = 1,
         empire_forester = 1,
         empire_geologist = 1,
         empire_hunter = 1,
         empire_innkeeper = 1,
         empire_lumberjack = 1,
         empire_miller = 1,
         empire_miner = 3,
         empire_smelter = 1,
         empire_stonemason = 2,
         empire_toolsmith = 1,
         empire_vinefarmer = 1,
         empire_vintner = 1
      },
      soldiers = {
         [{0,0,0,0}] = 8,
      }
   })
end
}
pop_textdomain()
return init
