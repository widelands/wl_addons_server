-- =======================================================================
--              Village Starting Conditions for Europeans
-- =======================================================================

include "scripting/infrastructure.lua"
include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"
include "addons/europeans_tribe.wad/scripting/debug.lua"

push_textdomain("europeans_tribe.wad", true)

init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Harbors",
    -- TRANSLATORS: This is the tooltip for the "Headquarters" starting condition
    tooltip = _"Start the game with bundle of ports",
    func =  function(plr, shared_in_start)

    local map = wl.Game().map
    local player_slot = map.player_slots[plr.number]
    local sf = player_slot.starting_field
    if shared_in_start then
       sf = shared_in_start
    else
       plr:allow_workers("all")
    end
   
    if (map.allows_seafaring == true) and (map.number_of_port_spaces > 0) then
        for i, portfield in pairs(map.port_spaces) do
            if (math.abs(portfield.x - sf.x) < 12) and (math.abs(portfield.y - sf.y) < 12) then
                port = prefilled_buildings(plr, { "europeans_port", portfield.x, portfield.y,
                    wares = {},
                    workers = {
                        europeans_carrier = 16,
                        europeans_builder = 12,
                        europeans_farmer_basic = 3,
                        europeans_lumberjack_basic = 2,
                        europeans_carpenter_basic = 1,
                        europeans_stonecutter_basic = 1,
                        europeans_stonemason_basic = 1,
                        europeans_weaver_basic = 1,
                        europeans_weaver_normal = 1,
                        europeans_trainer = 1,
                        europeans_shipwright = 1
                  },
                    soldiers = {
                        [{0,0,0,0}] = 4,
                  }
                })
            end
        end
    else
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
                europeans_builder = 24,
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
    end
    
    local ports = plr:get_buildings("europeans_port")
    
    if #ports > 0 then
        set_ware(plr, "log", math.ceil(320 / #ports))
        set_ware(plr, "planks", math.ceil(128 / #ports))
        set_ware(plr, "water", math.ceil(256/ #ports))
        set_ware(plr, "reed", math.ceil(64 / #ports))
        set_ware(plr, "granite", math.ceil(64 / #ports))
        set_ware(plr, "cloth", math.ceil(48 / #ports))
        set_ware(plr, "iron", math.ceil(32 / #ports))
        set_ware(plr, "coal", math.ceil(32 / #ports))
        set_ware(plr, "corn", math.ceil(32 / #ports))
        set_ware(plr, "spidercloth", math.ceil(32 / #ports))
        set_ware(plr, "grout", math.ceil(24 / #ports))
        set_ware(plr, "brick", math.ceil(24 / #ports))
        set_ware(plr, "marble", math.ceil(24 / #ports))
        set_ware(plr, "quartz", math.ceil(24 / #ports))
        set_ware(plr, "diamond", math.ceil(16 / #ports))
        set_ware(plr, "shovel", math.ceil(16 / #ports))
        set_ware(plr, "buckets", math.ceil(10 / #ports))
        set_ware(plr, "basket", math.ceil(8 / #ports))
        set_ware(plr, "pick", math.ceil(6 / #ports))
        set_ware(plr, "fire_tongs", math.ceil(4 / #ports))
        set_ware(plr, "hammer", math.ceil(4 / #ports))
        set_ware(plr, "saw", math.ceil(4 / #ports))
        set_ware(plr, "scythe", math.ceil(4 / #ports))
        set_ware(plr, "bread_paddle", math.ceil(2 / #ports))
        set_ware(plr, "fishing_net", math.ceil(2 / #ports))
        set_ware(plr, "fishing_rod", math.ceil(2 / #ports))
        set_ware(plr, "hook_pole", math.ceil(2 / #ports))
        set_ware(plr, "hunting_bow", math.ceil(2 / #ports))
        set_ware(plr, "hunting_spear", math.ceil(2 / #ports))
        set_ware(plr, "milking_tongs", math.ceil(2 / #ports))
        set_ware(plr, "armor", math.ceil(6 / #ports))
        set_ware(plr, "tabard", math.ceil(6 / #ports))
        set_ware(plr, "spear_wooden", math.ceil(12 / #ports))
        place_ship_random(plr, 128)
    end
    
    print (player_slot.name, sf.x, sf.y)
    if (player_slot.name == "Sweden") and (sf.x == 24) and (sf.y == 422) then
        place_port(plr, 23, 452)
        place_building(plr, 23, 452, 6, "europeans_clay_pit")
        place_building(plr, 23, 452, 6, "europeans_fishers_house_normal")
    end 
    if (player_slot.name == "England") and (sf.x == 380) and (sf.y == 499) then
        place_port(plr, 412, 362, 1)
        place_building(plr, 412, 362, 6, "europeans_clay_pit")
        place_building(plr, 412, 362, 6, "europeans_fishers_house_normal")
        place_port(plr, 386, 386, 1)
        place_building(plr, 386, 386, 8, "europeans_clay_pit")
        place_building(plr, 386, 386, 8, "europeans_fishers_house_normal")
        place_building(plr, 386, 386, 8, "europeans_gamekeepers_hut")
        place_building(plr, 386, 386, 8, "europeans_hunters_house_basic")
        place_port(plr, 359, 390, 1)
        place_building(plr, 359, 390, 6, "europeans_quarry_normal")
        place_building(plr, 359, 390, 6, "europeans_clay_pit")
        place_building(plr, 359, 390, 6, "europeans_fishers_house_normal")
        place_port(plr, 350, 397, 1)
        place_port(plr, 315, 434, 1)
        place_port(plr, 323, 363, 1)
        place_building(plr, 323, 363, 4, "europeans_quarry_advanced")
    end 
    if (player_slot.name == "Italy") and (sf.x == 491) and (sf.y == 170) then
        place_port(plr, 438, 170, 1)
        place_building(plr, 438, 170, 8, "europeans_quarry_normal")
        place_port(plr, 437, 186, 1)
        place_building(plr, 437, 186, 8, "europeans_quarry_normal")
        place_building(plr, 437, 186, 8, "europeans_gamekeepers_hut")
        place_building(plr, 437, 186, 8, "europeans_hunters_house_basic")
        place_port(plr, 478, 221, 1)
        place_building(plr, 478, 221, 8, "europeans_quarry_normal")
        place_building(plr, 478, 221, 8, "europeans_clay_pit")
        place_building(plr, 478, 221, 8, "europeans_fishers_house_normal")
        place_port(plr, 47, 224, 1)
        place_building(plr, 47, 224, 8, "europeans_quarry_normal")
        place_building(plr, 47, 224, 8, "europeans_clay_pit")
        place_building(plr, 47, 224, 8, "europeans_fishers_house_normal")
        place_port(plr, 31, 213, 1)
    end 

    plr:forbid_buildings{"europeans_shipyard_advanced", "europeans_shipyard_normal"}
    plr:forbid_buildings{"europeans_ferry_yard_advanced", "europeans_ferry_yard_normal", "europeans_ferry_yard_basic"}
    plr:forbid_buildings{"europeans_scouts_house_advanced", "europeans_scouts_house_normal", "europeans_scouts_house_basic"}
    plr:forbid_buildings{"europeans_recruitement_center_advanced", "europeans_recruitement_center_normal"}
    plr:forbid_buildings{"europeans_battlearena_level_1","europeans_battlearena_level_2", "europeans_battlearena_level_3", "europeans_battlearena_level_4"}
    plr:forbid_buildings{"europeans_smithy_level_4", "europeans_smithy_level_5", "europeans_smithy_level_6", "europeans_trainingscamp_level_1", "europeans_trainingscamp_level_2"}
    plr:forbid_buildings{"europeans_smithy_level_7", "europeans_smithy_level_8", "europeans_smithy_level_9", "europeans_trainingscamp_level_3", "europeans_trainingscamp_level_4"}
   
   
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
