-- =======================================================================
--              Headquarters Starting Conditions for Europeans
-- =======================================================================

include "scripting/infrastructure.lua"
include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"
include "addons/europeans_tribe.wad/scripting/debug.lua"

push_textdomain("europeans_tribe.wad", true)

init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Headquarters",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"Start the game with your headquarters only",
    func =  function(plr, shared_in_start)

    local sf = wl.Game().map.player_slots[plr.number].starting_field
    if shared_in_start then
        sf = shared_in_start
    else
        plr:allow_workers("all")
    end

    plr:forbid_buildings{"europeans_shipyard_advanced", "europeans_shipyard_normal", "europeans_shipyard_basic", "europeans_port"}
    plr:forbid_buildings{"europeans_ferry_yard_advanced", "europeans_ferry_yard_normal", "europeans_ferry_yard_basic"}
    plr:forbid_buildings{"europeans_scouts_house_advanced", "europeans_scouts_house_normal", "europeans_scouts_house_basic"}
    plr:forbid_buildings{"europeans_recruitement_center_advanced", "europeans_recruitement_center_normal"}
    plr:forbid_buildings{"europeans_battlearena_level_1","europeans_battlearena_level_2", "europeans_battlearena_level_3", "europeans_battlearena_level_4"}
    plr:forbid_buildings{"europeans_smithy_level_4", "europeans_smithy_level_5", "europeans_smithy_level_6", "europeans_trainingscamp_level_1", "europeans_trainingscamp_level_2"}
    plr:forbid_buildings{"europeans_smithy_level_7", "europeans_smithy_level_8", "europeans_smithy_level_9", "europeans_trainingscamp_level_3", "europeans_trainingscamp_level_4"}
   
    prefilled_buildings(plr, { "europeans_headquarters", sf.x, sf.y,
            wares = {
                water = 256,
                log = 256,
                granite = 64,
                planks = 64,
                reed = 64,
                cloth = 48,
                iron = 32,
                corn = 32,
                coal = 32,
                spidercloth = 32,
                grout = 32,
                brick = 32,
                marble = 32,
                quartz = 32,
                diamond = 24,
                shovel = 16,
                buckets = 10,
                basket = 8,
                pick = 6,
                fire_tongs = 4,
                hammer = 4,
                saw = 4,
                scythe = 4,
                bread_paddle = 2,
                fishing_net = 2,
                fishing_rod = 2,
                hook_pole = 2,
                hunting_bow = 2,
                hunting_spear = 2,
                milking_tongs = 2,
            },
            workers = {
                europeans_carrier = 32,
                europeans_builder = 16,
                europeans_farmer_basic = 6,
                europeans_trainer = 3,
                europeans_lumberjack_basic = 3,
                europeans_carpenter_basic = 2,
                europeans_stonecutter_basic = 2,
                europeans_stonemason_basic = 2,
                europeans_weaver_basic = 1,
                europeans_weaver_normal = 1,
                europeans_shipwright = 1,
          },
            soldiers = {
                [{0,0,0,0}] = 16,
          }
    })
   
    place_building_in_region(plr, "europeans_sawmill_advanced", sf:region(6), {
        inputs = {log = 8},
    })
    place_building_in_region(plr, "europeans_stonemasons_house", sf:region(6), {
        inputs = {marble = 8, granite = 8, clay = 6, water = 6, coal = 6},
    })
    
    for i = 1, 96 do
        -- Delay of 15 min between actions
        sleep(900000)
        
        -- Ware-dependent activation
        if plr:get_wares("iron") > 15 and plr:get_wares("coal") > 15 and plr:get_wares("planks") > 15 and plr:get_wares("armor") > 7 then
           plr:allow_buildings{"europeans_smithy_level_4", "europeans_smithy_level_5", "europeans_smithy_level_6"}
        end
        if plr:get_wares("iron") > 15 and plr:get_wares("coal") > 15 and plr:get_wares("planks") > 15 and plr:get_wares("gold") > 7 then
           plr:allow_buildings{"europeans_smithy_level_7", "europeans_smithy_level_8", "europeans_smithy_level_9"}
        end
        if plr:get_wares("ration") > 15 and plr:get_wares("beer") > 15 then
           plr:allow_buildings{"europeans_battlearena_basic"}
        end
        if plr:get_wares("snack") > 15 and plr:get_wares("mead") > 15 and plr:get_wares("shield_steel") > 0 then
           plr:allow_buildings{"europeans_battlearena_level_1", "europeans_battlearena_level_2"}
        end
        if plr:get_wares("meal") > 15 and plr:get_wares("wine") > 15 and plr:get_wares("shield_advanced") > 0 then
           plr:allow_buildings{"europeans_battlearena_level_3", "europeans_battlearena_level_4"}
        end
        if plr:get_wares("ration") > 15 and plr:get_wares("spear_advanced") > 0 and plr:get_wares("armor_chain") > 0 then
           plr:allow_buildings{"europeans_trainingscamp_basic"}
        end
        if plr:get_wares("ration") > 15 and plr:get_wares("ax_broad") > 0 and plr:get_wares("armor_helmet") > 0 then
           plr:allow_buildings{"europeans_trainingscamp_level_1"}
        end
        if plr:get_wares("snack") > 15 and plr:get_wares("trident_steel") > 0 and plr:get_wares("helmet_mask") > 0 then
           plr:allow_buildings{"europeans_trainingscamp_level_2"}
        end
        if plr:get_wares("snack") > 15 and plr:get_wares("sword_broad") > 0 and plr:get_wares("armor_gilded") > 0 then
           plr:allow_buildings{"europeans_trainingscamp_level_3"}
        end
        if plr:get_wares("meal") > 15 and plr:get_wares("trident_heavy_double") > 0 and plr:get_wares("helmet_warhelm") > 0 then
           plr:allow_buildings{"europeans_trainingscamp_level_4"}
        end
        if i > 95 then
           plr:allow_buildings("all")
        end 
    end
end
}

pop_textdomain()
return init
