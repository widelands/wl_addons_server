-- =======================================================================
--              Village Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Village",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"Start the game with a small peaceful village",
    func =  function(player, shared_in_start)

    local sf = wl.Game().map.player_slots[player.number].starting_field
    if shared_in_start then
      sf = shared_in_start
    else
      player:allow_workers("all")
    end

    prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
        wares = {
            water = 511,
            log = 192,
            granite = 64,
            reed = 64,
            coal = 64,
            iron = 48,
            blackwood = 32,
            planks = 32,
            cloth = 32,
            ore = 32,
            spidercloth = 32,
            marble = 32,
            quartz = 32,
            marble_column = 24,
            diamond = 24,
            basket = 12,
            buckets = 12,
            saw = 12,
            hammer = 12,
            scythe = 12,
            felling_ax = 12,
            pick = 12,
            fire_tongs = 4,
            gold = 4
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
    place_building_in_region(player, "europeans_recruitement_center_basic", sf:region(6), {
    })
    place_building_in_region(player, "europeans_smithy_level_1", sf:region(6), {
        inputs = {planks = 4, iron = 4},
    })
    place_building_in_region(player, "europeans_sawmill_advanced", sf:region(10), {
        inputs = {log = 8},
    })
    place_building_in_region(player, "europeans_stonemasons_house", sf:region(10), {
        inputs = {marble = 8, granite = 8, clay = 6, water = 6, coal = 6},
    })
    place_building_in_region(player, "europeans_weaving_mill_normal", sf:region(12), {
        inputs = {spider_silk = 8},
    })
    place_building_in_region(player, "europeans_spiderfarm", sf:region(12), {
        inputs = {water = 6, corn = 6},
    })
    place_building_in_region(player, "europeans_reed_yard", sf:region(16), {
        inputs = {water = 6},
    })
    place_building_in_region(player, "europeans_farm_level_1", sf:region(16), {
    })
    place_building_in_region(player, "europeans_well_basic", sf:region(16), {
    })
    place_building_in_region(player, "europeans_well_basic", sf:region(16), {
    })
end
}

pop_textdomain()
return init
