descriptions = wl.Descriptions()

image_dirname = path.dirname(__file__) .. "images/"

push_textdomain("gauls.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

-- For lore texts
-- TRANSLATORS: Format string for a Latin quote and its translation
quote_with_translation_format = pgettext("empire_lore", "‘%1%’<br>(%2%)")
function latin_lore(latin, translation)
   return quote_with_translation_format:bformat(latin, translation)
end

wl.Descriptions():new_tribe {
    name = "gauls",
    animation_directory = image_dirname,
    animations = {
        frontier = { hotspot = {6, 19} },
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
        { ware = "helmet_golden", points = 4 },
        { ware = "armor_chain", points = 1 },
        { ware = "armor_bronze", points = 3 },
        { ware = "shield_bronze", points = 3 },
        { ware = "bronze", points = 3 },
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
            [0] = "gauls_resi_none",
        },
        resource_coal = {
            [10] = "gauls_resi_coal_1",
            [20] = "gauls_resi_coal_2",
        },
        resource_iron = {
            [10] = "gauls_resi_iron_1",
            [20] = "gauls_resi_iron_2",
        },
        resource_gold = {
            [10] = "gauls_resi_copper_gold_1",
            [20] = "gauls_resi_copper_gold_2",
        },
        resource_stones = {
            [10] = "gauls_resi_stones_1",
            [20] = "gauls_resi_stones_2",
        },
        resource_water = {
            [100] = "gauls_resi_water",
        },
    },

    wares_order = {
        {
            -- 1. Building Materials (Basic)
            {
                name = "log",
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Log, part 1
                        pgettext("gauls_ware", "Log is an important basic building material. It is also used for charcoal production."),
                        -- TRANSLATORS: Help text for a Gallic ware: Log, part 2
                        pgettext("gauls_ware", "Logs are produced by felling trees. Woodcutters need forester’s houses nearby to take care of the supply of trees.")
                    }
                }
            },
            {
                name = "granite",
                default_target_quantity = 30,
                preciousness = 8,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Granite, part 1
                        pgettext("gauls_ware", "Granite is a basic building material. You also need it for production of bricks."),
                        -- TRANSLATORS: Help text for a Gallic ware: Granite, part 2
                        pgettext("gauls_ware", "It is mainly produced by stonecutters, but iron mines and tin mines also produce some. Especially basic tin mine can help you, when there is not enough rocks in your surroundings. This mine is also the only one that produces primarily granite while empty."),
                    }
                }
            },
            {
                name = "planks",
                default_target_quantity = 30,
                preciousness = 40,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Planks, part 1
                        pgettext("gauls_ware", "Planks are an important building material."),
                        -- TRANSLATORS: Help text for a Gallic ware: Planks, part 2
                        pgettext("gauls_ware", "They are produced out of logs by the sawmill."),
                        -- TRANSLATORS: Help text for a Gallic ware: Planks, part 3
                        pgettext("gauls_ware", "They are also used by the weaponsmithy."),
                    }
                }
            },
            {
                name = "clay",
                default_target_quantity = 30,
                preciousness = 15,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Clay
                        pgettext("gauls_ware", "Clay is made out of water and mud to be turned into bricks."),
                    }
                }
            },
            {
                name = "brick",
                default_target_quantity = 18,
                preciousness = 40,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Sanded Wood
                        pgettext("gauls_ware", "Bricks are an important building material. They are made out of a mix of clay and granite dried in a coal fire."),
                    }
                }
            },
            {
                name = "reed",
                preciousness = 50,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Reed
                        pgettext("gauls_ware", "Reed is grown on shores of lakes and rivers by reed yards. Nothing is better suited to make roofs waterproof. It is also used to make baskets and fishing nets."),
                    }
                }
            },
            {
                name = "wool",
                default_target_quantity = 15,
                preciousness = 10,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Wool
                        pgettext("gauls_ware", "Wool is the hair of sheep. Weaving mills use it to make cloth."),
                    }
                }
            },
            {
                name = "cloth",
                default_target_quantity = 10,
                preciousness = 3,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Cloth
                        pgettext("gauls_ware", "Cloth is needed to build several buildings. It is also consumed in the sewing workshop, armor smithy and shipyard."),
                    }
                }
            },
            {
               name = "straw",
                default_target_quantity = 50,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic ware: Straw
                    purpose = pgettext("gauls_ware", "Straw is a by-product of wheat production. You need it for breeding animals.")
                }
            },
            {
               name = "wheat_sheaf",
                preciousness = 45,
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic ware: Wheat Sheaf
                    purpose = pgettext("gauls_ware", "Wheat sheaves are harvested by farmers who sent them to threshing floors to gain wheat and straw.")
                }
            },
            {
                name = "water",
                preciousness = 12,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Water, part 1
                        pgettext("ware", "Water is the essence of life!"),
                        -- TRANSLATORS: Help text for a Gallic ware: Water, part 2
                        pgettext("gauls_ware", "Water is used in multiple buildings. You need it for production of bricks, for preparation of bread, elixirs and potions and for breeding animals.")
                    }
                }
            }
        },
        {
            -- 2. Food Production
            {
                name = "wheat",
                preciousness = 8,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Wheat, part 1
                        pgettext("gauls_ware", "Wheat is essential for survival."),
                        -- TRANSLATORS: Help text for a Gallic ware: Wheat, part 2
                        pgettext("gauls_ware", "Wheat is produced by threshing floors and turned into flour by mills. Sheep farms and cattle farms also need to be supplied with wheat.")
                    }
                }
            },
            {
                name = "flour",
                default_target_quantity = 15,
                preciousness = 40,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Flour
                        pgettext("gauls_ware", "Flour is produced by the miller out of wheat and it is needed in the bakery to produce the tasty bread."),
                    }
                }
            },
            {
                name = "fruit",
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Fruit, part 1
                        pgettext("gauls_ware", "Fruit is picked by gardeners in the orchard and used as a substitute of vegetable by meal preparation."),
                        -- TRANSLATORS: Help text for a Gallic ware: Fruit, part 2
                        pgettext("gauls_ware", "Druids do also pick some secret fruit ingredients when poaching elixir.")
                    }
                }
            },
            {
                name = "vegetable",
                default_target_quantity = 50,
                preciousness = 10,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Vegetable
                        pgettext("gauls_ware", "Vegetable is used by meal preparation. If there is no vegetable in the kitchen, fruit can be used instead."),
                    }
                }
            },
            {
                name = "herbs",
                default_target_quantity = 50,
                preciousness = 10,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Herbs, part 1
                        pgettext("gauls_ware", "Herbs are irreplaceable by preparation of elixir and potion."),
                        -- TRANSLATORS: Help text for a Gallic ware: Herbs, part 2
                        pgettext("gauls_ware", "You need this two types of drinks in deep mines and for warrior training.")
                    }
                }
            },
            {
                name = "fish",
                preciousness = 10,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Fish
                        pgettext("gauls_ware", "Fresh fish is smoked in the smokery and added into meals for your warriors and miners."),
                    }
                }
            },
            {
                name = "meat",
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Meat
                        pgettext("gauls_ware", "Fresh meat is smoked in the smokery and added into meals for your warriors, miners and carriers."),
                    }
                }
            },
            {
                name = "smoked_fish",
                default_target_quantity = 15,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Smoked Fish, part 1
                        pgettext("gauls_ware", "Smoked fish or smoked meat is used for meal preparation."),
                        -- TRANSLATORS: Help text for a Gallic ware: Smoked Fish, part 2
                        pgettext("gauls_ware", "Can be replaced by milk.")
                    }
                }
            },
            {
                name = "smoked_meat",
                default_target_quantity = 15,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Smoked Meat, part 1
                        pgettext("gauls_ware", "Smoked fish or smoked meat is used for meal preparation."),
                        -- TRANSLATORS: Help text for a Gallic ware: Smoked Meat, part 2
                        pgettext("gauls_ware", "Can be replaced by milk.")
                    }
                }
            },
            {
                name = "barbarians_bread",
                default_target_quantity = 20,
                preciousness = 10,
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic ware: Bread
                    purpose = pgettext("gauls_ware", "Bread is used in kitchens to prepare rations and meals. Bread is also consumed at the training sites (druid’s gatherings)."),
                }
            },
            {
                name = "milk",
                default_target_quantity = 20,
                preciousness = 25,
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic ware: Milk
                    purpose = pgettext("gauls_ware", "Milk is used to prepare rations and meals. If there is no milk available, cook can use smoked fish or smoked meat instead.")
                }
            }
        },
        {
           -- 3. Mining
            {
                name = "ration",
                default_target_quantity = 10,
                preciousness = 4,
                helptexts = {
                    purpose = {
                    	-- TRANSLATORS: Help text for a Gallic ware: Ration, part 1
                        pgettext("gauls_ware", "A small bite to keep miners strong and working."),
                    	-- TRANSLATORS: Help text for a Gallic ware: Ration, part 2
                        pgettext("gauls_ware", "The scout also consumes rations on his scouting trips."),
                    }
                }
            },
            {
                name = "meal",
                default_target_quantity = 10,
                preciousness = 4,
                helptexts = {
                    purpose = {
                    	-- TRANSLATORS: Help text for a Gallic ware: Meal, part 1
                        pgettext("gauls_ware", "A proper meal is made in the kitchen out of bread and either milk or smoked fish or smoked meat and it also has to contain fruit or vegetable. It satisfies the needs of miners in advanced mines."),
                    	-- TRANSLATORS: Help text for a Gallic ware: Meal, part 2
                        pgettext("gauls_ware", "Meal is also consumed at the training sites (fighting arenas, training camps)."),
                    }
                }
            },
            {
                name = "coal",
                default_target_quantity = 30,
                preciousness = 50,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Coal, part 1
                        pgettext("gauls_ware", "While smelting metals, the fires of the Gallic furnaces are fed with coal."),
                        -- TRANSLATORS: Help text for a Gallic ware: Coal, part 2
                        pgettext("gauls_ware", "It is mined in coal mines or produced out of logs by a charcoal kiln.")
                    }
                }
            },
            {
                name = "copper_ore",
                default_target_quantity = 10,
                preciousness = 3,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Copper Ore, part 1
                        pgettext("gauls_ware", "Copper ore can be smelted into copper in a furnace."),
                        -- TRANSLATORS: Help text for a Gallic ware: Copper Ore, part 2
                        pgettext("gauls_ware", "By adding some tin ore you can obtain bronze.")
                    }
                }
            },
            {
                name = "copper",
                default_target_quantity = 5,
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Copper, part 1
                        pgettext("gauls_ware", "Copper is a rare building material."),
                        -- TRANSLATORS: Help text for a Gallic ware: Copper, part 2
                        pgettext("gauls_ware", "It is produced by the furnaces.")
                    }
                }
            },
            {
                name = "iron_ore",
                default_target_quantity = 10,
                preciousness = 40,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Iron Ore, part 1
                        pgettext("ware", "Iron ore can be smelted into iron in a furnace."),
                        -- TRANSLATORS: Help text for a Gallic ware: Iron Ore, part 2
                        pgettext("gauls_ware", "Your miners need rations or meals and in deep mines also potions to produce it.")
                    }
                }
            },
            {
                name = "iron",
                default_target_quantity = 5,
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Iron, part 1
                        pgettext("ware", "Iron is needed for tool and weapon production."),
                        -- TRANSLATORS: Help text for a Gallic ware: Iron, part 2
                        pgettext("gauls_ware", "It is produced by the furnaces.")
                    }
                }
            },
            {
                name = "gold_ore",
                default_target_quantity = 10,
                preciousness = 3,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Gold Ore, part 1
                        pgettext("ware", "Gold ore can be smelted into gold in the furnace."),
                        -- TRANSLATORS: Help text for a Gallic ware: Gold Ore, part 2
                        pgettext("gauls_ware", "It is primarily obtained in the copper-gold mines, but miners in your copper mines can usually find some too.")
                    }
                }
            },
            {
                name = "gold",
                default_target_quantity = 5,
                preciousness = 4,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Gold, part 1
                        pgettext("ware", "Gold is needed for golden helmets. It is a rare building material too."),
                        -- TRANSLATORS: Help text for a Gallic ware: Gold, part 2
                        pgettext("gauls_ware", "Gold is the most valuable of all metals and it is smelted out of gold ore in furnaces.")
                    }
                }
            },
            {
                name = "tin_ore",
                default_target_quantity = 5,
                preciousness = 13,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Tin Ore, part 1
                        pgettext("ware", "Tin ore can be smelted together with copper ore into bronze in a furnace."),
                        -- TRANSLATORS: Help text for a Gallic ware: Tin Ore, part 2
                        pgettext("gauls_ware", "Your miners need rations and in deep mines meals with potion to produce it.")
                    }
                }
            },
            {
                name = "bronze",
                default_target_quantity = 5,
                preciousness = 4,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Bronze, part 1
                        pgettext("ware", "Bronze is needed for armor production. It is a rare building material too."),
                        -- TRANSLATORS: Help text for a Gallic ware: Bronze, part 2
                        pgettext("gauls_ware", "It is smelted out of copper ore and tin ore in furnaces.")
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
                        -- TRANSLATORS: Help text for a Gallic ware: Felling Ax, part 1
                        pgettext("gauls_ware", "The felling ax is the tool to cut down trees and is used by woodcutters."),
                        -- TRANSLATORS: Help text for a Gallic ware: Felling Ax, part 2
                        pgettext("gauls_ware", "They are produced by craftsmen in a workshop.")
                    }
                }
            },
            {
                name = "pick",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                         -- TRANSLATORS: Help text for a Gallic ware: Pick
                         pgettext("gauls_ware", "Picks are used by stonecutters and miners."),
                     }
                }
            },
            {
                name = "shovel",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Shovel
                        pgettext("gauls_ware", "The shovel is an essential tool for six types of workers."),
                    }
                }
            },
            {
                name = "hammer",
                default_target_quantity = 2,
                preciousness = 10,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Hammer, part 1
                        pgettext("gauls_ware", "The hammer is a widely used tool. Geologists, builders, shipwrights and craftsmen, they all need hammer."),
                        -- TRANSLATORS: Help text for a Gallic ware: Hammer, part 2
                        pgettext("gauls_ware", "It is produced by craftsmen in a workshop.")
                    }
                }
            },
            {
                name = "scythe",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Scythe, part 1
                        pgettext("ware", "The scythe is the tool of farmers."),
                        -- TRANSLATORS: Help text for a Gallic ware: Scythe, part 2
                        pgettext("gauls_ware", "You need it to harvest wheat and reed.")
                    }
                }
            },
            {
                name = "kitchen_tools",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    purpose = {
                         -- TRANSLATORS: Help text for a Gallic ware: Kitchen Tools, part 1
                         pgettext("gauls_ware", "Kitchen tools are used by cooks and bakers."),
                         -- TRANSLATORS: Help text for a Gallic ware: Kitchen Tools, part 2
                         pgettext("gauls_ware", "You need them to produce rations, meals, smoked meat or fish and bread.")
                     }
                }
            },
            {
                name = "fire_tongs",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Fire Tongs, part 1
                        pgettext("gauls_ware", "Fire tongs are the tools for smelting ores."),
                        -- TRANSLATORS: Help text for a Gallic ware: Fire Tongs, part 2
                        pgettext("gauls_ware", "They are produced by craftsmen in a workshop.")
                    }
                }
            },
            {
                name = "buckets",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Buckets, part 1
                        pgettext("gauls_ware", "Buckets are used by water carriers, breeders and together with a shovel by clay diggers and brick makers."),
                        -- TRANSLATORS: Help text for a Gallic ware: Buckets, part 2
                        pgettext("gauls_ware", "They are produced by craftsmen in a workshop.")
                    }
                }
            },
            {
                name = "fishing_net",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Fishing Net, part 1
                        pgettext("gauls_ware", "Fishing net is used by fishers to catch fishes."),
                        -- TRANSLATORS: Help text for a Gallic ware: Fishing Net, part 2
                        pgettext("gauls_ware", "It is produced by craftsmen in a workshop.")
                    }
                }
            },
            {
                name = "basket",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Basket, part 1
                        pgettext("gauls_ware", "Basket is used together with a shovel by gardener and together with a flail by toiler."),
                        -- TRANSLATORS: Help text for a Gallic ware: Basket, part 2
                        pgettext("gauls_ware", "It is produced by craftsmen in a workshop.")
                    }
                }
            },
            {
                name = "flail",
                default_target_quantity = 2,
                preciousness = 10,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Flail, part 1
                        pgettext("gauls_ware", "Flail is used together with basket by toilers in the threshing floor."), 
                        -- TRANSLATORS: Help text for a Gallic ware: Flail, part 2
                        pgettext("gauls_ware", "It is produced by craftsmen in a workshop.")
                    }
                }
            }
        },
        {
            -- 5. Weapons, Armour, Warrior training
            {
                name = "elixir",
                default_target_quantity = 20,
                preciousness = 6,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Elixir, part 1
                        pgettext("gauls_ware", "Elixir is a magical drink that makes your warriors perform much better."),
                        -- TRANSLATORS: Help text for a Gallic ware: Elixir, part 2
                        pgettext("gauls_ware", "Notice that for elixir preparation you actually need two doses of fruit because the druid picks some secret ingredients before its preparation by himself."),
                        -- TRANSLATORS: Help text for a Gallic ware: Elixir, part 3
                        pgettext("gauls_ware", "It is consumed at the training sites (druid’s gatherings, training camps)."),
                    }
                }
            },
            {
                name = "potion",
                default_target_quantity = 20,
                preciousness = 6,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Potion, part 1
                        pgettext("gauls_ware", "Potion is a magical drink that makes your warriors and miners perform much better."),
                        -- TRANSLATORS: Help text for a Gallic ware: Potion, part 2
                        pgettext("gauls_ware", "It is consumed at advanced mines and at the training sites (fighting arenas)."),
                    }
                }
            },
            {
                name = "spear",
                default_target_quantity = 5,
                preciousness = 5,
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic ware: Spear
                    purpose = pgettext("gauls_ware", "Spear is a widely used weapon for hunters and new warriors.")
                }
            },
            {
                name = "tunic",
                default_target_quantity = 5,
                preciousness = 5,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Tunic, part 1
                        pgettext("gauls_ware", "A basic piece of clothing for your new warriors, trainers, druids and scouts."),
                        -- TRANSLATORS: Help text for a Gallic ware: Tunic, part 2
                        pgettext("gauls_ware", "It is also used for defense training under every new chain and bronze armor."),
                    }
                }
            },
            {
                name = "sword_short",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Help text for a Gallic ware: Short Sword, part 1
                        pgettext("gauls_ware", "Short sword is a basic piece of equipment for your new trainers."),
                        -- TRANSLATORS: Help text for a Gallic ware: Short Sword, part 2
                        pgettext("gauls_ware", "It is produced in the weapon smithy and used at the training camp – together with meal and elixir – to train warriors from attack level 0 to level 1."),
                    }
                }
            },
            {
                name = "sword_long",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic ware: Long Sword
                    purpose = pgettext("gauls_ware", "Long sword is produced in the weapon smithy and used at the training camp – together with meal and elixir – to train warriors from attack level 1 to level 2.")
                }
            },
            {
                name = "armor_chain",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic ware: Chain Armor
                    purpose = pgettext("gauls_ware", "This basic armor is produced in the armor smithy and used at the fighting arena – together with meal and tunic – to train warriors from defense level 0 to level 1.")
                }
            },
            {
                name = "armor_bronze",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic ware: Bronze Armor
                    purpose = pgettext("gauls_ware", "This advanced armor is produced in the armor smithy and used at the fighting arena – together with meal and tunic – to train warriors from defense level 1 to level 2.")
                }
            },
            {
                name = "helmet_golden",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic ware: Golden Helmet
                    purpose = pgettext("gauls_ware", "This helmet is produced in the armor smithy and used at the fighting arena – together with meal – to train warriors from defense level 2 to level 3.")
                }
            },
            {
                name = "shield_wooden",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic ware: Wooden Shield
                    purpose = pgettext("gauls_ware", "This basic shield is produced in the workshop and used at the fighting arena – together with meal and potion – to train warriors from evade level 0 to level 1.")
                }
            },
            {
                name = "shield_bronze",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic ware: Bronze Shield
                    purpose = pgettext("gauls_ware", "This advanced shield is produced in the armor smithy and used at the fighting arena – together with meal and potion – to train warriors from evade level 1 to level 2.")
                }
            },
        }
    },
    workers_order = {
        {
            -- 1. Carriers and General Workers
            {
                name = "gauls_carrier",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Carrier
                    purpose = pgettext("gauls_worker", "Carries items along roads.")
                }
            },
            {
                name = "gauls_carrier_1",
                default_target_quantity = 5,
                preciousness = 30,
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Ox
                    purpose = pgettext("gauls_worker", "Carries items along roads.")
                }
            },
            {
                name = "gauls_ferry",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Ferry
                    purpose = pgettext("gauls_worker", "Ships wares across narrow rivers and straights.")
                }
            },
            {
                name = "gauls_water_carrier",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Water Carrier
                    purpose = pgettext("gauls_worker", "Carries water.")
                }
            },
            {
                name = "gauls_gardener",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Gardener
                    purpose = pgettext("gauls_worker", "Groves vegetable and herbs. While experienced, she can also work in the orchard and plant fruit trees.")
                }
            },
            {
                name = "gauls_gardener_experienced",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Experienced Gardener
                    purpose = pgettext("gauls_worker", "Plants fruit trees and harvests fruit.")
                }
            },
            {
                name = "gauls_builder",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Builder
                    purpose = pgettext("gauls_worker", "Works at construction sites to raise new buildings.")
                }
            }
        },
        {
            -- 2. Building materials, Builders
            {
                name = "gauls_stonecutter",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Stonecutter
                    purpose = pgettext("gauls_worker", "Mines stone.")
                }
            },
            {
                name = "gauls_woodcutter",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Woodcutter
                    purpose = pgettext("gauls_worker", "Fells trees.")
                }
            },
            {
                name = "gauls_forester",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Forester
                    purpose = pgettext("gauls_worker", "Plants trees.")
                }
            },
            {
                name = "gauls_claydigger",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Clay Digger
                    purpose = pgettext("gauls_worker", "Makes clay out of mud and water.")
                }
            },
            {
                name = "gauls_brickmaker",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Brick Maker
                    purpose = pgettext("gauls_worker", "Burns bricks out of clay and granite.")
                }
            },
            {
                name = "gauls_breeder",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Breeder
                    purpose = pgettext("gauls_worker", "Breeds animals.")
                }
            },
            {
                name = "gauls_shipwright",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Shipwright
                    purpose = pgettext("gauls_worker", "Works at the shipyard and constructs new ships.")
                }
            },
        },
        {
            -- 3. Collectors and Food Supply
            {
                name = "gauls_fisher",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Fisher
                    purpose = pgettext("gauls_worker", "Catches fish in the sea.")
                }
            },
            {
                name = "gauls_hunter",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Hunter
                    purpose = pgettext("gauls_worker", "The hunter brings fresh, raw meat to the colonists.")
                }
            },
            {
                name = "gauls_farmer",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Farmer
                    purpose = pgettext("gauls_worker", "Plants fields and harvests wheat sheaves.")
                }
            },
            {
                name = "gauls_toiler",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Toiler
                    purpose = pgettext("gauls_worker", "Threshes harvested wheat sheaves to obtain wheat grain.")
                }
            },
            {
                name = "gauls_miller",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Miller
                    purpose = pgettext("gauls_worker", "Grinds wheat to produce flour.")
                }
            },
            {
                name = "gauls_baker",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Baker
                    purpose = pgettext("gauls_worker", "Bakes bread for ration and meal preparation.")
                }
            },
            {
                name = "gauls_cook",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Cook
                    purpose = pgettext("gauls_worker", "Prepares rations and meals for miners and warriors. Cook can also work at the smokery and smoke meat and fishes.")
                }
            }
        },
        {
            -- 4. Miners and Metal Workers
            {
                name = "gauls_geologist",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Geologist
                    purpose = pgettext("gauls_worker", "Discovers resources for mining.")
                }
            },
            {
                name = "gauls_miner",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Miner
                    purpose = pgettext("gauls_worker", "Mines ore and minerals.")
                }
            },
            {
                name = "gauls_miner_master",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Master Miner
                    purpose = pgettext("gauls_worker", "Mines ore and minerals.")
                }
            },
            {
                name = "gauls_smelter",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Smelter
                    purpose = pgettext("gauls_worker", "Smelts ore.")
                }
            },
            {
                name = "gauls_charcoal_burner",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Charcoal Burner
                    purpose = pgettext("gauls_worker", "Burns logs and wood to produce charcoal.")
                }
            },
            {
                name = "gauls_weaver",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Weaver
                    purpose = pgettext("gauls_worker", "Weaves cloth.")
                }
            },
            {
                name = "gauls_dressmaker",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Dressmaker
                    purpose = pgettext("gauls_worker", "Dressmaker is an experienced weaver and produces tunics.")
                }
            },
        },
        {
            -- 5. Training, Clothing
            {
                name = "gauls_craftsman",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Craftsman
                    purpose = pgettext("gauls_worker", "Produces tools for your workers and wooden shields for the first level of evade training. Craftman can also help the experienced blacksmith in the armor smithy.")
                }
            },
            {
                name = "gauls_blacksmith",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Blacksmith
                    purpose = pgettext("gauls_worker", "Produces armor for the warriors.")
                }
            },
            {
                name = "gauls_recruit",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Recruit
                    purpose = pgettext("gauls_worker", "Eager to become a warrior and defend his tribe!")
                }
            },
            {
                name = "gauls_soldier",
                default_target_quantity = 20,
                preciousness = 30,
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Warrior
                    purpose = pgettext("gauls_worker", "Defend and Conquer!")
                }
            },
            {
                name = "gauls_druid",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Druid
                    purpose = pgettext("gauls_worker", "His elixirs improve health of warriors and his potions improve their training as well as miners’ productivity.")
                }
            },
            {
                name = "gauls_trainer",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Trainer
                    purpose = pgettext("gauls_worker", "Trains and recruits warriors.")
                }
            },
            {
                name = "gauls_scout",
                helptexts = {
                    -- TRANSLATORS: Help text for a Gallic worker: Scout
                    purpose = pgettext("gauls_worker", "Explores territory of your enemy.")
                }
            }
        },
    },

    immovables = {
        {
            name = "ashes",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Ashes
                purpose = _("The remains of a destroyed building.")
            }
        },
        {
            name = "destroyed_building",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Destroyed Building
                purpose = _("The remains of a destroyed building.")
            }
        },
        {
          name = "hole",
          helptexts = {
             -- TRANSLATORS: Help text for a Gallic immovable: Hole
             purpose = _("When clay diggers dig up earth, they leave holes in the ground. These holes vanish after a while. ")
          }
       },
       {
            name = "herbs_tiny",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Herbs (tiny)
                purpose = _("These herbs has just been planted.")
            }
        },
        {
            name = "herbs_small",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Herbs (small)
                purpose = _("These herbs are growing.")
            }
        },
        {
            name = "herbs_medium",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Herbs (medium)
                purpose = _("These herbs are flowering.")
            }
        },
        {
            name = "herbs_ripe",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Herbs (ripe)
                purpose = _("These herbs are ready for harvesting.")
            }
        },
        {
            name = "herbs_harvested",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Herbs (harvested)
                purpose = _("These herbs has been harvested.")
            }
        },
        {
            name = "vegetable_tiny",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Vegetable (tiny)
                purpose = _("These vegetable plants has just been planted.")
            }
        },
        {
            name = "vegetable_small",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Vegetable (small)
                purpose = _("These vegetable plants are growing.")
            }
        },
        {
            name = "vegetable_medium",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Vegetable (medium)
                purpose = _("These vegetable plants are flowering.")
            }
        },
        {
            name = "vegetable_ripe",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Vegetable (ripe)
                purpose = _("These vegetable plants are ready for harvesting.")
            }
        },
        {
            name = "vegetable_harvested",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Vegetable (harvested)
                purpose = _("This vegetable has been harvested.")
            }
        },
        {
           name = "wheatfield_tiny",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: Wheat Field (tiny)
              purpose = _("This field has just been planted.")
           }
        },
        {
           name = "wheatfield_small",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: Wheat Field (small)
              purpose = _("This field is growing.")
           }
        },
        {
           name = "wheatfield_medium",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: Wheat Field (medium)
              purpose = _("This field is growing.")
           }
        },
        {
           name = "wheatfield_ripe",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: Wheat Field (ripe)
              purpose = _("This field is ready for harvesting.")
           }
        },
        {
           name = "wheatfield_harvested",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: Wheat Field (harvested)
              purpose = _("This field has been harvested.")
           }
        },
        {
            name = "reedfield_tiny",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Reed Field (tiny)
                purpose = _("This reed field has just been planted.")
            }
        },
        {
            name = "reedfield_small",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Reed Field (small)
                purpose = _("This reed field is growing.")
            }
        },
        {
            name = "reedfield_medium",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Reed Field (medium)
                purpose = _("This reed field is flowering.")
            }
        },
        {
            name = "reedfield_ripe",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Reed Field (ripe)
                purpose = _("This reed field is ready for harvesting.")
            }
        },
        {
           name = "berry_bush_juniper_tiny",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: Juniper (tiny)
              purpose = _("This juniper has just been planted.")
           }
        },
        {
           name = "berry_bush_juniper_small",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: Juniper (small)
              purpose = _("This juniper is growing.")
           }
        },
        {
           name = "berry_bush_juniper_medium",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: Juniper (medium)
              purpose = _("This juniper is flowering.")
           }
        },
        {
           name = "berry_bush_juniper_ripe",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: Juniper (ripe)
              purpose = _("This juniper is ready for harvesting.")
           }
        },
        {
           name = "berry_bush_raspberry_ripe",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: One of the berry bushes
              purpose = _("This raspberry is ready for harvesting.")
           }
        },
        {
           name = "berry_bush_currant_black_ripe",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: One of the berry bushes
              purpose = _("This black currant is ready for harvesting.")
           }
        },
        {
           name = "berry_bush_strawberry_ripe",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: One of the berry bushes
              purpose = _("These strawberries are ready for harvesting.")
           }
        },
        {
           name = "berry_bush_desert_hackberry_ripe",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: One of the berry bushes
              purpose = _("This desert hackberry is ready for harvesting.")
           }
        },
        {
           name = "berry_bush_currant_red_ripe",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: One of the berry bushes
              purpose = _("This red currant is ready for harvesting.")
           }
        },
        {
           name = "berry_bush_blueberry_ripe",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: One of the berry bushes
              purpose = _("These blueberries are ready for harvesting.")
           }
        },
        {
           name = "berry_bush_sea_buckthorn_ripe",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: One of the berry bushes
              purpose = _("This berry bush is ready for harvesting.")
           }
        },
        {
           name = "berry_bush_stink_tree_ripe",
           helptexts = {
              -- TRANSLATORS: Help text for a Gallic immovable: One of the berry bushes
              purpose = _("This berry bush is ready for harvesting.")
           }
        },
        {
            name = "cherry_tree_sapling",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Cherry Tree (Sapling)
                purpose = _("This cherry tree has just been planted.")
            }
        },
        {
            name = "cherry_tree_pole",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Cherry Tree (Pole)
                purpose = _("This cherry tree is growing.")
            }
        },
        {
            name = "cherry_tree_mature",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Cherry Tree (Mature)
                purpose = _("This cherry tree is fully grown.")
            }
        },
        {
            name = "cherry_tree_old",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Cherry Tree (Old)
                purpose = _("This old cherry tree can be cut down by a woodcutter for log. This is the only life stage of this tree, when a woodcutter is allowed to fell it.")
            }
        },
        {
            name = "cherry_tree_flowering",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Cherry Tree (Flowering)
                purpose = _("This cherry tree is flowering.")
            }
        },
        {
            name = "cherry_tree_fruit",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Cherry Tree (Fruit)
                purpose = _("This cherry tree is full of fruits. Gardeners and druids can pick some fruit here.")
            }
        },
        {
            name = "apple_tree_sapling",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Apple Tree (Sapling)
                purpose = _("This apple tree has just been planted.")
            }
        },
        {
            name = "apple_tree_pole",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Apple Tree (Pole)
                purpose = _("This apple tree is growing.")
            }
        },
        {
            name = "apple_tree_mature",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Apple Tree (Mature)
                purpose = _("This apple tree is fully grown.")
            }
        },
        {
            name = "apple_tree_old",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Apple Tree (Old)
                purpose = _("This old apple tree can be cut down by a woodcutter for log. This is the only life stage of this tree, when a woodcutter is allowed to fell it.")
            }
        },
        {
            name = "apple_tree_flowering",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Apple Tree (Flowering)
                purpose = _("This apple tree is flowering.")
            }
        },
        {
            name = "apple_tree_fruit",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Apple Tree (Fruit)
                purpose = _("This apple tree is full of fruits. Gardeners and druids can pick some fruit here.")
            }
        },
        {
            name = "gauls_resi_none",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic resource indicator: No resources
                purpose = _("There are no resources in the ground here.")
            }
        },
        {
            name = "gauls_resi_water",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic resource indicator: Water
                purpose = _("There is water in the ground here.")
            }
        },
        {
            name = "gauls_resi_coal_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Coal, part 1
                    _("Coal veins contain coal that can be dug up by coal mines."),
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Coal, part 2
                    _("There is only a little bit of coal here.")
                }
            }
        },
        {
            name = "gauls_resi_iron_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Iron, part 1
                    _("This vein contains iron ore that can be dug up by iron mines."),
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Iron, part 2
                    _("There is only a little bit of iron ore here.")
                }
            }
        },
        {
            name = "gauls_resi_copper_gold_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Copper-Gold, part 1
                    _("This vein contains copper-gold ore that can be dug up by copper-gold mines."),
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Copper-Gold, part 2
                    _("There is only a little bit of copper-gold ore here.")
                }
            }
        },
        {
            name = "gauls_resi_stones_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Tin Ore, part 1
                    _("This vein contains tin ore that can be dug up by tin mines. There is also high ratio of granite in the ground."),
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Tin Ore, part 2
                    _("There is only a little bit of tin ore and granite here.")
                }
            }
        },
        {
            name = "gauls_resi_coal_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Coal, part 1
                    _("Coal veins contain coal that can be dug up by coal mines."),
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Coal, part 2
                    _("There is a lot of coal here.")
                }
            }
        },
        {
            name = "gauls_resi_iron_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Iron, part 1
                    _("This vein contains iron ore that can be dug up by iron mines."),
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Iron, part 2
                    _("There is a lot of iron ore here.")
                }
            }
        },
        {
            name = "gauls_resi_copper_gold_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Copper-Gold, part 1
                    _("This vein contains copper-gold ore that can be dug up by copper-gold mines."),
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Copper-Gold, part 2
                    _("There is a lot of copper-gold ore here.")
                }
            }
        },
        {
            name = "gauls_resi_stones_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Tin Ore, part 1
                    _("This vein contains tin ore that can be dug up by tin mines. There is also high ratio of granite in the ground."),
                    -- TRANSLATORS: Help text for a Gallic resource indicator: Tin Ore, part 2
                    _("There is a lot of tin ore and granite here.")
                }
            }
        },
        {
            name = "gauls_shipconstruction",
            helptexts = {
                -- TRANSLATORS: Help text for a Gallic immovable: Ship Under Construction
                purpose = _("A ship is being constructed at this site.")
            }
        }
    },

    -- The order here also determines the order in lists on screen.
    buildings = {
        -- Warehouses
        {
            name = "gauls_headquarters",
            helptexts = {
                -- TRANSLATORS: Lore help text for a Gallic warehouse: Headquarters
                purpose = pgettext("gauls_building", "Accommodation for your people. Also stores your wares and tools."),
                -- TRANSLATORS: Note help text for a Gallic warehouse: Headquarters
                note = pgettext("gauls_building", "The headquarters is your main building."),
            }
        },
        {
            name = "gauls_warehouse",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic warehouse: Warehouse
                purpose = pgettext("gauls_building", "Your workers and warriors will find shelter here. Also stores your wares and tools.")
            }
        },
        {
            name = "gauls_port",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic warehouse: Port
                purpose = pgettext("gauls_building", "Serves as a base for overseas colonization and trade. Also stores your warriors, wares and tools.")
            }
        },
        -- Small
        {
            name = "gauls_woodcutters_house",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Woodcutter’s House
                purpose = pgettext("gauls_building", "Fells trees in the surrounding area and processes them into logs."),
                -- TRANSLATORS: Note help text for a Gallic production site: Woodcutter’s House
                performance = {
                   -- TRANSLATORS: Performance help text for a Gallic production site: Woodcutter’s House, part 1
                   pgettext("gauls_building", "This building can produce one log between %1$s and %2$s, depending on how far the woodcutter has to walk."):bformat(format_seconds(37), format_minutes_seconds(1, 24)),

                   -- TRANSLATORS: Performance help text for a Gallic production site: Woodcutter’s House, part 2
                   pgettext("gauls_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "gauls_foresters_house",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Forester’s Hut
                purpose = pgettext("gauls_building", "Plants trees in the surrounding area."),
                -- TRANSLATORS: Note help text for a Gallic production site: Forester’s Hut
                note = pgettext("gauls_building", "The forester’s house needs free space within the work area to plant the trees."),
                performance = {
                   -- TRANSLATORS: Performance help text for a Gallic production site: Forester’s Hut, part 1
                   pgettext("gauls_building", "The forester plants one tree between %1$s and %2$s, depending on how far he has to walk."):bformat(format_seconds(17), format_seconds(50)),
                   -- TRANSLATORS: Performance help text for a Gallic production site: Forester’s Hut, part 2
                   pgettext("gauls_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "gauls_clay_pit",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Clay Pit
                purpose = pgettext("gauls_building", "Digs up mud from the ground and uses water to turn it into clay. Clay is used to make bricks."),
                performance = {
                   -- TRANSLATORS: Performance help text for a Gallic production site: Clay Pit, part 1
                   pgettext("gauls_building", "This building can produce one clay between %1$s and %2$s, depending on how far the clay digger has to walk."):bformat(format_seconds(55), format_minutes_seconds(1, 13)),
                   -- TRANSLATORS: Performance help text for a Gallic production site: Clay Pit, part 2
                   pgettext("gauls_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "gauls_stonecutters_hut",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Stonecutter’s Hut
                purpose = pgettext("gauls_building", "Cuts blocks of stone out of rocks in the vicinity."),
                -- TRANSLATORS: Note help text for a Gallic production site: Stonecutter’s Hut
                note = pgettext("gauls_building", "The stonecutter needs rocks to cut within the work area."),
                performance = {
                   -- TRANSLATORS: Performance help text for a Gallic production site: Stonecutter’s Hut, part 1
                   pgettext("gauls_building", "The stonecutter can produce one block of granite between %1$s and %2$s on average, depending on how far he has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 9)),
                   -- TRANSLATORS: Performance help text for a Gallic production site: Stonecutter’s Hut, part 2
                   pgettext("gauls_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "gauls_well",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Well
                purpose = pgettext("gauls_building", "Draws water out of the deep."),
                performance = {
                   -- TRANSLATORS: Performance help text for a Gallic production site: Well, part 1
                   pgettext("gauls_building", "The carrier needs %s to get one bucket full of water."):bformat(format_seconds(30)),
                   -- TRANSLATORS: Performance help text for a Gallic production site: Well, part 2
                   pgettext("gauls_building", "If the water resource is depleted, the carrier needs %s on average."):bformat(format_seconds(50))
                }
            }
        },
        {
            name = "gauls_fishers_hut",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Fisher's Hut
                purpose = pgettext("gauls_building", "Fishes on the coast near the fisher’s house."),
                note = {
                   -- TRANSLATORS: Note help text for a Gallic production site: Fisher's Hut, Part 1
                   pgettext("gauls_building", "The fisher’s hut needs water full of fish within the work area."),
                   -- TRANSLATORS: Note help text for a Gallic production site: Fisher's Hut, Part 2
                   pgettext("gauls_building", "Roads and trees along the shoreline block fishing."),
                },
                performance = {
                   -- TRANSLATORS: Performance help text for a Gallic production site: Fisher's Hut, part 1
                   pgettext("gauls_building", "This building can produce one fish between %1$s and %2$s, depending on how far the fisher has to walk."):bformat(format_seconds(38), format_minutes_seconds(1, 7)),
                   -- TRANSLATORS: Performance help text for a Gallic production site: Fisher's Hut, part 2
                   pgettext("gauls_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "gauls_hunters_hut",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Hunter’s Hut
                purpose = pgettext("building", "Hunts animals to produce meat."),
                -- TRANSLATORS: Note help text for a Gallic production site: Hunter’s Hut
                note = pgettext("gauls_building", "The hunter’s hut needs animals to hunt within the work area."),
                performance = {
                   -- TRANSLATORS: Performance help text for a Gallic production site: Hunter’s Hut, part 1
                   pgettext("gauls_building", "This building can produce one meat between %1$s and %2$s, depending on how far the hunter has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 31)),
                   -- TRANSLATORS: Performance help text for a Gallic production site: Hunter’s Hut, part 2
                   pgettext("gauls_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
             }
        },
        {
            name = "gauls_scouts_cottage",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Scout’s Cottage
                purpose = pgettext("building", "Explores unknown territory."),
                performance = {
            	    -- TRANSLATORS: Performance help text for a Gallic production site: Scout’s Cottage, part 1
            	    pgettext("gauls_building", "One exploration trip of the scout takes between %1$s and %2$s."):bformat(format_minutes_seconds(1, 32), format_minutes_seconds(3, 45)),
            	    -- TRANSLATORS: Performance help text for a Gallic production site: Scout’s Cottage, part 2
            	    pgettext("gauls_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
             }
        },

        -- Medium
        {
            name = "gauls_workshop",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Workshop
                purpose = pgettext("gauls_building", "Forges the tools that your workers need."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Workshop
                performance = pgettext("gauls_building", "If this building is fully supplied and all produced items are needed by the economy, production of one of each item takes %1$s. If only one kind of item is needed by the economy, its production takes %2$s."):bformat(format_minutes_seconds(11, 48), format_seconds(59))
            }
        },
        {
            name = "gauls_sawmill",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Sawmill
                purpose = pgettext("gauls_building", "Saws logs to produce planks."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Sawmill
                performance = pgettext("gauls_building", "The sawmill needs %s to produce one plank."):bformat(format_seconds(40))
            }
        },
        {
            name = "gauls_brick_kiln",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Brick Kiln
                purpose = pgettext("gauls_building", "Burns bricks using granite and clay, and coal as fuel. Bricks are an important building material."),
                performance = {
                   -- TRANSLATORS: Performance help text for a Gallic production site: Brick Kiln
                   pgettext("gauls_building", "The brick kiln needs %s on average to produce one brick."):bformat(format_seconds(30))
                }
            }
        },
        {
            name = "gauls_reed_yard",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Reed Yard
                purpose = pgettext("gauls_building", "Produces reed."),
                -- TRANSLATORS: Note help text for a Gallic production site: Reed Yard
                note = pgettext("gauls_building", "Needs water nearby."),
                performance = {
                   -- TRANSLATORS: Performance help text for a Gallic production site: Reed Yard, part 1
                   pgettext("gauls_building", "The farmer can produce one bundle of reed between %1$s and %2$s on average, depending on how far he has to walk."):bformat(format_seconds(49), format_minutes_seconds(1, 40)),
                   -- TRANSLATORS: Performance help text for a Gallic production site: Reed Yard, part 2
                   pgettext("gauls_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "gauls_furnace",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Furnace
                purpose = pgettext("gauls_building", "Smelts ore into iron, copper, bronze and gold."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Furnace
                performance = pgettext("gauls_building", "If this building is fully supplied and there is a demand for all metals, production of 6 iron ingots, 2 copper ingots, 3 bronze bars and 2 gold bars takes %1$s. If only one kind of metal is needed, it takes %2$s to produce one iron or copper ingot or %3$s to produce one bronze or gold bar."):bformat(format_minutes_seconds(5, 24), format_seconds(23), format_seconds(28))
            }
        },
        {
            name = "gauls_garden",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Garden
                purpose = pgettext("gauls_building", "Grows herbs and vegetable."),
                performance = {
                   -- TRANSLATORS: Performance help text for a Gallic production site: Garden
                   pgettext("gauls_building", "If all products are needed by the economy, the gardener resp. experienced gardener need %1$s resp. %2$s on average to produce two baskets of vegetable and two bundles of herbs. If only one product is needed by the economy, the gardener resp. experienced gardener need %3$s resp. %4$s on average to produce one baskets of vegetable or one bundle of herbs."):bformat(format_minutes_seconds(3, 2), format_minutes_seconds(2, 42), format_seconds(45), format_seconds(40)),
                }
            }
        },
        {
            name = "gauls_orchard",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Orchard
                purpose = pgettext("gauls_building", "Plants fruit trees and harvests fruit."),
                -- TRANSLATORS: Note help text for a Gallic production site: Orchard
                note = pgettext("gauls_building", "According to the climate, two different fruit trees are planted – apple tree and cherry tree. Per two fruit trees, one juniper – which has a form of a bush – is planted."),
                performance = {
                   -- TRANSLATORS: Performance help text for a Gallic production site: Orchard, part 1
                   pgettext("gauls_building", "When the orchard has already multiple trees, the gardener can produce one basket of fruit between %1$s and %2$s, depending on how far she has to walk."):bformat(format_seconds(39), format_minutes_seconds(1, 19)),
                   -- TRANSLATORS: Performance help text for a Gallic production site: Orchard, part 2
                   pgettext("gauls_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "gauls_threshing_floor_small",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Small Threshing Floor
                purpose = pgettext("gauls_building", "Threshes harvested wheat sheaves to obtain wheat grain."),
                -- TRANSLATORS: Note help text for a Gallic production site: Small Threshing Floor
                note = pgettext("gauls_building", "Straw is collected only when the economy needs straw."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Small Threshing Floor
                performance = pgettext("gauls_building", "The toiler needs %1$s to produce one basket of wheat or %2$s to produce one basket of wheat and one bale of straw."):bformat(format_seconds(15), format_seconds(25)),
            }
        },
        {
            name = "gauls_threshing_floor",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Threshing Floor
                purpose = pgettext("gauls_building", "Threshes harvested wheat sheaves to obtain wheat grain."),
                -- TRANSLATORS: Note help text for a Gallic production site: Threshing Floor
                note = pgettext("gauls_building", "Straw is collected only when the economy needs straw."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Threshing Floor
                performance = pgettext("gauls_building", "The toiler needs %1$s to produce one basket of wheat or %2$s to produce one basket of wheat and one bale of straw."):bformat(format_seconds(9), format_seconds(15)),
            }
        },
        {
            name = "gauls_mill",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Mill
                purpose = pgettext("gauls_building", "Grinds wheat to produce flour."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Mill
                performance = pgettext("gauls_building", "The miller needs %1% to grind wheat into a sack of flour."):bformat(format_seconds(15))
            }
        },
        {
            name = "gauls_bakery",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Bakery
                purpose = pgettext("gauls_building", "Bakes bread for ration and meal preparation."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Bakery
                performance = pgettext("gauls_building", "The baker needs %1% on average to bake a loaf of bread."):bformat(format_seconds(34))
            }
        },
        {
            name = "gauls_kitchen_small",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Small Kitchen
                purpose = pgettext("gauls_building", "Prepares rations to feed the scouts and miners."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Small Kitchen
                performance = pgettext("gauls_building", "The cook needs %1% on average to prepare one ration."):bformat(format_seconds(19))
            }
        },
        {
            name = "gauls_kitchen",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Kitchen
                purpose = pgettext("gauls_building", "Prepares rations for scouts and miners as well as meals to feed the miners at advanced mines and warriors at the training sites."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Kitchen
                performance = pgettext("gauls_building", "If this building is fully supplied and all kinds of food are needed by the economy, production of one of each food takes %1$s. If only one kind of food is needed by the economy, production of one ration or one meal takes %2$s."):bformat(format_seconds(46), format_seconds(23))
            }
        },
        {
            name = "gauls_smokery",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Smokery
                purpose = pgettext("gauls_building", "Smokes fish and meat using logs."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Smokery
                performance = pgettext("gauls_building", "If this building is fully supplied, the cook needs %1% to smoke three fishes or three pieces of meat."):bformat(format_minutes_seconds(1, 12))
            }
        },
        {
            name = "gauls_druids_house",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Druid’s House
                purpose = pgettext("gauls_building", "Produces elixirs and potions for your miners and warriors."),
                -- TRANSLATORS: Note help text for a Gallic production site: Druid’s House
                note = pgettext("gauls_building", "Because the druid picks some secret ingredients by himself, he needs trees for potion preparation and fruit trees with fruit for elixir preparation in his working area."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Druid’s House
                performance = pgettext("gauls_building", "If this building is fully supplied and all kinds of drinks are needed by the economy, production of one of each drink takes %1$s. If only one kind of drink is needed by the economy, production of one drink takes %2$s."):bformat(format_minutes_seconds(2, 24), format_minutes_seconds(1, 12))
            }
        },
        {
            name = "gauls_sewing_workshop",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Sewing Workshop
                purpose = pgettext("gauls_building", "Produces tunics."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Sewing Workshop
                performance = pgettext("gauls_building", "The dressmaker needs %1% to sew one piece of clothing."):bformat(format_seconds(55))
            }
        },
        {
            name = "gauls_weaponsmithy",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Weapon Smithy
                purpose = pgettext("gauls_building", "Produces spears for hunters and new warriors and swords for trainers and attack training."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Weapon Smithy
                performance = pgettext("gauls_building", "If this building is fully supplied and both swords and spear are needed by the economy, production of two spears, one short sword and one long sword takes %1$s. If only one kind of sword or spear is needed by the economy, production of one short sword takes %2$s, one long sword takes %3$s and one spear takes %4$s."):bformat(format_minutes_seconds(1, 35), format_seconds(25), format_seconds(30), format_seconds(20))
            }
        },
        {
            name = "gauls_armorsmithy",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Armor Smithy
                purpose = pgettext("gauls_building", "Produces shields and armor."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Armor Smithy
                performance = pgettext("gauls_building", "If this building is fully supplied and there is a demand for all types of armor, production of one of each items takes %1$s. If only one kind of armor is needed, production of one bronze shield takes %2$s and production of any other item takes %3$s."):bformat(format_minutes_seconds(3, 5), format_seconds(38), format_seconds(49))
            }
        },
        {
            name = "gauls_barracks",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Barracks
                purpose = pgettext("gauls_building", "Equips recruits and trains them as warriors."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Barracks
                performance = pgettext("gauls_building", "The barracks need %s to recruit one warrior."):bformat(format_seconds(30))
            }
        },
        {
            name = "gauls_charcoal_kiln",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Charcoal Kiln
                purpose = pgettext("gauls_building", "Burns logs into charcoal."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Charcoal Kiln
                performance = pgettext("gauls_building", "The charcoal burner needs %1% to produce one lump of coal."):bformat(format_minutes_seconds(1, 20))
            }
        },

        -- Big
        {
            name = "gauls_farm",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Farm
                purpose = pgettext("gauls_building", "Sows wheat and harvests wheat sheaves."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Farm
                performance = pgettext("gauls_building", "The farmer sows and harvests one sheaf of wheat between %1$s and %2$s, depending on how far he has to walk."):bformat(format_seconds(42), format_seconds(57)),
            }
        },
        {
            name = "gauls_cattle_farm",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Cattle Farm
                purpose = pgettext("gauls_building", "Breeds strong oxen for adding them to the transportation system. Also keeps cows for their milk and meat."),
                -- TRANSLATORS: Note help text for a Gallic production site: Cattle Farm
                note = pgettext("gauls_building", "Production of meat stops when economy doesn’t need smoked meat, production of both milk and meat stops when economy doesn’t need milk."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Cattle Farm
                performance = pgettext("gauls_building", "If this building is fully supplied and the economy needs all products, breeding of one ox, production of 2 jugs of milk and one piece of meat takes %1$s. Production of one ox only takes %2$s, production of 2 jugs of milk and one piece of meat takes %3$s and production of 2 jugs of milk only takes %4$s."):bformat(format_minutes_seconds(1, 36), format_seconds(30), format_minutes_seconds(1, 6), format_seconds(52))
            }
        },
        {
            name = "gauls_sheep_farm",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Sheep Farm
                purpose = pgettext("gauls_building", "Keeps sheep for their wool."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Sheep Farm
                performance = pgettext("gauls_building", "The sheep farm needs %1% to produce one wool."):bformat(format_seconds(59))
            }
        },
        {
            name = "gauls_weaving_mill",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Weaving Mill
                purpose = pgettext("gauls_building", "Weaves cloth out of wool."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Weaving Mill
                performance = pgettext("gauls_building", "The weaver needs %1% to make one piece of cloth."):bformat(format_seconds(54))
            }
        },

        -- Mines
        {
            name = "gauls_coal_mine_small",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Small Coal Mine
                purpose = pgettext("gauls_building", "Digs coal out of the ground in mountain terrain."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Small Coal Mine
                performance = pgettext("gauls_building", "The miner needs %1% to produce one lump of coal."):bformat(format_seconds(30))
            }
        },
        {
            name = "gauls_coal_mine",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Coal Mine
                purpose = pgettext("gauls_building", "Digs coal out of the ground in mountain terrain."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Coal Mine
                performance = pgettext("gauls_building", "The miners need %1% to produce one lump of coal."):bformat(format_seconds(20))
            }
        },
        {
            name = "gauls_coal_mine_deep",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Deep Coal Mine
                purpose = pgettext("gauls_building", "Digs coal out of the ground in mountain terrain."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Deep Coal Mine
                performance = pgettext("gauls_building", "The miners need %1% to produce one lump of coal."):bformat(format_seconds(20))
            }
        },
        {
            name = "gauls_iron_mine_small",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Small Iron Mine
                purpose = pgettext("gauls_building", "Digs iron ore out of the ground in mountain terrain."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Small Iron Mine
                performance = pgettext("gauls_building", "The miner needs %1% to produce one piece of ore and one block of granite."):bformat(format_seconds(40))
            }
        },
        {
            name = "gauls_iron_mine",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Iron Mine
                purpose = pgettext("gauls_building", "Digs iron ore out of the ground in mountain terrain."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Iron Mine
                performance = pgettext("gauls_building", "The miners needs %1% to produce two pieces of ore and one block of granite."):bformat(format_minutes(1))
            }
        },
        {
            name = "gauls_iron_mine_deep",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Deep Iron Mine
                purpose = pgettext("gauls_building", "Digs iron ore out of the ground in mountain terrain."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Deep Iron Mine
                performance = pgettext("gauls_building", "The miners need %1% to produce five pieces of ore and two blocks of granite."):bformat(format_minutes_seconds(2, 30))
            }
        },
        {
            name = "gauls_copper_mine",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Copper Mine
                purpose = pgettext("gauls_building", "Digs copper ore and gold ore out of the ground in mountain terrain."),
                -- TRANSLATORS: Note help text for a Gallic production site: Copper Mine
                note = pgettext("gauls_building", "While empty, this mine produces copper ore."),
                -- TRANSLATORS: Note help text for a Gallic production site: Copper Mine
                performance = pgettext("gauls_building", "The miner needs %1% to produce two pieces of copper ore and one piece of gold ore."):bformat(format_minutes_seconds(1, 12))
            }
        },
        {
            name = "gauls_copper_gold_mine",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Copper-Gold Mine
                purpose = pgettext("gauls_building", "Digs copper ore and gold ore out of the ground in mountain terrain."),
                -- TRANSLATORS: Note help text for a Gallic production site: Copper-Gold Mine
                note = pgettext("gauls_building", "While empty, this mine produces gold ore."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Copper-Gold Mine
                performance = pgettext("gauls_building", "The miners need %1% to produce two pieces of copper ore and two pieces of gold ore."):bformat(format_minutes(1))
            }
        },
        {
            name = "gauls_tin_mine",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Tin Mine
                purpose = pgettext("gauls_building", "Digs tin ore and granite out of the ground in mountain terrain."),
                -- TRANSLATORS: Note help text for a Gallic production site: Tin Mine
                note = pgettext("gauls_building", "While empty, this mine produces blocks of granite."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Tin Mine
                performance = pgettext("gauls_building", "The miner needs %1% to produce one piece of tin ore and three blocks of granite."):bformat(format_minutes_seconds(1, 15))
            }
        },
        {
            name = "gauls_tin_mine_deep",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Deep Tin Mine
                purpose = pgettext("gauls_building", "Digs tin ore and granite out of the ground in mountain terrain."),
                -- TRANSLATORS: Note help text for a Gallic production site: Deep Tin Mine
                note = pgettext("gauls_building", "While empty, this mine produces tin ore."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Deep Tin Mine
                performance = pgettext("gauls_building", "The miners need %1% to produce three pieces of tin ore and two blocks of granite."):bformat(format_minutes_seconds(1, 30))
            }
        },

        -- Training Sites
        {
            name = "gauls_training_camp",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Purpose help text for a Gallic training site: Training Camp, part 1
                    pgettext("gauls_building", "Trains warriors in ‘Attack’."),
                    -- TRANSLATORS: Purpose help text for a Gallic training site: Training Camp, part 2
                    pgettext("gauls_building", "Equips the warriors with all necessary weapons.")
                },
                performance = {
                    -- TRANSLATORS: Performance help text for a Gallic training site: Training Camp, part 1
                    pgettext("gauls_building", "If this building is fully supplied, it can train one warrior one level in attack in %s."):bformat(format_seconds(36)),
                    -- TRANSLATORS: Performance help text for a Gallic training site: Training Camp, part 2
                    pgettext("gauls_building", "Complete training of one warrior takes %s."):bformat(format_minutes_seconds(1, 12))
                }
            }
        },
        {
            name = "gauls_fighting_arena",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic training site: Fighting Arena
                purpose = pgettext("gauls_building", "Trains warriors in ‘Defense’ and ‘Evade’."),
                performance = {
                    -- TRANSLATORS: Performance help text for a Gallic training site: Fighting Arena, part 1
                    pgettext("gauls_building", "If this building is fully supplied, it can train one warrior one level in defense or evade in %s."):bformat(format_seconds(36)),
                    -- TRANSLATORS: Performance help text for a Gallic training site: Fighting Arena, part 2
                    pgettext("gauls_building", "Complete training of one warrior takes %s."):bformat(format_minutes(3))
                }
            }
        },
        {
            name = "gauls_druids_gathering",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic training site: Druid’s Gathering
                purpose = pgettext("gauls_building", "Improves warrior’s health."),
                -- TRANSLATORS: Note help text for a Gallic training site: Druid’s Gathering
                note = pgettext("gauls_building", "Keep in mind that every druid needs trees in his working area."),
                performance = {
                    -- TRANSLATORS: Performance help text for a Gallic training site: Druid’s Gathering, part 1
                    pgettext("gauls_building", "If this building is fully supplied and has trees in its working area, it needs between %1$s and %2$s to improve one warrior one level in health, depending on how far the druid has to walk."):bformat(format_seconds(24), format_seconds(57)),
                    -- TRANSLATORS: Performance help text for a Gallic training site: Druid’s Gathering, part 2
                    pgettext("gauls_building", "Complete training of one warrior takes %s on average."):bformat(format_minutes_seconds(2, 4)),
                    -- TRANSLATORS: Performance help text for a Gallic training site: Druid’s Gathering, part 3
                    pgettext("gauls_building", "In case of slopes or obstacles in the way, the time is increased."),
                }
            }
        },

        -- Military Sites
        {
            name = "gauls_guard_post",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic military site: Guard Post
                purpose = pgettext("gauls_building", "Garrisons warriors to expand your territory."),
            }
        },
        {
            name = "gauls_watchtower",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic military site: Watchtower
                purpose = pgettext("gauls_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note help text for a Gallic military site: Watchtower
                note = pgettext("gauls_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },
        {
            name = "gauls_sentry",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic military site: Sentry
                purpose = pgettext("gauls_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note help text for a Gallic military site: Sentry
                note = pgettext("gauls_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },
        {
            name = "gauls_stone_tower",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic military site: Stone Tower
                purpose = pgettext("gauls_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note help text for a Gallic military site: Stone Tower
                note = pgettext("gauls_building", "This building can be built by enhancing a watchtower or big sentry. Enhancement of big sentry costs you one log and one reed more but you save one block of stone instead.")
            }
        },
        {
            name = "gauls_castle",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic military site: Castle
                purpose = pgettext("gauls_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note help text for a Gallic military site: Castle
                note = pgettext("gauls_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },
        {
            name = "gauls_stronghold",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic military site: Stronghold
                purpose = pgettext("gauls_building", "Garrisons warriors to expand your territory."),
                -- TRANSLATORS: Note help text for a Gallic military site: Stronghold
                note = pgettext("gauls_building", "If you’re low on warriors to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a warrior to send him away.")
            }
        },

        -- Seafaring/Ferry Sites - these are only displayed on seafaring/ferry maps
        {
            name = "gauls_ferry_yard",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Ferry Yard
                purpose = pgettext("gauls_building", "Builds ferries."),
                -- TRANSLATORS: Note help text for a Gallic production site: Ferry Yard
                note = pgettext("gauls_building", "Needs water nearby."),
                -- TRANSLATORS: Performance help text for a Gallic production site: Ferry Yard
                performance = {
                   -- TRANSLATORS: Performance help text for a Gallic production site: Ferry Yard, part 1
                   pgettext("gauls_building", "The shipwright can produce one ferry between %1$s and %2$s, depending on how far he has to walk."):bformat(format_seconds(36), format_minutes_seconds(1, 1)),
                   -- TRANSLATORS: Performance help text for a Gallic production site: Ferry Yard, part 2
                   pgettext("gauls_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },
        {
            name = "gauls_shipyard",
            helptexts = {
                -- TRANSLATORS: Purpose help text for a Gallic production site: Shipyard
                purpose = pgettext("gauls_building", "Constructs ships that are used for overseas colonization and for shipping wares between ports."),
                performance = {
                   -- TRANSLATORS: Performance help text for a Gallic production site: Shipyard, part 1
                   pgettext("gauls_building", "The shipwright can produce one ship between %1$s and %2$s, depending on how far he has to walk."):bformat(format_minutes_seconds(17, 54), format_minutes_seconds(25, 3)),
                   -- TRANSLATORS: Performance help text for a Gallic production site: Shipyard, part 2
                   pgettext("gauls_building", "In case of slopes or obstacles in the way, the time is increased.")
                }
            }
        },

        -- Partially Finished Buildings - these are the same 2 buildings for all tribes
        {
            name = "constructionsite",
            helptexts = {
                -- TRANSLATORS: Lore help text for a Gallic building: Construction Site
                lore = pgettext("gauls_building", "‘Don’t swear at the builder who is short of building materials.’"),
                -- TRANSLATORS: Lore author help text for a Gallic building: Construction Site
                lore_author = pgettext("gauls_building", "Proverb widely used for impossible tasks of any kind"),
                -- TRANSLATORS: Purpose help text for a Gallic building: Construction Site
                purpose = pgettext("gauls_building", "A new building is being built at this construction site.")
            }
        },
        {
            name = "dismantlesite",
            helptexts = {
                -- TRANSLATORS: Lore help text for a Gallic building: Dismantle Site
                lore = pgettext("gauls_building", "‘New paths will appear when you are willing to tear down the old.’"),
                -- TRANSLATORS: Lore author help text for a Gallic building: Dismantle Site
                lore_author = pgettext("gauls_building", "Proverb"),
                -- TRANSLATORS: Purpose help text for a Gallic building: Dismantle Site
                purpose = pgettext("gauls_building", "A building is being dismantled at this dismantle site, returning some of the resources that were used during this building’s construction to your tribe’s stores.")
            }
        }
    },
    warehouse_names = { 
        pgettext("warehousename", "Agedincum"), 
        pgettext("warehousename", "Aginnon"), 
        pgettext("warehousename", "Alesia"), 
        pgettext("warehousename", "Ambatia"), 
        pgettext("warehousename", "Andematunnon"), 
        pgettext("warehousename", "Andreritum"), 
        pgettext("warehousename", "Anicium"), 
        pgettext("warehousename", "Aosta"), 
        pgettext("warehousename", "Aquileia"), 
        pgettext("warehousename", "Arausion"), 
        pgettext("warehousename", "Aregenua"), 
        pgettext("warehousename", "Atuatuca"), 
        pgettext("warehousename", "Augustodurum"), 
        pgettext("warehousename", "Augustoritum"), 
        pgettext("warehousename", "Autricum"), 
        pgettext("warehousename", "Avaricum"), 
        pgettext("warehousename", "Aventicum"), 
        pgettext("warehousename", "Bagacum"), 
        pgettext("warehousename", "Bibracte"), 
        pgettext("warehousename", "Bibrax"), 
        pgettext("warehousename", "Bononia"), 
        pgettext("warehousename", "Bratuspantion"), 
        pgettext("warehousename", "Brigantio"), 
        pgettext("warehousename", "Brigantion"), 
        pgettext("warehousename", "Brixia"), 
        pgettext("warehousename", "Burdigala"), 
        pgettext("warehousename", "Caesarodunum"), 
        pgettext("warehousename", "Caracotinum"), 
        pgettext("warehousename", "Cenabum"), 
        pgettext("warehousename", "Condate"), 
        pgettext("warehousename", "Condevincum"), 
        pgettext("warehousename", "Corseul"), 
        pgettext("warehousename", "Crociatonum"), 
        pgettext("warehousename", "Darantasia"), 
        pgettext("warehousename", "Dariorium"), 
        pgettext("warehousename", "Divodurum"), 
        pgettext("warehousename", "Durocassium"), 
        pgettext("warehousename", "Durocatelaunos"), 
        pgettext("warehousename", "Durocortorum"), 
        pgettext("warehousename", "Durotincum"), 
        pgettext("warehousename", "Ebrodunom"), 
        pgettext("warehousename", "Gergovia"), 
        pgettext("warehousename", "Lemonum"), 
        pgettext("warehousename", "Lutetia"), 
        pgettext("warehousename", "Matiscon"), 
        pgettext("warehousename", "Mediolanom"), 
        pgettext("warehousename", "Noeodunom"), 
        pgettext("warehousename", "Novaria"), 
        pgettext("warehousename", "Noviodunum"), 
        pgettext("warehousename", "Noviomagos"), 
        pgettext("warehousename", "Ocellum"), 
        pgettext("warehousename", "Octodurus"), 
        pgettext("warehousename", "Rotomagos"), 
        pgettext("warehousename", "Ruessium"), 
        pgettext("warehousename", "Samarobriva"), 
        pgettext("warehousename", "Sedunum"), 
        pgettext("warehousename", "Segodunom"), 
        pgettext("warehousename", "Segusio"), 
        pgettext("warehousename", "Solonion"), 
        pgettext("warehousename", "Tarnaiae"), 
        pgettext("warehousename", "Taurasia"), 
        pgettext("warehousename", "Tolosa"), 
        pgettext("warehousename", "Trier"), 
        pgettext("warehousename", "Tullum"), 
        pgettext("warehousename", "Uxellodunum"), 
        pgettext("warehousename", "Vesontion"), 
        pgettext("warehousename", "Vesunna"), 
        pgettext("warehousename", "Vorgium"), 
    },
    
   -- Productionsite status strings
   -- TRANSLATORS: Productivity label on a Gallic building if there is 1 worker missing
   productionsite_worker_missing = pgettext("gauls", "Worker missing"),
   -- TRANSLATORS: Productivity label on a Gallic building if there is 1 worker coming
   productionsite_worker_coming = pgettext("gauls", "Worker is coming"),
   -- TRANSLATORS: Productivity label on a Gallic building if there is more than 1 worker missing. If you need plural forms here, please let us know.
   productionsite_workers_missing = pgettext("gauls", "Workers missing"),
   -- TRANSLATORS: Productivity label on a Gallic building if there is more than 1 worker coming. If you need plural forms here, please let us know.
   productionsite_workers_coming = pgettext("gauls", "Workers are coming"),
   -- TRANSLATORS: Productivity label on a Gallic building if there is 1 experienced worker missing
   productionsite_experienced_worker_missing = pgettext("gauls", "Expert missing"),
   -- TRANSLATORS: Productivity label on a Gallic building if there is more than 1 experienced worker missing. If you need plural forms here, please let us know.
   productionsite_experienced_workers_missing = pgettext("gauls", "Experts missing"),

   -- Soldier strings to be used in Military Status strings

   soldier_context = "gauls_soldier",
   soldier_0_sg = "%1% warrior (+%2%)",
   soldier_0_pl = "%1% warriors (+%2%)",
   soldier_1_sg = "%1% warrior",
   soldier_1_pl = "%1% warriors",
   soldier_2_sg = "%1%(+%2%) warrior (+%3%)",
   soldier_2_pl = "%1%(+%2%) warriors (+%3%)",
   soldier_3_sg = "%1%(+%2%) warrior",
   soldier_3_pl = "%1%(+%2%) warriors",
   -- TRANSLATORS: %1% is the number of gauls warriors the plural refers to. %2% is the maximum number of warrior slots in the building.
   UNUSED_soldier_0 = npgettext("gauls_soldier", "%1% warrior (+%2%)", "%1% warriors (+%2%)", 0),
   -- TRANSLATORS: Number of gauls warriors stationed at a military site.
   UNUSED_soldier_1 = npgettext("gauls_soldier", "%1% warrior", "%1% warriors", 0),
   -- TRANSLATORS: %1% is the number of gauls warriors the plural refers to. %2% are currently open warrior slots in the building. %3% is the maximum number of warrior slots in the building
   UNUSED_soldier_2 = npgettext("gauls_soldier", "%1%(+%2%) warrior (+%3%)", "%1%(+%2%) warriors (+%3%)", 0),
   -- TRANSLATORS: %1% is the number of gauls warriors the plural refers to. %2% are currently open warrior slots in the building.
   UNUSED_soldier_3 = npgettext("gauls_soldier", "%1%(+%2%) warrior", "%1%(+%2%) warriors", 0),
   
    -- Special types
    builder = "gauls_builder",
    carriers = {"gauls_carrier", "gauls_carrier_1"},
    geologist = "gauls_geologist",
    scouts_house = "gauls_scouts_cottage",
    soldier = "gauls_soldier",
    ship = "gauls_ship",
    ferry = "gauls_ferry",
    port = "gauls_port",
    
   fastplace = {
      warehouse = "gauls_warehouse",
      port = "gauls_port",
      training_small = "gauls_druids_gathering",
      training_large = "gauls_fighting_arena",
      military_small_primary = "gauls_guard_post",
      military_small_secondary = "gauls_watchtower",
      military_medium_primary = "gauls_sentry",
      military_medium_secondary = "gauls_castle",
      military_tower = "gauls_stone_tower",
      military_fortress = "gauls_stronghold",
      woodcutter = "gauls_woodcutters_house",
      forester = "gauls_foresters_house",
      quarry = "gauls_stonecutters_hut",
      building_materials_primary = "gauls_clay_pit",
      building_materials_secondary = "gauls_brick_kiln",
      building_materials_tertiary = "gauls_sawmill",
      hunter = "gauls_hunters_hut",
      fisher = "gauls_fishers_hut",
      fish_meat_replenisher = "gauls_cattle_farm",
      well = "gauls_well",
      farm_primary = "gauls_farm",
      farm_secondary = "gauls_threshing_floor",
      bakery = "gauls_bakery",
      brevery = "gauls_druids_house",
      tavern = "gauls_kitchen_small",
      smelting = "gauls_furnace",
      tool_smithy = "gauls_workshop",
      weapon_smithy = "gauls_weaponsmithy",
      armor_smithy = "gauls_armorsmithy",
      weaving_mill = "gauls_weaving_mill",
      shipyard = "gauls_shipyard",
      ferry_yard = "gauls_ferry_yard",
      scout = "gauls_scouts_cottage",
      barracks = "gauls_barracks",
      charcoal = "gauls_charcoal_kiln",
      mine_stone = "gauls_tin_mine",
      mine_coal = "gauls_coal_mine_small",
      mine_iron = "gauls_iron_mine_small",
      mine_gold = "gauls_copper_gold_mine",
      agriculture_producer = "gauls_reed_yard",
      industry_alternative = "gauls_sewing_workshop",
      industry_supporter = "gauls_sheep_farm",
   },
}

pop_textdomain()
