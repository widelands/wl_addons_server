-- =======================================================================
--                Minimum Starting conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Basic Village",
    -- TRANSLATORS: This is the tooltip for the "Poor Hamlet" (minimum) starting condition
    tooltip = _"Start the game with a small, peaceful village with only basic buildings. Disabled seafaring because of lack of compatibility with terraforming (diking of water bodies).",
    func =  function(player, shared_in_start)
    
    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
      sf = shared_in_start
    else
      player:allow_workers("all")
    end
    
    player:forbid_buildings{"europeans_headquarters", "europeans_port", "europeans_shipyard_basic", "europeans_shipyard_normal", "europeans_shipyard_advanced"}
    
    local h = player:place_building("europeans_castle", sf, false, true)
    h:set_soldiers{[{1,1,1,1}] = 6}

    place_building_in_region(player, "europeans_warehouse", sf:region(3), {
        wares = {
            log = 128,
            reed = 128,
            coal = 64,
            granite = 48,
            blackwood = 32,
            cloth = 32,
            grout = 32,
            water = 32,
            ore = 16,
            planks = 16,
            brick = 16,
            marble = 16,
            marble_column = 8,
            iron = 4,
            gold = 4,
            quartz = 16,
            diamond = 16,
            buckets = 16,
            basket = 16,
            armor_wooden = 8,
            boots_wooden = 8,
            helmet_wooden = 8,
            spear_wooden = 8
        },
        workers = {
            europeans_geologist = 1,
            europeans_carrier = 32,
            europeans_builder = 16,
            europeans_farmer_basic = 16,
            europeans_lumberjack_basic = 8,
            europeans_breeder_basic = 6,
            europeans_miner_basic = 6,
            europeans_forester_basic = 6,
            europeans_stonecutter_basic = 6,
            europeans_trainer_basic = 6,
            europeans_trader = 4,
            europeans_carpenter_basic = 2,
            europeans_charcoal_burner_basic = 2,
            europeans_smith_basic = 2,
            europeans_stonemason_basic = 2,
            europeans_brewer_basic = 1,
            europeans_miller_basic = 1,
            europeans_baker_basic = 1,
            europeans_smelter_basic = 1,
            europeans_weaver_basic = 1,
            europeans_tailor_basic = 1,
            europeans_shoemaker_basic = 1,
            europeans_claydigger_basic = 1
      },
        soldiers = {
            [{1,1,1,1}] = 16,
      }
    })
    sleep(5000)
    place_building_in_region(player, "europeans_well_basic", sf:region(8), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_well_basic", sf:region(8), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_well_basic", sf:region(8), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_well_basic", sf:region(8), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_farm_medium_basic", sf:region(16), {
        inputs = {water = 4},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_farm_medium_basic", sf:region(16), {
        inputs = {water = 4},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_sawmill_basic", sf:region(12), {
        inputs = {log = 4},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_weaving_mill_basic", sf:region(12), {
        inputs = {reed = 4},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_stonemasons_house_basic", sf:region(12), {
        inputs = {water = 6, granite = 6, coal = 4},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_lumberjacks_house_basic", sf:region(12), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_foresters_house_basic", sf:region(12), {
        inputs = {water = 4},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_lumberjacks_house_basic", sf:region(12), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_foresters_house_basic", sf:region(12), {
        inputs = {water = 4},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_quarry_basic", sf:region(12), {
    })
end
}

pop_textdomain()
return init
