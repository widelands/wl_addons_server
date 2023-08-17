-- =======================================================================
--              Village Starting Conditions for Europeans
-- =======================================================================

include "addons/europeans_tribe.wad/scripting/starting_conditions.lua"

push_textdomain("europeans_tribe.wad", true)

local init = {
    -- TRANSLATORS: This is the name of a starting condition
    descname = _ "Harbors (for European map)",
    -- TRANSLATORS: This is the tooltip for the "Harbors" starting condition
    tooltip = _"Start the game with a bundle of ports. Disabled terraforming (diking of water bodies) because of lack of compatibility with seafaring.",
    map_tags = {"seafaring"},
    
    func =  function(player, shared_in_start)

    local map = wl.Game().map
    local player_slot = map.player_slots[player.number]
    local sf = player_slot.starting_field
    if shared_in_start then
       sf = shared_in_start
    else
       player:allow_workers("all")
    end
   
    player:forbid_buildings{"europeans_terraformers_house_basic", "europeans_terraformers_house_normal", "europeans_terraformers_house_advanced"}
   
    if (map.allows_seafaring == true) and ((player.name == "Saxons") or (sf.x == 380 and sf.y == 498)) then
        port = prefilled_buildings(player, { "europeans_port", 412, 362,
            wares = {},
            workers = {
                europeans_shipwright_basic = 2
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
        port = prefilled_buildings(player, { "europeans_port", 350, 397,
            wares = {},
            workers = {
                europeans_shipwright_basic = 2
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
        port = prefilled_buildings(player, { "europeans_port", 370, 497,
            wares = {},
            workers = {
                europeans_breeder_basic = 1,
                europeans_brewer_basic = 1,
                europeans_miller_basic = 1,
                europeans_baker_basic = 1,
                europeans_smelter_basic = 1,
                europeans_smith_basic = 1,
                europeans_beekeeper_basic = 1
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
        port = prefilled_buildings(player, { "europeans_port", 384, 432,
            wares = {},
            workers = {
                europeans_breeder_basic = 1,
                europeans_brewer_basic = 1,
                europeans_miller_basic = 1,
                europeans_baker_basic = 1,
                europeans_smelter_basic = 1,
                europeans_smith_basic = 1,
                europeans_beekeeper_basic = 1
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
        port = prefilled_buildings(player, { "europeans_port", 322, 440,
            wares = {},
            workers = {
                europeans_breeder_basic = 1,
                europeans_brewer_basic = 1,
                europeans_miller_basic = 1,
                europeans_baker_basic = 1,
                europeans_smelter_basic = 1,
                europeans_smith_basic = 1,
                europeans_beekeeper_basic = 1
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
        port = prefilled_buildings(player, { "europeans_port", 346, 435,
            wares = {},
            workers = {
                europeans_breeder_basic = 1,
                europeans_brewer_basic = 1,
                europeans_miller_basic = 1,
                europeans_baker_basic = 1,
                europeans_smelter_basic = 1,
                europeans_smith_basic = 1,
                europeans_beekeeper_basic = 1
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
        port = prefilled_buildings(player, { "europeans_port", 352, 354,
            wares = {},
            workers = {
                europeans_breeder_basic = 1,
                europeans_brewer_basic = 1,
                europeans_miller_basic = 1,
                europeans_baker_basic = 1,
                europeans_smelter_basic = 1,
                europeans_smith_basic = 1,
                europeans_beekeeper_basic = 1
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
    elseif (map.allows_seafaring == true) and ((player.name == "Romans") or (sf.x == 491 and sf.y == 170)) then
        port = prefilled_buildings(player, { "europeans_port", 478, 221,
            wares = {},
            workers = {
                europeans_shipwright_basic = 2,
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
        port = prefilled_buildings(player, { "europeans_port", 438, 170,
            wares = {},
            workers = {
                europeans_shipwright_basic = 2
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
        port = prefilled_buildings(player, { "europeans_port", 437, 186,
            wares = {},
            workers = {
                europeans_shipwright_basic = 2
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
        port = prefilled_buildings(player, { "europeans_port", 47, 224,
            wares = {},
            workers = {
                europeans_shipwright_basic = 2
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
        port = prefilled_buildings(player, { "europeans_port", 498, 188,
            wares = {},
            workers = {
                europeans_breeder_basic = 1,
                europeans_brewer_basic = 1,
                europeans_miller_basic = 1,
                europeans_baker_basic = 1,
                europeans_smelter_basic = 1,
                europeans_smith_basic = 1,
                europeans_beekeeper_basic = 1
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
        port = prefilled_buildings(player, { "europeans_port", 462, 161,
            wares = {},
            workers = {
                europeans_breeder_basic = 1,
                europeans_brewer_basic = 1,
                europeans_miller_basic = 1,
                europeans_baker_basic = 1,
                europeans_smelter_basic = 1,
                europeans_smith_basic = 1,
                europeans_beekeeper_basic = 1
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
        port = prefilled_buildings(player, { "europeans_port", 30, 212,
            wares = {},
            workers = {
                europeans_breeder_basic = 1,
                europeans_brewer_basic = 1,
                europeans_miller_basic = 1,
                europeans_baker_basic = 1,
                europeans_smelter_basic = 1,
                europeans_smith_basic = 1,
                europeans_beekeeper_basic = 1
          },
            soldiers = {
                [{0,0,0,0}] = 4,
          }
        })
    elseif (map.allows_seafaring == true) and (map.number_of_port_spaces > 0) then
        player:forbid_buildings{"europeans_headquarters", "europeans_warehouse"}
        for i, portfield in pairs(map.port_spaces) do
            if (math.abs(portfield.x - sf.x) < 16) and (math.abs(portfield.y - sf.y) < 16) then
                port = prefilled_buildings(player, { "europeans_port", portfield.x, portfield.y,
                    wares = {},
                    workers = {
                        europeans_breeder_basic = 2,
                        europeans_brewer_basic = 2,
                        europeans_miller_basic = 2,
                        europeans_baker_basic = 2,
                        europeans_smelter_basic = 2,
                        europeans_smith_basic = 2,
                        europeans_beekeeper_basic = 1,
                        europeans_shipwright_basic = 1
                  },
                    soldiers = {
                        [{0,0,0,0}] = 8,
                  }
                })
            end
        end
    else
        prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
                wares = {
                    log = 128,
                    reed = 128,
                    granite = 128,
                    blackwood = 128,
                    water = 128,
                    coal = 64,
                    cloth = 32,
                    planks = 32,
                    marble = 32,
                    marble_column = 16,
                    grout = 16,
                    brick = 16,
                    gold = 16,
                    quartz = 16,
                    diamond = 16,
                    buckets = 32,
                    basket = 32
                },
                workers = {
                    europeans_carrier = 64,
                    europeans_farmer_basic = 48,
                    europeans_builder = 16,
                    europeans_lumberjack_basic = 16,
                    europeans_forester_basic = 16,
                    europeans_miner_basic = 16,
                    europeans_stonecutter_basic = 8,
                    europeans_carpenter_basic = 8,
                    europeans_charcoal_burner_basic = 8,
                    europeans_stonemason_basic = 8,
                    europeans_weaver_basic = 8,
                    europeans_breeder_basic = 8,
                    europeans_brewer_basic = 8,
                    europeans_miller_basic = 8,
                    europeans_baker_basic = 8,
                    europeans_smelter_basic = 8,
                    europeans_smith_basic = 8,
                    europeans_trainer_basic = 8,
                    europeans_trader = 8,
                    europeans_claydigger_basic = 4,
                    europeans_beekeeper_basic = 4,
                    europeans_shipwright_basic = 4,
                    europeans_tailor_basic = 2,
                    europeans_shoemaker_basic = 2,
                    europeans_terraformer_basic = 2,
                    europeans_scout_basic = 2,
                    europeans_geologist = 1
              },
                soldiers = {
                    [{0,0,0,0}] = 32,
              }
        })
    end
    
    local ports = player:get_buildings("europeans_port")
    
    if #ports > 0 then
        for i, port in ipairs(ports) do
            port:set_wares("reed", math.ceil(128 / #ports))
            port:set_wares("blackwood", math.ceil(128 / #ports))
            port:set_wares("granite", math.ceil(128 / #ports))
            port:set_wares("log", math.ceil(128 / #ports))
            port:set_wares("water", math.ceil(128/ #ports))
            port:set_wares("cloth", math.ceil(32 / #ports))
            port:set_wares("planks", math.ceil(32 / #ports))
            port:set_wares("coal", math.ceil(32 / #ports))
            port:set_wares("marble", math.ceil(32 / #ports))
            port:set_wares("marble_column", math.ceil(32 / #ports))
            port:set_wares("grout", math.ceil(32 / #ports))
            port:set_wares("brick", math.ceil(32 / #ports))
            port:set_wares("gold", math.ceil(16 / #ports))
            port:set_wares("quartz", math.ceil(16 / #ports))
            port:set_wares("diamond", math.ceil(16 / #ports))
            port:set_wares("buckets", math.ceil(32 / #ports))
            port:set_wares("basket", math.ceil(16 / #ports))
            
            port:set_workers("europeans_carrier", math.ceil(128 / #ports))
            port:set_workers("europeans_builder", math.ceil(48 / #ports))
            port:set_workers("europeans_farmer_basic", math.ceil(48 / #ports))
            port:set_workers("europeans_lumberjack_basic", math.ceil(32 / #ports))
            port:set_workers("europeans_forester_basic", math.ceil(32 / #ports))
            port:set_workers("europeans_stonecutter_basic", math.ceil(16 / #ports))
            port:set_workers("europeans_miner_basic", math.ceil(16 / #ports))
            port:set_workers("europeans_carpenter_basic", math.ceil(8 / #ports))
            port:set_workers("europeans_weaver_basic", math.ceil(8 / #ports))
            port:set_workers("europeans_stonemason_basic", math.ceil(8 / #ports))
            port:set_workers("europeans_charcoal_burner_basic", math.ceil(8 / #ports))
            port:set_workers("europeans_claydigger_basic", math.ceil(8 / #ports))
            port:set_workers("europeans_geologist", math.ceil(8 / #ports))
            port:set_workers("europeans_scout_basic", math.ceil(8 / #ports))
            port:set_workers("europeans_trader", math.ceil(8 / #ports))
            port:set_workers("europeans_trainer_basic", math.ceil(8 / #ports))
        end
        place_building_in_region(player, "europeans_advanced_tower", ports[1].fields[1]:region(6), {
            soldiers = {[{3,3,3,3}] = 6},
        })
        place_building_in_region(player, "europeans_shipyard_basic", ports[1].fields[1]:region(6), {
            inputs = { blackwood = 2, planks = 8, cloth = 2, reed = 2 },
        })
        place_building_in_region(player, "europeans_sawmill_basic", ports[1].fields[1]:region(8), {
            inputs = { log = 4 },
        })
        place_building_in_region(player, "europeans_weaving_mill_basic", ports[1].fields[1]:region(8), {
            inputs = { reed = 4 },
        })
    else
        prefilled_buildings(player, { "europeans_headquarters", sf.x, sf.y,
            wares = {
                log = 128,
                reed = 128,
                granite = 128,
                blackwood = 128,
                water = 128,
                coal = 64,
                cloth = 32,
                planks = 32,
                marble = 32,
                marble_column = 16,
                grout = 16,
                brick = 16,
                gold = 16,
                quartz = 16,
                diamond = 16,
                buckets = 32,
                basket = 32
            },
            workers = {
                europeans_carrier = 64,
                europeans_farmer_basic = 48,
                europeans_builder = 16,
                europeans_lumberjack_basic = 16,
                europeans_forester_basic = 16,
                europeans_miner_basic = 16,
                europeans_stonecutter_basic = 8,
                europeans_carpenter_basic = 8,
                europeans_charcoal_burner_basic = 8,
                europeans_stonemason_basic = 8,
                europeans_weaver_basic = 8,
                europeans_breeder_basic = 8,
                europeans_brewer_basic = 8,
                europeans_miller_basic = 8,
                europeans_baker_basic = 8,
                europeans_smelter_basic = 8,
                europeans_smith_basic = 8,
                europeans_trainer_basic = 8,
                europeans_trader = 8,
                europeans_claydigger_basic = 4,
                europeans_beekeeper_basic = 4,
                europeans_shipwright_basic = 4,
                europeans_tailor_basic = 2,
                europeans_shoemaker_basic = 2,
                europeans_terraformer_basic = 2,
                europeans_scout_basic = 2,
                europeans_geologist = 1
            },
            soldiers = {
                [{0,0,0,0}] = 32,
            }
        })
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
