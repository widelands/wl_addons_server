-- =======================================================================
--                 Start conditions for New World
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "New World",
    -- TRANSLATORS: This is the tooltip for the "New World" starting condition
    tooltip = _"Start the game with a advanced castle and a port. The AI might struggle with this condition on smaller maps.",
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
                        europeans_farmer_basic = 6,
                        europeans_lumberjack_basic = 4,
                        europeans_forester_basic = 3,
                        europeans_miner_basic = 3,
                        europeans_trainer_basic = 2,
                        europeans_stonecutter_basic = 1,
                        europeans_hunter_basic = 1,
                        europeans_fisher_basic = 1,
                        europeans_carpenter_basic = 1,
                        europeans_charcoal_burner_basic = 1,
                        europeans_stonemason_basic = 1,
                        europeans_smith_basic = 1,
                        europeans_brewer_basic = 1,
                        europeans_miller_basic = 1,
                        europeans_baker_basic = 1,
                        europeans_smelter_basic = 1,
                        europeans_weaver_basic = 1,
                        europeans_claydigger_basic = 1
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
                water = 127,
                log = 127,
                reed = 127,
                granite = 63,
                coal = 63,
                ore = 31,
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
                pick = 7,
                hammer = 7,
                saw = 7,
                scythe = 5,
                shovel = 5,
                felling_ax = 5,
                fire_tongs = 5,
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
                europeans_farmer_basic = 8,
                europeans_lumberjack_basic = 4,
                europeans_miner_basic = 4,
                europeans_forester_basic = 4,
                europeans_trainer_basic = 2,
                europeans_stonecutter_basic = 2,
                europeans_hunter_basic = 2,
                europeans_fisher_basic = 2,
                europeans_carpenter_basic = 2,
                europeans_charcoal_burner_basic = 2,
                europeans_smith_basic = 2,
                europeans_stonemason_basic = 2,
                europeans_brewer_basic = 1,
                europeans_miller_basic = 1,
                europeans_baker_basic = 1,
                europeans_smelter_basic = 1,
                europeans_weaver_basic = 1,
                europeans_claydigger_basic = 1
          },
            soldiers = {
                [{0,0,0,0}] = 16,
          }
        })
    end
    
    local ports = player:get_buildings("europeans_port")
    
    if #ports > 0 then
        for i, port in ipairs(ports) do
            port:set_wares("water", math.ceil(127/ #ports))
            port:set_wares("log", math.ceil(127 / #ports))
            port:set_wares("reed", math.ceil(127 / #ports))
            port:set_wares("granite", math.ceil(63 / #ports))
            port:set_wares("coal", math.ceil(63 / #ports))
            port:set_wares("ore", math.ceil(31 / #ports))
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
            port:set_wares("pick", math.ceil(7 / #ports))
            port:set_wares("hammer", math.ceil(7 / #ports))
            port:set_wares("saw", math.ceil(7 / #ports))
            port:set_wares("scythe", math.ceil(5 / #ports))
            port:set_wares("shovel", math.ceil(5 / #ports))
            port:set_wares("felling_ax", math.ceil(5 / #ports))
            port:set_wares("fire_tongs", math.ceil(5 / #ports))
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
    
    for i = 1, 1000 do
        -- Delay of 15 min between actions
        sleep(900000)
        
        -- Time-dependent activation (gametime)
        if i == 8 then
            place_ship_random(player, 64)
        end
        if i == 12 then
            place_ship_random(player, 64)
        end
    end
end
}

pop_textdomain()
return init
