-- =======================================================================
--              Village Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Normal Village",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"Start the game with a village with some normal buildings. Disabled seafaring because of lack of compatibility with terraforming (diking of water bodies).",
    func =  function(player, shared_in_start)

    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
      sf = shared_in_start
    else
      player:allow_workers("all")
    end
    
    player:forbid_buildings{"europeans_headquarters", "europeans_port", "europeans_shipyard_basic", "europeans_shipyard_normal", "europeans_shipyard_advanced"}
    
    local h = player:place_building("europeans_fortress", sf, false, true)
    h:set_soldiers{[{2,2,2,2}] = 12}

    place_building_in_region(player, "europeans_warehouse", sf:region(8), {
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
            europeans_builder = 32,
            europeans_worker_normal = 32,
            europeans_farmer_normal = 16,
            europeans_miner_normal = 12,
            europeans_trader = 8,
            europeans_trainer_normal = 8,
            europeans_lumberjack_normal = 6,
            europeans_forester_normal = 6,
            europeans_stonecutter_normal = 4,
            europeans_claydigger_normal = 4,
      },
        soldiers = {
            [{2,2,2,2}] = 16,
      }
    })
    sleep(5000)
    place_building_in_region(player, "europeans_well_level_2", sf:region(8), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_well_level_2", sf:region(8), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_well_level_2", sf:region(10), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_well_level_2", sf:region(10), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_farm_normal", sf:region(16), {
        inputs = {water = 4},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_farm_normal", sf:region(16), {
        inputs = {water = 4},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_sawmill_normal", sf:region(12), {
        inputs = {log = 6},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_weaving_mill_normal", sf:region(12), {
        inputs = {reed = 4},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_stonemasons_house_normal", sf:region(12), {
        inputs = {water = 6, granite = 6, clay = 6, coal = 4},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_lumberjacks_house_normal", sf:region(12), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_foresters_house_normal", sf:region(12), {
        inputs = {water = 6},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_lumberjacks_house_normal", sf:region(12), {
    })
    sleep(5000)
    place_building_in_region(player, "europeans_foresters_house_normal", sf:region(12), {
        inputs = {water = 6},
    })
    sleep(5000)
    place_building_in_region(player, "europeans_quarry_normal", sf:region(12), {
    })
end
}

pop_textdomain()
return init
