-- =======================================================================
--    ''Basic Outpost'' starting conditions for Barbarians
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

   prefilled_buildings(player, { "barbarians_headquarters", sf.x, sf.y,
      wares = {
         log = 30,
         blackwood = 7,
         granite = 10,
         grout = 1,
         iron = 4,
         iron_ore = 3,
         coal = 4,
      },
      workers = {
         barbarians_blacksmith = 1,
         barbarians_smelter = 1,
         barbarians_builder = 2,
         barbarians_carrier = 10,
         barbarians_gardener = 1,
         barbarians_geologist = 1,
         barbarians_lime_burner = 1,
         barbarians_lumberjack = 2,
         barbarians_miner = 2,
         barbarians_ranger = 1,
         barbarians_stonemason = 1,
         barbarians_hunter = 1,
         barbarians_fisher = 1,
         barbarians_innkeeper = 1,
         barbarians_charcoal_burner = 1
      },
      soldiers = {
         [{0,0,0,0}] = 8,
      }
   })
end
}

pop_textdomain()
return init
