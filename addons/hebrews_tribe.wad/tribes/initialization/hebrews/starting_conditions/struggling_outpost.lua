-- =======================================================================
--    Hardcore (Struggling Outpost) starting conditions for Hebrews
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("hebrews_tribe.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Struggling Outpost"),
   -- TRANSLATORS: This is the tooltip for the "Hardcore" starting condition
   tooltip = _("Start the game with just your headquarters and very few wares for bootstrapping an economy. Warning: the AI can't successfully start from this."),
   func = function(player, shared_in_start)

   local sf = wl.Game().map.player_slots[player.number].starting_field
   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   hq = prefilled_buildings(player, { "hebrews_headquarters", sf.x, sf.y,
      wares = {
         branch = 12,
         granite = 2,
      },
      workers = {
         hebrews_talmid_chacham = 1,
         hebrews_builder = 2,
         hebrews_carrier = 10,
         hebrews_talmid = 3,
         hebrews_geologist = 3,
         hebrews_branch_collector = 2,
         hebrews_stonemason = 1,
         hebrews_fisher = 1,
         hebrews_farmer = 1,
         hebrews_shepherd = 1,
         hebrews_donkey = 3,
      },
      soldiers = {
         [{0,0,0,0}] = 2,
      }
   })
end
}

pop_textdomain()
return init
