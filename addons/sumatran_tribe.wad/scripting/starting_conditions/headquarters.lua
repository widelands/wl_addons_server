-- =======================================================================
--             Headquarters starting conditions for Sumatrans
-- =======================================================================

include "scripting/infrastructure.lua"

push_textdomain("sumatran_tribe.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _("Headquarters"),
   -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
   tooltip = _("Start the game with your headquarters only"),
   func = function(player, shared_in_start)

   local sf = wl.Game().map.player_slots[player.number].starting_field
   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   hq = prefilled_buildings(player, { "sumatran_headquarters", sf.x, sf.y,
         wares = {
            log = 58,
            reed = 33,
            granite = 40,
            water = 18,
            tropicalwood = 22,
            sandedwood = 4,
            cloth = 5,
            palmleaves = 27,
            crocodile_jacket = 8,
            cassavaroot = 7,
            cassavaleaves = 5,
            fish = 6,
            eggs = 3,
            meal = 4,
            meat = 2,
            food_waste = 4,
            palm_wine = 5,
            coal = 12,
            copper_ore = 4,
            iron_ore = 5,
            iron = 12,
            gold = 4,
            diamond_raw = 2,
            diamond = 7,
            spear = 8,
            pick = 8,
            felling_ax = 6,
            shovel = 10,
            hammer = 12,
            machete = 6,
            kitchen_tools = 2,
            buckets = 10,
            whetstone = 1,
        },
        workers = {
            sumatran_geologist = 4,
            sumatrans_carrier = 30,
            sumatran_carrier_1 = 10,
            sumatrans_builder = 5,
            sumatran_miner = 2,
            sumatran_miner_master = 2,
            sumatran_woodcutter = 3,
            sumatran_forester = 4,
            sumatran_leaf_gatherer = 2,
            sumatran_hunter = 3,
            sumatran_farmer_experienced = 3,
            sumatran_farmer = 1,
            sumatran_reedcutter = 1,
            sumatran_cook = 1,
            sumatran_smelter = 1,
            sumatran_chief = 1,
            sumatran_tribal_chief = 1,
            sumatran_craftsman = 1,
            sumatran_craftsman_experienced = 1,
            sumatran_coppersmith = 1,
            sumatran_stonecutter = 2,
            sumatran_winemaker = 1,
         },
         -- Max health: 3, Max attack: 3, Max defense: 3, Max evade: 1
         soldiers = {
            [{0,0,0,0}] = 40,
         }
      })
end
}

pop_textdomain()
return init
