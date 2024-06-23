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
        { ware = "gold", points = 1 },
        { ware = "coin_copper", points = 2 },
        { ware = "coin_silver", points = 4 },
        { ware = "coin_gold", points = 6 },
        { ware = "armor_wooden", points = 1 },
        { ware = "armor_processed", points = 2 },
        { ware = "armor_compressed", points = 4 },
        { ware = "armor_advanced", points = 6 },
        { ware = "boots_wooden", points = 1 },
        { ware = "boots_sturdy", points = 2 },
        { ware = "boots_swift", points = 4 },
        { ware = "boots_advanced", points = 6 },
        { ware = "spear_wooden", points = 1 },
        { ware = "spear_advanced", points = 2 },
        { ware = "ax_broad", points = 4 },
        { ware = "sword_broad", points = 6 },
        { ware = "helmet_wooden", points = 1 },
        { ware = "helmet_mask", points = 2 },
        { ware = "shield_steel", points = 4 },
        { ware = "shield_advanced", points = 6 },
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
                default_target_quantity = 64,
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
                default_target_quantity = 32,
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
                name = "blackwood",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans ware: Blackwood
                    purpose = pgettext("europeans_ware", "This fire-hardened wood is as hard as iron and it is used for several buildings. It is produced out of logs in the wood hardener (basic sawmill).")
                }
            },
            {
                name = "planks",
                default_target_quantity = 16,
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
                name = "scrap_wood",
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
            -- Building Materials 2 (Agricultur)
            {
                name = "reed",
                default_target_quantity = 32,
                preciousness = 2,
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
                name = "cloth",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Cloth
                    purpose = pgettext("europeans_ware", "Cloth is needed to build several buildings. It is produced out of reed.")
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
                name = "armor",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Armor
                    purpose = pgettext("europeans_ware", "Raw material for some sorts of armor. It is produced in the weaving mill out of wool or reed.")
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
        },
        {
            -- Building Materials 3 (Stone)
            {
                name = "granite",
                default_target_quantity = 16,
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
                default_target_quantity = 8,
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
        },
        {
            -- Building Materials 4 (Mining)
            {
                name = "coal",
                default_target_quantity = 32,
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
                name = "marble",
                default_target_quantity = 16,
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
            },
            {
                name = "quartz",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Quartz
                    purpose = pgettext("europeans_ware", "These transparent quartz gems are used to build some exclusive buildings. They are mined as a byproduct in a deep iron mine or by advanced quarry.")
                }
            },
            {
                name = "diamond",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Diamond
                    purpose = pgettext("europeans_ware", "These wonderful diamonds are used to build advanced buildings. They are mined as a byproduct in a deep coal mine or by advanced quarry.")
                }
            }
        },
        {
           -- Metals and Money
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
                name = "scrap_metal",
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans ware: Scrap Iron
                    purpose = pgettext("europeans_ware", "Discarded weapons and armor can be recycled in an advanced smelting works to produce new tools, weapon and armor.")
                }
            },
            {
                name = "metal_alloy",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Iron, part 1
                        pgettext("ware", "Mixed metal alloy is smelted out of ores."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Iron, part 2
                        pgettext("europeans_ware", "It is produced by the smelting works. Weapons, armor and tools are made of alloy.")
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
                        pgettext("ware", "Wood coins are money made of copper or bronze (copper and tin). Its the standard barter object."),
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
                        pgettext("ware", "Wood coins are money made of silver. Its a valuable barter object."),
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
                        pgettext("ware", "Wood coins are money made of gold. Its most valuable barter object."),
                    }
                }
            }
        },
        {
            -- Tools
            {
                name = "buckets",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Buckets, part 1
                        pgettext("europeans_ware", "Big buckets for the forester, the gardener, and the construction of wells."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Buckets, part 2
                        pgettext("europeans_ware", "They are produced by all smithies.")
                    }
                }
            },
            {
                name = "basket",
                default_target_quantity = 4,
                preciousness = 1,
                 helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Basket, part 1
                        pgettext("europeans_ware", "This basket is needed by advanced carrier to transport wares."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Basket, part 2
                        pgettext("europeans_ware", "It is produced by all smithies.")
                    }
                }
            },
            {
                name = "hammer",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Hammer, part 1
                        pgettext("europeans_ware", "The hammer is an essential tool. Geologists, builders, and worker all need a hammer."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Hammer, part 2
                        pgettext("europeans_ware", "Make sure you’ve always got some in reserve! They are produced by all smithies.")
                    }
                }
            },
            {
                name = "saw",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                         -- TRANSLATORS: Helptext for an Europeans ware: Saw, part 1
                         pgettext("europeans_ware", "The saw is an essential tool. This saw is needed by the worker and the woodcutter."),
                         -- TRANSLATORS: Helptext for an Europeans ware: Saw, part 2
                         pgettext("europeans_ware", "Make sure you’ve always got some in reserve! They are produced by all smithies.")
                     }
                }
            },
            {
                name = "scythe",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Scythe, part 1
                        pgettext("europeans_ware", "The scythe is a secondary tool of the lumberjacks."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Scythe, part 2
                        pgettext("europeans_ware", "Scythes are produced by all smithies.")
                    }
                }
            },
            {
                name = "felling_ax",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Felling Ax, part 1
                        pgettext("europeans_ware", "The felling ax is the tool to chop down trees."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Felling Ax, part 2
                        pgettext("europeans_ware", "Felling axes are used by lumberjacks and produced by all smithies.")
                    }
                }
            },
            {
                name = "pick",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                         -- TRANSLATORS: Helptext for an Europeans ware: Pick, part 1
                         pgettext("europeans_ware", "The pick is an essential tool. Picks are used by stonemasons and miners."),
                         -- TRANSLATORS: Helptext for an Europeans ware: Pick, part 2
                         pgettext("europeans_ware", "They are produced produced by all smithies.")
                     }
                }
            },
            {
                name = "shovel",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Shovel, part 1
                        pgettext("europeans_ware", "The shovel is an essential tool. Therefore the forester, the gardener and the terraformer use them."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Shovel, part 2
                        pgettext("europeans_ware", "They are produced by all smithies.")
                    }
                }
            },
        },
        {
            -- Armor
            {
                name = "armor_wooden",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Wooden Armor
                    purpose = pgettext("europeans_ware", "Basic armor for European soldiers. It is produced in the big manufactory. In combination with wooden spear, it is the equipment to fit out young soldiers.")
                }
            },
            {
                name = "armor_processed",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Processed Armor
                    purpose = pgettext("europeans_ware", "Basic armor for European soldiers. It is produced in the weaving mill. In combination with wooden spear, it is the equipment to fit out young soldiers.")
                }
            },
            {
                name = "armor_compressed",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Chain Armor
                    purpose = pgettext("europeans_ware", "The compressed armor is a medium armor for European soldiers. It is produced by a tailor and used in a battle arena to protect soldiers with additional health points.")
                }
            },
            {
                name = "armor_advanced",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Advanced Armor
                    purpose = pgettext("europeans_ware", "The advanced armor is produced in the a manufactory and used in the battle arena to protect soldiers with additional health points.")
                }
            },
            {
                name = "boots_wooden",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Wooden Boots
                    purpose = pgettext("europeans_ware", "Wooden boots are basic footwear for soldiers to be protect on their feet. They are produced by the dressmaker.")
                }
            },
            {
                name = "boots_sturdy",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Sturdy Boots
                    purpose = pgettext("europeans_ware", "Sturdy boots are excellent footwear for soldiers to be quicker on their feet. They are produced by the dressmaker and used to train soldiers’ evade from level 0 to level 1.")
                }
            },
            {
                name = "boots_swift",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Sturdy Boots
                    purpose = pgettext("europeans_ware", "Swift boots are light and durable footwear for soldiers to be quicker on their feet. They are produced by the dressmaker and used to train soldiers’ evade from level 1 to level 2.")
                }
            },
            {
                name = "boots_advanced",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Advanced Boots
                    purpose = pgettext("europeans_ware", "Hero boots! The only suitable footwear for a real hero. They are produced by the dressmaker and used to train soldiers’ evade from level 2 to level 3.")
                }
            }
        },
        {
            -- Weapons, Shields and Helmets
            {
                name = "spear_wooden",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Wooden Spear
                    purpose = pgettext("europeans_ware", "This wooden spear is the basic weapon in the European military system. It is produced in the manufactory. In combination with armor, it is the equipment to fit out young soldiers.")
                }
            },
            {
                name = "spear_advanced",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Advanced Spear
                    purpose = pgettext("europeans_ware", "This is a advanced spear with a steel tip. It is produced in a manufactory and used in a battle arena – together with food – to train soldiers in attack.")
                }
            },
            {
                name = "ax_broad",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Broad Ax
                    purpose = pgettext("europeans_ware", "This is an broad ax. It is produced in a manufactory and used in a battle arena – together with food – to train soldiers in attack.")
                }
            },
            {
                name = "sword_broad",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Broad Sword
                    purpose = pgettext("europeans_ware", "This is a broad sword. It is produced in the advanced manufactory and used in a battle arena – together with food – to train soldiers in attack.")
                }
            },
            {
                name = "helmet_wooden",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Helmet Mask
                    purpose = pgettext("europeans_ware", "The helmet is the basic defense tool of a soldier. It is produced in the manufactory. In combination with armor, it is the equipment to fit out young soldiers.")
                }
            },
            {
                name = "helmet_mask",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Helmet Mask
                    purpose = pgettext("europeans_ware", "The mask is the medium defense tool of a soldier. It is produced in a manufactory and used in a battle arena – together with food – to train soldiers in defense.")
                }
            },
            {
                name = "shield_steel",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Steel Shield
                    purpose = pgettext("europeans_ware", "This steel shield is produced in a manufactory and used in a battle arena – together with food – to train soldiers in defense.")
                }
            },
            {
                name = "shield_advanced",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Advanced Shield
                    purpose = pgettext("europeans_ware", "These advanced shields are used by the best soldiers of the Europeans. They are produced in the advanced manufactory and used in the advanced battle arena – together with food – to train soldiers in defense.")
                }
            }
        }
    },
    -- Workers positions in workers windows.
    -- This also gives us the information which workers the tribe uses.
    -- Each subtable is a column in the workers windows.
    workers_order = {
        {
            -- Carriers and Soldiers
            {
                name = "europeans_carrier",
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
                name = "europeans_ferry",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Ferry
                    purpose = pgettext("europeans_worker", "Ships wares across narrow rivers.")
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
                name = "europeans_worker_normal",
                default_target_quantity = 2,
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
                name = "europeans_shipwright_normal",
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
                name = "europeans_builder",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Builder
                    purpose = pgettext("europeans_worker", "Works at construction sites to raise new buildings.")
                }
            },
            {
                name = "europeans_geologist",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Geologist
                    purpose = pgettext("europeans_worker", "Discovers resources for mining.")
                }
            }
        },
        {
            -- Collectors, Supporters and Producer (Wood, Reed)
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
                name = "europeans_lumberjack_normal",
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
                name = "europeans_forester_basic",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Ranger / Forester
                    purpose = pgettext("europeans_worker", "Plant trees.")
                }
            },
            {
                name = "europeans_forester_normal",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Ranger / Forester
                    purpose = pgettext("europeans_worker", "Plant trees.")
                }
            },
            {
                name = "europeans_forester_advanced",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Ranger / Forester
                    purpose = pgettext("europeans_worker", "Plant trees.")
                }
            }
        },
        {
            -- Collectors and Producer (Clay and Stone)
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
                name = "europeans_gardener_normal",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Gardener
                    purpose = pgettext("europeans_worker", "Making clay for lime kiln or stonemasons house and planting reed and cotton.")
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
            }
        },
        {
            -- Miners and Stonecutters
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
                name = "europeans_stonecutter_normal",
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
                name = "europeans_miner_normal",
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
            -- Training, Trading and Scouting
            {
                name = "europeans_trainer_basic",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Trainer
                    purpose = pgettext("europeans_worker", "Trains the soldiers.")
                }
            },
            {
                name = "europeans_trainer_normal",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Trainer
                    purpose = pgettext("europeans_worker", "Trains the soldiers.")
                }
            },
            {
                name = "europeans_trainer_advanced",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Trainer
                    purpose = pgettext("europeans_worker", "Trains the soldiers.")
                }
            },
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
                name = "europeans_scout_normal",
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
            }
        },
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
            name = "cottonfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Cotton Field
                purpose = _("This cotton field has just been planted.")
            }
        },
        {
            name = "cottonfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Cotton Field
                purpose = _("This cotton field is growing.")
            }
        },
        {
            name = "cottonfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Cotton Field
                purpose = _("This cotton field is flowering. Honey can be produced from it by a beekeeper.")
            }
        },
        {
            name = "cottonfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Cotton Field
                purpose = _("This cotton field is ready for harvesting.")
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
                purpose = _("This reed field is flowering. Honey can be produced from it by a beekeeper.")
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
            name = "rubber_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Sapling
                purpose = _("This rubber tree has just been planted.")
            }
        },
        {
            name = "rubber_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Pole
                purpose = _("This rubber tree is growing.")
            }
        },
        {
            name = "rubber_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Mature
                purpose = _("This rubber tree is fully grown. Lianas can be gathered from it.")
            }
        },
        {
            name = "rubber_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Old
                purpose = _("This rubber tree is ready for harvesting rubber by a master woodcutter. Other tribes can harvest it for normal logs.")
            }
        },
        {
            name = "rubber_black_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Sapling
                purpose = _("This rubber tree has just been planted.")
            }
        },
        {
            name = "rubber_black_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Pole
                purpose = _("This rubber tree is growing.")
            }
        },
        {
            name = "rubber_black_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Mature
                purpose = _("This rubber tree is fully grown. Lianas can be gathered from it.")
            }
        },
        {
            name = "rubber_black_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Old
                purpose = _("This rubber tree is ready for harvesting rubber by a master woodcutter. Other tribes can harvest it for normal logs.")
            }
        },
        {
            name = "rubber_desert_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Sapling
                purpose = _("This rubber tree has just been planted.")
            }
        },
        {
            name = "rubber_desert_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Pole
                purpose = _("This rubber tree is growing.")
            }
        },
        {
            name = "rubber_desert_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Mature
                purpose = _("This rubber tree is fully grown. Lianas can be gathered from it.")
            }
        },
        {
            name = "rubber_desert_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Old
                purpose = _("This rubber tree is ready for harvesting rubber by a master woodcutter. Other tribes can harvest it for normal logs.")
            }
        },
        {
            name = "rubber_winter_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Sapling
                purpose = _("This rubber tree has just been planted.")
            }
        },
        {
            name = "rubber_winter_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Pole
                purpose = _("This rubber tree is growing.")
            }
        },
        {
            name = "rubber_winter_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Mature
                purpose = _("This rubber tree is fully grown. Lianas can be gathered from it.")
            }
        },
        {
            name = "rubber_winter_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Rubber Tree Old
                purpose = _("This rubber tree is ready for harvesting rubber by a master woodcutter. Other tribes can harvest it for normal logs.")
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
        {
            name = "europeans_trade_pole",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans immovable: Trade Pole
                purpose = pgettext("europeans_building", "Open market to exchange wares with other allied tribes.")
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
            name = "balsa_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Balsa Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "balsa_black_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Balsa Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "balsa_desert_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Balsa Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "balsa_winter_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Balsa Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "ironwood_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Ironwood Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "ironwood_black_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Ironwood Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "ironwood_desert_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Ironwood Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "ironwood_winter_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Ironwood Tree
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
            name = "europeans_warehouse",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Warehouse
                purpose = pgettext("europeans_building", "Your workers and soldiers will find shelter here. Also stores your wares and tools.")
            }
        },
        {
            name = "europeans_port",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Port
                purpose = pgettext("europeans_building", "Serves as a base for overseas colonization and trade. Also stores your soldiers, wares and tools.")
            }
        },
        {
            name = "europeans_market_agricultur",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Small Market
                purpose = pgettext("europeans_building", "Market building to sale natural products for coins.")
            }
        },
        {
            name = "europeans_market_craft",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Small Market
                purpose = pgettext("europeans_building", "Market building to sale processed products for coins.")
            }
        },
        {
            name = "europeans_market_armor",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Big Market
                purpose = pgettext("europeans_building", "Market building to sale armor for coins.")
            }
        },
        {
            name = "europeans_market_boots",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Big Market
                purpose = pgettext("europeans_building", "Market building to sale boots for coins.")
            }
        },
        {
            name = "europeans_market_weapons",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Big Market
                purpose = pgettext("europeans_building", "Market building to sale rubber for coins.")
            }
        },
        {
            name = "europeans_market_wood",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Big Market
                purpose = pgettext("europeans_building", "Market building to sale wood tools and weapons for coins.")
            }
        },
        {
            name = "europeans_store_small",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Store
                purpose = pgettext("europeans_building", "Store building to purchase wares from other allied tribes.")
            }
        },
        {
            name = "europeans_store_big",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Store
                purpose = pgettext("europeans_building", "Store building to purchase wares from other allied tribes.")
            }
        },
        {
            name = "europeans_trading_post",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Market
                purpose = pgettext("europeans_building", "Trading building to purchase wares from other allied tribes.")
            }
        },

        -- Small
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
            name = "europeans_lumberjacks_house_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Woodcutter's House
                purpose = pgettext("europeans_building", "Fells trees in the surrounding area and processes them into logs."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Woodcutter's House
                note = pgettext("europeans_building", "The woodcutter’s house needs trees to fell within the work area.")
            }
        },
        {
            name = "europeans_lumberjacks_house_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Lumberjack's House
                purpose = pgettext("europeans_building", "Fells trees in the surrounding area and processes them into logs."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Lumberjack's House
                note = pgettext("europeans_building", "The lumberjack’s house needs trees to fell within the work area.")
            }
        },
        {
            name = "europeans_tree_nursery_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Ranger's Hut
                purpose = pgettext("europeans_building", "Plants trees in the surrounding area."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Ranger's Hut
                note = pgettext("europeans_building", "The ranger’s hut needs free space within the work area to plant the trees."),
            }
        },
        {
            name = "europeans_tree_nursery_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Forester's House
                purpose = pgettext("europeans_building", "Plants trees in the surrounding area."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Forester's House
                note = pgettext("europeans_building", "The forester’s house needs free space within the work area to plant the trees.")
            }
        },
        {
            name = "europeans_tree_nursery_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Forester's House
                purpose = pgettext("europeans_building", "Plants trees in the surrounding area."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Forester's House
                note = pgettext("europeans_building", "The forester’s house needs free space within the work area to plant the trees.")
            }
        },
        {
            name = "europeans_farm_small_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Small Farm
                purpose = pgettext("europeans_building", "Digs up mud from the ground and uses water to turn it into clay. Then plant reed in the holes created.")
            }
        },
        {
            name = "europeans_farm_small_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Small Farm
                purpose = pgettext("europeans_building", "Digs up mud from the ground and uses water to turn it into clay. Then plant reed and cotton in the holes created.")
            }
        },
        {
            name = "europeans_farm_small_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Small Farm
                purpose = pgettext("europeans_building", "Digs up mud from the ground and uses water to turn it into clay. Then plant reed, cotton and rubber trees in the holes created.")
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
            name = "europeans_quarry_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Quarry
                purpose = pgettext("europeans_building", "Cuts blocks of granite out of rocks in the vicinity."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Quarry
                note = pgettext("europeans_building", "The quarry needs rocks to cut within the work area.")
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
            name = "europeans_scouts_house_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Scout's House
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
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Well
                purpose = pgettext("europeans_building", "Draws water out of the deep.")
            }
        },
        {
            name = "europeans_well_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Well
                purpose = pgettext("europeans_building", "Draws water out of the deep.")
            }
        },
        {
            name = "europeans_well_level_6",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Big Well
                purpose = pgettext("europeans_building", "Draws water out of the deep.")
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
            name = "europeans_weaving_mill_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Weaving Mill
                purpose = pgettext("europeans_building", "Weaves cloth for buildings and ships’ sails, and armor to equip and train the soldiers.")
            }
        },
        {
            name = "europeans_weaving_mill_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Weaving Mill
                purpose = pgettext("europeans_building", "Weaves cloth and armor out of cotton and reed.")
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
            name = "europeans_sawmill_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Sawmill
                purpose = pgettext("europeans_building", "Hardening log to produce blackwood and saws log to produce planks.")
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
                purpose = pgettext("europeans_building", "Burns logs into charcoal.")
            }
        },
        {
            name = "europeans_charcoal_kiln_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Charcoal Kiln
                purpose = pgettext("europeans_building", "Burns logs into charcoal.")
            }
        },
        {
            name = "europeans_charcoal_kiln_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Charcoal Kiln
                purpose = pgettext("europeans_building", "Burns logs into charcoal.")
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
            name = "europeans_stonemasons_house_normal",
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
                purpose = pgettext("europeans_building", "Smelts ore into iron.")
            }
        },
        {
            name = "europeans_smelting_works_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Smelting Works
                purpose = pgettext("europeans_building", "Smelts ore into iron and gold.")
            }
        },
        {
            name = "europeans_smelting_works_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Smelting Works
                purpose = pgettext("europeans_building", "Smelts ore into iron and gold. Recycles scrap metal.")
            }
        },
        {
            name = "europeans_toolsmithy_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Toolsmithy
                purpose = pgettext("europeans_building", "Medium factory that produces tools from simple raw materials.")
            }
        },
        {
            name = "europeans_toolsmithy_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Toolsmithy
                purpose = pgettext("europeans_building", "Medium factory that produces tools from simple raw materials.")
            }
        },
        {
            name = "europeans_toolsmithy_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Toolsmithy
                purpose = pgettext("europeans_building", "Medium factory that produces tools from simple raw materials.")
            }
        },
        {
            name = "europeans_tailors_house_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Tailors_house
                purpose = pgettext("europeans_building", "Medium factory that produces armor and clothing from simple raw materials.")
            }
        },
        {
            name = "europeans_tailors_house_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Tailors_house
                purpose = pgettext("europeans_building", "Medium factory that produces armor and clothing from simple raw materials.")
            }
        },
        {
            name = "europeans_tailors_house_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Tailors_house
                purpose = pgettext("europeans_building", "Medium factory that produces armor and clothing from simple raw materials.")
            }
        },
        {
            name = "europeans_shoemakers_house_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Shoemakers_house
                purpose = pgettext("europeans_building", "Medium factory that produces boots from simple raw materials.")
            }
        },
        {
            name = "europeans_shoemakers_house_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Shoemakers_house
                purpose = pgettext("europeans_building", "Medium factory that produces boots from simple raw materials.")
            }
        },
        {
            name = "europeans_shoemakers_house_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Shoemakers_house
                purpose = pgettext("europeans_building", "Medium factory that produces boots from simple raw materials.")
            }
        },
        {
            name = "europeans_weaponsmithy_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Weaponsmithy
                purpose = pgettext("europeans_building", "Medium factory that produces weapons from simple raw materials.")
            }
        },
        {
            name = "europeans_weaponsmithy_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Weaponsmithy
                purpose = pgettext("europeans_building", "Medium factory that produces weapons from simple raw materials.")
            }
        },
        {
            name = "europeans_weaponsmithy_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Weaponsmithy
                purpose = pgettext("europeans_building", "Medium factory that produces weapons from simple raw materials.")
            }
        },

        -- Big
        {
            name = "europeans_manufactory_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Big Manufactory
                purpose = pgettext("europeans_building", "Large factory that produces complex wares such as tools, weapons, armor, clothing, shoes or building materials from simple raw materials.")
            }
        },
        {
            name = "europeans_manufactory_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Big Manufactory
                purpose = pgettext("europeans_building", "Large factory that produces complex wares such as tools, weapons, armor, clothing, shoes or building materials from simple raw materials.")
            }
        },
        {
            name = "europeans_manufactory_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Big Manufactory
                purpose = pgettext("europeans_building", "Large factory that produces complex wares such as tools, weapons, armor, clothing, shoes or building materials from simple raw materials.")
            }
        },

        -- Mines
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
            name = "europeans_coalmine_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Coal Mine
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
            name = "europeans_ironmine_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Iron Mine
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
        {
            name = "europeans_goldmine_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Gold Mine
                purpose = pgettext("europeans_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },

        -- Training Sites
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
            name = "europeans_trainingscamp_normal",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Normal Training Camp, part 1
                    pgettext("europeans_building", "Trains recruits to soldiers."),
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Normal Training Camp, part 2
                    pgettext("europeans_building", "Equips the recruits with all necessary armor parts and weapons.")
                },
            }
        },
        {
            name = "europeans_trainingscamp_advanced",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Advanced Training Camp, part 1
                    pgettext("europeans_building", "Trains recruits to soldiers."),
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Advanced Training Camp, part 2
                    pgettext("europeans_building", "Equips the recruits with all necessary armor parts and weapons.")
                },
            }
        },
        {
            name = "europeans_battlearena_basic",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Battle Arena
                note = pgettext("europeans_building", "Trains soldiers in ‘Evade’, ‘Health’ and ‘Attack’."),
            }
        },
        {
            name = "europeans_battlearena_level_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Trainingcamp, part 1
                    pgettext("europeans_building", "Trains soldiers in ‘Evade’, ‘Health’, ‘Attack’ and in ‘Defense’."),
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Trainingcamp, part 2
                    pgettext("europeans_building", "‘Evade’ increases the soldier’s chance not to be hit by the enemy and so to remain totally unaffected.")
                },
            }
        },
        {
            name = "europeans_battlearena_level_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Arena, part 1
                    pgettext("europeans_building", "Trains soldiers in ‘Evade’, ‘Health’, ‘Attack’ and in ‘Defense’."),
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Arena, part 2
                    pgettext("europeans_building", "‘Evade’ increases the soldier’s chance not to be hit by the enemy and so to remain totally unaffected.")
                },
            }
        },
        {
            name = "europeans_battlearena_level_3",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Colosseum, part 1
                    pgettext("europeans_building", "Trains soldiers in ‘Evade’, ‘Health’, ‘Attack’ and in ‘Defense’."),
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Colosseum, part 2
                    pgettext("europeans_building", "‘Evade’ increases the soldier’s chance not to be hit by the enemy and so to remain totally unaffected.")
                },
            }
        },

        -- Military Sites
        {
            name = "europeans_guardhouse",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Guardhouse
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Blockhouse
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_tower_small",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Small Tower
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Blockhouse
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_sentry",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Sentry
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Sentry
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_barrier",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Barrier
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Barrier
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_outpost",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Outpost
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Outpost
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_advanced_barrier",
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
            name = "europeans_tower_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: High Tower
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Tower
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_tower_level_3",
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
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Castle
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
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Castle
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Fortress
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_castle_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Fortress
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Fortress
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_castle_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Castle
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Fortress
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },

        -- Seafaring/Ferry Sites - these are only displayed on seafaring/ferry maps
        {
            name = "europeans_ferry_yard_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Ferry Yard
                purpose = pgettext("europeans_building", "Builds ferries."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Ferry Yard
                note = pgettext("europeans_building", "Needs water nearby.")
            }
        },
        {
            name = "europeans_ferry_yard_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Ferry Yard
                purpose = pgettext("europeans_building", "Builds ferries."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Ferry Yard
                note = pgettext("europeans_building", "Needs water nearby.")
            }
        },
        {
            name = "europeans_ferry_yard_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Ferry Yard
                purpose = pgettext("europeans_building", "Builds ferries."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Ferry Yard
                note = pgettext("europeans_building", "Needs water nearby.")
            }
        },
        {
            name = "europeans_shipyard_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Shipyard
                purpose = pgettext("europeans_building", "Constructs ships that are used for overseas colonization and for trading between ports.")
            }
        },
        {
            name = "europeans_shipyard_normal",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Shipyard
                purpose = pgettext("europeans_building", "Constructs ships that are used for overseas colonization and for trading between ports.")
            }
        },
        {
            name = "europeans_shipyard_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Shipyard
                purpose = pgettext("europeans_building", "Constructs ships that are used for overseas colonization and for trading between ports.")
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
        -- Europeans capital cities or big cities with more than 500.000 people
        pgettext("warehousename", "Amsterdam"),
        pgettext("warehousename", "Andorra la Vella"),
        pgettext("warehousename", "Antwerpen"),
        pgettext("warehousename", "Astrachan"),
        pgettext("warehousename", "Athen"),
        pgettext("warehousename", "Balaschicha"),
        pgettext("warehousename", "Barcelona"),
        pgettext("warehousename", "Beograd"),
        pgettext("warehousename", "Berlin"),
        pgettext("warehousename", "Bern"),
        pgettext("warehousename", "Birmingham"),
        pgettext("warehousename", "Bradford"),
        pgettext("warehousename", "Bremen"),
        pgettext("warehousename", "Bruxelles"),
        pgettext("warehousename", "București"),
        pgettext("warehousename", "Budapest"),
        pgettext("warehousename", "Charkiw"),
        pgettext("warehousename", "Chișinău"),
        pgettext("warehousename", "Den Haag"),
        pgettext("warehousename", "Dnipro"),
        pgettext("warehousename", "Donezk"),
        pgettext("warehousename", "Dortmund"),
        pgettext("warehousename", "Dresden"),
        pgettext("warehousename", "Dublin"),
        pgettext("warehousename", "Duisburg"),
        pgettext("warehousename", "Düsseldorf"),
        pgettext("warehousename", "Edinburgh"),
        pgettext("warehousename", "Essen"),
        pgettext("warehousename", "Frankfurt am Main"),
        pgettext("warehousename", "Genova"),
        pgettext("warehousename", "Glasgow"),
        pgettext("warehousename", "Göteborg"),
        pgettext("warehousename", "Hamburg"),
        pgettext("warehousename", "Hannover"),
        pgettext("warehousename", "Helsinki"),
        pgettext("warehousename", "Homel"),
        pgettext("warehousename", "Ischewsk"),
        pgettext("warehousename", "Istanbul"),
        pgettext("warehousename", "Jaroslawl"),
        pgettext("warehousename", "Kasan"),
        pgettext("warehousename", "Kirow"),
        pgettext("warehousename", "København"),
        pgettext("warehousename", "Köln"),
        pgettext("warehousename", "Kraków"),
        pgettext("warehousename", "Krasnodar"),
        pgettext("warehousename", "Krywyj Rih"),
        pgettext("warehousename", "Kyiv"),
        pgettext("warehousename", "Leeds"),
        pgettext("warehousename", "Leipzig"),
        pgettext("warehousename", "Lipezk"),
        pgettext("warehousename", "Lisboa"),
        pgettext("warehousename", "Ljubljana"),
        pgettext("warehousename", "Łódź"),
        pgettext("warehousename", "London"),
        pgettext("warehousename", "Luxemburg"),
        pgettext("warehousename", "Lwiw"),
        pgettext("warehousename", "Lyon"),
        pgettext("warehousename", "Machatschkala"),
        pgettext("warehousename", "Madrid"),
        pgettext("warehousename", "Málaga"),
        pgettext("warehousename", "Manchester"),
        pgettext("warehousename", "Marseille"),
        pgettext("warehousename", "Milano"),
        pgettext("warehousename", "Minsk"),
        pgettext("warehousename", "Monaco"),
        pgettext("warehousename", "Moskwa"),
        pgettext("warehousename", "München"),
        pgettext("warehousename", "Nabereschnyje Tschelny"),
        pgettext("warehousename", "Napoli"),
        pgettext("warehousename", "Nikosia"),
        pgettext("warehousename", "Nischni Nowgorod"),
        pgettext("warehousename", "Nürnberg"),
        pgettext("warehousename", "Odessa"),
        pgettext("warehousename", "Orenburg"),
        pgettext("warehousename", "Oslo"),
        pgettext("warehousename", "Palermo"),
        pgettext("warehousename", "Paris"),
        pgettext("warehousename", "Pensa"),
        pgettext("warehousename", "Perm"),
        pgettext("warehousename", "Podgorica"),
        pgettext("warehousename", "Poznań"),
        pgettext("warehousename", "Praha"),
        pgettext("warehousename", "Prishtina"),
        pgettext("warehousename", "Reykjavík"),
        pgettext("warehousename", "Rīga"),
        pgettext("warehousename", "Rjasan"),
        pgettext("warehousename", "Roma"),
        pgettext("warehousename", "Rostow-na-Donu"),
        pgettext("warehousename", "Rotterdam"),
        pgettext("warehousename", "San Marino"),
        pgettext("warehousename", "Samara"),
        pgettext("warehousename", "Sankt Petersburg"),
        pgettext("warehousename", "Saporischschja"),
        pgettext("warehousename", "Sarajevo"),
        pgettext("warehousename", "Saratow"),
        pgettext("warehousename", "Sevilla"),
        pgettext("warehousename", "Sheffield"),
        pgettext("warehousename", "Skopje"),
        pgettext("warehousename", "Sofia"),
        pgettext("warehousename", "Stockholm"),
        pgettext("warehousename", "Stuttgart"),
        pgettext("warehousename", "Tallinn"),
        pgettext("warehousename", "Tirana"),
        pgettext("warehousename", "Toljatti"),
        pgettext("warehousename", "Torino"),
        pgettext("warehousename", "Ufa"),
        pgettext("warehousename", "Uljanowsk"),
        pgettext("warehousename", "Vaduz"),
        pgettext("warehousename", "Valencia"),
        pgettext("warehousename", "Valletta"),
        pgettext("warehousename", "Vilnius"),
        pgettext("warehousename", "Warszawa"),
        pgettext("warehousename", "Wien"),
        pgettext("warehousename", "Wolgograd"),
        pgettext("warehousename", "Woronesch"),
        pgettext("warehousename", "Wrocław"),
        pgettext("warehousename", "Zagreb"),
        pgettext("warehousename", "Zaragoza"),
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
    -- carriers = {"europeans_carrier_1", "europeans_carrier_ox", "europeans_carrier_2", "europeans_carrier_donkey", "europeans_carrier_3", "europeans_carrier_horse", "europeans_carrier_reindeer"},
    carriers = {"europeans_carrier_1", "europeans_carrier_2", "europeans_carrier_3",},
    geologist = "europeans_geologist",
    scouts_house = "europeans_scouts_house_basic",
    soldier = "europeans_soldier",
    ship = "europeans_ship",
    ferry = "europeans_ferry",
    port = "europeans_port",
    
   fastplace = {
      warehouse = "europeans_warehouse",
      port = "europeans_port",
      training_small = "europeans_battlearena_basic",
      training_large = "europeans_battlearena_level_2",
      military_small_primary = "europeans_guardhouse",
      military_small_secondary = "europeans_sentry",
      military_medium_primary = "europeans_barrier",
      military_medium_secondary = "europeans_outpost",
      military_tower = "europeans_tower_basic",
      military_fortress = "europeans_castle_basic",
      well = "europeans_well_basic",
      woodcutter = "europeans_lumberjacks_house_basic",
      forester = "europeans_tree_nursery_basic",
      quarry = "europeans_quarry_basic",
      mine_stone = "europeans_quarry_basic",
      building_materials_primary = "europeans_lumberjacks_house_basic",
      building_materials_secondary = "europeans_sawmill_basic",
      building_materials_tertiary = "europeans_stonemasons_house_basic",
      charcoal = "europeans_charcoal_kiln_basic",
      weaving_mill = "europeans_weaving_mill_basic",
      farm_primary = "europeans_farm_small_basic",
      farm_secondary = "europeans_farm_small_normal",
      farm_tertiary = "europeans_farm_small_advanced",
      agriculture_producer = "europeans_farm_small_basic",
      mine_coal = "europeans_coalmine_basic",
      mine_iron = "europeans_ironmine_basic",
      mine_gold = "europeans_goldmine_basic",
      smelting = "europeans_smelting_works_basic",
      tool_manufactory = "europeans_toolsmithy_basic",
      weapon_manufactory = "europeans_weaponsmithy_basic",
      armor_manufactory = "europeans_tailors_house_basic",
      boots_manufactory = "europeans_shoemakers_house_basic",
      big_manufactory = "europeans_manufactory_basic",
      shipyard = "europeans_shipyard_basic",
      ferry_yard = "europeans_ferry_yard_basic",
      scout = "europeans_scouts_house_basic",
      barracks = "europeans_trainingscamp_basic",
      industry_supporter = "europeans_smelting_works_basic",
      industry_alternative = "europeans_charcoal_kiln_basic",
   },
}

pop_textdomain()
