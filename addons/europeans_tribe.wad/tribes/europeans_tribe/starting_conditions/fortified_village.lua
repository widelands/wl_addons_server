-- =======================================================================
--                 europeans Fortified Village Starting Conditions
-- =======================================================================

include "scripting/infrastructure.lua"
include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"
include "addons/europeans_tribe.wad/scripting/debug.lua"

push_textdomain("europeans_tribe.wad", true)

init = {
   -- TRANSLATORS: This is the name of a starting condition
   descname = _ "Fortified Village",
   -- TRANSLATORS: This is the tooltip for the "Fortified Village" starting condition
   tooltip = _"Start the game with a big village with advanced castle in its center",
   func =  function(player, shared_in_start)

   local sf = wl.Game().map.player_slots[player.number].starting_field

   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   local sf = wl.Game().map.player_slots[player.number].starting_field
   if shared_in_start then
      sf = shared_in_start
   else
      player:allow_workers("all")
   end

   local h = player:place_building("europeans_advanced_castle", sf, false, true)
   h:set_soldiers{[{4,4,4,4}] = 24}
      
   place_building_in_region(player, "europeans_warehouse_advanced", sf:region(4), {
        wares = {
            water = 256,
            log = 128,
            granite = 64,
            coal = 64,
            reed = 64,
            marble = 48,
            quartz = 48,
            blackwood = 32,
            planks = 32,
            cloth = 32,
            iron = 32,
            diamond = 24,
            spidercloth = 16,
            gold = 4
        },
        workers = {
            europeans_carrier = 32,
            europeans_farmer_basic = 16,
            europeans_builder = 10,
            europeans_miner_basic = 9,
            europeans_trainer = 5,
            europeans_lumberjack_basic = 4,
            europeans_forester_basic = 4,
            europeans_carpenter_basic = 2,
            europeans_stonecutter_basic = 2,
            europeans_stonemason_basic = 2,
            europeans_charcoal_burner_basic = 2,
            europeans_hunter_basic = 2,
            europeans_fisher_basic = 2,
            europeans_fishbreeder = 2,
            europeans_miller_basic = 2,
            europeans_baker_basic = 2,
            europeans_smoker_basic = 2,
            europeans_brewer_basic = 2,
            europeans_breeder_normal = 2,
            europeans_weaver_basic = 2,
            europeans_smelter_basic = 2,
            europeans_smith_basic = 2,
            europeans_shipwright = 2,
            europeans_fishbreeder = 1,
            europeans_beekeeper = 1,
            europeans_gamekeeper = 1,
            europeans_geologist = 1
      },
        soldiers = {
            [{0,0,0,0}] = 16,
      }
   })
   
   place_building_in_region(player, "europeans_recruitement_center_basic", sf:region(6), {
   })
   place_building_in_region(player, "europeans_smithy_level_3", sf:region(6), {
        inputs = {planks = 4, iron = 4},
   })
   place_building_in_region(player, "europeans_sawmill_advanced", sf:region(10), {
        inputs = {log = 8},
   })
   place_building_in_region(player, "europeans_stonemasons_house", sf:region(10), {
        inputs = {marble = 8, granite = 8, clay = 6, water = 6, coal = 6},
   })
   place_building_in_region(player, "europeans_smelting_works_advanced", sf:region(10), {
        inputs = {coal = 8, ore = 8},
   })
   place_building_in_region(player, "europeans_charcoal_kiln_advanced", sf:region(10), {
        inputs = {log = 12},
   })
   place_building_in_region(player, "europeans_weaving_mill_advanced", sf:region(12), {
        inputs = {reed = 6, spider_silk = 6},
   })
   place_building_in_region(player, "europeans_spiderfarm", sf:region(12), {
        inputs = {water = 6, corn = 6},
   })
   place_building_in_region(player, "europeans_sheepfarm", sf:region(12), {
        inputs = {water = 6, blackroot = 6},
   })
   place_building_in_region(player, "europeans_reed_yard", sf:region(16), {
        inputs = {water = 6},
   })
   place_building_in_region(player, "europeans_farm_level_3", sf:region(16), {
        inputs = {water = 6},
   })
   place_building_in_region(player, "europeans_well_advanced", sf:region(16), {
   })
   place_building_in_region(player, "europeans_well_advanced", sf:region(16), {
   })
end
}
pop_textdomain()
return init
