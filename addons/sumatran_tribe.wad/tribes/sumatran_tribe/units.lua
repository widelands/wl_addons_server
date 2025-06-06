descriptions = wl.Descriptions()

image_dirname = path.dirname(__file__) .. "images/"

push_textdomain("sumatran_tribe.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

-- For lore texts
-- TRANSLATORS: Format string for a Latin quote and its translation
quote_with_translation_format = pgettext("empire_lore", "‘%1%’<br>(%2%)")
function latin_lore(latin, translation)
   return quote_with_translation_format:bformat(latin, translation)
end

-- For versions other than 1.2 market added
if get_build_id():find("1.2", 1, true) == nil then

wl.Descriptions():new_tribe {
    name = "sumatrans",
    animation_directory = image_dirname,
    animations = {
        frontier = { hotspot = {9, 24} },
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
        { ware = "gold", points = 3 },
        { ware = "gold_sheet", points = 3 },
        { ware = "armor_copper", points = 3 },
        { ware = "armor_golden", points = 6 },
        { ware = "shield_golden", points = 3 },
        { ware = "diamond", points = 4 },
    },

    -- Image file paths for this tribe’s road and waterway textures
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
            [0] = "sumatran_resi_none",
        },
        resource_coal = {
            [10] = "sumatran_resi_coal_1",
            [20] = "sumatran_resi_coal_2",
        },
        resource_iron = {
            [10] = "sumatran_resi_iron_1",
            [20] = "sumatran_resi_iron_2",
        },
        resource_gold = {
            [10] = "sumatran_resi_copper_gold_1",
            [20] = "sumatran_resi_copper_gold_2",
        },
        resource_stones = {
            [10] = "sumatran_resi_stones_1",
            [20] = "sumatran_resi_stones_2",
        },
        resource_water = {
            [100] = "sumatran_resi_water",
        },
    },

    wares_order = {
        {
            -- 1. Building Materials (Basic)
            {
                name = "log",
                default_target_quantity = 1000,
                preciousness = 80,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Log, part 1
                        pgettext("sumatran_ware", "Log is an important basic building material. It is also used for charcoal production and for the production of sanded wood for tools and spears."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Log, part 2
                        pgettext("sumatran_ware", "Logs are produced by felling all trees except the tropical ones. Woodcutters need palm planter’s huts nearby to take care of the supply of trees.")
                    }
                }
            },
            {
                name = "tropicalwood",
                default_target_quantity = 1000,
                preciousness = 3,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Tropical Wood, part 1
                        pgettext("sumatran_ware", "Tropical wood is an important basic building material. It is also used for charcoal production."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Tropical Wood, part 2
                        pgettext("sumatran_ware", "It is produced by felling tropical trees (ironwood, rubber and balsa trees as well as dipterocarpus). Woodcutters need jungle preserver’s huts nearby to take care of the supply of tropical trees."),
                    }
                }
            },
            {
                name = "palmleaves",
                default_target_quantity = 40,
                preciousness = 11,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Palm Leaves, part 1
                        pgettext("sumatran_ware", "Palm leaves are a basic building material. They are used together with reed for cloth production too."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Palm Leaves, part 2
                        pgettext("sumatran_ware", "Leaf gatherers need palm planter’s huts nearby to take care of the supply of palm trees. The trees have to be cut down by woodcutters first, then can the gatherers collect the leaves from the ground."),
                    }
                }
            },
            {
                name = "reed",
                preciousness = 50,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Reed, part 1
                        pgettext("sumatran_ware", "Reed is a basic building material. It is used together with palm leaves for cloth production too."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Reed, part 2
                        pgettext("sumatran_ware", "It is planted and collected by the reed cutters on shores of lakes and rivers."),
                    }
                }
            },
            {
                name = "cloth",
                default_target_quantity = 15,
                preciousness = 3,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Cloth, part 1
                        pgettext("sumatran_ware", "Cloth is needed to build several buildings. Also the dressmakers need cloth for clothing for your warriors."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Cloth, part 2
                        pgettext("sumatran_ware", "It is produced out of reed and palm leaves."),
                    }
                }
            },
            {
                name = "stone",
                default_target_quantity = 30,
                preciousness = 4,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Stone
                        pgettext("sumatran_ware", "Stone is a basic building material. You also need it for production of diamonds and whetstones."),
                    }
                }
            },
            {
                name = "sandedwood",
                default_target_quantity = 18,
                preciousness = 10,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Sanded Wood
                        pgettext("sumatran_ware", "Sanded wood is used for tool and spear production. You will need it to build a ship too. It is made out of logs."),
                    }
                }
            },
            {
               name = "crocodile_skin",
                preciousness = 150,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Crocodile Skin
                    purpose = pgettext("sumatran_ware", "Crocodile skin is used for production of clothing for your warriors, hunters, chiefs and scouts.")
                }
            },
            {
                name = "water",
                preciousness = 12,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Water, part 1
                        pgettext("ware", "Water is the essence of life!"),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Water, part 2
                        pgettext("sumatran_ware", "Water is used by the cooks in your kitchens. Cassava plantations and chicken farm need water too.")
                    }
                }
            }
        },
        {
            -- 2. Food Production
            {
                name = "cassavaroot",
                preciousness = 8,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Cassava Root
                        pgettext("sumatran_ware", "Cassava root is cooked in cassava kitchens to prepare starch, the main ingredient of meals."),
                    }
                }
            },
            {
                name = "cassavaleaves",
                preciousness = 40,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Cassava Leaves, part 1
                        pgettext("sumatran_ware", "Cassava leaves are needed to prepare sauce for your meals."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Cassava Leaves, part 2
                        pgettext("sumatran_ware", "Make sure that you leaf gatherers collect all leaves from the harvested cassava fields. Otherwise you will have to substitute them with eggs.")
                    }
                }
            },
            {
                name = "starch",
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Starch, part 1
                        pgettext("sumatran_ware", "Starch is the main ingredient used by meal preparation."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Starch, part 2
                        pgettext("sumatran_ware", "It is made out of cassava roots by cooking.")
                    }
                }
            },
            {
                name = "fish",
                preciousness = 200,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Fish
                        pgettext("sumatran_ware", "Fresh fish is cooked in the kitchens and added into meals for your warriors and miners."),
                    }
                }
            },
            {
                name = "meat",
                preciousness = 200,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Meat
                        pgettext("sumatran_ware", "Fresh meat is cooked in the kitchens and added into meals for yor warriors, miners and carriers."),
                    }
                }
            },
            {
                name = "eggs",
                default_target_quantity = 40,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Eggs, part 1
                        pgettext("sumatran_ware", "Eggs are used as a substitute for meat, fish and cassava leaves in the kitchens."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Eggs, part 2
                        pgettext("sumatran_ware", "You need food waste as a food source for chickens to produce eggs.")
                    }
                }
            },
            {
                name = "meal",
                default_target_quantity = 20,
                preciousness = 4,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Meal
                    purpose = pgettext("sumatran_ware", "Meal is consumed in mines and training sites. Every new carrier also need meal before his service on a road."),
                    -- TRANSLATORS: Note helptext for a Sumatran ware: Meal
                    note = pgettext("sumatran_ware", "Meal is an optimal combination of several food ingredients. These are starch, cassava leaves, meat or fish and water. Eggs can be used instead some of these ingredients too."),
                }
            },
            {
                name = "food_waste",
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Food Waste
                    purpose = pgettext("sumatran_ware", "You can feed food waste to your chickens and gain eggs and meat."),
                    -- TRANSLATORS: Note helptext for a Sumatran ware: Food Waste
                    note = pgettext("sumatran_ware", "Food waste is produced as a byproduct in your kitchens. Kitchens also start producing food waste by throwing out starch when they don't have cassava leaves or eggs on stock and meal is needed.")
                }
            },
            {
                name = "palm_wine",
                preciousness = 4,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Palm Wine
                    purpose = pgettext("sumatran_ware", "Palm wine is consumed together with meal in your training sites and in deep mines. It is produced by winery and wineries need fully grown palms nearby.")
                }
            }
        },
        {
           -- 3. Mining
             {
                name = "diamond_raw",
                default_target_quantity = 5,
                preciousness = 30,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Raw Diamond
                    purpose = pgettext("sumatran_ware", "Raw diamonds are used to produce whetstones or can be polished and used as a precious building material.")
                }
            },
            {
                name = "diamond",
                default_target_quantity = 2,
                preciousness = 2,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Diamond, part 1
                        pgettext("sumatran_ware", "Diamonds are a very precious building material. These precious stones are also your main source of wealth, when goal of game is to collect precious things."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Diamond, part 2
                        pgettext("sumatran_ware", "The production of diamonds is skipped when whetstone is needed.")
                    }
                }
            },
           {
                name = "coal",
                default_target_quantity = 50,
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Coal, part 1
                        pgettext("sumatran_ware", "While smelting metals, the fires of the sumatran furnaces are fed with coal."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Coal, part 2
                        pgettext("sumatran_ware", "It is mined in coal mines or produced out of logs and tropical wood by a charcoal kiln.")
                    }
                }
            },
            {
                name = "copper_ore",
                default_target_quantity = 10,
                preciousness = 3,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Copper Ore, part 1
                        pgettext("sumatran_ware", "Copper ore can be smelted into copper in a furnace."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Copper Ore, part 2
                        pgettext("sumatran_ware", "Your miners need meals and in deep mines also palm wine to produce it.")
                    }
                }
            },
            {
                name = "copper",
                default_target_quantity = 10,
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Copper, part 1
                        pgettext("sumatran_ware", "Copper is needed for armor production. It is a rare building material too."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Copper, part 2
                        pgettext("sumatran_ware", "It is produced by the furnaces.")
                    }
                }
            },
            {
                name = "iron_ore",
                default_target_quantity = 10,
                preciousness = 3,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Iron Ore, part 1
                        pgettext("ware", "Iron ore can be smelted into iron in a furnace."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Iron Ore, part 2
                        pgettext("sumatran_ware", "Your miners need meals and in deep mines also palm wine to produce it.")
                    }
                }
            },
            {
                name = "iron",
                default_target_quantity = 10,
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Iron, part 1
                        pgettext("ware", "Iron is needed for tool and weapon production."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Iron, part 2
                        pgettext("sumatran_ware", "It is produced by the furnaces.")
                    }
                }
            },
            {
                name = "gold_ore",
                default_target_quantity = 10,
                preciousness = 3,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Gold Ore, part 1
                        pgettext("ware", "Gold ore can be smelted into gold in a furnace."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Gold Ore, part 2
                        pgettext("sumatran_ware", "Your miners need meals and in deep mines also palm wine to produce it.")
                    }
                }
            },
            {
                name = "gold",
                default_target_quantity = 5,
                preciousness = 4,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Gold, part 1
                        pgettext("ware", "Gold is needed for armor production. It is a rare building material too."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Gold, part 2
                        pgettext("sumatran_ware", "Gold is the most valuable of all metals, and it is smelted out of gold ore in furnaces.")
                    }
                }
            }
        },
        {
            -- 4. Tools
            {
                name = "felling_ax",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Felling Ax, part 1
                        pgettext("sumatran_ware", "The felling ax is the tool to cut down trees and is used by woodcutters."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Felling Ax, part 2
                        pgettext("sumatran_ware", "They are produced by tools workshops.")
                    }
                }
            },
            {
                name = "pick",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                         -- TRANSLATORS: Helptext for a Sumatran ware: Pick
                         pgettext("sumatran_ware", "Picks are used by stonecutters and miners."),
                     }
                }
            },
            {
                name = "shovel",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Shovel
                        pgettext("sumatran_ware", "The shovel is an essential tool for foresters and farmers."),
                    }
                }
            },
            {
                name = "hammer",
                default_target_quantity = 2,
                preciousness = 10,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Hammer, part 1
                        pgettext("sumatran_ware", "The hammer is the most used tool. Geologists, builders, coppersmiths, shipwrights and craftsmen, they all need hammer."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Hammer, part 2
                        pgettext("sumatran_ware", "They are produced by tools workshops.")
                    }
                }
            },
            {
                name = "machete",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Machete, part 1
                        pgettext("sumatran_ware", "The machete is a tool for leaf gatherers, reedcutters and together with buckets also for wine makers."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Machete, part 2
                        pgettext("sumatran_ware", "They are produced by tools workshops.")
                    }
                }
            },
            {
                name = "kitchen_tools",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    purpose = {
                         -- TRANSLATORS: Helptext for a Sumatran ware: Kitchen Tools, part 1
                         pgettext("sumatran_ware", "Kitchen tools are used by cooks."),
                         -- TRANSLATORS: Helptext for a Sumatran ware: Kitchen Tools, part 2
                         pgettext("sumatran_ware", "They are produced by tools workshops.")
                     }
                }
            },
            {
                name = "fire_tongs",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Fire Tongs, part 1
                        pgettext("sumatran_ware", "Fire tongs are the tools for smelting ores."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Fire Tongs, part 2
                        pgettext("sumatran_ware", "They are produced by tools workshops.")
                    }
                }
            },
            {
                name = "buckets",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Buckets, part 1
                        pgettext("sumatran_ware", "Buckets are used by water carriers and together with a machete by wine makers."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Buckets, part 2
                        pgettext("sumatran_ware", "They are produced by tools workshops.")
                    }
                }
            },
            {
                name = "whetstone",
                default_target_quantity = 2,
                preciousness = 10,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Whetstone
                        pgettext("sumatran_ware", "Whetstones are used by craftsmen and are produced in a basic workshop."),
                    }
                }
            }
        },
        {
            -- 5. Weapons, Armour
            {
                name = "copper_sheet",
                default_target_quantity = 10,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Copper Sheet
                        pgettext("sumatran_ware", "Source material for armor production."),
                    }
                }
            },
            {
                name = "gold_sheet",
                default_target_quantity = 10,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Gold Sheet
                        pgettext("sumatran_ware", "Source material for armor production."),
                    }
                }
            },
            {
                name = "sumatran_spear",
                default_target_quantity = 10,
                preciousness = 5,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Spear
                    purpose = pgettext("sumatran_ware", "Spear is a widely used weapon for hunters and warriors.")
                }
            },
            {
                name = "crocodile_jacket",
                default_target_quantity = 10,
                preciousness = 5,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Crocodile Jacket
                    purpose = pgettext("sumatran_ware", "A basic piece of clothing for your warriors, hunters and chiefs.")
                }
            },
            {
                name = "warriors_dress",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Warrior's Dress
                    purpose = pgettext("sumatran_ware", "The warriors dress is an ideal type clothing for warriors. It is produced in a sewing workshop and used in a training camp – together with meal and palm wine – to ensure that the warrior’s health will be on the highest level.")
                }
            },
            {
                name = "crocodile_shoes",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Crocodile Shoes
                    purpose = pgettext("sumatran_ware", "This shoes are produced in a sewing workshop and used in a training camp – together with meal and palm wine – to train soldiers in evade. Scouts wear this type of shoes too.")
                }
            },
            {
                name = "armor_copper",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Copper Armor
                    purpose = pgettext("sumatran_ware", "The copper armor is a basic defense tool for warriors. It is produced in an armorsmithy and used in a training camp – together with meal and palm wine – to train warriors in defense.")
                }
            },
            {
                name = "armor_golden",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Golden Armor
                    purpose = pgettext("sumatran_ware", "The golden armor is an improved defense tool for warriors. It is produced in an armorsmithy and used in a training camp – together with meal and palm wine – to train warriors in defense.")
                }
            },
            {
                name = "shield_golden",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Golden Shield
                    purpose = pgettext("sumatran_ware", "The golden shield is the most efficient defense tool for warriors. It is produced in an armorsmithy and used in a training camp – together with meal and palm wine – to train warriors in defense.")
                }
            },
        }
    },
    workers_order = {
        {
            -- 1. Carriers and General Workers
            {
                name = "sumatrans_carrier",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Carrier (female)
                    purpose = pgettext("sumatran_worker", "Carries items along roads.")
                }
            },
            {
                name = "sumatran_carrier_1",
                default_target_quantity = 1,
                preciousness = 2,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Carrier (male)
                    purpose = pgettext("sumatran_worker", "Carries items along roads.")
                }
            },
            {
                name = "sumatran_ferry",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Ferry
                    purpose = pgettext("sumatran_worker", "Ships wares across narrow rivers and straights.")
                }
            },
            {
                name = "sumatran_recruit",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Recruit
                    purpose = pgettext("sumatran_worker", "Eager to become a soldier and defend his tribe!")
                }
            },
            {
                name = "sumatran_breeder",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Breeder
                    purpose = pgettext("sumatran_worker", "Breeds animals.")
                }
            },
            {
                name = "sumatran_scout",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Scout
                    purpose = pgettext("sumatran_worker", "Explores territory of your enemy.")
                }
            },
            {
                name = "sumatran_jungle_ghost",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Jungle Ghost
                    purpose = pgettext("sumatran_worker", "Gives life to the tropical animals and dwells in thermal springs.")
                }
            }
        },
        {
            -- 2. Building materials, Builders
            {
                name = "sumatran_stonecutter",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Stonecutter
                    purpose = pgettext("sumatran_worker", "Mines stone.")
                }
            },
            {
                name = "sumatran_woodcutter",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Woodcutter
                    purpose = pgettext("sumatran_worker", "Fells trees.")
                }
            },
            {
                name = "sumatran_forester",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Forester
                    purpose = pgettext("sumatran_worker", "Plants trees.")
                }
            },
            {
                name = "sumatran_reedcutter",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Reedcutter
                    purpose = pgettext("sumatran_worker", "Grows reed.")
                }
            },
            {
                name = "sumatran_leaf_gatherer",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Leaf Gatherer
                    purpose = pgettext("sumatran_worker", "Collects palm and cassava leaves.")
                }
            },
            {
                name = "sumatran_shipwright",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Shipwright
                    purpose = pgettext("sumatran_worker", "Works at the shipyard and constructs new ships.")
                }
            },
            {
                name = "sumatrans_builder",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Builder
                    purpose = pgettext("sumatran_worker", "Works at construction sites to raise new buildings.")
                }
            }
        },
        {
            -- 3. Collectors and Food Supply
            {
                name = "sumatran_water_carrier",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Water Carrier
                    purpose = pgettext("sumatran_worker", "Carries water.")
                }
            },
            {
                name = "sumatran_hunter",
                default_target_quantity = 1,
                preciousness = 3,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Hunter
                    purpose = pgettext("sumatran_worker", "Produces meat and fish.")
                }
            },
            {
                name = "sumatran_hunter_chief",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Chief Hunter
                    purpose = pgettext("sumatran_worker", "Produces meat, fish and crocodile skin.")
                }
            },
            {
                name = "sumatran_farmer",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Farmer
                    purpose = pgettext("sumatran_worker", "Grows cassava.")
                }
            },
            {
                name = "sumatran_farmer_experienced",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Experienced Farmer
                    purpose = pgettext("sumatran_worker", "Grows cassava.")
                }
            },
            {
                name = "sumatran_winemaker",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Winemaker
                    purpose = pgettext("sumatran_worker", "Produces palm wine.")
                }
            },
            {
                name = "sumatran_cook",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Cook
                    purpose = pgettext("sumatran_worker", "Prepares meals.")
                }
            }
        },
        {
            -- 4. Miners and Metal Workers
            {
                name = "sumatran_geologist",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Geologist
                    purpose = pgettext("sumatran_worker", "Discovers resources for mining.")
                }
            },
            {
                name = "sumatran_miner",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Miner
                    purpose = pgettext("sumatran_worker", "Mines ore and minerals.")
                }
            },
            {
                name = "sumatran_miner_master",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Master Miner
                    purpose = pgettext("sumatran_worker", "Mines ore and minerals.")
                }
            },
            {
                name = "sumatran_smelter",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Smelter
                    purpose = pgettext("sumatran_worker", "Smelts ore.")
                }
            },
            {
                name = "sumatran_charcoal_burner",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Charcoal Burner
                    purpose = pgettext("sumatran_worker", "Burns logs and wood to produce charcoal.")
                }
            },
            {
                name = "sumatran_craftsman",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Craftsman
                    purpose = pgettext("sumatran_worker", "Produces sanded wood, whetstones and polished diamonds.")
                }
            },
            {
                name = "sumatran_craftsman_experienced",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Experienced Craftsman
                    purpose = pgettext("sumatran_worker", "Produces tools, weapons.")
                }
            }
        },
        {
            -- 5. Training, Clothing
            {
                name = "sumatran_soldier",
                default_target_quantity = 40,
                preciousness = 200,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Warrior
                    purpose = pgettext("sumatran_worker", "Defend and Conquer!")
                }
            },
            {
                name = "sumatran_chief",
                default_target_quantity = 1,
                preciousness = 3,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Chief
                    purpose = pgettext("sumatran_worker", "Trains warriors.")
                }
            },
            {
                name = "sumatran_tribal_chief",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Tribal Chief
                    purpose = pgettext("sumatran_worker", "Trains and recruits warriors. Recruits hunters, new chiefs and carriers too.")
                }
            },
            {
                name = "sumatran_weaver",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Weaver
                    purpose = pgettext("sumatran_worker", "Weaves cloth.")
                }
            },
            {
                name = "sumatran_dressmaker",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Dressmaker
                    purpose = pgettext("sumatran_worker", "Dressmaker is an experienced weaver and produces clothing.")
                }
            },
            {
                name = "sumatran_coppersmith",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Coppersmith
                    purpose = pgettext("sumatran_worker", "Makes metal sheets for armor production.")
                }
            },
            {
                name = "sumatran_armorsmith",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Armorsmith
                    purpose = pgettext("sumatran_worker", "Armorsmith is an experienced coppersmith and produces armor for training camps.")
                }
            }
        },
    },

    immovables = {
        {
            name = "ashes",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Ashes
                purpose = _("The remains of a destroyed building.")
            }
        },
        {
            name = "destroyed_building",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Destroyed Building
                purpose = _("The remains of a destroyed building.")
            }
        },
        {
            name = "palm_leaves",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Palm Leaves
                purpose = _("Palm leaves can be picked up by a leaf gatherer and used as building material and for weaving cloth.")
            }
        },
        {
            name = "cassavaplants_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Cassava Plants (tiny)
                purpose = _("These cassava plants has just been planted.")
            }
        },
        {
            name = "cassavaplants_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Cassava Plants (small)
                purpose = _("These cassava plants are growing.")
            }
        },
        {
            name = "cassavaplants_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Cassava Plants (medium)
                purpose = _("These cassava plants are flowering.")
            }
        },
        {
            name = "cassavaplants_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Cassava Plants (ripe)
                purpose = _("These cassava plants are ready for harvesting.")
            }
        },
        {
            name = "cassavaplants_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Cassava Plants (harvested)
                purpose = _("These cassava plants has been harvested. Your leaf gatherer can pick up some cassava leaves here.")
            }
        },
        {
            name = "reedfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Reed Field
                purpose = _("This reed field has just been planted.")
            }
        },
        {
            name = "reedfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Reed Field
                purpose = _("This reed field is growing.")
            }
        },
        {
            name = "reedfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Reed Field
                purpose = _("This reed field is flowering.")
            }
        },
        {
            name = "reedfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Reed Field
                purpose = _("This reed field is ready for harvesting.")
            }
        },
        {
            name = "rubber_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Rubber Tree Sapling
                purpose = _("This rubber tree has just been planted.")
            }
        },
        {
            name = "rubber_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Rubber Tree Pole
                purpose = _("This rubber tree is growing.")
            }
        },
        {
            name = "rubber_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Rubber Tree Mature
                purpose = _("This rubber tree is fully grown.")
            }
        },
        {
            name = "rubber_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Rubber Tree Old
                purpose = _("This rubber tree is ready for harvesting tropical wood by a woodcutter. Other tribes can harvest it for normal logs or rubber.")
            }
        },
        {
            name = "dipterocarpus_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Dipterocarpus (Sapling)
                purpose = _("This dipterocarpus tree has just been planted.")
            }
        },
        {
            name = "dipterocarpus_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Dipterocarpus (Pole)
                purpose = _("This dipterocarpus tree is growing.")
            }
        },
        {
            name = "dipterocarpus_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Dipterocarpus (Mature)
                purpose = _("This dipterocarpus tree is fully grown.")
            }
        },
        {
            name = "dipterocarpus_old",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Dipterocarpus (Old)
                purpose = _("This dipterocarpus tree is ready for harvesting tropical wood by a woodcutter. Other tribes can harvest it for normal logs.")
            }
        },
        {
            name = "ironwood_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Ironwood Tree (Sapling)
                purpose = _("This ironwood tree has just been planted.")
            }
        },
        {
            name = "ironwood_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Ironwood Tree (Pole)
                purpose = _("This ironwood tree is growing.")
            }
        },
        {
            name = "ironwood_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Ironwood Tree (Mature)
                purpose = _("This ironwood tree is fully grown.")
            }
        },
        {
            name = "ironwood_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Ironwood Tree (Old)
                purpose = _("This ironwood tree is ready for harvesting tropical wood by a woodcutter. Other tribes can harvest it for normal logs or ironwood.")
            }
        },
        {
            name = "balsa_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Balsa Tree (Sapling)
                purpose = _("This balsa tree has just been planted.")
            }
        },
        {
            name = "balsa_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Balsa Tree (Pole)
                purpose = _("This balsa tree is growing.")
            }
        },
        {
            name = "balsa_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Balsa Tree (Mature)
                purpose = _("This balsa tree is fully grown.")
            }
        },
        {
            name = "balsa_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Balsa Tree (Old)
                purpose = _("This balsa tree is ready for harvesting tropical wood by a woodcutter. Other tribes can harvest it for normal logs or balsa.")
            }
        },
        {
            name = "sumatran_resi_none",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran resource indicator: No resources
                purpose = _("There are no resources in the ground here.")
            }
        },
        {
            name = "sumatran_resi_water",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran resource indicator: Water
                purpose = _("There is water in the ground here.")
            }
        },
        {
            name = "sumatran_resi_coal_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Coal, part 1
                    _("Coal veins contain coal that can be dug up by coal mines."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Coal, part 2
                    _("There is only a little bit of coal here.")
                }
            }
        },
        {
            name = "sumatran_resi_iron_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Iron, part 1
                    _("This vein contains iron ore that can be dug up by iron mines."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Iron, part 2
                    _("There is only a little bit of iron ore here.")
                }
            }
        },
        {
            name = "sumatran_resi_copper_gold_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Copper-Gold, part 1
                    _("This vein contains copper-gold ore that can be dug up by copper-gold mines."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Copper-Gold, part 2
                    _("There is only a little bit of copper-gold ore here.")
                }
            }
        },
        {
            name = "sumatran_resi_stones_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Stones, part 1
                    _("Stone is a basic building material and can be dug up by a stone mine. You will also get some raw diamonds from the mine."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Stones, part 2
                    _("There is only a little bit of stone and diamonds here.")
                }
            }
        },
        {
            name = "sumatran_resi_coal_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Coal, part 1
                    _("Coal veins contain coal that can be dug up by coal mines."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Coal, part 2
                    _("There is a lot of coal here.")
                }
            }
        },
        {
            name = "sumatran_resi_iron_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Iron, part 1
                    _("This vein contains iron ore that can be dug up by iron mines."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Iron, part 2
                    _("There is a lot of iron ore here.")
                }
            }
        },
        {
            name = "sumatran_resi_copper_gold_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Copper-Gold, part 1
                    _("This vein contains copper-gold ore that can be dug up by copper-gold mines."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Copper-Gold, part 2
                    _("There is a lot of copper-gold ore here.")
                }
            }
        },
        {
            name = "sumatran_resi_stones_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Stones, part 1
                    _("Stone is a basic building material and can be dug up by a stone mine. You will also get some raw diamonds from the mine."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Stones, part 2
                    _("There is a lot of stone and diamonds here.")
                }
            }
        },
        {
            name = "sumatran_shipconstruction",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Ship Under Construction
                purpose = _("A ship is being constructed at this site.")
            }
        }
    },

    -- The order here also determines the order in lists on screen.
    buildings = {
        -- Warehouses
        {
            name = "sumatran_headquarters",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Sumatran production site: Headquarters
                lore = pgettext("sumatran_building", "Oh, you brave northern star, you are protecting and watching over all of our buildings. All other stars come and go, but you never leave your place."),
                -- TRANSLATORS: Lore author helptext for a Sumatran production site: Headquarters
                lore_author = pgettext("sumatran_building", "Part of tribal equinox prayer"),
                -- TRANSLATORS: Purpose helptext for a Sumatran warehouse: Headquarters
                purpose = pgettext("sumatran_building", "Accommodation for your people. Also stores your wares and tools."),
                -- TRANSLATORS: Note helptext for a Sumatran warehouse: Headquarters
                note = pgettext("sumatran_building", "The headquarters is your main building."),
            }
        },
        {
            name = "sumatran_warehouse",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran warehouse: Warehouse
                purpose = pgettext("sumatran_building", "Your workers and warriors will find shelter here. Also stores your wares and tools.")
            }
        },
        {
            name = "sumatran_port",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran warehouse: Port
                purpose = pgettext("sumatran_building", "Serves as a base for overseas colonization and trade. Also stores your warriors, wares and tools.")
            }
        },
      -- Markets
        {
            name = "sumatran_market",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Lutas' Atlantean market: Market
                purpose = pgettext("sumatran_building", "A market enables trading with other tribes.")
            }
        },
        -- Small
        {
            name = "sumatran_woodcutters_house",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Woodcutter’s House
                purpose = pgettext("sumatran_building", "Fells trees in the surrounding area and processes them into logs or tropical wood."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Woodcutter’s House
                note = pgettext("sumatran_building", "The woodcutter recognizes 3 types of trees. Tropical trees (ironwood, balsa and rubber tree and dipterocarpus), palm trees (5 types of official palms) and all other trees. Trees of the first two groups are cut down only when tropical wood respectively log or palm leaves is needed. If the woodcutter is not able to cut down both tropical and palm trees, the building’s productivity can decrease."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Woodcutter’s House, part 1
                   pgettext("sumatran_building", "The woodcutter can produce one log between %1$s and %2$s on average, depending on how far he has to walk and how many tree types are available. If there is only one type of trees, if there are two types or tree types, he needs %3$s, %4$s or %5$s on average to cut down one tree respectively."):bformat(format_seconds(30), format_minutes_seconds(1, 29), format_seconds(59), format_seconds(50), format_seconds(46)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Woodcutter’s House, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_palm_planters_hut",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Sumatran production site: Palm Planter’s Hut
                lore = pgettext("sumatran_building", "The old legends say that long time ago our tribe lived in a place where only palm trees were growing. Without palm trees we could never call this place our home, they have an irreplaceable place in our culture and economy."),
                -- TRANSLATORS: Lore author helptext for a Sumatran production site: Palm Planter’s Hut
                lore_author = pgettext("sumatran_building", "Explanation why foresters living in this houses plant palm trees only"),
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Palm Planter’s Hut
                purpose = pgettext("sumatran_building", "Plants palm trees in the surrounding area."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Palm Planter’s Hut
                note = pgettext("sumatran_building", "You need palm trees for logs, palm wine production and palm leaves, which are collected by leaf gather when a palm tree is cut down."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Palm Planter’s Hut, part 1
                   pgettext("sumatran_building", "The forester plants one palm tree between %1$s and %2$s on average, depending on how far he has to walk."):bformat(format_seconds(18), format_seconds(43)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Palm Planter’s Hut, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_jungle_preservers_hut",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Jungle Preserver’s Hut
                purpose = pgettext("sumatran_building", "Plants tropical trees in the surrounding area."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Jungle Preserver’s Hut
                note = pgettext("sumatran_building", "The tropical trees are source of tropical wood, which is an important building material."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Jungle Preserver’s Hut, part 1
                   pgettext("sumatran_building", "The forester plants one tree between %1$s and %2$s on average, depending on how far he has to walk."):bformat(format_seconds(26), format_seconds(51)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Jungle Preserver’s Hut, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_stonecutters_hut",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Stonecutter’s Hut
                purpose = pgettext("sumatran_building", "Cuts raw pieces of stone out of rocks in the vicinity."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Stonecutter’s Hut
                note = pgettext("sumatran_building", "The stonecutter needs rocks to cut within the work area."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Stonecutter’s Hut, part 1
                   pgettext("sumatran_building", "The stonecutter can produce one block of stone between %1$s and %2$s on average, depending on how far he has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 9)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Stonecutter’s Hut, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_water_carriers_hut",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Water Carrier’s Hut
                purpose = pgettext("sumatran_building", "Draws water out of the rivers and lakes."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Water Carrier’s Hut
                note = pgettext("sumatran_building", "Water carriers cannot dig up water from the ground. Roads and trees along the shoreline block drawing water."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Water Carrier’s Hut, part 1
                   pgettext("sumatran_building", "The carrier can produce one bucket of water between %1$s and %2$s on average, depending on how far he has to walk."):bformat(format_seconds(18), format_seconds(51)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Water Carrier’s Hut, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_leaf_gatherers_hut",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Leaf Gatherer’s Hut
                purpose = pgettext("sumatran_building", "Gathers cassava leaves left by farmers and palm leaves left by woodcutters."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Leaf Gatherer’s Hut
                note = pgettext("sumatran_building", "Both cassava and palm leaves are important wares for your economy and shortages may cause you trouble."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Water Carrier’s Hut, part 1
                   pgettext("sumatran_building", "The leaf gatherer can produce one bundle of leaves between %1$s and %2$s on average, depending on how far she has to walk."):bformat(format_seconds(23), format_minutes_seconds(1, 3)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Water Carrier’s Hut, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_hunters_tent",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Hunter’s Tent
                purpose = pgettext("building", "Hunts animals to produce meat and catches fishes in the waters."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Hunter’s Tent
                note = pgettext("sumatran_building", "The building has 3 different working areas. Smallest for fishing, larger for hunting and the largest is not used by the worker in this type of building."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Hunter’s Tent, part 1
                   pgettext("sumatran_building", "If the hunter has both game and fishes in his working area, he needs %1$s to hunt two animals and to catch one fish on average. If there is only one food source available, he needs %2$s to hunt one animal or %3$s to catch one fish on average."):bformat(format_minutes_seconds(2, 42), format_seconds(55), format_minutes_seconds(1, 33)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Hunter’s Tent, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
             }
        },
        {
            name = "sumatran_hunters_house",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Hunter’s House
                purpose = pgettext("building", "Hunts animals to produce meat and catches fishes in the waters. Hunters in this houses can hunt crocodiles for skin and meat too."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Hunter’s House
                note = pgettext("sumatran_building", "The building has 2 different working areas. Smaller for fishing and the larger for hunting."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Hunter’s House, part 1
                   pgettext("sumatran_building", "If the hunter has game, crocodiles and fishes in his working area, he needs %1$s to hunt one animal, one crocodile and to catch one fish on average. If there are only two food sources available, he needs %2$s to hunt one animal and one crocodile or %3$s to hunt one animal or crocodile and to catch one fish on average. If there is only one food source available, he needs %4$s to hunt one animal or one crocodile and %5$s to catch one fish on average."):bformat(format_minutes_seconds(2, 33), format_minutes_seconds(1, 40), format_minutes_seconds(1, 53), format_minutes(1), format_minutes_seconds(1, 13)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Hunter’s House, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_thermal_springs",
            helptexts = {
                purpose = {
                   -- TRANSLATORS: Purpose helptext for a Sumatran production site: Thermal springs, part 1
                   pgettext("sumatran_building", "Thermal springs make terrain more favorable for tropical and palm trees. This is useful especially while playing wasteland and winter maps. In the first case to transform mountains is very advantageous, in the second case, all types of terrain can be transformed."),
                   -- TRANSLATORS: Purpose helptext for a Sumatran production site: Thermal springs, part 2
                   pgettext("sumatran_building", "While playing on White Summer terrains, flowering meadows can be transformed into normal meadows and used for growing palm trees, which are hard to grow on clearings.")
                },
                -- TRANSLATORS: Note helptext for a Sumatran production site: Thermal springs, the first placeholder is "145 min.", the next three "54"
                note = pgettext("sumatran_building", "Thermal springs need maintenance. That costs you logs, stone and water."),
                performance = pgettext("sumatran_building", "The building needs approximately %1% to improve fertility of every field in its working area. By doing that it will consume approximately %2% logs, %3% buckets of water and %4% blocks of stone."):bformat(format_minutes(145), 54, 54, 54)
            }
        },
        {
            name = "sumatran_scouts_dwelling",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Scout’s Dwelling
                purpose = pgettext("building", "Explores unknown territory.")
            }
        },

        -- Medium
        {
            name = "sumatran_reed_yard",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Reed Yard
                purpose = pgettext("sumatran_building", "Produces reed."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Reed Yard
                note = pgettext("sumatran_building", "Needs water nearby."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Water Carrier’s Hut, part 1
                   pgettext("sumatran_building", "The reedcutter can produce one bundle of reed between %1$s and %2$s on average, depending on how far he has to walk."):bformat(format_seconds(49), format_minutes_seconds(1, 40)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Water Carrier’s Hut, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_workshop_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Basic Workshop
                purpose = pgettext("sumatran_building", "Produces sandedwood, diamonds and whetstones."),
                performance = pgettext("sumatran_building", "The craftsman needs %1% to produce sanded wood, %2% to polish one diamond or %3% to produce whetstones."):bformat(format_seconds(20), format_minutes_seconds(1, 12), format_minutes_seconds(1, 7))
            }
        },
        {
            name = "sumatran_workshop_tools",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Tools Workshop
                purpose = pgettext("sumatran_building", "Forges the tools that your workers need."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Tools Workshop
                note = pgettext("sumatran_building", "Notice that the building needs an experienced worker. If you don’t have any, your worker needs to gain some experience by working in a basic workshop for some period of time."),
                performance = pgettext("sumatran_building", "The experienced craftsman needs %1% on average to make one tool."):bformat(format_seconds(59))
            }
        },
        {
            name = "sumatran_workshop_weapons",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Weapons Workshop
                purpose = pgettext("sumatran_building", "Produces spears for hunters, warriors and hunting camps."),
                performance = pgettext("sumatran_building", "The experienced craftsman needs %1% on average to make one spear."):bformat(format_seconds(25))
            }
        },
        {
            name = "sumatran_coppersmiths_house",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Coppersmith’s House
                purpose = pgettext("sumatran_building", "Produces copper sheets and gold sheets."),
                performance = pgettext("sumatran_building", "The coppersmith needs %1% to produce one copper sheet or %2% to produce one gold sheet."):bformat(format_seconds(15), format_seconds(30))
            }
        },
        {
            name = "sumatran_armorsmithy",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Armorsmithy
                purpose = pgettext("sumatran_building", "Produces shields and armor."),
                performance = pgettext("sumatran_building", "The armorsmith needs %1% on average to make one piece of armor."):bformat(format_seconds(50))
            }
        },
        {
            name = "sumatran_winery",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Winery
                purpose = pgettext("sumatran_building", "Produces palm wine."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Winery
                note = pgettext("sumatran_building", "The worker needs old palms around his house."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Winery, part 1
                   pgettext("sumatran_building", "The winemaker can produce one bucket of wine between %1$s and %2$s on average, depending on how far she has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 17)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Winery, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_cassava_kitchen",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Cassava Kitchen
                purpose = pgettext("sumatran_building", "Produces starch."),
                performance = pgettext("sumatran_building", "The cook needs %1% on average to cook 3 portions of starch."):bformat(format_minutes_seconds(1, 15))
            }
        },
        {
            name = "sumatran_kitchen",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Kitchen
                purpose = pgettext("sumatran_building", "Produces meal."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Kitchen
                note = pgettext("sumatran_building", "Make sure you have cassava leaves or eggs on stock while meal is needed. Otherwise your cook will start to throw out starch as food waste for your chicken farms."),
                performance = pgettext("sumatran_building", "The cook needs %1% on average to prepare two meals. If there is not enough cassava leaves or eggs for a meal, he throws out 2 bags of food waste in the same amount of time."):bformat(format_seconds(36))
            }
        },
        {
            name = "sumatran_sewing_workshop",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Sewing Workshop
                purpose = pgettext("sumatran_building", "Produces clothing."),
                performance = pgettext("sumatran_building", "The dressmaker needs %1% to sew one piece of clothing."):bformat(format_seconds(55))
            }
        },
        {
            name = "sumatran_furnace",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Furnace
                purpose = pgettext("sumatran_building", "Smelts ore into iron, copper and gold."),
                performance = pgettext("sumatran_building", "The smelter needs %1% to produce one iron ingot, %2% to produce one copper ingot or %3% to produce one gold bar."):bformat(format_seconds(35), format_seconds(30), format_seconds(40))
            }
        },
        {
            name = "sumatran_charcoal_kiln",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Charcoal Kiln
                purpose = pgettext("sumatran_building", "Burns logs into charcoal."),
                performance = pgettext("sumatran_building", "The charcoal burner needs %1% to produce one lump of coal."):bformat(format_minutes_seconds(1, 30))
            }
        },
        {
            name = "sumatran_tribal_gathering",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Purpose helptext for a Sumatran production site: Tribal Gathering, part 1
                    pgettext("sumatran_building", "Recruits warriors, hunters, chiefs and carriers."),
                    -- TRANSLATORS: Purpose helptext for a Sumatran production site: Tribal Gathering, part 2
                    pgettext("sumatran_building", "Equips the recruits with all necessary weapons and clothing.")
                },
                performance = pgettext("sumatran_building", "The tribal chief needs %1% to recruit one soldier, to train one hunter or a new chief and %2% to gain one carrier."):bformat(format_seconds(30), format_seconds(20))
            }
        },

        -- Big
        {
            name = "sumatran_cassava_fields",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Cassava Fields
                purpose = pgettext("sumatran_building", "Grows cassava for roots and leaves."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Cassava Fields
                note = pgettext("sumatran_building", "The farmer harvest one cassava root from every field. The remained leaves can be harvested by leaf gatherer."),
                performance = pgettext("sumatran_building", "The inexperienced resp. experienced farmer needs %1% resp. %2% on average to produce one cassava root."):bformat(format_minutes(2), format_minutes_seconds(1, 20)),
            }
        },
        {
            name = "sumatran_cassava_plantation",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Cassava Plantation
                purpose = pgettext("sumatran_building", "Grows cassava for roots and leaves."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Cassava Plantation
                note = pgettext("sumatran_building", "Thanks to watering, the farmer harvests two roots from every field. Unfortunately, the amount of leaves left remains unchanged and leaf gatherer can pick up one bundle of leaves from every harvested field."),
                performance = pgettext("sumatran_building", "The farmer needs %1% on average to produce one cassava root."):bformat(format_seconds(48)),
            }
        },
        {
            name = "sumatran_chicken_farm",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Chicken Farm
                purpose = pgettext("sumatran_building", "Breeds chickens for eggs and meat."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Chicken Farm
                note = pgettext("sumatran_building", "The production of eggs is divided into two cycles. In first one only eggs are produced, in second one, you gain eggs and meat."),
                performance = pgettext("sumatran_building", "The breeder needs %1% on average to produce one basket of eggs or meat."):bformat(format_seconds(33))
            }
        },
        {
            name = "sumatran_weaving_mill",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Weaving Mill
                purpose = pgettext("sumatran_building", "Weaves cloth out of reed and palm leaves."),
                performance = pgettext("sumatran_building", "The weaver needs %1% on average to make one piece of cloth."):bformat(format_seconds(44))
            }
        },
        {
            name = "sumatran_jungle_marsh",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Jungle Marsh
                purpose = pgettext("sumatran_building", "Home of tropical animals. Source of meat and crocodile skin for your hunters."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Jungle Marsh
                note = pgettext("sumatran_building", "If animals don’t leave a marsh, you have probably built too many roads around the marsh. Roads can block the way for animals to leave. Out of 4 animals leaving the marsh, there is one crocodile."),
                performance = pgettext("sumatran_building", "There is one animal leaving the marsh in %1% on average."):bformat(format_seconds(43))
            }
        },

        -- Mines
        {
            name = "sumatran_coal_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Coal Mine
                purpose = pgettext("sumatran_building", "Digs coal out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Coal Mine
                note = pgettext("sumatran_building", "This mine can’t be enhanced. You can use it as an alternative to your charcoal burners, when you have enough meal or lack of wood."),
                performance = pgettext("sumatran_building", "The miner needs %1% on average to produce one piece of ore."):bformat(format_seconds(35))
            }
        },
        {
            name = "sumatran_iron_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Iron Mine
                purpose = pgettext("sumatran_building", "Digs iron ore out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Iron Mine
                note = pgettext("sumatran_building", "In comparison to a deep mine, production of this mine is quicker but more expensive."),
                performance = pgettext("sumatran_building", "The miner needs %1% on average to produce one piece of ore."):bformat(format_seconds(35))
            }
        },
        {
            name = "sumatran_deep_iron_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Deep Iron Mine
                purpose = pgettext("sumatran_building", "Digs iron ore out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Deep Iron Mine
                note = pgettext("sumatran_building", "In comparison to a basic mine, production of this mine is slower but cheaper."),
                performance = pgettext("sumatran_building", "The miners need %1% on average to produce one piece of ore."):bformat(format_seconds(45))
            }
        },
        {
            name = "sumatran_copper_gold_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Copper-Gold Mine
                purpose = pgettext("sumatran_building", "Digs copper ore and gold ore out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Copper-Gold Mine
                note = pgettext("sumatran_building", "In comparison to a deep mine, production of this mine is quicker but more expensive. The mine has two programs. Can produce higher ratio of gold ore when gold ore is needed. "),
                performance = pgettext("sumatran_building", "The miner needs %1% on average to produce one piece of ore."):bformat(format_seconds(25))
            }
        },
        {
            name = "sumatran_deep_copper_gold_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Deep Gold Mine
                purpose = pgettext("sumatran_building", "Digs copper ore and gold ore out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Deep Copper-Gold Mine
                note = pgettext("sumatran_building", "In comparison to a basic mine, production of this mine is slower but cheaper. The mine has two programs. Can produce higher ratio of gold ore when gold ore is needed. Empty mines produce gold primarily, when gold is needed."),
                performance = pgettext("sumatran_building", "The miners need %1% on average to produce one piece of ore."):bformat(format_seconds(35))
            }
        },
        {
            name = "sumatran_stone_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Stone Mine
                purpose = pgettext("sumatran_building", "Digs raw diamonds and stone out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Stone Mine
                note = pgettext("sumatran_building", "In comparison to a deep mine, production of this mine is quicker but more expensive. The mine has two programs. When economy doesn’t need raw diamonds, the miners don’t bother by searching them."),
                performance = pgettext("sumatran_building", "The miner needs %1% on average to produce one piece of stone or raw diamond."):bformat(format_seconds(25))
            }
        },
        {
            name = "sumatran_deep_stone_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Deep Stone Mine
                purpose = pgettext("sumatran_building", "Digs raw diamonds and stone out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Deep Stone Mine
                note = pgettext("sumatran_building", "In comparison to a basic mine, production of this mine is slower. The mine has two programs. When economy doesn’t need raw diamonds, the miners don’t bother by searching them."),
                performance = pgettext("sumatran_building", "The miners need %1% on average to produce one piece of stone or raw diamond."):bformat(format_seconds(35))
            }
        },

        -- Training Sites
        {
            name = "sumatran_training_camp",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Purpose helptext for a Sumatran training site: Training Camp, part 1
                    pgettext("sumatran_building", "Trains warriors in ‘Evade’, ‘Defense’ and ‘Health’."),
                    -- TRANSLATORS: Purpose helptext for a Sumatran training site: Training Camp, part 2
                    pgettext("sumatran_building", "Equips the warriors with all necessary armor parts and weapons.")
                },
                performance = {
                    -- TRANSLATORS: Performance helptext for a Sumatran training site: Training Camp, part 1
                    pgettext("sumatran_building", "If all needed wares are delivered in time, a training camp can train one soldier one level in evade, defense or health in %s."):bformat(format_seconds(36)),
                    -- TRANSLATORS: Performance helptext for a Sumatran training site: Training Camp, part 2
                    pgettext("sumatran_building", "Complete training of one soldier takes %s."):bformat(format_minutes_seconds(4, 12))
                }
            }
        },
        {
            name = "sumatran_hunting_camp",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran training site: Hunting Camp
                purpose = pgettext("sumatran_building", "Trains warriors in ‘Attack’."),
                -- TRANSLATORS: Note helptext for a Sumatran training site: Hunting Camp
                note = pgettext("sumatran_building", "The warriors improve their attack abilities by hunting crocodiles. Make sure there is enough jungle marshes around the building."),
                performance = {
                    -- TRANSLATORS: Performance helptext for a Sumatran training site: Hunting Camp, part 1
                    pgettext("sumatran_building", "If all needed wares are delivered in time, a hunting camp needs between %1$s and %2$s to train one soldier one level in attack, depending on how far the hunter has to walk."):bformat(format_seconds(25), format_minutes_seconds(1, 19)),
                    -- TRANSLATORS: Performance helptext for a Sumatran training site: Hunting Camp, part 2
                    pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased."),
                    -- TRANSLATORS: Performance helptext for a Sumatran training site: Hunting Camp, part 3
                    pgettext("sumatran_building", "Complete training of one soldier takes %s on average."):bformat(format_minutes_seconds(2, 50))
                }
            }
        },

        -- Military Sites
        {
            name = "sumatran_guard_post",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran military site: Guard Post
                purpose = pgettext("sumatran_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note helptext for a Sumatran military site: Guard Post
                note = pgettext("sumatran_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },
        {
            name = "sumatran_sentry_small",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran military site: Small Sentry
                purpose = pgettext("sumatran_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note helptext for a Sumatran military site: Small Sentry
                note = pgettext("sumatran_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },
        {
            name = "sumatran_sentry_big",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran military site: Big Sentry
                purpose = pgettext("sumatran_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note helptext for a Sumatran military site: Big Sentry
                note = pgettext("sumatran_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },
        {
            name = "sumatran_watchtower",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran military site: Watchtower
                purpose = pgettext("sumatran_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note helptext for a Sumatran military site: Watchtower
                note = pgettext("sumatran_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },
        {
            name = "sumatran_fortified_tower",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran military site: Fortified Tower
                purpose = pgettext("sumatran_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note helptext for a Sumatran military site: Fortified Tower
                note = pgettext("sumatran_building", "This building can be built by enhancing a watchtower or big sentry. Enhancement of big sentry costs you one log and one reed more but you save one block of stone instead.")
            }
        },
        {
            name = "sumatran_fort",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran military site: Fort
                purpose = pgettext("sumatran_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note helptext for a Sumatran military site: Fort
                note = pgettext("sumatran_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },

        -- Seafaring/Ferry Sites - these are only displayed on seafaring/ferry maps
        {
            name = "sumatran_ferry_yard",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Ferry Yard
                purpose = pgettext("sumatran_building", "Builds ferries."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Ferry Yard
                note = pgettext("sumatran_building", "Needs water nearby."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Ferry Yard, part 1
                   pgettext("sumatran_building", "The shipwright can produce one ferry between %1$s and %2$s, depending on how far he has to walk."):bformat(format_seconds(36), format_minutes_seconds(1, 1)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Ferry Yard, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_shipyard",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Shipyard
                purpose = pgettext("sumatran_building", "Constructs ships that are used for overseas colonization and for shipping wares between ports."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Shipyard, part 1
                   pgettext("sumatran_building", "The shipwright can produce one ship between %1$s and %2$s, depending on how far he has to walk."):bformat(format_minutes_seconds(17, 54), format_minutes_seconds(25, 3)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Shipyard, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },

        -- Partially Finished Buildings - these are the same 2 buildings for all tribes
        {
            name = "constructionsite",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Sumatran building: Construction Site
                lore = pgettext("sumatran_building", "‘Don’t swear at the builder who is short of building materials.’"),
                -- TRANSLATORS: Lore author helptext for a Sumatran building: Construction Site
                lore_author = pgettext("sumatran_building", "Proverb widely used for impossible tasks of any kind"),
                -- TRANSLATORS: Purpose helptext for a Sumatran building: Construction Site
                purpose = pgettext("sumatran_building", "A new building is being built at this construction site.")
            }
        },
        {
            name = "dismantlesite",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Sumatran building: Dismantle Site
                lore = pgettext("sumatran_building", "‘New paths will appear when you are willing to tear down the old.’"),
                -- TRANSLATORS: Lore author helptext for a Sumatran building: Dismantle Site
                lore_author = pgettext("sumatran_building", "Proverb"),
                -- TRANSLATORS: Purpose helptext for a Sumatran building: Dismantle Site
                purpose = pgettext("sumatran_building", "A building is being dismantled at this dismantle site, returning some of the resources that were used during this building’s construction to your tribe’s stores.")
            }
        }
    },
    warehouse_names = { 
        pgettext("warehousename", "Arigas"),
        pgettext("warehousename", "Soufou"), -- Soufon
        pgettext("warehousename", "Batang"),
        pgettext("warehousename", "Priama"), -- Priamo, Pariaman
        pgettext("warehousename", "Ticou"),
        pgettext("warehousename", "Padang"), -- ok, Batacapas
        pgettext("warehousename", "Menincabo"), -- Manamcabo
        pgettext("warehousename", "Indrapoura"), -- Indapoura
        pgettext("warehousename", "Mocomo"),
        pgettext("warehousename", "Bancoulo"), -- Boncolo, Bengkulu
        pgettext("warehousename", "Panarikan"),
        pgettext("warehousename", "Sillebar"), -- Salebor
        pgettext("warehousename", "Lampan"), -- Lampung
        pgettext("warehousename", "Dampin"), -- ok
        pgettext("warehousename", "Goudan"),
        pgettext("warehousename", "Palimban"), -- Palimbam, Palembang
        pgettext("warehousename", "Baros"), -- Baras
        pgettext("warehousename", "Jambi"), -- Lambi
        pgettext("warehousename", "Campfer"), -- Campara
        pgettext("warehousename", "Aru"),
        pgettext("warehousename", "Bancalo"),
        pgettext("warehousename", "Dilly"),
        pgettext("warehousename", "Garo"),
        pgettext("warehousename", "Achem"), -- ok, Aceh
    },
    
   -- Productionsite status strings
   -- TRANSLATORS: Productivity label on a Sumatran building if there is 1 worker missing
   productionsite_worker_missing = pgettext("sumatrans", "Worker missing"),
   -- TRANSLATORS: Productivity label on a Sumatran building if there is 1 worker coming
   productionsite_worker_coming = pgettext("sumatrans", "Worker is coming"),
   -- TRANSLATORS: Productivity label on a Sumatran building if there is more than 1 worker missing. If you need plural forms here, please let us know.
   productionsite_workers_missing = pgettext("sumatrans", "Workers missing"),
   -- TRANSLATORS: Productivity label on a Sumatran building if there is more than 1 worker coming. If you need plural forms here, please let us know.
   productionsite_workers_coming = pgettext("sumatrans", "Workers are coming"),
   -- TRANSLATORS: Productivity label on a Sumatran building if there is 1 experienced worker missing
   productionsite_experienced_worker_missing = pgettext("sumatrans", "Expert missing"),
   -- TRANSLATORS: Productivity label on a Sumatran building if there is more than 1 experienced worker missing. If you need plural forms here, please let us know.
   productionsite_experienced_workers_missing = pgettext("sumatrans", "Experts missing"),

   -- Soldier strings to be used in Military Status strings

   soldier_context = "sumatran_soldier",
   soldier_0_sg = "%1% warrior (+%2%)",
   soldier_0_pl = "%1% warriors (+%2%)",
   soldier_1_sg = "%1% warrior",
   soldier_1_pl = "%1% warriors",
   soldier_2_sg = "%1%(+%2%) warrior (+%3%)",
   soldier_2_pl = "%1%(+%2%) warriors (+%3%)",
   soldier_3_sg = "%1%(+%2%) warrior",
   soldier_3_pl = "%1%(+%2%) warriors",
   -- TRANSLATORS: %1% is the number of sumatran warriors the plural refers to. %2% is the maximum number of warrior slots in the building.
   UNUSED_soldier_0 = npgettext("sumatran_soldier", "%1% warrior (+%2%)", "%1% warriors (+%2%)", 0),
   -- TRANSLATORS: Number of sumatran warriors stationed at a militarysite.
   UNUSED_soldier_1 = npgettext("sumatran_soldier", "%1% warrior", "%1% warriors", 0),
   -- TRANSLATORS: %1% is the number of sumatran warriors the plural refers to. %2% are currently open warrior slots in the building. %3% is the maximum number of warrior slots in the building
   UNUSED_soldier_2 = npgettext("sumatran_soldier", "%1%(+%2%) warrior (+%3%)", "%1%(+%2%) warriors (+%3%)", 0),
   -- TRANSLATORS: %1% is the number of sumatran warriors the plural refers to. %2% are currently open warrior slots in the building.
   UNUSED_soldier_3 = npgettext("sumatran_soldier", "%1%(+%2%) warrior", "%1%(+%2%) warriors", 0),
   
    -- Special types
    builder = "sumatrans_builder",
    carriers = {"sumatrans_carrier", "sumatran_carrier_1"},
    geologist = "sumatran_geologist",
    scouts_house = "sumatran_scouts_dwelling",
    soldier = "sumatran_soldier",
    ship = "sumatrans_ship",
    ferry = "sumatran_ferry",
    port = "sumatran_port",
    
   fastplace = {
      warehouse = "sumatran_warehouse",
      port = "sumatran_port",
      training_small = "sumatran_hunting_camp",
      training_large = "sumatran_training_camp",
      military_small_primary = "sumatran_sentry_small",
      military_small_secondary = "sumatran_guard_post",
      military_medium_primary = "sumatran_sentry_big",
      military_medium_secondary = "sumatran_watchtower",
      military_tower = "sumatran_fortified_tower",
      military_fortress = "sumatran_fort",
      woodcutter = "sumatran_woodcutters_house",
      forester = "sumatran_palm_planters_hut",
      quarry = "sumatran_stonecutters_hut",
      building_materials_primary = "sumatran_leaf_gatherers_hut",
      building_materials_secondary = "sumatran_workshop_basic",
      building_materials_tertiary = "sumatran_reed_yard",
      hunter = "sumatran_hunters_house",
      fisher = "sumatran_hunters_tent",
      fish_meat_replenisher = "sumatran_jungle_marsh",
      well = "sumatran_water_carriers_hut",
      farm_primary = "sumatran_cassava_fields",
      farm_secondary = "sumatran_cassava_plantation",
      bakery = "sumatran_cassava_kitchen",
      brevery = "sumatran_winery",
      tavern = "sumatran_kitchen",
      smelting = "sumatran_furnace",
      tool_smithy = "sumatran_workshop_tools",
      weapon_smithy = "sumatran_workshop_weapons",
      armor_smithy = "sumatran_armorsmithy",
      weaving_mill = "sumatran_weaving_mill",
      shipyard = "sumatran_shipyard",
      ferry_yard = "sumatran_ferry_yard",
      scout = "sumatran_scouts_dwelling",
      barracks = "sumatran_tribal_gathering",
      charcoal = "sumatran_charcoal_kiln",
      mine_stone = "sumatran_stone_mine",
      mine_coal = "sumatran_coal_mine",
      mine_iron = "sumatran_iron_mine",
      mine_gold = "sumatran_copper_gold_mine",
      agriculture_producer = "sumatran_chicken_farm",
      industry_alternative = "sumatran_sewing_workshop",
      industry_supporter = "sumatran_jungle_preservers_hut",
      terraforming = "sumatran_thermal_springs",
   },
}

else

wl.Descriptions():new_tribe {
    name = "sumatrans",
    animation_directory = image_dirname,
    animations = {
        frontier = { hotspot = {9, 24} },
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
        { ware = "gold", points = 3 },
        { ware = "gold_sheet", points = 3 },
        { ware = "armor_copper", points = 3 },
        { ware = "armor_golden", points = 6 },
        { ware = "shield_golden", points = 3 },
        { ware = "diamond", points = 4 },
    },

    -- Image file paths for this tribe’s road and waterway textures
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
            [0] = "sumatran_resi_none",
        },
        resource_coal = {
            [10] = "sumatran_resi_coal_1",
            [20] = "sumatran_resi_coal_2",
        },
        resource_iron = {
            [10] = "sumatran_resi_iron_1",
            [20] = "sumatran_resi_iron_2",
        },
        resource_gold = {
            [10] = "sumatran_resi_copper_gold_1",
            [20] = "sumatran_resi_copper_gold_2",
        },
        resource_stones = {
            [10] = "sumatran_resi_stones_1",
            [20] = "sumatran_resi_stones_2",
        },
        resource_water = {
            [100] = "sumatran_resi_water",
        },
    },

    wares_order = {
        {
            -- 1. Building Materials (Basic)
            {
                name = "log",
                default_target_quantity = 1000,
                preciousness = 80,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Log, part 1
                        pgettext("sumatran_ware", "Log is an important basic building material. It is also used for charcoal production and for the production of sanded wood for tools and spears."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Log, part 2
                        pgettext("sumatran_ware", "Logs are produced by felling all trees except the tropical ones. Woodcutters need palm planter’s huts nearby to take care of the supply of trees.")
                    }
                }
            },
            {
                name = "tropicalwood",
                default_target_quantity = 1000,
                preciousness = 3,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Tropical Wood, part 1
                        pgettext("sumatran_ware", "Tropical wood is an important basic building material. It is also used for charcoal production."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Tropical Wood, part 2
                        pgettext("sumatran_ware", "It is produced by felling tropical trees (ironwood, rubber and balsa trees as well as dipterocarpus). Woodcutters need jungle preserver’s huts nearby to take care of the supply of tropical trees."),
                    }
                }
            },
            {
                name = "palmleaves",
                default_target_quantity = 40,
                preciousness = 11,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Palm Leaves, part 1
                        pgettext("sumatran_ware", "Palm leaves are a basic building material. They are used together with reed for cloth production too."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Palm Leaves, part 2
                        pgettext("sumatran_ware", "Leaf gatherers need palm planter’s huts nearby to take care of the supply of palm trees. The trees have to be cut down by woodcutters first, then can the gatherers collect the leaves from the ground."),
                    }
                }
            },
            {
                name = "reed",
                preciousness = 50,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Reed, part 1
                        pgettext("sumatran_ware", "Reed is a basic building material. It is used together with palm leaves for cloth production too."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Reed, part 2
                        pgettext("sumatran_ware", "It is planted and collected by the reed cutters on shores of lakes and rivers."),
                    }
                }
            },
            {
                name = "cloth",
                default_target_quantity = 15,
                preciousness = 3,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Cloth, part 1
                        pgettext("sumatran_ware", "Cloth is needed to build several buildings. Also the dressmakers need cloth for clothing for your warriors."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Cloth, part 2
                        pgettext("sumatran_ware", "It is produced out of reed and palm leaves."),
                    }
                }
            },
            {
                name = "stone",
                default_target_quantity = 30,
                preciousness = 4,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Stone
                        pgettext("sumatran_ware", "Stone is a basic building material. You also need it for production of diamonds and whetstones."),
                    }
                }
            },
            {
                name = "sandedwood",
                default_target_quantity = 18,
                preciousness = 10,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Sanded Wood
                        pgettext("sumatran_ware", "Sanded wood is used for tool and spear production. You will need it to build a ship too. It is made out of logs."),
                    }
                }
            },
            {
               name = "crocodile_skin",
                preciousness = 150,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Crocodile Skin
                    purpose = pgettext("sumatran_ware", "Crocodile skin is used for production of clothing for your warriors, hunters, chiefs and scouts.")
                }
            },
            {
                name = "water",
                preciousness = 12,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Water, part 1
                        pgettext("ware", "Water is the essence of life!"),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Water, part 2
                        pgettext("sumatran_ware", "Water is used by the cooks in your kitchens. Cassava plantations and chicken farm need water too.")
                    }
                }
            }
        },
        {
            -- 2. Food Production
            {
                name = "cassavaroot",
                preciousness = 8,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Cassava Root
                        pgettext("sumatran_ware", "Cassava root is cooked in cassava kitchens to prepare starch, the main ingredient of meals."),
                    }
                }
            },
            {
                name = "cassavaleaves",
                preciousness = 40,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Cassava Leaves, part 1
                        pgettext("sumatran_ware", "Cassava leaves are needed to prepare sauce for your meals."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Cassava Leaves, part 2
                        pgettext("sumatran_ware", "Make sure that you leaf gatherers collect all leaves from the harvested cassava fields. Otherwise you will have to substitute them with eggs.")
                    }
                }
            },
            {
                name = "starch",
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Starch, part 1
                        pgettext("sumatran_ware", "Starch is the main ingredient used by meal preparation."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Starch, part 2
                        pgettext("sumatran_ware", "It is made out of cassava roots by cooking.")
                    }
                }
            },
            {
                name = "fish",
                preciousness = 200,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Fish
                        pgettext("sumatran_ware", "Fresh fish is cooked in the kitchens and added into meals for your warriors and miners."),
                    }
                }
            },
            {
                name = "meat",
                preciousness = 200,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Meat
                        pgettext("sumatran_ware", "Fresh meat is cooked in the kitchens and added into meals for yor warriors, miners and carriers."),
                    }
                }
            },
            {
                name = "eggs",
                default_target_quantity = 40,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Eggs, part 1
                        pgettext("sumatran_ware", "Eggs are used as a substitute for meat, fish and cassava leaves in the kitchens."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Eggs, part 2
                        pgettext("sumatran_ware", "You need food waste as a food source for chickens to produce eggs.")
                    }
                }
            },
            {
                name = "meal",
                default_target_quantity = 20,
                preciousness = 4,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Meal
                    purpose = pgettext("sumatran_ware", "Meal is consumed in mines and training sites. Every new carrier also need meal before his service on a road."),
                    -- TRANSLATORS: Note helptext for a Sumatran ware: Meal
                    note = pgettext("sumatran_ware", "Meal is an optimal combination of several food ingredients. These are starch, cassava leaves, meat or fish and water. Eggs can be used instead some of these ingredients too."),
                }
            },
            {
                name = "food_waste",
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Food Waste
                    purpose = pgettext("sumatran_ware", "You can feed food waste to your chickens and gain eggs and meat."),
                    -- TRANSLATORS: Note helptext for a Sumatran ware: Food Waste
                    note = pgettext("sumatran_ware", "Food waste is produced as a byproduct in your kitchens. Kitchens also start producing food waste by throwing out starch when they don't have cassava leaves or eggs on stock and meal is needed.")
                }
            },
            {
                name = "palm_wine",
                preciousness = 4,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Palm Wine
                    purpose = pgettext("sumatran_ware", "Palm wine is consumed together with meal in your training sites and in deep mines. It is produced by winery and wineries need fully grown palms nearby.")
                }
            }
        },
        {
           -- 3. Mining
             {
                name = "diamond_raw",
                default_target_quantity = 5,
                preciousness = 30,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Raw Diamond
                    purpose = pgettext("sumatran_ware", "Raw diamonds are used to produce whetstones or can be polished and used as a precious building material.")
                }
            },
            {
                name = "diamond",
                default_target_quantity = 2,
                preciousness = 2,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Diamond, part 1
                        pgettext("sumatran_ware", "Diamonds are a very precious building material. These precious stones are also your main source of wealth, when goal of game is to collect precious things."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Diamond, part 2
                        pgettext("sumatran_ware", "The production of diamonds is skipped when whetstone is needed.")
                    }
                }
            },
           {
                name = "coal",
                default_target_quantity = 50,
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Coal, part 1
                        pgettext("sumatran_ware", "While smelting metals, the fires of the sumatran furnaces are fed with coal."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Coal, part 2
                        pgettext("sumatran_ware", "It is mined in coal mines or produced out of logs and tropical wood by a charcoal kiln.")
                    }
                }
            },
            {
                name = "copper_ore",
                default_target_quantity = 10,
                preciousness = 3,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Copper Ore, part 1
                        pgettext("sumatran_ware", "Copper ore can be smelted into copper in a furnace."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Copper Ore, part 2
                        pgettext("sumatran_ware", "Your miners need meals and in deep mines also palm wine to produce it.")
                    }
                }
            },
            {
                name = "copper",
                default_target_quantity = 10,
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Copper, part 1
                        pgettext("sumatran_ware", "Copper is needed for armor production. It is a rare building material too."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Copper, part 2
                        pgettext("sumatran_ware", "It is produced by the furnaces.")
                    }
                }
            },
            {
                name = "iron_ore",
                default_target_quantity = 10,
                preciousness = 3,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Iron Ore, part 1
                        pgettext("ware", "Iron ore can be smelted into iron in a furnace."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Iron Ore, part 2
                        pgettext("sumatran_ware", "Your miners need meals and in deep mines also palm wine to produce it.")
                    }
                }
            },
            {
                name = "iron",
                default_target_quantity = 10,
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Iron, part 1
                        pgettext("ware", "Iron is needed for tool and weapon production."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Iron, part 2
                        pgettext("sumatran_ware", "It is produced by the furnaces.")
                    }
                }
            },
            {
                name = "gold_ore",
                default_target_quantity = 10,
                preciousness = 3,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Gold Ore, part 1
                        pgettext("ware", "Gold ore can be smelted into gold in a furnace."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Gold Ore, part 2
                        pgettext("sumatran_ware", "Your miners need meals and in deep mines also palm wine to produce it.")
                    }
                }
            },
            {
                name = "gold",
                default_target_quantity = 5,
                preciousness = 4,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Gold, part 1
                        pgettext("ware", "Gold is needed for armor production. It is a rare building material too."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Gold, part 2
                        pgettext("sumatran_ware", "Gold is the most valuable of all metals, and it is smelted out of gold ore in furnaces.")
                    }
                }
            }
        },
        {
            -- 4. Tools
            {
                name = "felling_ax",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Felling Ax, part 1
                        pgettext("sumatran_ware", "The felling ax is the tool to cut down trees and is used by woodcutters."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Felling Ax, part 2
                        pgettext("sumatran_ware", "They are produced by tools workshops.")
                    }
                }
            },
            {
                name = "pick",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                         -- TRANSLATORS: Helptext for a Sumatran ware: Pick
                         pgettext("sumatran_ware", "Picks are used by stonecutters and miners."),
                     }
                }
            },
            {
                name = "shovel",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Shovel
                        pgettext("sumatran_ware", "The shovel is an essential tool for foresters and farmers."),
                    }
                }
            },
            {
                name = "hammer",
                default_target_quantity = 2,
                preciousness = 10,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Hammer, part 1
                        pgettext("sumatran_ware", "The hammer is the most used tool. Geologists, builders, coppersmiths, shipwrights and craftsmen, they all need hammer."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Hammer, part 2
                        pgettext("sumatran_ware", "They are produced by tools workshops.")
                    }
                }
            },
            {
                name = "machete",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Machete, part 1
                        pgettext("sumatran_ware", "The machete is a tool for leaf gatherers, reedcutters and together with buckets also for wine makers."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Machete, part 2
                        pgettext("sumatran_ware", "They are produced by tools workshops.")
                    }
                }
            },
            {
                name = "kitchen_tools",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    purpose = {
                         -- TRANSLATORS: Helptext for a Sumatran ware: Kitchen Tools, part 1
                         pgettext("sumatran_ware", "Kitchen tools are used by cooks."),
                         -- TRANSLATORS: Helptext for a Sumatran ware: Kitchen Tools, part 2
                         pgettext("sumatran_ware", "They are produced by tools workshops.")
                     }
                }
            },
            {
                name = "fire_tongs",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Fire Tongs, part 1
                        pgettext("sumatran_ware", "Fire tongs are the tools for smelting ores."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Fire Tongs, part 2
                        pgettext("sumatran_ware", "They are produced by tools workshops.")
                    }
                }
            },
            {
                name = "buckets",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Buckets, part 1
                        pgettext("sumatran_ware", "Buckets are used by water carriers and together with a machete by wine makers."),
                        -- TRANSLATORS: Helptext for a Sumatran ware: Buckets, part 2
                        pgettext("sumatran_ware", "They are produced by tools workshops.")
                    }
                }
            },
            {
                name = "whetstone",
                default_target_quantity = 2,
                preciousness = 10,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Whetstone
                        pgettext("sumatran_ware", "Whetstones are used by craftsmen and are produced in a basic workshop."),
                    }
                }
            }
        },
        {
            -- 5. Weapons, Armour
            {
                name = "copper_sheet",
                default_target_quantity = 10,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Copper Sheet
                        pgettext("sumatran_ware", "Source material for armor production."),
                    }
                }
            },
            {
                name = "gold_sheet",
                default_target_quantity = 10,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Sumatran ware: Gold Sheet
                        pgettext("sumatran_ware", "Source material for armor production."),
                    }
                }
            },
            {
                name = "sumatran_spear",
                default_target_quantity = 10,
                preciousness = 5,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Spear
                    purpose = pgettext("sumatran_ware", "Spear is a widely used weapon for hunters and warriors.")
                }
            },
            {
                name = "crocodile_jacket",
                default_target_quantity = 10,
                preciousness = 5,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Crocodile Jacket
                    purpose = pgettext("sumatran_ware", "A basic piece of clothing for your warriors, hunters and chiefs.")
                }
            },
            {
                name = "warriors_dress",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Warrior's Dress
                    purpose = pgettext("sumatran_ware", "The warriors dress is an ideal type clothing for warriors. It is produced in a sewing workshop and used in a training camp – together with meal and palm wine – to ensure that the warrior’s health will be on the highest level.")
                }
            },
            {
                name = "crocodile_shoes",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Crocodile Shoes
                    purpose = pgettext("sumatran_ware", "This shoes are produced in a sewing workshop and used in a training camp – together with meal and palm wine – to train soldiers in evade. Scouts wear this type of shoes too.")
                }
            },
            {
                name = "armor_copper",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Copper Armor
                    purpose = pgettext("sumatran_ware", "The copper armor is a basic defense tool for warriors. It is produced in an armorsmithy and used in a training camp – together with meal and palm wine – to train warriors in defense.")
                }
            },
            {
                name = "armor_golden",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Golden Armor
                    purpose = pgettext("sumatran_ware", "The golden armor is an improved defense tool for warriors. It is produced in an armorsmithy and used in a training camp – together with meal and palm wine – to train warriors in defense.")
                }
            },
            {
                name = "shield_golden",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran ware: Golden Shield
                    purpose = pgettext("sumatran_ware", "The golden shield is the most efficient defense tool for warriors. It is produced in an armorsmithy and used in a training camp – together with meal and palm wine – to train warriors in defense.")
                }
            },
        }
    },
    workers_order = {
        {
            -- 1. Carriers and General Workers
            {
                name = "sumatrans_carrier",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Carrier (female)
                    purpose = pgettext("sumatran_worker", "Carries items along roads.")
                }
            },
            {
                name = "sumatran_carrier_1",
                default_target_quantity = 1,
                preciousness = 2,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Carrier (male)
                    purpose = pgettext("sumatran_worker", "Carries items along roads.")
                }
            },
            {
                name = "sumatran_ferry",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Ferry
                    purpose = pgettext("sumatran_worker", "Ships wares across narrow rivers and straights.")
                }
            },
            {
                name = "sumatran_recruit",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Recruit
                    purpose = pgettext("sumatran_worker", "Eager to become a soldier and defend his tribe!")
                }
            },
            {
                name = "sumatran_breeder",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Breeder
                    purpose = pgettext("sumatran_worker", "Breeds animals.")
                }
            },
            {
                name = "sumatran_scout",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Scout
                    purpose = pgettext("sumatran_worker", "Explores territory of your enemy.")
                }
            },
            {
                name = "sumatran_jungle_ghost",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Jungle Ghost
                    purpose = pgettext("sumatran_worker", "Gives life to the tropical animals and dwells in thermal springs.")
                }
            }
        },
        {
            -- 2. Building materials, Builders
            {
                name = "sumatran_stonecutter",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Stonecutter
                    purpose = pgettext("sumatran_worker", "Mines stone.")
                }
            },
            {
                name = "sumatran_woodcutter",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Woodcutter
                    purpose = pgettext("sumatran_worker", "Fells trees.")
                }
            },
            {
                name = "sumatran_forester",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Forester
                    purpose = pgettext("sumatran_worker", "Plants trees.")
                }
            },
            {
                name = "sumatran_reedcutter",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Reedcutter
                    purpose = pgettext("sumatran_worker", "Grows reed.")
                }
            },
            {
                name = "sumatran_leaf_gatherer",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Leaf Gatherer
                    purpose = pgettext("sumatran_worker", "Collects palm and cassava leaves.")
                }
            },
            {
                name = "sumatran_shipwright",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Shipwright
                    purpose = pgettext("sumatran_worker", "Works at the shipyard and constructs new ships.")
                }
            },
            {
                name = "sumatrans_builder",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Builder
                    purpose = pgettext("sumatran_worker", "Works at construction sites to raise new buildings.")
                }
            }
        },
        {
            -- 3. Collectors and Food Supply
            {
                name = "sumatran_water_carrier",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Water Carrier
                    purpose = pgettext("sumatran_worker", "Carries water.")
                }
            },
            {
                name = "sumatran_hunter",
                default_target_quantity = 1,
                preciousness = 3,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Hunter
                    purpose = pgettext("sumatran_worker", "Produces meat and fish.")
                }
            },
            {
                name = "sumatran_hunter_chief",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Chief Hunter
                    purpose = pgettext("sumatran_worker", "Produces meat, fish and crocodile skin.")
                }
            },
            {
                name = "sumatran_farmer",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Farmer
                    purpose = pgettext("sumatran_worker", "Grows cassava.")
                }
            },
            {
                name = "sumatran_farmer_experienced",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Experienced Farmer
                    purpose = pgettext("sumatran_worker", "Grows cassava.")
                }
            },
            {
                name = "sumatran_winemaker",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Winemaker
                    purpose = pgettext("sumatran_worker", "Produces palm wine.")
                }
            },
            {
                name = "sumatran_cook",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Cook
                    purpose = pgettext("sumatran_worker", "Prepares meals.")
                }
            }
        },
        {
            -- 4. Miners and Metal Workers
            {
                name = "sumatran_geologist",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Geologist
                    purpose = pgettext("sumatran_worker", "Discovers resources for mining.")
                }
            },
            {
                name = "sumatran_miner",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Miner
                    purpose = pgettext("sumatran_worker", "Mines ore and minerals.")
                }
            },
            {
                name = "sumatran_miner_master",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Master Miner
                    purpose = pgettext("sumatran_worker", "Mines ore and minerals.")
                }
            },
            {
                name = "sumatran_smelter",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Smelter
                    purpose = pgettext("sumatran_worker", "Smelts ore.")
                }
            },
            {
                name = "sumatran_charcoal_burner",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Charcoal Burner
                    purpose = pgettext("sumatran_worker", "Burns logs and wood to produce charcoal.")
                }
            },
            {
                name = "sumatran_craftsman",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Craftsman
                    purpose = pgettext("sumatran_worker", "Produces sanded wood, whetstones and polished diamonds.")
                }
            },
            {
                name = "sumatran_craftsman_experienced",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Experienced Craftsman
                    purpose = pgettext("sumatran_worker", "Produces tools, weapons.")
                }
            }
        },
        {
            -- 5. Training, Clothing
            {
                name = "sumatran_soldier",
                default_target_quantity = 40,
                preciousness = 200,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Warrior
                    purpose = pgettext("sumatran_worker", "Defend and Conquer!")
                }
            },
            {
                name = "sumatran_chief",
                default_target_quantity = 1,
                preciousness = 3,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Chief
                    purpose = pgettext("sumatran_worker", "Trains warriors.")
                }
            },
            {
                name = "sumatran_tribal_chief",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Tribal Chief
                    purpose = pgettext("sumatran_worker", "Trains and recruits warriors. Recruits hunters, new chiefs and carriers too.")
                }
            },
            {
                name = "sumatran_weaver",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Weaver
                    purpose = pgettext("sumatran_worker", "Weaves cloth.")
                }
            },
            {
                name = "sumatran_dressmaker",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Dressmaker
                    purpose = pgettext("sumatran_worker", "Dressmaker is an experienced weaver and produces clothing.")
                }
            },
            {
                name = "sumatran_coppersmith",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Coppersmith
                    purpose = pgettext("sumatran_worker", "Makes metal sheets for armor production.")
                }
            },
            {
                name = "sumatran_armorsmith",
                helptexts = {
                    -- TRANSLATORS: Helptext for a Sumatran worker: Armorsmith
                    purpose = pgettext("sumatran_worker", "Armorsmith is an experienced coppersmith and produces armor for training camps.")
                }
            }
        },
    },

    immovables = {
        {
            name = "ashes",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Ashes
                purpose = _("The remains of a destroyed building.")
            }
        },
        {
            name = "destroyed_building",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Destroyed Building
                purpose = _("The remains of a destroyed building.")
            }
        },
        {
            name = "palm_leaves",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Palm Leaves
                purpose = _("Palm leaves can be picked up by a leaf gatherer and used as building material and for weaving cloth.")
            }
        },
        {
            name = "cassavaplants_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Cassava Plants (tiny)
                purpose = _("These cassava plants has just been planted.")
            }
        },
        {
            name = "cassavaplants_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Cassava Plants (small)
                purpose = _("These cassava plants are growing.")
            }
        },
        {
            name = "cassavaplants_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Cassava Plants (medium)
                purpose = _("These cassava plants are flowering.")
            }
        },
        {
            name = "cassavaplants_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Cassava Plants (ripe)
                purpose = _("These cassava plants are ready for harvesting.")
            }
        },
        {
            name = "cassavaplants_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Cassava Plants (harvested)
                purpose = _("These cassava plants has been harvested. Your leaf gatherer can pick up some cassava leaves here.")
            }
        },
        {
            name = "reedfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Reed Field
                purpose = _("This reed field has just been planted.")
            }
        },
        {
            name = "reedfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Reed Field
                purpose = _("This reed field is growing.")
            }
        },
        {
            name = "reedfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Reed Field
                purpose = _("This reed field is flowering.")
            }
        },
        {
            name = "reedfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Reed Field
                purpose = _("This reed field is ready for harvesting.")
            }
        },
        {
            name = "rubber_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Rubber Tree Sapling
                purpose = _("This rubber tree has just been planted.")
            }
        },
        {
            name = "rubber_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Rubber Tree Pole
                purpose = _("This rubber tree is growing.")
            }
        },
        {
            name = "rubber_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Rubber Tree Mature
                purpose = _("This rubber tree is fully grown.")
            }
        },
        {
            name = "rubber_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Rubber Tree Old
                purpose = _("This rubber tree is ready for harvesting tropical wood by a woodcutter. Other tribes can harvest it for normal logs or rubber.")
            }
        },
        {
            name = "dipterocarpus_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Dipterocarpus (Sapling)
                purpose = _("This dipterocarpus tree has just been planted.")
            }
        },
        {
            name = "dipterocarpus_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Dipterocarpus (Pole)
                purpose = _("This dipterocarpus tree is growing.")
            }
        },
        {
            name = "dipterocarpus_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Dipterocarpus (Mature)
                purpose = _("This dipterocarpus tree is fully grown.")
            }
        },
        {
            name = "dipterocarpus_old",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Dipterocarpus (Old)
                purpose = _("This dipterocarpus tree is ready for harvesting tropical wood by a woodcutter. Other tribes can harvest it for normal logs.")
            }
        },
        {
            name = "ironwood_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Ironwood Tree (Sapling)
                purpose = _("This ironwood tree has just been planted.")
            }
        },
        {
            name = "ironwood_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Ironwood Tree (Pole)
                purpose = _("This ironwood tree is growing.")
            }
        },
        {
            name = "ironwood_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Ironwood Tree (Mature)
                purpose = _("This ironwood tree is fully grown.")
            }
        },
        {
            name = "ironwood_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Ironwood Tree (Old)
                purpose = _("This ironwood tree is ready for harvesting tropical wood by a woodcutter. Other tribes can harvest it for normal logs or ironwood.")
            }
        },
        {
            name = "balsa_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Balsa Tree (Sapling)
                purpose = _("This balsa tree has just been planted.")
            }
        },
        {
            name = "balsa_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Balsa Tree (Pole)
                purpose = _("This balsa tree is growing.")
            }
        },
        {
            name = "balsa_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Balsa Tree (Mature)
                purpose = _("This balsa tree is fully grown.")
            }
        },
        {
            name = "balsa_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Balsa Tree (Old)
                purpose = _("This balsa tree is ready for harvesting tropical wood by a woodcutter. Other tribes can harvest it for normal logs or balsa.")
            }
        },
        {
            name = "sumatran_resi_none",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran resource indicator: No resources
                purpose = _("There are no resources in the ground here.")
            }
        },
        {
            name = "sumatran_resi_water",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran resource indicator: Water
                purpose = _("There is water in the ground here.")
            }
        },
        {
            name = "sumatran_resi_coal_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Coal, part 1
                    _("Coal veins contain coal that can be dug up by coal mines."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Coal, part 2
                    _("There is only a little bit of coal here.")
                }
            }
        },
        {
            name = "sumatran_resi_iron_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Iron, part 1
                    _("This vein contains iron ore that can be dug up by iron mines."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Iron, part 2
                    _("There is only a little bit of iron ore here.")
                }
            }
        },
        {
            name = "sumatran_resi_copper_gold_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Copper-Gold, part 1
                    _("This vein contains copper-gold ore that can be dug up by copper-gold mines."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Copper-Gold, part 2
                    _("There is only a little bit of copper-gold ore here.")
                }
            }
        },
        {
            name = "sumatran_resi_stones_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Stones, part 1
                    _("Stone is a basic building material and can be dug up by a stone mine. You will also get some raw diamonds from the mine."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Stones, part 2
                    _("There is only a little bit of stone and diamonds here.")
                }
            }
        },
        {
            name = "sumatran_resi_coal_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Coal, part 1
                    _("Coal veins contain coal that can be dug up by coal mines."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Coal, part 2
                    _("There is a lot of coal here.")
                }
            }
        },
        {
            name = "sumatran_resi_iron_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Iron, part 1
                    _("This vein contains iron ore that can be dug up by iron mines."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Iron, part 2
                    _("There is a lot of iron ore here.")
                }
            }
        },
        {
            name = "sumatran_resi_copper_gold_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Copper-Gold, part 1
                    _("This vein contains copper-gold ore that can be dug up by copper-gold mines."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Copper-Gold, part 2
                    _("There is a lot of copper-gold ore here.")
                }
            }
        },
        {
            name = "sumatran_resi_stones_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Stones, part 1
                    _("Stone is a basic building material and can be dug up by a stone mine. You will also get some raw diamonds from the mine."),
                    -- TRANSLATORS: Helptext for a Sumatran resource indicator: Stones, part 2
                    _("There is a lot of stone and diamonds here.")
                }
            }
        },
        {
            name = "sumatran_shipconstruction",
            helptexts = {
                -- TRANSLATORS: Helptext for a Sumatran immovable: Ship Under Construction
                purpose = _("A ship is being constructed at this site.")
            }
        }
    },

    -- The order here also determines the order in lists on screen.
    buildings = {
        -- Warehouses
        {
            name = "sumatran_headquarters",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Sumatran production site: Headquarters
                lore = pgettext("sumatran_building", "Oh, you brave northern star, you are protecting and watching over all of our buildings. All other stars come and go, but you never leave your place."),
                -- TRANSLATORS: Lore author helptext for a Sumatran production site: Headquarters
                lore_author = pgettext("sumatran_building", "Part of tribal equinox prayer"),
                -- TRANSLATORS: Purpose helptext for a Sumatran warehouse: Headquarters
                purpose = pgettext("sumatran_building", "Accommodation for your people. Also stores your wares and tools."),
                -- TRANSLATORS: Note helptext for a Sumatran warehouse: Headquarters
                note = pgettext("sumatran_building", "The headquarters is your main building."),
            }
        },
        {
            name = "sumatran_warehouse",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran warehouse: Warehouse
                purpose = pgettext("sumatran_building", "Your workers and warriors will find shelter here. Also stores your wares and tools.")
            }
        },
        {
            name = "sumatran_port",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran warehouse: Port
                purpose = pgettext("sumatran_building", "Serves as a base for overseas colonization and trade. Also stores your warriors, wares and tools.")
            }
        },
        -- Small
        {
            name = "sumatran_woodcutters_house",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Woodcutter’s House
                purpose = pgettext("sumatran_building", "Fells trees in the surrounding area and processes them into logs or tropical wood."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Woodcutter’s House
                note = pgettext("sumatran_building", "The woodcutter recognizes 3 types of trees. Tropical trees (ironwood, balsa and rubber tree and dipterocarpus), palm trees (5 types of official palms) and all other trees. Trees of the first two groups are cut down only when tropical wood respectively log or palm leaves is needed. If the woodcutter is not able to cut down both tropical and palm trees, the building’s productivity can decrease."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Woodcutter’s House, part 1
                   pgettext("sumatran_building", "The woodcutter can produce one log between %1$s and %2$s on average, depending on how far he has to walk and how many tree types are available. If there is only one type of trees, if there are two types or tree types, he needs %3$s, %4$s or %5$s on average to cut down one tree respectively."):bformat(format_seconds(30), format_minutes_seconds(1, 29), format_seconds(59), format_seconds(50), format_seconds(46)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Woodcutter’s House, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_palm_planters_hut",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Sumatran production site: Palm Planter’s Hut
                lore = pgettext("sumatran_building", "The old legends say that long time ago our tribe lived in a place where only palm trees were growing. Without palm trees we could never call this place our home, they have an irreplaceable place in our culture and economy."),
                -- TRANSLATORS: Lore author helptext for a Sumatran production site: Palm Planter’s Hut
                lore_author = pgettext("sumatran_building", "Explanation why foresters living in this houses plant palm trees only"),
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Palm Planter’s Hut
                purpose = pgettext("sumatran_building", "Plants palm trees in the surrounding area."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Palm Planter’s Hut
                note = pgettext("sumatran_building", "You need palm trees for logs, palm wine production and palm leaves, which are collected by leaf gather when a palm tree is cut down."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Palm Planter’s Hut, part 1
                   pgettext("sumatran_building", "The forester plants one palm tree between %1$s and %2$s on average, depending on how far he has to walk."):bformat(format_seconds(18), format_seconds(43)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Palm Planter’s Hut, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_jungle_preservers_hut",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Jungle Preserver’s Hut
                purpose = pgettext("sumatran_building", "Plants tropical trees in the surrounding area."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Jungle Preserver’s Hut
                note = pgettext("sumatran_building", "The tropical trees are source of tropical wood, which is an important building material."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Jungle Preserver’s Hut, part 1
                   pgettext("sumatran_building", "The forester plants one tree between %1$s and %2$s on average, depending on how far he has to walk."):bformat(format_seconds(26), format_seconds(51)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Jungle Preserver’s Hut, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_stonecutters_hut",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Stonecutter’s Hut
                purpose = pgettext("sumatran_building", "Cuts raw pieces of stone out of rocks in the vicinity."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Stonecutter’s Hut
                note = pgettext("sumatran_building", "The stonecutter needs rocks to cut within the work area."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Stonecutter’s Hut, part 1
                   pgettext("sumatran_building", "The stonecutter can produce one block of stone between %1$s and %2$s on average, depending on how far he has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 9)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Stonecutter’s Hut, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_water_carriers_hut",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Water Carrier’s Hut
                purpose = pgettext("sumatran_building", "Draws water out of the rivers and lakes."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Water Carrier’s Hut
                note = pgettext("sumatran_building", "Water carriers cannot dig up water from the ground. Roads and trees along the shoreline block drawing water."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Water Carrier’s Hut, part 1
                   pgettext("sumatran_building", "The carrier can produce one bucket of water between %1$s and %2$s on average, depending on how far he has to walk."):bformat(format_seconds(18), format_seconds(51)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Water Carrier’s Hut, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_leaf_gatherers_hut",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Leaf Gatherer’s Hut
                purpose = pgettext("sumatran_building", "Gathers cassava leaves left by farmers and palm leaves left by woodcutters."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Leaf Gatherer’s Hut
                note = pgettext("sumatran_building", "Both cassava and palm leaves are important wares for your economy and shortages may cause you trouble."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Water Carrier’s Hut, part 1
                   pgettext("sumatran_building", "The leaf gatherer can produce one bundle of leaves between %1$s and %2$s on average, depending on how far she has to walk."):bformat(format_seconds(23), format_minutes_seconds(1, 3)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Water Carrier’s Hut, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_hunters_tent",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Hunter’s Tent
                purpose = pgettext("building", "Hunts animals to produce meat and catches fishes in the waters."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Hunter’s Tent
                note = pgettext("sumatran_building", "The building has 3 different working areas. Smallest for fishing, larger for hunting and the largest is not used by the worker in this type of building."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Hunter’s Tent, part 1
                   pgettext("sumatran_building", "If the hunter has both game and fishes in his working area, he needs %1$s to hunt two animals and to catch one fish on average. If there is only one food source available, he needs %2$s to hunt one animal or %3$s to catch one fish on average."):bformat(format_minutes_seconds(2, 42), format_seconds(55), format_minutes_seconds(1, 33)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Hunter’s Tent, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
             }
        },
        {
            name = "sumatran_hunters_house",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Hunter’s House
                purpose = pgettext("building", "Hunts animals to produce meat and catches fishes in the waters. Hunters in this houses can hunt crocodiles for skin and meat too."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Hunter’s House
                note = pgettext("sumatran_building", "The building has 2 different working areas. Smaller for fishing and the larger for hunting."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Hunter’s House, part 1
                   pgettext("sumatran_building", "If the hunter has game, crocodiles and fishes in his working area, he needs %1$s to hunt one animal, one crocodile and to catch one fish on average. If there are only two food sources available, he needs %2$s to hunt one animal and one crocodile or %3$s to hunt one animal or crocodile and to catch one fish on average. If there is only one food source available, he needs %4$s to hunt one animal or one crocodile and %5$s to catch one fish on average."):bformat(format_minutes_seconds(2, 33), format_minutes_seconds(1, 40), format_minutes_seconds(1, 53), format_minutes(1), format_minutes_seconds(1, 13)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Hunter’s House, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_thermal_springs",
            helptexts = {
                purpose = {
                   -- TRANSLATORS: Purpose helptext for a Sumatran production site: Thermal springs, part 1
                   pgettext("sumatran_building", "Thermal springs make terrain more favorable for tropical and palm trees. This is useful especially while playing wasteland and winter maps. In the first case to transform mountains is very advantageous, in the second case, all types of terrain can be transformed."),
                   -- TRANSLATORS: Purpose helptext for a Sumatran production site: Thermal springs, part 2
                   pgettext("sumatran_building", "While playing on White Summer terrains, flowering meadows can be transformed into normal meadows and used for growing palm trees, which are hard to grow on clearings.")
                },
                -- TRANSLATORS: Note helptext for a Sumatran production site: Thermal springs, the first placeholder is "145 min.", the next three "54"
                note = pgettext("sumatran_building", "Thermal springs need maintenance. That costs you logs, stone and water."),
                performance = pgettext("sumatran_building", "The building needs approximately %1% to improve fertility of every field in its working area. By doing that it will consume approximately %2% logs, %3% buckets of water and %4% blocks of stone."):bformat(format_minutes(145), 54, 54, 54)
            }
        },
        {
            name = "sumatran_scouts_dwelling",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Scout’s Dwelling
                purpose = pgettext("building", "Explores unknown territory.")
            }
        },

        -- Medium
        {
            name = "sumatran_reed_yard",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Reed Yard
                purpose = pgettext("sumatran_building", "Produces reed."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Reed Yard
                note = pgettext("sumatran_building", "Needs water nearby."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Water Carrier’s Hut, part 1
                   pgettext("sumatran_building", "The reedcutter can produce one bundle of reed between %1$s and %2$s on average, depending on how far he has to walk."):bformat(format_seconds(49), format_minutes_seconds(1, 40)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Water Carrier’s Hut, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_workshop_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Basic Workshop
                purpose = pgettext("sumatran_building", "Produces sandedwood, diamonds and whetstones."),
                performance = pgettext("sumatran_building", "The craftsman needs %1% to produce sanded wood, %2% to polish one diamond or %3% to produce whetstones."):bformat(format_seconds(20), format_minutes_seconds(1, 12), format_minutes_seconds(1, 7))
            }
        },
        {
            name = "sumatran_workshop_tools",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Tools Workshop
                purpose = pgettext("sumatran_building", "Forges the tools that your workers need."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Tools Workshop
                note = pgettext("sumatran_building", "Notice that the building needs an experienced worker. If you don’t have any, your worker needs to gain some experience by working in a basic workshop for some period of time."),
                performance = pgettext("sumatran_building", "The experienced craftsman needs %1% on average to make one tool."):bformat(format_seconds(59))
            }
        },
        {
            name = "sumatran_workshop_weapons",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Weapons Workshop
                purpose = pgettext("sumatran_building", "Produces spears for hunters, warriors and hunting camps."),
                performance = pgettext("sumatran_building", "The experienced craftsman needs %1% on average to make one spear."):bformat(format_seconds(25))
            }
        },
        {
            name = "sumatran_coppersmiths_house",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Coppersmith’s House
                purpose = pgettext("sumatran_building", "Produces copper sheets and gold sheets."),
                performance = pgettext("sumatran_building", "The coppersmith needs %1% to produce one copper sheet or %2% to produce one gold sheet."):bformat(format_seconds(15), format_seconds(30))
            }
        },
        {
            name = "sumatran_armorsmithy",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Armorsmithy
                purpose = pgettext("sumatran_building", "Produces shields and armor."),
                performance = pgettext("sumatran_building", "The armorsmith needs %1% on average to make one piece of armor."):bformat(format_seconds(50))
            }
        },
        {
            name = "sumatran_winery",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Winery
                purpose = pgettext("sumatran_building", "Produces palm wine."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Winery
                note = pgettext("sumatran_building", "The worker needs old palms around his house."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Winery, part 1
                   pgettext("sumatran_building", "The winemaker can produce one bucket of wine between %1$s and %2$s on average, depending on how far she has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 17)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Winery, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_cassava_kitchen",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Cassava Kitchen
                purpose = pgettext("sumatran_building", "Produces starch."),
                performance = pgettext("sumatran_building", "The cook needs %1% on average to cook 3 portions of starch."):bformat(format_minutes_seconds(1, 15))
            }
        },
        {
            name = "sumatran_kitchen",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Kitchen
                purpose = pgettext("sumatran_building", "Produces meal."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Kitchen
                note = pgettext("sumatran_building", "Make sure you have cassava leaves or eggs on stock while meal is needed. Otherwise your cook will start to throw out starch as food waste for your chicken farms."),
                performance = pgettext("sumatran_building", "The cook needs %1% on average to prepare two meals. If there is not enough cassava leaves or eggs for a meal, he throws out 2 bags of food waste in the same amount of time."):bformat(format_seconds(36))
            }
        },
        {
            name = "sumatran_sewing_workshop",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Sewing Workshop
                purpose = pgettext("sumatran_building", "Produces clothing."),
                performance = pgettext("sumatran_building", "The dressmaker needs %1% to sew one piece of clothing."):bformat(format_seconds(55))
            }
        },
        {
            name = "sumatran_furnace",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Furnace
                purpose = pgettext("sumatran_building", "Smelts ore into iron, copper and gold."),
                performance = pgettext("sumatran_building", "The smelter needs %1% to produce one iron ingot, %2% to produce one copper ingot or %3% to produce one gold bar."):bformat(format_seconds(35), format_seconds(30), format_seconds(40))
            }
        },
        {
            name = "sumatran_charcoal_kiln",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Charcoal Kiln
                purpose = pgettext("sumatran_building", "Burns logs into charcoal."),
                performance = pgettext("sumatran_building", "The charcoal burner needs %1% to produce one lump of coal."):bformat(format_minutes_seconds(1, 30))
            }
        },
        {
            name = "sumatran_tribal_gathering",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Purpose helptext for a Sumatran production site: Tribal Gathering, part 1
                    pgettext("sumatran_building", "Recruits warriors, hunters, chiefs and carriers."),
                    -- TRANSLATORS: Purpose helptext for a Sumatran production site: Tribal Gathering, part 2
                    pgettext("sumatran_building", "Equips the recruits with all necessary weapons and clothing.")
                },
                performance = pgettext("sumatran_building", "The tribal chief needs %1% to recruit one soldier, to train one hunter or a new chief and %2% to gain one carrier."):bformat(format_seconds(30), format_seconds(20))
            }
        },

        -- Big
        {
            name = "sumatran_cassava_fields",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Cassava Fields
                purpose = pgettext("sumatran_building", "Grows cassava for roots and leaves."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Cassava Fields
                note = pgettext("sumatran_building", "The farmer harvest one cassava root from every field. The remained leaves can be harvested by leaf gatherer."),
                performance = pgettext("sumatran_building", "The inexperienced resp. experienced farmer needs %1% resp. %2% on average to produce one cassava root."):bformat(format_minutes(2), format_minutes_seconds(1, 20)),
            }
        },
        {
            name = "sumatran_cassava_plantation",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Cassava Plantation
                purpose = pgettext("sumatran_building", "Grows cassava for roots and leaves."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Cassava Plantation
                note = pgettext("sumatran_building", "Thanks to watering, the farmer harvests two roots from every field. Unfortunately, the amount of leaves left remains unchanged and leaf gatherer can pick up one bundle of leaves from every harvested field."),
                performance = pgettext("sumatran_building", "The farmer needs %1% on average to produce one cassava root."):bformat(format_seconds(48)),
            }
        },
        {
            name = "sumatran_chicken_farm",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Chicken Farm
                purpose = pgettext("sumatran_building", "Breeds chickens for eggs and meat."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Chicken Farm
                note = pgettext("sumatran_building", "The production of eggs is divided into two cycles. In first one only eggs are produced, in second one, you gain eggs and meat."),
                performance = pgettext("sumatran_building", "The breeder needs %1% on average to produce one basket of eggs or meat."):bformat(format_seconds(33))
            }
        },
        {
            name = "sumatran_weaving_mill",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Weaving Mill
                purpose = pgettext("sumatran_building", "Weaves cloth out of reed and palm leaves."),
                performance = pgettext("sumatran_building", "The weaver needs %1% on average to make one piece of cloth."):bformat(format_seconds(44))
            }
        },
        {
            name = "sumatran_jungle_marsh",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Jungle Marsh
                purpose = pgettext("sumatran_building", "Home of tropical animals. Source of meat and crocodile skin for your hunters."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Jungle Marsh
                note = pgettext("sumatran_building", "If animals don’t leave a marsh, you have probably built too many roads around the marsh. Roads can block the way for animals to leave. Out of 4 animals leaving the marsh, there is one crocodile."),
                performance = pgettext("sumatran_building", "There is one animal leaving the marsh in %1% on average."):bformat(format_seconds(43))
            }
        },

        -- Mines
        {
            name = "sumatran_coal_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Coal Mine
                purpose = pgettext("sumatran_building", "Digs coal out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Coal Mine
                note = pgettext("sumatran_building", "This mine can’t be enhanced. You can use it as an alternative to your charcoal burners, when you have enough meal or lack of wood."),
                performance = pgettext("sumatran_building", "The miner needs %1% on average to produce one piece of ore."):bformat(format_seconds(35))
            }
        },
        {
            name = "sumatran_iron_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Iron Mine
                purpose = pgettext("sumatran_building", "Digs iron ore out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Iron Mine
                note = pgettext("sumatran_building", "In comparison to a deep mine, production of this mine is quicker but more expensive."),
                performance = pgettext("sumatran_building", "The miner needs %1% on average to produce one piece of ore."):bformat(format_seconds(35))
            }
        },
        {
            name = "sumatran_deep_iron_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Deep Iron Mine
                purpose = pgettext("sumatran_building", "Digs iron ore out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Deep Iron Mine
                note = pgettext("sumatran_building", "In comparison to a basic mine, production of this mine is slower but cheaper."),
                performance = pgettext("sumatran_building", "The miners need %1% on average to produce one piece of ore."):bformat(format_seconds(45))
            }
        },
        {
            name = "sumatran_copper_gold_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Copper-Gold Mine
                purpose = pgettext("sumatran_building", "Digs copper ore and gold ore out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Copper-Gold Mine
                note = pgettext("sumatran_building", "In comparison to a deep mine, production of this mine is quicker but more expensive. The mine has two programs. Can produce higher ratio of gold ore when gold ore is needed. "),
                performance = pgettext("sumatran_building", "The miner needs %1% on average to produce one piece of ore."):bformat(format_seconds(25))
            }
        },
        {
            name = "sumatran_deep_copper_gold_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Deep Gold Mine
                purpose = pgettext("sumatran_building", "Digs copper ore and gold ore out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Deep Copper-Gold Mine
                note = pgettext("sumatran_building", "In comparison to a basic mine, production of this mine is slower but cheaper. The mine has two programs. Can produce higher ratio of gold ore when gold ore is needed. Empty mines produce gold primarily, when gold is needed."),
                performance = pgettext("sumatran_building", "The miners need %1% on average to produce one piece of ore."):bformat(format_seconds(35))
            }
        },
        {
            name = "sumatran_stone_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Stone Mine
                purpose = pgettext("sumatran_building", "Digs raw diamonds and stone out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Stone Mine
                note = pgettext("sumatran_building", "In comparison to a deep mine, production of this mine is quicker but more expensive. The mine has two programs. When economy doesn’t need raw diamonds, the miners don’t bother by searching them."),
                performance = pgettext("sumatran_building", "The miner needs %1% on average to produce one piece of stone or raw diamond."):bformat(format_seconds(25))
            }
        },
        {
            name = "sumatran_deep_stone_mine",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Deep Stone Mine
                purpose = pgettext("sumatran_building", "Digs raw diamonds and stone out of the ground in mountain terrain."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Deep Stone Mine
                note = pgettext("sumatran_building", "In comparison to a basic mine, production of this mine is slower. The mine has two programs. When economy doesn’t need raw diamonds, the miners don’t bother by searching them."),
                performance = pgettext("sumatran_building", "The miners need %1% on average to produce one piece of stone or raw diamond."):bformat(format_seconds(35))
            }
        },

        -- Training Sites
        {
            name = "sumatran_training_camp",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Purpose helptext for a Sumatran training site: Training Camp, part 1
                    pgettext("sumatran_building", "Trains warriors in ‘Evade’, ‘Defense’ and ‘Health’."),
                    -- TRANSLATORS: Purpose helptext for a Sumatran training site: Training Camp, part 2
                    pgettext("sumatran_building", "Equips the warriors with all necessary armor parts and weapons.")
                },
                performance = {
                    -- TRANSLATORS: Performance helptext for a Sumatran training site: Training Camp, part 1
                    pgettext("sumatran_building", "If all needed wares are delivered in time, a training camp can train one soldier one level in evade, defense or health in %s."):bformat(format_seconds(36)),
                    -- TRANSLATORS: Performance helptext for a Sumatran training site: Training Camp, part 2
                    pgettext("sumatran_building", "Complete training of one soldier takes %s."):bformat(format_minutes_seconds(4, 12))
                }
            }
        },
        {
            name = "sumatran_hunting_camp",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran training site: Hunting Camp
                purpose = pgettext("sumatran_building", "Trains warriors in ‘Attack’."),
                -- TRANSLATORS: Note helptext for a Sumatran training site: Hunting Camp
                note = pgettext("sumatran_building", "The warriors improve their attack abilities by hunting crocodiles. Make sure there is enough jungle marshes around the building."),
                performance = {
                    -- TRANSLATORS: Performance helptext for a Sumatran training site: Hunting Camp, part 1
                    pgettext("sumatran_building", "If all needed wares are delivered in time, a hunting camp needs between %1$s and %2$s to train one soldier one level in attack, depending on how far the hunter has to walk."):bformat(format_seconds(25), format_minutes_seconds(1, 19)),
                    -- TRANSLATORS: Performance helptext for a Sumatran training site: Hunting Camp, part 2
                    pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased."),
                    -- TRANSLATORS: Performance helptext for a Sumatran training site: Hunting Camp, part 3
                    pgettext("sumatran_building", "Complete training of one soldier takes %s on average."):bformat(format_minutes_seconds(2, 50))
                }
            }
        },

        -- Military Sites
        {
            name = "sumatran_guard_post",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran military site: Guard Post
                purpose = pgettext("sumatran_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note helptext for a Sumatran military site: Guard Post
                note = pgettext("sumatran_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },
        {
            name = "sumatran_sentry_small",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran military site: Small Sentry
                purpose = pgettext("sumatran_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note helptext for a Sumatran military site: Small Sentry
                note = pgettext("sumatran_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },
        {
            name = "sumatran_sentry_big",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran military site: Big Sentry
                purpose = pgettext("sumatran_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note helptext for a Sumatran military site: Big Sentry
                note = pgettext("sumatran_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },
        {
            name = "sumatran_watchtower",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran military site: Watchtower
                purpose = pgettext("sumatran_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note helptext for a Sumatran military site: Watchtower
                note = pgettext("sumatran_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },
        {
            name = "sumatran_fortified_tower",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran military site: Fortified Tower
                purpose = pgettext("sumatran_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note helptext for a Sumatran military site: Fortified Tower
                note = pgettext("sumatran_building", "This building can be built by enhancing a watchtower or big sentry. Enhancement of big sentry costs you one log and one reed more but you save one block of stone instead.")
            }
        },
        {
            name = "sumatran_fort",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran military site: Fort
                purpose = pgettext("sumatran_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note helptext for a Sumatran military site: Fort
                note = pgettext("sumatran_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },

        -- Seafaring/Ferry Sites - these are only displayed on seafaring/ferry maps
        {
            name = "sumatran_ferry_yard",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Ferry Yard
                purpose = pgettext("sumatran_building", "Builds ferries."),
                -- TRANSLATORS: Note helptext for a Sumatran production site: Ferry Yard
                note = pgettext("sumatran_building", "Needs water nearby."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Ferry Yard, part 1
                   pgettext("sumatran_building", "The shipwright can produce one ferry between %1$s and %2$s, depending on how far he has to walk."):bformat(format_seconds(36), format_minutes_seconds(1, 1)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Ferry Yard, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "sumatran_shipyard",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Sumatran production site: Shipyard
                purpose = pgettext("sumatran_building", "Constructs ships that are used for overseas colonization and for shipping wares between ports."),
                performance = {
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Shipyard, part 1
                   pgettext("sumatran_building", "The shipwright can produce one ship between %1$s and %2$s, depending on how far he has to walk."):bformat(format_minutes_seconds(17, 54), format_minutes_seconds(25, 3)),
                   -- TRANSLATORS: Performance helptext for a Sumatran production site: Shipyard, part 2
                   pgettext("sumatran_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },

        -- Partially Finished Buildings - these are the same 2 buildings for all tribes
        {
            name = "constructionsite",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Sumatran building: Construction Site
                lore = pgettext("sumatran_building", "‘Don’t swear at the builder who is short of building materials.’"),
                -- TRANSLATORS: Lore author helptext for a Sumatran building: Construction Site
                lore_author = pgettext("sumatran_building", "Proverb widely used for impossible tasks of any kind"),
                -- TRANSLATORS: Purpose helptext for a Sumatran building: Construction Site
                purpose = pgettext("sumatran_building", "A new building is being built at this construction site.")
            }
        },
        {
            name = "dismantlesite",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Sumatran building: Dismantle Site
                lore = pgettext("sumatran_building", "‘New paths will appear when you are willing to tear down the old.’"),
                -- TRANSLATORS: Lore author helptext for a Sumatran building: Dismantle Site
                lore_author = pgettext("sumatran_building", "Proverb"),
                -- TRANSLATORS: Purpose helptext for a Sumatran building: Dismantle Site
                purpose = pgettext("sumatran_building", "A building is being dismantled at this dismantle site, returning some of the resources that were used during this building’s construction to your tribe’s stores.")
            }
        }
    },
    warehouse_names = { 
        pgettext("warehousename", "Arigas"),
        pgettext("warehousename", "Soufou"), -- Soufon
        pgettext("warehousename", "Batang"),
        pgettext("warehousename", "Priama"), -- Priamo, Pariaman
        pgettext("warehousename", "Ticou"),
        pgettext("warehousename", "Padang"), -- ok, Batacapas
        pgettext("warehousename", "Menincabo"), -- Manamcabo
        pgettext("warehousename", "Indrapoura"), -- Indapoura
        pgettext("warehousename", "Mocomo"),
        pgettext("warehousename", "Bancoulo"), -- Boncolo, Bengkulu
        pgettext("warehousename", "Panarikan"),
        pgettext("warehousename", "Sillebar"), -- Salebor
        pgettext("warehousename", "Lampan"), -- Lampung
        pgettext("warehousename", "Dampin"), -- ok
        pgettext("warehousename", "Goudan"),
        pgettext("warehousename", "Palimban"), -- Palimbam, Palembang
        pgettext("warehousename", "Baros"), -- Baras
        pgettext("warehousename", "Jambi"), -- Lambi
        pgettext("warehousename", "Campfer"), -- Campara
        pgettext("warehousename", "Aru"),
        pgettext("warehousename", "Bancalo"),
        pgettext("warehousename", "Dilly"),
        pgettext("warehousename", "Garo"),
        pgettext("warehousename", "Achem"), -- ok, Aceh
    },
    
   -- Productionsite status strings
   -- TRANSLATORS: Productivity label on a Sumatran building if there is 1 worker missing
   productionsite_worker_missing = pgettext("sumatrans", "Worker missing"),
   -- TRANSLATORS: Productivity label on a Sumatran building if there is 1 worker coming
   productionsite_worker_coming = pgettext("sumatrans", "Worker is coming"),
   -- TRANSLATORS: Productivity label on a Sumatran building if there is more than 1 worker missing. If you need plural forms here, please let us know.
   productionsite_workers_missing = pgettext("sumatrans", "Workers missing"),
   -- TRANSLATORS: Productivity label on a Sumatran building if there is more than 1 worker coming. If you need plural forms here, please let us know.
   productionsite_workers_coming = pgettext("sumatrans", "Workers are coming"),
   -- TRANSLATORS: Productivity label on a Sumatran building if there is 1 experienced worker missing
   productionsite_experienced_worker_missing = pgettext("sumatrans", "Expert missing"),
   -- TRANSLATORS: Productivity label on a Sumatran building if there is more than 1 experienced worker missing. If you need plural forms here, please let us know.
   productionsite_experienced_workers_missing = pgettext("sumatrans", "Experts missing"),

   -- Soldier strings to be used in Military Status strings

   soldier_context = "sumatran_soldier",
   soldier_0_sg = "%1% warrior (+%2%)",
   soldier_0_pl = "%1% warriors (+%2%)",
   soldier_1_sg = "%1% warrior",
   soldier_1_pl = "%1% warriors",
   soldier_2_sg = "%1%(+%2%) warrior (+%3%)",
   soldier_2_pl = "%1%(+%2%) warriors (+%3%)",
   soldier_3_sg = "%1%(+%2%) warrior",
   soldier_3_pl = "%1%(+%2%) warriors",
   -- TRANSLATORS: %1% is the number of sumatran warriors the plural refers to. %2% is the maximum number of warrior slots in the building.
   UNUSED_soldier_0 = npgettext("sumatran_soldier", "%1% warrior (+%2%)", "%1% warriors (+%2%)", 0),
   -- TRANSLATORS: Number of sumatran warriors stationed at a militarysite.
   UNUSED_soldier_1 = npgettext("sumatran_soldier", "%1% warrior", "%1% warriors", 0),
   -- TRANSLATORS: %1% is the number of sumatran warriors the plural refers to. %2% are currently open warrior slots in the building. %3% is the maximum number of warrior slots in the building
   UNUSED_soldier_2 = npgettext("sumatran_soldier", "%1%(+%2%) warrior (+%3%)", "%1%(+%2%) warriors (+%3%)", 0),
   -- TRANSLATORS: %1% is the number of sumatran warriors the plural refers to. %2% are currently open warrior slots in the building.
   UNUSED_soldier_3 = npgettext("sumatran_soldier", "%1%(+%2%) warrior", "%1%(+%2%) warriors", 0),
   
    -- Special types
    builder = "sumatrans_builder",
    carriers = {"sumatrans_carrier", "sumatran_carrier_1"},
    geologist = "sumatran_geologist",
    scouts_house = "sumatran_scouts_dwelling",
    soldier = "sumatran_soldier",
    ship = "sumatrans_ship",
    ferry = "sumatran_ferry",
    port = "sumatran_port",
    
   fastplace = {
      warehouse = "sumatran_warehouse",
      port = "sumatran_port",
      training_small = "sumatran_hunting_camp",
      training_large = "sumatran_training_camp",
      military_small_primary = "sumatran_sentry_small",
      military_small_secondary = "sumatran_guard_post",
      military_medium_primary = "sumatran_sentry_big",
      military_medium_secondary = "sumatran_watchtower",
      military_tower = "sumatran_fortified_tower",
      military_fortress = "sumatran_fort",
      woodcutter = "sumatran_woodcutters_house",
      forester = "sumatran_palm_planters_hut",
      quarry = "sumatran_stonecutters_hut",
      building_materials_primary = "sumatran_leaf_gatherers_hut",
      building_materials_secondary = "sumatran_workshop_basic",
      building_materials_tertiary = "sumatran_reed_yard",
      hunter = "sumatran_hunters_house",
      fisher = "sumatran_hunters_tent",
      fish_meat_replenisher = "sumatran_jungle_marsh",
      well = "sumatran_water_carriers_hut",
      farm_primary = "sumatran_cassava_fields",
      farm_secondary = "sumatran_cassava_plantation",
      bakery = "sumatran_cassava_kitchen",
      brevery = "sumatran_winery",
      tavern = "sumatran_kitchen",
      smelting = "sumatran_furnace",
      tool_smithy = "sumatran_workshop_tools",
      weapon_smithy = "sumatran_workshop_weapons",
      armor_smithy = "sumatran_armorsmithy",
      weaving_mill = "sumatran_weaving_mill",
      shipyard = "sumatran_shipyard",
      ferry_yard = "sumatran_ferry_yard",
      scout = "sumatran_scouts_dwelling",
      barracks = "sumatran_tribal_gathering",
      charcoal = "sumatran_charcoal_kiln",
      mine_stone = "sumatran_stone_mine",
      mine_coal = "sumatran_coal_mine",
      mine_iron = "sumatran_iron_mine",
      mine_gold = "sumatran_copper_gold_mine",
      agriculture_producer = "sumatran_chicken_farm",
      industry_alternative = "sumatran_sewing_workshop",
      industry_supporter = "sumatran_jungle_preservers_hut",
      terraforming = "sumatran_thermal_springs",
   },
}

end

pop_textdomain()
