-- =======================================================================
--              Village Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Normal Village",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"Start the game with a village with some normal buildings. Useful starting condition for the AI.",
    func =  function(player, shared_in_start)

    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
      sf = shared_in_start
    else
      player:allow_workers("all")
    end
    
    local h = player:place_building("europeans_fortress", sf, false, true)
    h:set_soldiers{[{1,1,1,1}] = 18}

    place_building_in_region(player, "europeans_warehouse_normal", sf:region(6), {
        wares = {
            water = 255,
            log = 192,
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
    place_building_in_region(player, "europeans_recruitement_center_normal", sf:region(8), {
    })
    place_building_in_region(player, "europeans_toolsmithy_normal", sf:region(8), {
        inputs = {planks = 4, iron = 4, coal = 4},
    })
    place_building_in_region(player, "europeans_sawmill_normal", sf:region(10), {
        inputs = {log = 8},
    })
    place_building_in_region(player, "europeans_stonemasons_house", sf:region(10), {
        inputs = {marble = 8, granite = 8, clay = 6, water = 6, coal = 4},
    })
    place_building_in_region(player, "europeans_weaving_mill_normal", sf:region(12), {
        inputs = {spider_silk = 6, reed = 6},
    })
    place_building_in_region(player, "europeans_spiderfarm", sf:region(12), {
        inputs = {water = 6, corn = 6},
    })
    place_building_in_region(player, "europeans_reed_yard", sf:region(16), {
        inputs = {water = 6},
    })
    place_building_in_region(player, "europeans_farm_level_1", sf:region(16), {
    })
    place_building_in_region(player, "europeans_well_level_2", sf:region(16), {
    })
    place_building_in_region(player, "europeans_well_level_2", sf:region(16), {
    })
end
}

pop_textdomain()
return init