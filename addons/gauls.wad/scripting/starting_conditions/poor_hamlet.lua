-- =======================================================================
--       Minimum (Poor Hamlet) starting conditions for Gauls
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("gauls.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Poor Hamlet"),
   -- TRANSLATORS: This is the tooltip for the "Poor Hamlet" (minimum) starting condition
   tooltip = _("Start the game with just a warehouse and the bare minimum for bootstrapping an economy. Your starting position should be close to water. Warning: The AI can’t successfully start from this."),
   incompatible_wc = {"scripting/win_conditions/hq_hunter.lua"},

   func = function(player, shared_in_start)
      local sf = wl.Game().map.player_slots[player.number].starting_field
      if shared_in_start then
         sf = shared_in_start
      else
         player:allow_workers("all")
      end

      prefilled_buildings(player, { "gauls_warehouse", sf.x, sf.y,
         wares = {
            log = 3,
            planks = 1,
            brick = 5,
            reed = 3,
            hammer = 2, -- builder, craftsman
            felling_ax = 1, -- woodcutter
            pick = 1, -- stonecutter
            shovel = 1, -- forester
            scythe = 1, -- farmer
            iron = 5, -- claydigger, brickmaker, charcoalburner, smelter
            iron_ore = 4, -- geologist, miner, miller, baker, cook (one added directly as iron
                          -- because furnace doesn’t allow smelting one pice of iron ore
         },
        workers = {
         },
         soldiers = {
            [{0,0,0,0}] = 1,
         }
      })

      player:reveal_fields(sf:region(10))
      player:conquer(sf, 9)

      push_textdomain("gauls.wad", true)
      player:send_to_inbox(_("Be careful"), _("You have only one iron for each tool you will need to start your economy. Make sure no unneeded tool is created."))
      pop_textdomain()

      check_trees_rocks_poor_hamlet(player, sf, "gauls_warehouse", {granite = 3}, {log = 4})
   end
}
pop_textdomain()
return init
