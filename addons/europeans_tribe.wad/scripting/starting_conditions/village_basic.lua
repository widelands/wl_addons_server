-- =======================================================================
--                Minimum Starting conditions for europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Basic Village",
    -- TRANSLATORS: This is the tooltip for the "Poor Hamlet" (minimum) starting condition
    tooltip = _"Start the game with a small, peaceful village with only basic buildings. Preferred starting condition for the AI.",
    func =  function(player, shared_in_start)
    
    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
      sf = shared_in_start
    else
      player:allow_workers("all")
    end
    
    local h = player:place_building("europeans_castle", sf, false, true)
    h:set_soldiers{[{1,1,1,1}] = 12}

    place_building_in_region(player, "europeans_warehouse_basic", sf:region(6), {
        wares = {
            water = 127,
            log = 127,
            reed = 127,
            coal = 63,
            granite = 48,
            ore = 15,
            blackwood = 15,
            cloth = 15,
            planks = 15,
            spidercloth = 15,
            marble = 15,
            marble_column = 7,
            iron = 3,
            gold = 3,
            quartz = 15,
            diamond = 15,
            buckets = 15,
            basket = 12,
            pick = 12,
            saw = 9,
            hammer = 9,
            scythe = 9,
            shovel = 9,
            felling_ax = 9,
            fire_tongs = 7,
            milking_tongs = 3,
            needles = 3,
            bread_paddle = 3,
            hook_pole = 3,
            kitchen_tools = 3,
            fishing_net = 3,
            fishing_rod = 3,
            hunting_bow = 3,
            hunting_spear = 3,
            armor = 7,
            tabard = 7,
            spear_wooden = 7
        },
        workers = {
            europeans_carrier = 32,
            europeans_builder = 10,
            europeans_trainer_basic = 5,
            europeans_smith_basic = 2,
            europeans_geologist = 1
      },
        soldiers = {
            [{0,0,0,0}] = 16,
      }
    })
    place_building_in_region(player, "europeans_recruitement_center_basic", sf:region(8), {
    })
    place_building_in_region(player, "europeans_toolsmithy_basic", sf:region(8), {
        inputs = {planks = 4, iron = 4, coal = 4},
    })
    place_building_in_region(player, "europeans_sawmill_basic", sf:region(10), {
        inputs = {log = 8},
    })
    place_building_in_region(player, "europeans_lime_kiln", sf:region(10), {
        inputs = {granite = 8, clay = 6, water = 6, coal = 4},
    })
    place_building_in_region(player, "europeans_weaving_mill_basic", sf:region(12), {
        inputs = {reed = 8},
    })
    place_building_in_region(player, "europeans_reed_yard", sf:region(12), {
        inputs = {water = 6},
    })
    place_building_in_region(player, "europeans_farm_basic", sf:region(16), {
    })
    place_building_in_region(player, "europeans_well_basic", sf:region(16), {
    })
    place_building_in_region(player, "europeans_well_basic", sf:region(16), {
    })
end
}

pop_textdomain()
return init
