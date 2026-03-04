-- =======================================================================
--              New World starting conditions for Hebrews
-- =======================================================================

include "scripting/starting_conditions.lua"

push_textdomain("hebrews_tribe.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("New World"),
   -- TRANSLATORS: This is the tooltip for the "New World" starting condition
   tooltip = _("Start the game with seven ships full of wares on the ocean"),
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
         branch = 4,
         clay = 2,
         granite = 1,
         hebrews_soldier = 1,
         hebrews_farmer = 1,
      },
      {
         branch = 4,
         clay = 2,
         hebrews_soldier = 1,
         hebrews_stonemason = 1,
      },
      {
         clay = 2,
         granite = 1,
         copper_ore = 2,
         hebrews_soldier = 1,
         hebrews_geologist = 1,
         hebrews_talmid_chacham = 1,
      },
      {
         hebrews_geologist = 3,
         copper_ore = 4,
         hebrews_talmid_chacham = 1,
      },
      {
         branch = 8,
         hebrews_stonemason = 1,
      },
      {
         branch = 2,
         clay = 2,
         granite = 1,
         hebrews_stonemason = 1,
         hebrews_talmid = 1,
         hebrews_fisher = 1,
      },
      {
         branch = 2,
         granite = 1,
         hebrews_branch_collector = 3,
         hebrews_shepherd = 1,
         hebrews_donkey = 5,
      },
   })
end
}

pop_textdomain()
return init
