-- =======================================================================
--                 Start conditions for New World
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "New World",
    -- TRANSLATORS: This is the tooltip for the "New World" starting condition
    tooltip = _"Start the game with advanced castle and port. AI might struggling with this condition on smaller maps.",
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
    h:set_soldiers{[{3,3,3,3}] = 12}
      
    if (map.allows_seafaring == true) and (map.number_of_port_spaces > 0) then
        for i, portfield in pairs(map.port_spaces) do
            if (math.abs(portfield.x - sf.x) < 12) and (math.abs(portfield.y - sf.y) < 12) then
                prefilled_buildings(player, { "europeans_port", portfield.x, portfield.y,
                    wares = {},
                    workers = {
                        europeans_carrier = 16,
                        europeans_builder = 8,
                        europeans_smith_basic = 1,
                        europeans_trainer_basic = 1,
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
                water = 511,
                log = 192,
                reed = 127,
                granite = 63,
                ore = 31,
                coal = 31,
                cloth = 31,
                blackwood = 31,
                planks = 15,
                spidercloth = 15,
                marble = 15,
                marble_column = 7,
                iron = 7,
                gold = 7,
                quartz = 15,
                diamond = 15,
                buckets = 15,
                basket = 15,
                hammer = 12,
                saw = 12,
                scythe = 12,
                shovel = 9,
                pick = 9,
                felling_ax = 9,
                fire_tongs = 7,
                milking_tongs = 3,
                needles = 3,
                bread_paddle = 3,
                hook_pole = 3,
                kitchen_tools = 3,
                fishing_net = 2,
                fishing_rod = 2,
                hunting_bow = 2,
                hunting_spear = 2,
                armor = 7,
                tabard = 7,
                spear_wooden = 7
            },
            workers = {
                europeans_carrier = 32,
                europeans_builder = 12,
                europeans_trainer_basic = 3
          },
            soldiers = {
                [{0,0,0,0}] = 16,
          }
        })
    end
    
    local ports = player:get_buildings("europeans_port")
    
    if #ports > 0 then
        for i, port in ipairs(ports) do
            port:set_wares("water", math.ceil(511/ #ports))
            port:set_wares("log", math.ceil(192 / #ports))
            port:set_wares("reed", math.ceil(127 / #ports))
            port:set_wares("granite", math.ceil(63 / #ports))
            port:set_wares("ore", math.ceil(31 / #ports))
            port:set_wares("coal", math.ceil(31 / #ports))
            port:set_wares("cloth", math.ceil(31 / #ports))
            port:set_wares("blackwood", math.ceil(31 / #ports))
            port:set_wares("planks", math.ceil(15 / #ports))
            port:set_wares("spidercloth", math.ceil(15 / #ports))
            port:set_wares("marble", math.ceil(15 / #ports))
            port:set_wares("marble_column", math.ceil(7 / #ports))
            port:set_wares("iron", math.ceil(7 / #ports))
            port:set_wares("gold", math.ceil(7 / #ports))
            port:set_wares("quartz", math.ceil(15 / #ports))
            port:set_wares("diamond", math.ceil(15 / #ports))
            port:set_wares("buckets", math.ceil(15 / #ports))
            port:set_wares("basket", math.ceil(15 / #ports))
            port:set_wares("hammer", math.ceil(12 / #ports))
            port:set_wares("saw", math.ceil(12 / #ports))
            port:set_wares("scythe", math.ceil(12 / #ports))
            port:set_wares("shovel", math.ceil(9 / #ports))
            port:set_wares("pick", math.ceil(9 / #ports))
            port:set_wares("felling_ax", math.ceil(9 / #ports))
            port:set_wares("fire_tongs", math.ceil(7 / #ports))
            port:set_wares("milking_tongs", math.ceil(3 / #ports))
            port:set_wares("needles", math.ceil(3 / #ports))
            port:set_wares("bread_paddle", math.ceil(3 / #ports))
            port:set_wares("hook_pole", math.ceil(3 / #ports))
            port:set_wares("kitchen_tools", math.ceil(3 / #ports))
            port:set_wares("fishing_net", math.ceil(3 / #ports))
            port:set_wares("fishing_rod", math.ceil(3 / #ports))
            port:set_wares("hunting_bow", math.ceil(3 / #ports))
            port:set_wares("hunting_spear", math.ceil(3 / #ports))
            port:set_wares("armor", math.ceil(7 / #ports))
            port:set_wares("tabard", math.ceil(7 / #ports))
            port:set_wares("spear_wooden", math.ceil(7 / #ports))
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
