-- =======================================================================
--                 Start conditions for Headquarters
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("new_tribe.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _ "Headquarters",
   -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
   tooltip = _"Start the game with your headquarters only",
   func = function(player, shared_in_start)

   local sf = wl.Game().map.player_slots[player.number].starting_field
   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   hq = prefilled_buildings(player, { "newtribe_headquarters", sf.x, sf.y,
      wares = {
         log = 20,
         granite = 20,
         reed = 10,
         tool = 10
      },
      workers = {
         newtribe_builder = 10,
         newtribe_carrier = 40,
         newtribe_donkey = 5,
         newtribe_toolsmith = 2,
         newtribe_stonecutter = 3,
         newtribe_forester = 3,
         newtribe_woodcutter = 3,
         newtribe_farmer = 4,
         newtribe_fisher = 2,
         newtribe_fishbreeder = 2,
         newtribe_hunter = 1,
         newtribe_geologist = 3,
         newtribe_scout = 1,
         newtribe_trainer = 2,
      },
      soldiers = {
         [{0,0,0,0}] = 45,
      }
   })
end
}

pop_textdomain()
return init
