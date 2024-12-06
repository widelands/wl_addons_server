-- =======================================================================
--       Minimum (Poor Hamlet) starting conditions for Sumatrans
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("sumatran_tribe.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Poor Hamlet"),
   -- TRANSLATORS: This is the tooltip for the "Poor Hamlet" (minimum) starting condition
   tooltip = _("Start the game with just a warehouse and the bare minimum for bootstrapping an economy. Warning: the AI always and human in most of the cases can’t successfully start from this. Do not even try, if you are not prepared for real struggle. Sicilian Pasture map or Crete’s Vineyard map from position of yellow or green player and peaceful mode of play recomended."),
   incompatible_wc = {"scripting/win_conditions/hq_hunter.lua"},

   func = function(player, shared_in_start)
      local sf = wl.Game().map.player_slots[player.number].starting_field
      if shared_in_start then
         sf = shared_in_start
      else
         player:allow_workers("all")
      end

      prefilled_buildings(player, { "sumatran_warehouse", sf.x, sf.y,
         wares = {
            log = 3,
            hammer = 2, -- builder, craftsman
            whetstone = 1, -- craftsman
            felling_ax = 1, -- woodcutter
            pick = 1, -- stonecutter
            shovel = 1, -- forester
            machete = 2, -- leaves gatherer, reedcutter
            diamond = 1, -- furnace
            copper = 1, -- charcoal kiln
            iron = 1, -- smelter
            iron_ore = 5, -- geologist, miner, farmer, water carrier, cook
            crocodile_skin = 2, -- hunter
         },
        workers = {
            sumatran_tribal_chief = 1, -- you can't recruit a chief without already having an experienced tribal chief
         },
         soldiers = {
            [{0,0,0,0}] = 1,
         }
      })

      player:reveal_fields(sf:region(10))
      player:conquer(sf, 9)

      push_textdomain("sumatran_tribe.wad", true)
      player:send_to_inbox(_("Be careful"), _("You have only one iron for each tool you will need to start your economy. Make sure no unneeded tool is created."))
      pop_textdomain()

      check_trees_rocks_poor_hamlet(player, sf, "sumatran_warehouse", {stone = 17}, {log = 4})
   end
}
pop_textdomain()
return init
