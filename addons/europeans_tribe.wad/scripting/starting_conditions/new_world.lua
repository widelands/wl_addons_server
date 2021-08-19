-- =======================================================================
--                 Start conditions for New World
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "New World",
    -- TRANSLATORS: This is the tooltip for the "New World" starting condition
    tooltip = _"Start the game with advanced castle and port",
    map_tags = {"seafaring"},

    func = function(player, shared_in_start)

    local map = wl.Game().map
    local sf = map.player_slots[player.number].starting_field
    if shared_in_start then
       sf = shared_in_start
    else
       player:allow_workers("all")
    end
    local h = player:place_building("europeans_advanced_castle", sf, false, true)
    h:set_soldiers{[{4,4,4,4}] = 12}
      
    if (map.allows_seafaring == true) and (map.number_of_port_spaces > 0) then
        for i, portfield in pairs(map.port_spaces) do
            if (math.abs(portfield.x - sf.x) < 12) and (math.abs(portfield.y - sf.y) < 12) then
                prefilled_buildings(player, { "europeans_port", portfield.x, portfield.y,
                    wares = {},
                    workers = {
                        europeans_carrier = 16,
                        europeans_builder = 8,
                        europeans_farmer_basic = 8,
                        europeans_lumberjack_basic = 2,
                        europeans_forester_basic = 2,
                        europeans_carpenter_basic = 1,
                        europeans_stonecutter_basic = 1,
                        europeans_stonemason_normal = 1,
                        europeans_weaver_basic = 1,
                        europeans_weaver_normal = 1,
                        europeans_smith_basic = 1,
                        europeans_trainer_basic = 1,
                        europeans_shipwright_basic = 1,
                        europeans_fishbreeder_basic = 1
                  },
                    soldiers = {
                        [{0,0,0,0}] = 6,
                  }
                })
            end
        end
    else
        prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
            wares = {
                water = 256,
                log = 192,
                granite = 64,
                reed = 64,
                blackwood = 32,
                planks = 32,
                cloth = 32,
                iron = 32,
                ore = 32,
                coal = 32,
                spidercloth = 32,
                marble = 32,
                quartz = 32,
                diamond = 24,
                gold = 4,
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
                europeans_builder = 12,
                europeans_farmer_basic = 12,
                europeans_trainer_basic = 3,
                europeans_lumberjack_basic = 3,
                europeans_forester_basic = 3,
                europeans_carpenter_basic = 2,
                europeans_stonecutter_basic = 2,
                europeans_stonemason_normal = 2,
                europeans_weaver_basic = 1,
                europeans_weaver_normal = 1,
                europeans_smith_basic = 1,
                europeans_shipwright_basic = 1,
          },
            soldiers = {
                [{0,0,0,0}] = 16,
          }
        })
    end
    
    local ports = player:get_buildings("europeans_port")
    
    if #ports > 0 then
        for i, port in ipairs(ports) do
            port:set_wares("water", math.ceil(256/ #ports))
            port:set_wares("log", math.ceil(192 / #ports))
            port:set_wares("reed", math.ceil(96 / #ports))
            port:set_wares("granite", math.ceil(64 / #ports))
            port:set_wares("cloth", math.ceil(32 / #ports))
            port:set_wares("blackwood", math.ceil(32 / #ports))
            port:set_wares("planks", math.ceil(32 / #ports))
            port:set_wares("iron", math.ceil(32 / #ports))
            port:set_wares("ore", math.ceil(32 / #ports))
            port:set_wares("coal", math.ceil(32 / #ports))
            port:set_wares("spidercloth", math.ceil(32 / #ports))
            port:set_wares("marble", math.ceil(24 / #ports))
            port:set_wares("quartz", math.ceil(24 / #ports))
            port:set_wares("marble_column", math.ceil(24 / #ports))
            port:set_wares("diamond", math.ceil(16 / #ports))
            port:set_wares("gold", math.ceil(4 / #ports))
            port:set_wares("shovel", math.ceil(16 / #ports))
            port:set_wares("buckets", math.ceil(10 / #ports))
            port:set_wares("basket", math.ceil(8 / #ports))
            port:set_wares("pick", math.ceil(6 / #ports))
            port:set_wares("fire_tongs", math.ceil(4 / #ports))
            port:set_wares("hammer", math.ceil(4 / #ports))
            port:set_wares("saw", math.ceil(4 / #ports))
            port:set_wares("scythe", math.ceil(4 / #ports))
            port:set_wares("bread_paddle", math.ceil(2 / #ports))
            port:set_wares("fishing_net", math.ceil(2 / #ports))
            port:set_wares("fishing_rod", math.ceil(2 / #ports))
            port:set_wares("hook_pole", math.ceil(2 / #ports))
            port:set_wares("hunting_bow", math.ceil(2 / #ports))
            port:set_wares("hunting_spear", math.ceil(2 / #ports))
            port:set_wares("milking_tongs", math.ceil(2 / #ports))
            port:set_wares("armor", math.ceil(6 / #ports))
            port:set_wares("tabard", math.ceil(6 / #ports))
            port:set_wares("spear_wooden", math.ceil(12 / #ports))
        end
    end

    -- Get all trainingsite types
    local trainingsite_types = {}
    local trainingsites = {}
    for i, building in ipairs(wl.Game():get_tribe_description(player.tribe_name).buildings) do
        if (building.type_name == "trainingsite") then
            table.insert(trainingsite_types, building.name)
        end
    end
    
    for i = 1, 1000 do
        -- Delay of 15 min between actions
        sleep(900000)
        
        -- Time-dependent activation (gametime)
        if i == 8 then
            if (player_slot.name == "Sweden") and (sf.x == 24) and (sf.y == 422) then
                place_port(player, 23, 452)
                place_building(player, 23, 452, 6, "europeans_clay_pit")
                place_building(player, 23, 452, 6, "europeans_fishers_house_normal")
            end 
            if (player_slot.name == "England") and (sf.x == 380) and (sf.y == 499) then
                -- Shetland
                place_port(player, 412, 362, 1)
                place_building(player, 412, 362, 6, "europeans_clay_pit")
                place_building(player, 412, 362, 6, "europeans_fishers_house_normal")
                -- Orkney
                place_port(player, 386, 386, 1)
                place_building(player, 386, 386, 6, "europeans_clay_pit")
                place_building(player, 386, 386, 6, "europeans_fishers_house_normal")
                -- Lewis / Harris
                place_port(player, 359, 390, 1)
                place_building(player, 359, 390, 6, "europeans_quarry_normal")
                place_building(player, 359, 390, 6, "europeans_clay_pit")
                place_building(player, 359, 390, 6, "europeans_fishers_house_normal")
            end 
            if (player_slot.name == "Italy") and (sf.x == 491) and (sf.y == 170) then
                -- Sizilia
                place_port(player, 478, 221, 1)
                place_building(player, 478, 221, 6, "europeans_quarry_normal")
                place_building(player, 478, 221, 6, "europeans_clay_pit")
                place_building(player, 478, 221, 6, "europeans_fishers_house_normal")
                -- Corsica
                place_port(player, 438, 170, 1)
                place_building(player, 438, 170, 6, "europeans_quarry_normal")
                -- Sardenya
                place_port(player, 437, 186, 1)
                place_building(player, 437, 186, 6, "europeans_quarry_normal")
            end 
            place_ship_random(player, 64)
        end
        if i == 12 then
            if (player_slot.name == "England") and (sf.x == 380) and (sf.y == 499) then
                -- Ireland
                place_port(player, 348, 434, 1)
                -- Island
                place_port(player, 335, 363, 1)
                place_building(player, 335, 363, 4, "europeans_quarry_advanced")
            end
            if (player_slot.name == "Italy") and (sf.x == 491) and (sf.y == 170) then
                -- Greece
                place_port(player, 31, 213, 1)
                place_port(player, 47, 224, 1)
                place_building(player, 47, 224, 6, "europeans_quarry_normal")
            end
            place_ship_random(player, 64)
        end
    end
end
}

pop_textdomain()
return init
