descriptions = wl.Descriptions()

image_dirname = path.dirname(__file__) .. "images/"

push_textdomain("europeans_tribe.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

-- For lore texts
-- TRANSLATORS: Format string for a latin quote and its translation
quote_with_translation_format = pgettext("europeans_lore", "‘%1%’<br>(%2%)")
function latin_lore(latin, translation)
   return quote_with_translation_format:bformat(latin, translation)
end

wl.Descriptions():new_tribe {
    name = "europeans",
    animation_directory = image_dirname,
    animations = {
        frontier = { hotspot = {1, 19} },
        flag = { hotspot = {14, 38}, fps = 10 },
        pinned_note = { hotspot = {18, 67} },
        bridge_normal_e = { hotspot = {-2, 12} },
        bridge_busy_e = { hotspot = {-2, 12} },
        bridge_normal_se = { hotspot = {5, 2} },
        bridge_busy_se = { hotspot = {5, 2} },
        bridge_normal_sw = { hotspot = {36, 3} },
        bridge_busy_sw = { hotspot = {36, 3} }
    },

    bridge_height = 8,
    
    collectors_points_table = {
        { ware = "diamond", points = 1 },
        { ware = "gold", points = 2 },
        { ware = "coin_copper", points = 4 },
        { ware = "coin_silver", points = 6 },
        { ware = "coin_gold", points = 8 },
    },

    -- Image file paths for this tribe's road and waterway textures
    roads = {
        busy = {
            image_dirname .. "roadt_busy.png",
        },
        normal = {
            image_dirname .. "roadt_normal_00.png",
            image_dirname .. "roadt_normal_01.png",
            image_dirname .. "roadt_normal_02.png",
        },
        waterway = {
            image_dirname .. "waterway_0.png",
        },
    },

    resource_indicators = {
        [""] = {
            [0] = "europeans_resi_none",
        },
        resource_coal = {
            [10] = "europeans_resi_coal_1",
            [20] = "europeans_resi_coal_2",
        },
        resource_iron = {
            [10] = "europeans_resi_iron_1",
            [20] = "europeans_resi_iron_2",
        },
        resource_gold = {
            [10] = "europeans_resi_gold_1",
            [20] = "europeans_resi_gold_2",
        },
        resource_stones = {
            [10] = "europeans_resi_stones_1",
            [20] = "europeans_resi_stones_2",
        },
        resource_water = {
            [100] = "europeans_resi_water",
        },
    },

    -- Wares positions in wares windows.
    -- This also gives us the information which wares the tribe uses.
    -- Each subtable is a column in the wares windows.
    wares_order = {
        {
            -- Building Materials 1 (Wood)
          {
                name = "water",
                default_target_quantity = 48,
                preciousness = 4,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Water, part 1
                        pgettext("ware", "Water is the essence of life!"),
                        -- TRANSLATORS: Helptext for an Europeans ware: Water, part 2
                        pgettext("europeans_ware", "Water is used by the gardener, by the forester, by all farms, and in the bakery and the brewery. The fish farm and the sheep farm need to be supplied with water, too.")
                    }
                }
            },
            {
                name = "log",
                default_target_quantity = 48,
                preciousness = 2,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Log, part 1
                        pgettext("europeans_ware", "Logs are an important basic building material. They are produced by felling trees."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Log, part 2
                        pgettext("europeans_ware", "European lumberjacks fell the trees; foresters take care of the supply of trees. Logs are also used by the charcoal kiln, the shipyard and the sawmill.")
                    }
                }
            },
            {
                name = "planks",
                default_target_quantity = 48,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Planks, part 1
                        pgettext("europeans_ware", "Planks are an important building material."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Planks, part 2
                        pgettext("europeans_ware", "They are produced out of logs by the sawmill."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Planks, part 3
                        pgettext("europeans_ware", "They are also used by the ferryyard and shipyard.")
                    }
                }
            },
            {
                name = "blackwood",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans ware: Blackwood
                    purpose = pgettext("europeans_ware", "This fire-hardened wood is as hard as iron and it is used for several buildings. It is produced out of logs in the wood hardener (basic sawmill).")
                }
            },
            {
                name = "balsa",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Balsa
                        pgettext("europeans_ware", "Balsa wood is an important trade ware. Balsa trees are cut by an experienced woodcutter.")
                    }
                }
            },
            {
                name = "ironwood",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Ironwood
                        pgettext("europeans_ware", "This very hard wood is as hard as iron. It is cut by a very experienced woodcutter.")
                    }
                }
            },
            {
                name = "scrap_wood",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Scrap wood, part 1
                        pgettext("europeans_ware", "Scrap wood is a waste material that arises from the demolition of buildings or from sawmills."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Scrap wood, part 2
                        pgettext("europeans_ware", "It can be processed into charcoal in charcoal kilns."),
                    }
                }
            },
        },
        {
            -- Building Materials 1 (Farming)
            {
                name = "reed",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Reed, part 1
                        pgettext("europeans_ware", "Reed is an important building material."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Reed, part 2
                        pgettext("europeans_ware", "It is produced by the reed yard."),
                    }
                }
            },
            {
                name = "cotton",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Cotton, part 1
                        pgettext("europeans_ware", "Cotton is a raw material used to make clothing."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Cotton, part 2
                        pgettext("europeans_ware", "It is produced by normal farms."),
                    }
                }
            },
            {
                name = "cloth",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Cloth
                    purpose = pgettext("europeans_ware", "Cloth is needed to build several buildings. It is produced out of reed.")
                }
            },
            {
                name = "rubber",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Rubber, part 1
                        pgettext("europeans_ware", "Rubber is needed to make improved armor and boots."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Rubber, part 2
                        pgettext("europeans_ware", "It is produced in tree nursery or in rubber farm."),
                    }
                }
            },
            {
                name = "armor",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Armor
                    purpose = pgettext("europeans_ware", "Raw material for some sorts of armor. It is produced in the weaving mill out of wool, cotton or reed.")
                }
            },
            {
                name = "liana",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Liana
                        pgettext("europeans_ware", "Lianas grow on trees. Very durable ropes are made out of them.")
                    }
                }
            },
            {
                name = "rope",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Rope
                        pgettext("europeans_ware", "This rope is made out of lianas. It is used for armor dresses and to construct buildings and ships.")
                    }
                }
            },
        },
        {
            -- Animal economy
            {
                name = "honey",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans ware: Honey
                    purpose = pgettext("europeans_ware", "Honey is produced by bees belonging to a farm. It is used to feed animals.")
                }
            },
            {
                name = "fruit",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans ware: Fruit
                    purpose = pgettext("europeans_ware", "Fruit are berries gathered from berry bushes by a fruit collector. They are used to brew fruit wine.")
                }
            },
            {
                name = "leather",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Wool
                    purpose = pgettext("europeans_ware", "The animal farm produces leather, which is used as a raw material for making boots.")
                }
            },
            {
                name = "fur",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans ware: Fur
                    purpose = pgettext("europeans_ware", "Fur is won from reindeer in a reindeer farm. It is woven into cloth or turned into fur garments for soldiers.")
                }
            },
            {
                name = "wool",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Wool
                    purpose = pgettext("europeans_ware", "Wool is the hair of sheep. Weaving mills use it to make armor. Animal farms with level 4 or 5 can produce wool.")
                }
            },
            {
                name = "spider_silk",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Spider Silk
                    purpose = pgettext("atlanteans_ware", "Spider silk is produced by spiders, which are bred by spider farms. It can be processed into spidercloth or tabards in a weaving mill, or used to make tools in the toolsmithy.")
                }
            },
            {
                name = "spidercloth",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Spidercloth
                    purpose = pgettext("atlanteans_ware", "Spidercloth is made out of spider silk in a weaving mill. It is used in the shipyard. Also some higher developed buildings need spidercloth for their construction.")
                }
            },
        },
        {
            -- Building Materials 3 (Stone, Grout and Brick)
            {
                name = "coal",
                default_target_quantity = 48,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Coal, part 1
                        pgettext("ware", "Coal is mined in coal mines or produced out of logs by a charcoal kiln."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Coal, part 2
                        pgettext("europeans_ware", "The fires of the Europeans smelting works and smithies are usually fed with coal.")
                    }
                }
            },
            {
                name = "granite",
                default_target_quantity = 48,
                preciousness = 2,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Granite, part 1
                        pgettext("europeans_ware", "Granite is a basic building material."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Granite, part 2
                        pgettext("europeans_ware", "The Europeans produces granite blocks in quarries.")
                    }
                }
            },
            {
                name = "grout",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Granite, part 1
                        pgettext("europeans_ware", "Grout is a basic building material."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Granite, part 2
                        pgettext("europeans_ware", "The Europeans produces grout in lime kiln or stonemasons house out of granite and water.")
                    }
                }
            },
            {
                name = "clay",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Clay, part 1
                        pgettext("europeans_ware", "Clay is needed to make bricks."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Clay, part 2
                        pgettext("europeans_ware", "The Europeans gets clay from gardeners house.")
                    }
                }
            },
            {
                name = "brick",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Brick, part 1
                        pgettext("europeans_ware", "Brick is a basic building material."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Brick, part 2
                        pgettext("europeans_ware", "The Europeans produces bricks in lime kiln or stonemasons house out of clay, granite and water.")
                    }
                }
            },
            {
                name = "marble",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Marble
                    purpose = pgettext("europeans_ware", "Marble is the beautiful stone which is cut out of the mountains or produced in a quarry. Marble is used as a building material and gets chiseled into marble columns in the stonemason’s house.")
                }
            },
            {
                name = "marble_column",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Marble Column
                    purpose = pgettext("europeans_ware", "Marble columns represent the high culture of the Europeans, so they are needed for nearly every advanced building. They are produced out of marble at a stonemason’s house.")
                }
            }
        },
        {
            -- Metal Economy and Trading
            {
                name = "ore",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Iron Ore, part 1
                        pgettext("default_ware", "Ore is mined in ore mines."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Iron Ore, part 2
                        pgettext("europeans_ware", "It is smelted in a smelting works to retrieve all the metals.")
                    }
                }
            },
            {
                name = "gold",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Gold, part 1
                        pgettext("ware", "Gold is the most valuable of all metals, and it is smelted out of ore."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Gold, part 2
                        pgettext("europeans_ware", "It is produced by the smelting works. Some valuable buildings need gold to be built.")
                    }
                }
            },
            {
                name = "coin_copper",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Copper Coin
                        pgettext("ware", "Copper coins are money made of copper or bronze (copper and tin). Its the standard barter object."),
                    }
                }
            },
            {
                name = "coin_silver",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Silver Coin
                        pgettext("ware", "Silver coins are money made of silver. Its a valuable barter object."),
                    }
                }
            },
            {
                name = "coin_gold",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Gold Coin
                        pgettext("ware", "Gold coins are money made of gold. Its most valuable barter object."),
                    }
                }
            },
            {
                name = "quartz",
                default_target_quantity = 32,
                preciousness = 2,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Quartz
                    purpose = pgettext("europeans_ware", "These transparent quartz gems are used for trading. They are produced in a mine.")
                }
            },
            {
                name = "diamond",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Diamond
                    purpose = pgettext("europeans_ware", "These wonderful diamonds are used for trading. They are produced in a mine.")
                }
            }
        },
    },
    -- Workers positions in workers windows.
    -- This also gives us the information which workers the tribe uses.
    -- Each subtable is a column in the workers windows.
    workers_order = {
        {
            -- Carriers and Soldiers
            {
                name = "europeans_carrier",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Carrier
                    purpose = pgettext("europeans_worker", "Used for recruiting all other workers.")
                }
            },
            {
                name = "europeans_carrier_1",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Carrier
                    purpose = pgettext("europeans_worker", "Carries items along your roads with their hands.")
                }
            },
            {
                name = "europeans_carrier_2",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Carrier
                    purpose = pgettext("europeans_worker", "Carries items along your roads with their hands. Only used for busy roads.")
                }
            },
            {
                name = "europeans_carrier_3",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Carrier
                    purpose = pgettext("europeans_worker", "Carries items along your roads with baskets. Only used for busy roads.")
                }
            },
            {
                name = "europeans_carrier_ox",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Ox
                    purpose = pgettext("europeans_worker", "Carries items along your roads. They are reared in an animal farm.")
                }
            },
            {
                name = "europeans_carrier_donkey",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Donkey
                    purpose = pgettext("europeans_worker", "Donkeys help to carry items along busy roads. They are reared in an animal farm.")
                }
            },
            {
                name = "europeans_carrier_horse",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Horse
                    purpose = pgettext("europeans_worker", "Horses help to carry items along busy roads. They are reared in an animal farm.")
                }
            },
            {
                name = "europeans_carrier_tapir",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans worker: Tapir
                    purpose = pgettext("europeans_worker", "Tapirs help to carry items along busy roads. They are reared in an animal farm.")
                }
            },
            {
                name = "europeans_carrier_reindeer",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans worker: Reindeer
                    purpose = pgettext("europeans_worker", "Reindeers help to carry items along busy roads. They are reared in an animal farm.")
                }
            }
        },
        {
            -- Basic Workers
            {
                name = "europeans_worker_basic",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Worker
                    purpose = pgettext("europeans_worker", "General worker with no special ability.")
                }
            },
            {
                name = "europeans_worker_advanced",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Worker
                    purpose = pgettext("europeans_worker", "General worker with no special ability.")
                }
            },
            {
                name = "europeans_shipwright_basic",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Shipwright
                    purpose = pgettext("europeans_worker", "Works at the shipyard and constructs new ships.")
                }
            },
            {
                name = "europeans_shipwright_advanced",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Shipwright
                    purpose = pgettext("europeans_worker", "Works at the shipyard and constructs new ships.")
                }
            },
            {
                name = "europeans_ferry",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Ferry
                    purpose = pgettext("europeans_worker", "Ships wares across narrow rivers.")
                }
            },
            {
                name = "europeans_builder",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Builder
                    purpose = pgettext("europeans_worker", "Works at construction sites to raise new buildings.")
                }
            },
        },
        {
            -- Collectors, Supporters and Producer (Cotton, Reed, Rubber)
            {
                name = "europeans_lumberjack_basic",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Lumberjack / Woodcutter
                    purpose = pgettext("europeans_worker", "Fells trees.")
                }
            },
            {
                name = "europeans_lumberjack_advanced",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Lumberjack / Woodcutter
                    purpose = pgettext("europeans_worker", "Fells trees.")
                }
            },
            {
                name = "europeans_forester",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Ranger / Forester
                    purpose = pgettext("europeans_worker", "Plant trees.")
                }
            },
            {
                name = "europeans_gardener_basic",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Gardener
                    purpose = pgettext("europeans_worker", "Making clay for lime kiln or stonemasons house and planting reed.")
                }
            },
            {
                name = "europeans_gardener_advanced",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Gardener
                    purpose = pgettext("europeans_worker", "Making clay for lime kiln or stonemasons house and planting reed, cotton and rubber trees.")
                }
            },
            {
                name = "europeans_diker",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Purpose helptext for a Europeans worker: Diker
                    purpose = pgettext("europeans_worker", "Constructs breakwaters to gain new land from the sea.")
                }
            }
        },
        {
            -- Miners and Stonecutters
            {
                name = "europeans_geologist",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Geologist
                    purpose = pgettext("europeans_worker", "Discovers resources for mining.")
                }
            },
            {
                name = "europeans_stonecutter_basic",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Stonecutter
                    purpose = pgettext("europeans_worker", "Cuts blocks of granite and marble out of rocks in the vicinity.")
                }
            },
            {
                name = "europeans_stonecutter_advanced",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Stonecutter
                    purpose = pgettext("europeans_worker", "Cuts blocks of granite and marble out of rocks in the vicinity.")
                }
            },
            {
                name = "europeans_miner_basic",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Miner
                    purpose = pgettext("europeans_worker", "Mines ore and minerals.")
                }
            },
            {
                name = "europeans_miner_advanced",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Miner
                    purpose = pgettext("europeans_worker", "Mines ore and minerals.")
                }
            }
        },
        {
            -- Scouting and Trading
            {
                name = "europeans_scout_basic",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Scout
                    purpose = pgettext("europeans_worker", "Scouts like Scotty the scout scouting unscouted areas in a scouty fashion.")
                    -- (c) WiHack Team 02.01.2010
                }
            },
            {
                name = "europeans_scout_advanced",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Scout
                    purpose = pgettext("europeans_worker", "Scouts like Scotty the scout scouting unscouted areas in a scouty fashion.")
                    -- (c) WiHack Team 02.01.2010
                }
            },
            {
                name = "europeans_trader",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Scout
                    purpose = pgettext("europeans_worker", "Traders work in markets or in trading posts to exchange wares with other tribes.")
                }
            },
            {
                name = "europeans_recruit",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Recruit
                    purpose = pgettext("europeans_worker", "Eager to become a soldier and defend his tribe!")
                }
            },
            {
                name = "europeans_soldier",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Soldier
                    purpose = pgettext("europeans_worker", "Defend and Conquer!")
                }
            }
        }
    },

    immovables = {
        {
            name = "ashes",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: Ashes
                purpose = _("The remains of a destroyed building.")
            }
        },
        {
            name = "destroyed_building",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: Destroyed Building
                purpose = _("The remains of a destroyed building.")
            }
        },
        {
            name = "berry_bush_blueberry_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_blueberry_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_blueberry_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it.")
            }
        },
        {
            name = "berry_bush_blueberry_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_currant_red_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_currant_red_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_currant_red_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it.")
            }
        },
        {
            name = "berry_bush_currant_red_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_juniper_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_juniper_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_juniper_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it.")
            }
        },
        {
            name = "berry_bush_juniper_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_raspberry_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_raspberry_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_raspberry_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it.")
            }
        },
        {
            name = "berry_bush_raspberry_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_currant_black_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_currant_black_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_currant_black_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it.")
            }
        },
        {
            name = "berry_bush_currant_black_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_strawberry_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_strawberry_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_strawberry_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it.")
            }
        },
        {
            name = "berry_bush_strawberry_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_stink_tree_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_stink_tree_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_stink_tree_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it.")
            }
        },
        {
            name = "berry_bush_stink_tree_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_desert_hackberry_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_desert_hackberry_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_desert_hackberry_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it.")
            }
        },
        {
            name = "berry_bush_desert_hackberry_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_sea_buckthorn_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_sea_buckthorn_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_sea_buckthorn_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it.")
            }
        },
        {
            name = "berry_bush_sea_buckthorn_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "grapevine_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: Grapevine
                purpose = _("This grapevine has just been planted.")
            }
        },
        {
            name = "grapevine_small",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: Grapevine
                purpose = _("This grapevine is growing.")
            }
        },
        {
            name = "grapevine_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: Grapevine
                purpose = _("This grapevine is growing.")
            }
        },
        {
            name = "grapevine_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: Grapevine
                purpose = _("This grapevine is ready for harvesting.")
            }
        },
        {
            name = "pond_dry",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Pond
                purpose = _("Ponds with water becomes dry after some time. These dry holes vanish after a while.")
            }
        },
        {
            name = "pond_water",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Pond
                purpose = _("When gardeners dig up earth, they leave holes with water in the ground. These falls dry after a while or can be used by terraformer to produce new soil.")
            }
        },
        {
            name = "reedfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Reed Field
                purpose = _("This reed field has just been planted.")
            }
        },
        {
            name = "reedfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Reed Field
                purpose = _("This reed field is growing.")
            }
        },
        {
            name = "reedfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Reed Field
                purpose = _("This reed field is flowering. Honey can be produced from it.")
            }
        },
        {
            name = "reedfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Reed Field
                purpose = _("This reed field is ready for harvesting.")
            }
        },
        {
            name = "europeans_resi_none",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans resource indicator: No resources
                purpose = _("There are no resources in the ground here.")
            }
        },
        {
            name = "europeans_resi_water",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans resource indicator: Water
                purpose = _("There is water in the ground here that can be pulled up by a well.")
            }
        },
        {
            name = "europeans_resi_coal_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Coal, part 1
                    _("Coal veins contain coal that can be dug up by coal mines."),
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Coal, part 2
                    _("There is only a little bit of coal here.")
                }
            }
        },
        {
            name = "europeans_resi_iron_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Iron, part 1
                    _("Iron veins contain iron ore that can be dug up by iron mines."),
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Iron, part 2
                    _("There is only a little bit of iron here.")
                }
            }
        },
        {
            name = "europeans_resi_gold_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Gold, part 1
                    _("Gold veins contain gold ore that can be dug up by gold mines."),
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Gold, part 2
                    _("There is only a little bit of gold here.")
                }
            }
        },
        {
            name = "europeans_resi_stones_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Stones, part 1
                    _("Marble is a basic building material and can be dug up by a marble mine. You will also get granite from the mine."),
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Stones, part 2
                    _("There is only a little bit of marble here.")
                }
            }
        },
        {
            name = "europeans_resi_coal_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Coal, part 1
                    _("Coal veins contain coal that can be dug up by coal mines."),
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Coal, part 2
                    _("There is a lot of coal here.")
                }
            }
        },
        {
            name = "europeans_resi_iron_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Iron, part 1
                    _("Iron veins contain iron ore that can be dug up by iron mines."),
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Iron, part 2
                    _("There is a lot of iron here.")
                }
            }
        },
        {
            name = "europeans_resi_gold_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Gold, part 1
                    _("Gold veins contain gold ore that can be dug up by gold mines."),
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Gold, part 2
                    _("There is a lot of gold here.")
                }
            }
        },
        {
            name = "europeans_resi_stones_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Stones, part 1
                    _("Marble is a basic building material and can be dug up by a marble mine. You will also get granite from the mine."),
                    -- TRANSLATORS: Helptext for an Europeans resource indicator: Stones, part 2
                    _("There is a lot of marble here.")
                }
            }
        },
        {
            name = "europeans_shipconstruction",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: Ship Under Construction
                purpose = _("A ship is being constructed at this site.")
            }
        },
        -- non imperial Immovables used by the woodcutter
        {
            name = "deadtree7",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable usable by Europeans: Dead Tree
                purpose = _("The remains of an old tree.")
            }
        },
        {
            name = "balsa_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Balsa Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "balsa_black_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Balsa Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "balsa_desert_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Balsa Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "balsa_winter_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Balsa Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "ironwood_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Ironwood Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "ironwood_black_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Ironwood Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "ironwood_desert_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Ironwood Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "ironwood_winter_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Ironwood Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "rubber_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Rubber Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "rubber_black_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Rubber Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "rubber_desert_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Corn Field
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "rubber_winter_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Rubber Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
    },

    -- The order here also determines the order in lists on screen.
    buildings = {
        -- Warehouses
        {
            name = "europeans_headquarters",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Headquarters
                purpose = pgettext("europeans_building", "Accommodation for your people. Also stores your wares and tools."),
                -- TRANSLATORS: Note helptext for an Europeans warehouse: Headquarters
                note = pgettext("europeans_building", "The headquarters is your main building.")
            }
        },
        {
            name = "europeans_port_big",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Port
                purpose = pgettext("europeans_building", "Serves as a base for overseas colonization and trade. Also stores your soldiers, wares and tools.")
            }
        },
        {
            name = "europeans_port",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Port
                purpose = pgettext("europeans_building", "Serves as a base for overseas colonization and trade. Also stores your soldiers, wares and tools.")
            }
        },
        -- Markets
        {
            name = "europeans_market",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans market: Market
                purpose = pgettext("europeans_building", "A market enables trading with other tribes.")
            }
        },
        -- Small
        {
            name = "europeans_water_gatherers_hut",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Water Gatherer's Hut
                purpose = pgettext("europeans_building", "Draws water out of the rivers and lakes."),
                note = {
                    -- TRANSLATORS: Note helptext for an Europeans production site: Water Gatherer's Hut, part 1
                    pgettext("europeans_building", "The water gatherer’s hut needs open water within the work area. Your workers cannot dig up water from the ground!"),
                    -- TRANSLATORS: Note helptext for an Europeans production site: Water Gatherer's Hut, part 2
                    pgettext("europeans_building", "Roads and trees along the shoreline block drawing water."),
                },
            }
        },
        {
            name = "europeans_lumberjacks_house_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Lumberjack_s Hut
                purpose = pgettext("europeans_building", "Fells trees in the surrounding area and processes them into logs."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Lumberjack_s Hut
                note = pgettext("europeans_building", "The lumberjack’s hut needs trees to fell within the work area."),
            }
        },
        {
            name = "europeans_lumberjacks_house_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Woodcutters Hut
                purpose = pgettext("europeans_building", "Fells trees in the surrounding area and processes them into logs."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Woodcutters Hut
                note = pgettext("europeans_building", "The lumberjack’s hut needs trees to fell within the work area."),
            }
        },
        {
            name = "europeans_lumberjacks_house_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Woodcutters House
                purpose = pgettext("europeans_building", "Fells trees in the surrounding area and processes them into logs."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Woodcutters House
                note = pgettext("europeans_building", "The lumberjack’s hut needs trees to fell within the work area."),
            }
        },
        {
            name = "europeans_lumberjacks_house_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Lumberjack's House
                purpose = pgettext("europeans_building", "Fells trees in the surrounding area and processes them into logs."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Lumberjack's House
                note = pgettext("europeans_building", "The lumberjack’s hut needs trees to fell within the work area."),
            }
        },
        {
            name = "europeans_lumberjacks_house_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Woodcutters House
                purpose = pgettext("europeans_building", "Fells trees in the surrounding area and processes them into logs."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Woodcutters House
                note = pgettext("europeans_building", "The lumberjack’s house needs trees to fell within the work area.")
            }
        },
        {
            name = "europeans_rare_tree_cutters_hut_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Liana Cutter's Hut
                purpose = pgettext("europeans_building", "Home of the liana cutter who cuts lianas for making ropes."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Liana Cutter's Hut
                note = pgettext("europeans_building", "The liana cutter harvests liana from fully matured trees within the work area which are not being used as lookouts."),
            }
        },
        {
            name = "europeans_rare_tree_cutters_hut_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Rare Tree Cutter's Hut
                purpose = pgettext("europeans_building", "Harvests rare trees in the surrounding area. Delivers ironwood, balsa and rubber."),
            }
        },
        {
            name = "europeans_foresters_house_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Forester's Hut
                purpose = pgettext("europeans_building", "Plants trees in the surrounding area."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Forester's Hut
                note = pgettext("europeans_building", "The forester’s house needs free space within the work area to plant the trees.")
            }
        },
        {
            name = "europeans_foresters_house_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Jungle Preserver's Hut
                purpose = pgettext("europeans_building", "Plants trees in the surrounding area."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Jungle Preserver's Hut
                note = pgettext("europeans_building", "The forester’s house needs free space within the work area to plant the trees.")
            }
        },
        {
            name = "europeans_foresters_house_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Forester's House
                purpose = pgettext("europeans_building", "Plants trees in the surrounding area."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Forester's House
                note = pgettext("europeans_building", "The forester’s house needs free space within the work area to plant the trees.")
            }
        },
        {
            name = "europeans_foresters_house_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Forester's House
                purpose = pgettext("europeans_building", "Plants trees in the surrounding area."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Forester's House
                note = pgettext("europeans_building", "The forester’s house needs free space within the work area to plant the trees.")
            }
        },
        {
            name = "europeans_foresters_house_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Forester's House
                purpose = pgettext("europeans_building", "Plants trees in the surrounding area."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Forester's House
                note = pgettext("europeans_building", "The forester’s house needs free space within the work area to plant the trees.")
            }
        },
        {
            name = "europeans_special_tree_plantation",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Rare Tree Plantation
                purpose = pgettext("europeans_building", "Plants special trees, like balsa, liana, rubber and ironwood."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Rare Tree Plantation
                note = pgettext("europeans_building", "Special trees are planted according to the economy requirements."),
            }
        },
        {
            name = "europeans_gardening_center",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Gardening Center
                purpose = pgettext("europeans_building", "Enhances the fertility of the landscape for trees. Also plants special trees, like balsa, liana, rubber and ironwood."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Gardening Center
                note = pgettext ("europeans_building", "Only a Jungle Master has the necessary experience to coax more growth from land.")
            }
        },
        {
            name = "europeans_quarry_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Quarry
                purpose = pgettext("europeans_building", "Cuts raw pieces of granite out of rocks in the vicinity."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Quarry
                note = pgettext("europeans_building", "The quarry needs rocks to cut within the work area."),
            }
        },
        {
            name = "europeans_quarry_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Quarry
                purpose = pgettext("europeans_building", "Cuts blocks of granite and marble out of rocks in the vicinity."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Quarry
                note = pgettext("europeans_building", "The quarry needs rocks to cut within the work area.")
            }
        },
        {
            name = "europeans_scouts_house_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Scout's Hut
                purpose = pgettext("building", "Explores unknown territory.")
            }
        },
        {
            name = "europeans_scouts_house_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Scout's House
                purpose = pgettext("building", "Explores unknown territory.")
            }
        },
        {
            name = "europeans_trading_post",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Trading Post
                purpose = pgettext("europeans_building", "Trading building to sell or purchase wares to or from other allied tribes.")
            }
        },
        -- Medium
        {
            name = "europeans_well_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Well
                purpose = pgettext("europeans_building", "Draws water out of the deep.")
            }
        },
        {
            name = "europeans_well_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Well
                purpose = pgettext("europeans_building", "Draws water out of the deep.")
            }
        },
        {
            name = "europeans_well_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Well
                purpose = pgettext("europeans_building", "Draws water out of the deep.")
            }
        },
        {
            name = "europeans_well_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Well
                purpose = pgettext("europeans_building", "Draws water out of the deep.")
            }
        },
        {
            name = "europeans_well_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Big Well
                purpose = pgettext("europeans_building", "Draws water out of the deep.")
            }
        },
        {
            name = "europeans_reed_farm_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Reed Yard
                purpose = pgettext("europeans_building", "Sows and harvests reed."),
                -- TRANSLATORS: Note helptext for Europeans production site: Reed Yard
                note = pgettext ("europeans_building", "This farm needs free space within the work area to plant seeds.")
            }
        },
        {
            name = "europeans_reed_farm_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Reed Farm
                purpose = pgettext("europeans_building", "Sows and harvests reed."),
                -- TRANSLATORS: Note helptext for Europeans production site: Reed Farm
                note = pgettext ("europeans_building", "This farm needs free space within the work area to plant seeds.")
            }
        },
        {
            name = "europeans_fruit_farm_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Vineyard
                purpose = pgettext("europeans_building", "Sows and harvests grape."),
                -- TRANSLATORS: Note helptext for Europeans production site: Vineyard
                note = pgettext ("europeans_building", "This farm needs free space within the work area to plant seeds.")
            }
        },
        {
            name = "europeans_fruit_farm_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Berry Farm
                purpose = pgettext("europeans_building", "Plants berry bushes in the surrounding area."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Berry Farm
                note = pgettext("europeans_building", "The berry farm needs free space within the work area to plant the bushes."),
            }
        },
        {
            name = "europeans_sawmill_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Sawmill
                purpose = pgettext("europeans_building", "Hardening log to produce blackwood.")
            }
        },
        {
            name = "europeans_sawmill_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Sawmill
                purpose = pgettext("europeans_building", "Hardening log to produce blackwood and saws log to produce planks.")
            }
        },
        {
            name = "europeans_charcoal_kiln_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Charcoal Kiln
                purpose = pgettext("europeans_building", "Burns scrap_wood into charcoal.")
            }
        },
        {
            name = "europeans_charcoal_kiln_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Charcoal Kiln
                purpose = pgettext("europeans_building", "Burns scrap_wood or logs into charcoal.")
            }
        },
        {
            name = "europeans_stonemasons_house_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Lime Kiln
                purpose = pgettext("europeans_building", "Processes clay and granite to make bricks and ‘grout’, a substance that solidifies and so reinforces masonry."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Lime Kiln
                note = pgettext("europeans_building", "The lime kiln’s output will only go to construction sites that need it. Brick and grout only used by advanced buildings."),
            }
        },
        {
            name = "europeans_stonemasons_house_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Stonemason's House
                purpose = pgettext("europeans_building", "Processes clay and granite to make bricks and ‘grout’, a substance that solidifies and so reinforces masonry. Additionally carves marble columns out of marble."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Lime Kiln
                note = pgettext("europeans_building", "The stonemason’s house's output will only go to construction sites that need it. Marble column only used by advanced buildings."),
            }
        },
        {
            name = "europeans_smelting_works_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Smelting Works
                purpose = pgettext("europeans_building", "Smelts ore into gold.")
            }
        },
        {
            name = "europeans_smelting_works_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Smelting Works
                purpose = pgettext("europeans_building", "Smelts ore into gold.")
            }
        },
        -- Big
        {
            name = "europeans_spiderfarm",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Spider Farm
                purpose = pgettext("europeans_building", "Breeds spiders for silk."),
            }
        },
        {
            name = "europeans_animal_farm_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Cattle Farm
                purpose = pgettext("europeans_building", "Breeds strong oxen for adding them to the transportation system."),
            }
        },
        {
            name = "europeans_animal_farm_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Tapir Farm
                purpose = pgettext("europeans_building", "Breeds tapirs for adding them to the transportation system."),
            }
        },
        {
            name = "europeans_animal_farm_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Horse Farm
                purpose = pgettext("europeans_building", "Breeds the strong horses for adding them to the transportation system."),
            }
        },
        {
            name = "europeans_animal_farm_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Donkey Farm
                purpose = pgettext("europeans_building", "Breeds cute and helpful donkeys for adding them to the transportation system."),
            }
        },
        {
            name = "europeans_animal_farm_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Sheep Farm
                purpose = pgettext("europeans_building", "Keeps sheep for their wool.")
            }
        },
        {
            name = "europeans_animal_farm_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Reindeer Farm
                purpose = pgettext("europeans_building", "Breeds strong reindeer for adding them to the transportation system. Also keeps them for their fur, which is turned into armor and cloth."),
            }
        },
        {
            name = "europeans_weaving_mill_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Weaving Mill
                purpose = pgettext("europeans_building", "Weaves cloth out of reed.")
            }
        },
        {
            name = "europeans_weaving_mill_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Weaving Mill
                purpose = pgettext("europeans_building", "Weaves cloth out of cotton or wool.")
            }
        },
        {
            name = "europeans_dikers_house",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Diker's House
                purpose = pgettext("europeans_building", "Constructs breakwaters nearby to gain new land from the sea."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Diker's House
                note = pgettext("europeans_building", "The diker will terraform the land around each breakwater he builds several times. You can manually remove breakwaters when the land is sufficiently secured to prevent wasting resources; to do so, build a flag, road, or building in the dike’s place.")
            }
        },
        -- Mines
        {
            name = "europeans_stonemine_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Granite Mine
                purpose = pgettext("europeans_building", "Digs granite, marble and other valuable minerals out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_stonemine_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Marble Mine
                purpose = pgettext("europeans_building", "Digs granite, marble and other valuable minerals out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_stonemine_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Deep Marble Mine
                purpose = pgettext("europeans_building", "Digs granite, marble and other valuable minerals out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_stonemine_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Crystal Mine
                purpose = pgettext("europeans_building", "Digs granite, marble and other valuable minerals out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_coalmine_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Coal Mine
                purpose = pgettext("europeans_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_coalmine_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Deep Coal Mine
                purpose = pgettext("europeans_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_coalmine_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Deeper Coal Mine
                purpose = pgettext("europeans_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_coalmine_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Coal Mine
                purpose = pgettext("europeans_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_coalmine_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Deep Coal Mine
                purpose = pgettext("europeans_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_ironmine_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Iron Mine
                purpose = pgettext("europeans_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_ironmine_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Deep Iron Mine
                purpose = pgettext("europeans_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_ironmine_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Deeper Iron Mine
                purpose = pgettext("europeans_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_ironmine_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Iron Mine
                purpose = pgettext("europeans_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_ironmine_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Deep Iron Mine
                purpose = pgettext("europeans_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_goldmine_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Gold Mine
                purpose = pgettext("europeans_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_goldmine_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Deep Gold Mine
                purpose = pgettext("europeans_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_goldmine_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Deeper Gold Mine
                purpose = pgettext("europeans_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_goldmine_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Gold Mine
                purpose = pgettext("europeans_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_goldmine_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Deep Gold Mine
                purpose = pgettext("europeans_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        -- Market
        {
            name = "europeans_store_cloth",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans market: Small Store
                purpose = pgettext("europeans_building", "Store building to sale processed products for coins.")
            }
        },
        {
            name = "europeans_store_fur",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans market: Small Store
                purpose = pgettext("europeans_building", "Store building to sale animal products for coins.")
            }
        },
        {
            name = "europeans_store_plant",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans market: Small Store
                purpose = pgettext("europeans_building", "Store building to sale plant products for coins.")
            }
        },
        {
            name = "europeans_store_stone",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans market: Small Store
                purpose = pgettext("europeans_building", "Store building to sale mining products for coins.")
            }
        },
        {
            name = "europeans_store_wood",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans market: Small Store
                purpose = pgettext("europeans_building", "Store building to sale wood products for coins.")
            }
        },
        -- Recruitement and Training Sites
        {
            name = "europeans_trainingscamp_basic",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Basic Training Camp, part 1
                    pgettext("europeans_building", "Trains recruits to soldiers."),
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Basic Training Camp, part 2
                    pgettext("europeans_building", "Equips the recruits with all necessary armor parts and weapons.")
                },
            }
        },
        {
            name = "europeans_trainingscamp_advanced",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Small Training Camp
                note = pgettext("europeans_building", "Trains soldiers in ‘Health’, ‘Evade’,‘Defense’ and 'Attack'."),
            }
        },
        {
            name = "europeans_trainingscamp_big",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Big Training Camp
                note = pgettext("europeans_building", "Trains soldiers in ‘Health’, ‘Evade’,‘Defense’ and 'Attack'."),
            }
        },
        {
            name = "europeans_shipyard_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Shipyard
                purpose = pgettext("europeans_building", "Constructs ships that are used for overseas colonization and for trading between ports."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Shipyard
                note = pgettext("europeans_building", "Needs water nearby.")
            }
        },
        {
            name = "europeans_shipyard_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Shipyard / Ferry Yard
                purpose = pgettext("europeans_building", "Constructs ships and additional ferries."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Shipyard / Ferry Yard
                note = pgettext("europeans_building", "Needs water nearby.")
            }
        },
        -- Military Sites
        {
            name = "europeans_sentry_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Sentry
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Blockhouse
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_sentry_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Sentry
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Sentry
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_sentry_mountain",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Sentry
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Blockhouse
                note = pgettext("europeans_building", "Modified version which can placed on mountains.")
            }
        },
        {
            name = "europeans_barrier_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Barrier
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Barrier
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_barrier_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Outpost
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Outpost
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_barrier_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Barrier
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Barrier
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_tower_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Tower
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Tower
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_tower_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Tower
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Tower
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_castle_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Fortress
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Castle
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_castle_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Citadel
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Fortress
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_castle_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Fortress
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Fortress
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_castle_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Castle
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Fortress
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        -- Partially Finished Buildings - these are the same 2 buildings for all tribes
        {
            name = "constructionsite",
            helptexts = {
                -- TRANSLATORS: Lore helptext for an Europeans building: Construction Site
                lore = pgettext("europeans_building", "‘Don’t swear at the builder who is short of building materials.’"),
                -- TRANSLATORS: Lore author helptext for an Europeans building: Construction Site
                lore_author = pgettext("europeans_building", "Proverb widely used for impossible tasks of any kind"),
                -- TRANSLATORS: Purpose helptext for an Europeans building: Construction Site
                purpose = pgettext("europeans_building", "A new building is being built at this construction site.")
            }
        },
        {
            name = "dismantlesite",
            helptexts = {
                -- TRANSLATORS: Lore helptext for an Europeans building: Dismantle Site
                lore = pgettext("europeans_building", "‘New paths will appear when you are willing to tear down the old.’"),
                -- TRANSLATORS: Lore author helptext for an Europeans building: Dismantle Site
                lore_author = pgettext("europeans_building", "Proverb"),
                -- TRANSLATORS: Purpose helptext for an Europeans building: Dismantle Site
                purpose = pgettext("europeans_building", "A building is being dismantled at this dismantle site, returning some of the resources that were used during this building’s construction to your tribe’s stores.")
            }
        }
    },
    warehouse_names = {
        -- Other Europeans countries and big Mediterranean islands
        pgettext("warehousename", "Albania"),
        pgettext("warehousename", "Andora"),
        pgettext("warehousename", "Armenia"),
        pgettext("warehousename", "Austria"),
        pgettext("warehousename", "Azerbaijan"),
        pgettext("warehousename", "Belaruz"),
        pgettext("warehousename", "Belgium"),
        pgettext("warehousename", "Bosnia"),
        pgettext("warehousename", "Bulgaria"),
        pgettext("warehousename", "Corsica"),
        pgettext("warehousename", "Creta"),
        pgettext("warehousename", "Croatia"),
        pgettext("warehousename", "Cyprus"),
        pgettext("warehousename", "Czecia"),
        pgettext("warehousename", "Denmark"),
        pgettext("warehousename", "England"),
        pgettext("warehousename", "Espania"),
        pgettext("warehousename", "Estonia"),
        pgettext("warehousename", "Faroer"),
        pgettext("warehousename", "Francia"),
        pgettext("warehousename", "Georgia"),
        pgettext("warehousename", "Germania"),
        pgettext("warehousename", "Gibraltar"),
        pgettext("warehousename", "Greece"),
        pgettext("warehousename", "Guernsey"),
        pgettext("warehousename", "Herzegovina"),
        pgettext("warehousename", "Hungaria"),
        pgettext("warehousename", "Ireland"),
        pgettext("warehousename", "Island"),
        pgettext("warehousename", "Italia"),
        pgettext("warehousename", "Jersey "),
        pgettext("warehousename", "Kosovo"),
        pgettext("warehousename", "Latvia"),
        pgettext("warehousename", "Liechtenstein"),
        pgettext("warehousename", "Lithuania"),
        pgettext("warehousename", "Luxembourg"),
        pgettext("warehousename", "Malta"),
        pgettext("warehousename", "Moldova"),
        pgettext("warehousename", "Monaco"),
        pgettext("warehousename", "Montenegro"),
        pgettext("warehousename", "Netherlands"),
        pgettext("warehousename", "Norge"),
        pgettext("warehousename", "North Macedonia"),
        pgettext("warehousename", "Poland"),
        pgettext("warehousename", "Portugal"),
        pgettext("warehousename", "Romania"),
        pgettext("warehousename", "Russia"),
        pgettext("warehousename", "San Marino"),
        pgettext("warehousename", "Sardinia"),
        pgettext("warehousename", "Scotia"),
        pgettext("warehousename", "Serbia"),
        pgettext("warehousename", "Sicilia"),
        pgettext("warehousename", "Slovakia"),
        pgettext("warehousename", "Slowenia"),
        pgettext("warehousename", "Suomi"),
        pgettext("warehousename", "Sweden"),
        pgettext("warehousename", "Swissia"),
        pgettext("warehousename", "Turkia"),
        pgettext("warehousename", "Ukrainia"),
        pgettext("warehousename", "Vatikan"),
        pgettext("warehousename", "Wales"),
    },
        
   -- Productionsite status strings

   -- TRANSLATORS: Productivity label on an europeans building if there is 1 worker missing
   productionsite_worker_missing = pgettext("europeans", "Worker missing"),
   -- TRANSLATORS: Productivity label on an europeans building if there is 1 worker coming
   productionsite_worker_coming = pgettext("europeans", "Worker is coming"),
   -- TRANSLATORS: Productivity label on an europeans building if there is more than 1 worker missing. If you need plural forms here, please let us know.
   productionsite_workers_missing = pgettext("europeans", "Workers missing"),
   -- TRANSLATORS: Productivity label on an europeans building if there is more than 1 worker coming. If you need plural forms here, please let us know.
   productionsite_workers_coming = pgettext("europeans", "Workers are coming"),
   -- TRANSLATORS: Productivity label on an europeans building if there is 1 experienced worker missing
   productionsite_experienced_worker_missing = pgettext("europeans", "Expert missing"),
   -- TRANSLATORS: Productivity label on an europeans building if there is more than 1 experienced worker missing. If you need plural forms here, please let us know.
   productionsite_experienced_workers_missing = pgettext("europeans", "Experts missing"),

   -- Soldier strings to be used in Military Status strings

   soldier_context = "europeans_soldier",
   soldier_0_sg = "%1% soldier (+%2%)",
   soldier_0_pl = "%1% soldiers (+%2%)",
   soldier_1_sg = "%1% soldier",
   soldier_1_pl = "%1% soldiers",
   soldier_2_sg = "%1%(+%2%) soldier (+%3%)",
   soldier_2_pl = "%1%(+%2%) soldiers (+%3%)",
   soldier_3_sg = "%1%(+%2%) soldier",
   soldier_3_pl = "%1%(+%2%) soldiers",
   -- TRANSLATORS: %1% is the number of europeans soldiers the plural refers to. %2% is the maximum number of soldier slots in the building.
   UNUSED_soldier_0 = npgettext("europeans_soldier", "%1% soldier (+%2%)", "%1% soldiers (+%2%)", 0),
   -- TRANSLATORS: Number of europeans soldiers stationed at a militarysite.
   UNUSED_soldier_1 = npgettext("europeans_soldier", "%1% soldier", "%1% soldiers", 0),
   -- TRANSLATORS: %1% is the number of europeans soldiers the plural refers to. %2% are currently open soldier slots in the building. %3% is the maximum number of soldier slots in the building
   UNUSED_soldier_2 = npgettext("europeans_soldier", "%1%(+%2%) soldier (+%3%)", "%1%(+%2%) soldiers (+%3%)", 0),
   -- TRANSLATORS: %1% is the number of europeans soldiers the plural refers to. %2% are currently open soldier slots in the building.
   UNUSED_soldier_3 = npgettext("europeans_soldier", "%1%(+%2%) soldier", "%1%(+%2%) soldiers", 0),
   
    -- Special types
    builder = "europeans_builder",
    carriers = {"europeans_carrier_1", "europeans_carrier_2", "europeans_carrier_3", "europeans_carrier_ox", "europeans_carrier_donkey", "europeans_carrier_horse"},
    ferry = "europeans_ferry",
    geologist = "europeans_geologist",
    port = "europeans_port_big",
    scouts_house = "europeans_scouts_house_advanced",
    ship = "europeans_ship",
    soldier = "europeans_soldier",
    
    fastplace = {
        barracks = "europeans_trainingscamp_basic",
        building_materials_primary = "europeans_weaving_mill_basic",
        building_materials_secondary = "europeans_sawmill_basic",
        building_materials_tertiary = "europeans_stonemasons_house_basic",
        charcoal = "europeans_charcoal_kiln_basic",
        farm_primary = "europeans_reed_farm_basic",
        farm_secondary = "europeans_reed_farm_advanced",
        farm_tertiary = "europeans_gardening_center",
        ferry_yard = "europeans_shipyard_advanced",
        fish_meat_replenisher = "europeans_animal_farm_level_1",
        forester = "europeans_foresters_hut",
        hunter = "europeans_animal_farm_basic",
        military_small_primary = "europeans_sentry_basic",
        military_small_secondary = "europeans_sentry_level_1",
        military_medium_primary = "europeans_barrier_basic",
        military_medium_secondary = "europeans_barrier_level_2",
        military_tower = "europeans_tower_basic",
        military_fortress = "europeans_castle_level_2",
        military_castle = "europeans_castle_level_3",
        mine_coal = "europeans_coalmine_basic",
        mine_gold = "europeans_goldmine_basic",
        mine_iron = "europeans_ironmine_basic",
        mine_stone = "europeans_stonemine_basic",
        quarry = "europeans_quarry_basic",
        port = "europeans_port",
        scout = "europeans_scouts_house_basic",
        second_carrier = "europeans_animal_farm_level_2",
        shipyard = "europeans_shipyard_basic",
        smelting = "europeans_smelting_works_basic",
        training_small = "europeans_trainingscamp_advanced",
        training_big = "europeans_trainingscamp_big",
        warehouse = "europeans_headquarters",
        weaving_mill = "europeans_weaving_mill_basic",
        well = "europeans_well_basic",
        woodcutter = "europeans_lumberjacks_house_basic",
    },
}

pop_textdomain()
