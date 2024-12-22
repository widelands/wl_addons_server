descriptions = wl.Descriptions()

image_dirname = path.dirname(__file__) .. "images/"

push_textdomain("europeans_military_extension.wad", true)

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
        { ware = "meat", points = 1 },
        { ware = "fish", points = 1 },
        { ware = "bread", points = 2 },
        { ware = "honey_bread", points = 2 },
        { ware = "biscuit", points = 2 },
        { ware = "beer", points = 2 },
        { ware = "mead", points = 2 },
        { ware = "beer_strong", points = 2 },
        { ware = "wine", points = 2 },
        { ware = "armor", points = 2 },
        { ware = "quartz", points = 2 },
        { ware = "diamond", points = 2 },
        { ware = "metal_alloy", points = 2 },
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
                name = "wool",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Wool
                    purpose = pgettext("europeans_ware", "Wool is the hair of sheep. Weaving mills use it to make armor. Animal farms with level 4 or 5 can produce wool.")
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
                default_target_quantity = 16,
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
                name = "leather",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Wool
                    purpose = pgettext("europeans_ware", "The animal farm produces leather, which is used as a raw material for making boots.")
                }
            },
        },
        {
            -- Building Materials 3 (Stone and Clay)
            {
                name = "granite",
                default_target_quantity = 32,
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
        },
        {
            -- Building Materials 4 (Mining)
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
            -- Metal Economy 
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
                default_target_quantity = 1,
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
            }
        },
        {
            -- Food 1
            {
                name = "rye",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Rye, part 1
                        pgettext("europeans_ware", "Rye is essential for survival."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Rye, part 2
                        pgettext("europeans_ware", "Rye is produced by farms and used by mills to produce mixed flour.")
                    }
                }
            },
            {
                name = "wheat",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Europeans ware: Wheat, part 1
                        pgettext("europeans_ware", "Wheat is essential for survival."),
                        -- TRANSLATORS: Helptext for an Europeans ware: Wheat, part 2
                        pgettext("europeans_ware", "Wheat is produced by farms and used by mills to produce mixed flour.")
                    }
                }
            },
            {
                name = "barley",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans ware: Barley
                    purpose = pgettext("europeans_ware", "Barley is a slow-growing grain that is used for brewing beer or mead.")
                }
            },
            {
                name = "corn",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Corn
                    purpose = pgettext("europeans_ware", "Advanced farms need to be provided with corn to feed the farm animals.")
                }
            },
            {
                name = "blackroot",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Blackroot
                    purpose = pgettext("europeans_ware", "Blackroots are a special kind of root. Advanced farms need to be provided with blackroot.")
                }
            },
            {
                name = "honey",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans ware: Honey
                    purpose = pgettext("europeans_ware", "Honey is produced by bees belonging to a farm. It is used to brew mead.")
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
                name = "grape",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Grape
                    purpose = pgettext("europeans_ware", "These grapes are the base for a tasty wine. They are harvested in a advanced farm and processed in a winery.")
                }
            },
            {
                name = "meat",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Meat, part 1
                    purpose = pgettext("europeans_ware", "Meat contains a lot of energy, and it is produced in animal farms. Miners consume meat.")
                }
            },
            {
                name = "fish",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Fish
                    purpose = pgettext("europeans_ware", "Fish is one of the biggest food resources of the Europeans, and it is produced in animal farms. Miners consume fish.")
                }
            },
        },
        {
            -- Food 2
            {
                name = "flour",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Flour
                    purpose = pgettext("europeans_ware", "Mixed flour is produced by the mill out of rye and wheat and is needed in the bakery to produce bread.")
                }
            },
            {
                name = "bread",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans ware: Bread
                    purpose = pgettext("europeans_ware", "Bread are produced in a bakery out of water and flour. Basic miners consume bread.")
                }
            },
            {
                name = "honey_bread",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans ware: Honey Bread
                    purpose = pgettext("europeans_ware", "Honey Bread are produced in a bakery out of water, honey and flour. Normal miners consume honey bread.")
                }
            },
            {
                name = "biscuit",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans ware: Biscuit
                    purpose = pgettext("europeans_ware", "Biscuits are produced in a bakery out of water, flour, honey and fruits. Advanced miners consume biscuit.")
                }
            },
            {
                name = "beer",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Beer
                    purpose = pgettext("europeans_ware", "This beer is produced in a brewery out of barley and water. Basic miners consume beer.")
                }
            },
            {
                name = "mead",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans ware: Mead
                    purpose = pgettext("europeans_ware", "Mead is produced by breweries out of water, barley and honey. Normal miners consume mead.")
                }
            },
            {
                name = "beer_strong",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Beer
                    purpose = pgettext("europeans_ware", "This strong beer is produced in a brewery out of barley and water. Advanced miners consume strong beer.")
                }
            },
            {
                name = "wine",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Wine
                    purpose = pgettext("europeans_ware", "It is produced in a winery out of grape. Advanced miners consume wine.")
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
                    purpose = pgettext("europeans_ware", "This is a advanced spear with a steel tip. It is produced in a manufactory and used in a battle arena to train soldiers in attack.")
                }
            },
            {
                name = "ax_broad",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Broad Ax
                    purpose = pgettext("europeans_ware", "This is an broad ax. It is produced in a manufactory and used in a battle arena to train soldiers in attack.")
                }
            },
            {
                name = "sword_broad",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Broad Sword
                    purpose = pgettext("europeans_ware", "This is a broad sword. It is produced in the advanced manufactory and used in a battle arena to train soldiers in attack.")
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
                    purpose = pgettext("europeans_ware", "The mask is the medium defense tool of a soldier. It is produced in a manufactory and used in a battle arena to train soldiers in defense.")
                }
            },
            {
                name = "shield_steel",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Steel Shield
                    purpose = pgettext("europeans_ware", "This steel shield is produced in a manufactory and used in a battle arena to train soldiers in defense.")
                }
            },
            {
                name = "shield_advanced",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans ware: Advanced Shield
                    purpose = pgettext("europeans_ware", "These advanced shields are used by the best soldiers of the Europeans. They are produced in the advanced manufactory and used in the advanced battle arena to train soldiers in defense.")
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
                default_target_quantity = 16,
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
                name = "europeans_forester_basic",
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
        },
        {
            -- Agriculture workers
            {
                name = "europeans_farmer_basic",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Farmer
                    purpose = pgettext("europeans_worker", "Plants and harvests fields.")
                }
            },
            {
                name = "europeans_farmer_advanced",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Farmer
                    purpose = pgettext("europeans_worker", "Plants and harvests fields.")
                }
            },
            {
                name = "europeans_hunter_basic",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Hunter
                    purpose = pgettext("europeans_worker", "The hunter brings fresh, raw meat to the colonists.")
                }
            },
            {
                name = "europeans_gamekeeper",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Gamekeeper
                    purpose = pgettext("europeans_worker", "The gamekeeper makes sure that the natural population of animals never drops too low.")
                }
            },
            {
                name = "europeans_fisher_basic",
                default_target_quantity = 1,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Fisher
                    purpose = pgettext("europeans_worker", "The fisher fishes delicious fish out of rivers, lakes or the ocean.")
                }
            },
            {
                name = "europeans_fishbreeder",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Fishbreeder
                    purpose = pgettext("europeans_worker", "Breeds fish in nearby waters.")
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
            },
            {
                name = "europeans_terraformer_basic",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Terraformer
                    purpose = pgettext("europeans_worker", "Terraforms desert and coast into fertile soil.")
                }
            },
            {
                name = "europeans_terraformer_advanced",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Europeans worker: Terraformer
                    purpose = pgettext("europeans_worker", "Terraforms desert and coast into fertile soil.")
                }
            }
        },
        {
            -- Scouting and Trading
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
                name = "europeans_trainer_basic",
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
            name = "barleyfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: barley field
                purpose = _("This field has just been planted.")
            }
        },
        {
            name = "barleyfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: barley field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "barleyfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: barley field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "barleyfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: barley field
                purpose = _("This field is ready for harvesting.")
            }
        },
        {
            name = "barleyfield_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: barley field
                purpose = _("This field has been harvested.")
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
            name = "blackrootfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: blackroot field
                purpose = _("This field has just been planted.")
            }
        },
        {
            name = "blackrootfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: blackroot field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "blackrootfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: blackroot field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "blackrootfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: blackroot field
                purpose = _("This field is ready for harvesting.")
            }
        },
        {
            name = "blackrootfield_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: blackroot field
                purpose = _("This field has been harvested.")
            }
        },
        {
            name = "cornfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: corn field
                purpose = _("This field has just been planted.")
            }
        },
        {
            name = "cornfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: corn field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "cornfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: corn field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "cornfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: corn field
                purpose = _("This field is ready for harvesting.")
            }
        },
        {
            name = "cornfield_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: corn field
                purpose = _("This field has been harvested.")
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
            name = "ryefield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: rye field
                purpose = _("This field has just been planted.")
            }
        },
        {
            name = "ryefield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: rye field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "ryefield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: rye field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "ryefield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: rye field
                purpose = _("This field is ready for harvesting.")
            }
        },
        {
            name = "ryefield_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: rye field
                purpose = _("This field has been harvested.")
            }
        },
        {
            name = "wheatfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: Wheat field
                purpose = _("This field has just been planted.")
            }
        },
        {
            name = "wheatfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: Wheat field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "wheatfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: Wheat field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "wheatfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: Wheat field
                purpose = _("This field is ready for harvesting.")
            }
        },
        {
            name = "wheatfield_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable: Wheat field
                purpose = _("This field has been harvested.")
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
        {
            name = "rubber_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Rubber Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "rubber_black_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Rubber Tree
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "rubber_desert_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Corn Field
                purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
            }
        },
        {
            name = "rubber_winter_amazons_old",
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
            name = "europeans_warehouse",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Warehouse
                purpose = pgettext("europeans_building", "Your workers and soldiers will find shelter here. Also stores your wares and tools.")
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
            name = "europeans_quarry_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Quarry
                purpose = pgettext("europeans_building", "Cuts blocks of granite and marble out of rocks in the vicinity."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Quarry
                note = pgettext("europeans_building", "The quarry needs rocks to cut within the work area.")
            }
        },
        {
            name = "europeans_hunters_house_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Hunters Hut
                purpose = pgettext("europeans_building", "Hunts animals to produce meat."),
                -- TRANSLATORS: Purpose helptext for Europeans production site: Hunters Hut
                note = pgettext("europeans_building", "The hunter’s hut needs animals to hunt within the work area."),
            }
        },
        {
            name = "europeans_hunters_house_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Hunters House
                purpose = pgettext("europeans_building", "Releases animals into the wild to steady the meat production.")
            }
        },
        {
            name = "europeans_fishers_house_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Fishers Hut
                purpose = pgettext("europeans_building", "Fishes on the coast or in lakes near the fisher’s house."),
                note = {
                   -- TRANSLATORS: Note helptext for an Europeans production site: Fisher's House, part 1
                   pgettext("europeans_building", "The fisher’s house needs water full of fish within the work area."),
                   -- TRANSLATORS: Note helptext for an Europeans production site: Fisher's House, part 2
                   pgettext("europeans_building", "Roads and trees along the shoreline block fishing."),
                },
            }
        },
        {
            name = "europeans_fishers_house_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Fishers House
                purpose = pgettext("europeans_building", "Breeds and fishes fish."),
                note = {
                   -- TRANSLATORS: Note helptext for an Europeans production site: Fisher's House, part 1
                   pgettext("europeans_building", "The fisher’s house needs water within the work area."),
                   -- TRANSLATORS: Note helptext for an Europeans production site: Fisher's House, part 2
                   pgettext("europeans_building", "Roads and trees along the shoreline block breeding and fishing."),
                },
            }
        },
        {
            name = "europeans_terraformers_house_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Terraformer's Hut
                purpose = pgettext("building", "Terraforms deserts and coasts into fertile soil.")
            }
        },
        {
            name = "europeans_terraformers_house_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Terraformer's House
                purpose = pgettext("building", "Terraforms deserts and coasts into fertile soil.")
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
            name = "europeans_farm_medium_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Farm
                purpose = pgettext("europeans_building", "Sows and harvests reed."),
            }
        },
        {
            name = "europeans_farm_medium_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Advanced Farm
                purpose = pgettext("europeans_building", "Sows and harvests reed, cotton, grape and fruits."),
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
                purpose = pgettext("europeans_building", "Weaves cloth and armor out of cotton, wool and reed.")
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
            name = "europeans_smelting_works_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Smelting Works
                purpose = pgettext("europeans_building", "Smelts ore into iron and gold. Recycles scrap metal.")
            }
        },
        {
            name = "europeans_mill_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Mill
                purpose = pgettext("europeans_building", "Grinds corn to produce cornmeal.")
            }
        },
        {
            name = "europeans_mill_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Mill
                purpose = pgettext("europeans_building", "Grinds corn to produce cornmeal. Grinds wheat and rye to produce mixed flour.")
            }
        },
        {
            name = "europeans_bakery_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Bakery
                purpose = pgettext("building", "Prepares rations to feed the scouts and miners.")
            }
        },
        {
            name = "europeans_bakery_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Bakery
                purpose = pgettext("building", "Prepares rations, snacks and meals to feed all miners.")
            }
        },
        {
            name = "europeans_brewery_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Brewery
                purpose = pgettext("europeans_building", "Produces beer to keep the miners strong and happy.")
            }
        },
        {
            name = "europeans_brewery_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Brewery
                purpose = pgettext("europeans_building", "Produces beer, mead and strong_beer for trainingssites."),
            }
        },
        {
            name = "europeans_brewery_winery",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Winery
                purpose = pgettext("europeans_building", "Produces mead and wine.")
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
            name = "europeans_weaponsmithy_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Weaponsmithy
                purpose = pgettext("europeans_building", "Medium factory that produces weapons from simple raw materials.")
            }
        },


        -- Big
        {
            name = "europeans_farm_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Farm
                purpose = pgettext("europeans_building", "Sows and harvests corn, rye and wheat."),
            }
        },
        {
            name = "europeans_farm_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Advanced Farm
                purpose = pgettext("europeans_building", "Sows and harvests barley, blackroot, corn, fruit, grape, rye and wheat."),
            }
        },
        {
            name = "europeans_animal_farm_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Cattle Farm
                purpose = pgettext("europeans_building", "Breeds strong oxen for adding them to the transportation system. Additionally produces meat for food production and leather for shoemaker."),
            }
        },
        {
            name = "europeans_animal_farm_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Donkey Farm
                purpose = pgettext("europeans_building", "Breeds strong oxen and cute and helpful horses and donkeys for adding them to the transportation system. Additionally keeps sheep for wool production and produces leather, meat and fish.")
            }
        },
        {
            name = "europeans_manufactory_basic",
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
            name = "europeans_stonemine_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Granite Mine
                purpose = pgettext("europeans_building", "Digs granite, marble, quartz and diamond out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_stonemine_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Marble Mine
                purpose = pgettext("europeans_building", "Digs granite, marble, quartz and diamond out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_stonemine_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Deep Marble Mine
                purpose = pgettext("europeans_building", "Digs granite, marble, quartz and diamond out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_stonemine_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Crystal Mine
                purpose = pgettext("europeans_building", "Digs granite, marble, quartz and diamond out of the ground in mountain terrain.")
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
        -- Mines with Food
        {
            name = "europeans_food_stonemine_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Granite Mine
                purpose = pgettext("europeans_food_building", "Digs granite, marble, quartz and diamond out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_stonemine_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Marble Mine
                purpose = pgettext("europeans_food_building", "Digs granite, marble, quartz and diamond out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_stonemine_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Deep Marble Mine
                purpose = pgettext("europeans_food_building", "Digs granite, marble, quartz and diamond out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_stonemine_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Crystal Mine
                purpose = pgettext("europeans_food_building", "Digs granite, marble, quartz and diamond out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_coalmine_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Coal Mine
                purpose = pgettext("europeans_food_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_coalmine_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Deep Coal Mine
                purpose = pgettext("europeans_food_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_coalmine_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Deeper Coal Mine
                purpose = pgettext("europeans_food_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_coalmine_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Coal Mine
                purpose = pgettext("europeans_food_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_coalmine_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Deep Coal Mine
                purpose = pgettext("europeans_food_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_coalmine_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Coal Mine
                purpose = pgettext("europeans_food_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_ironmine_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Iron Mine
                purpose = pgettext("europeans_food_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_ironmine_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Deep Iron Mine
                purpose = pgettext("europeans_food_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_ironmine_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Deeper Iron Mine
                purpose = pgettext("europeans_food_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_ironmine_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Iron Mine
                purpose = pgettext("europeans_food_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_ironmine_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Deep Iron Mine
                purpose = pgettext("europeans_food_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_ironmine_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Iron Mine
                purpose = pgettext("europeans_food_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_goldmine_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Gold Mine
                purpose = pgettext("europeans_food_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_goldmine_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Deep Gold Mine
                purpose = pgettext("europeans_food_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_goldmine_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for production site: Deeper Gold Mine
                purpose = pgettext("europeans_food_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_goldmine_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Gold Mine
                purpose = pgettext("europeans_food_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_goldmine_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Deep Gold Mine
                purpose = pgettext("europeans_food_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_food_goldmine_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Gold Mine
                purpose = pgettext("europeans_food_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        -- Market
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
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Big Market
                purpose = pgettext("europeans_building", "Market building to sale processed products for coins.")
            }
        },
        {
            name = "europeans_store_small",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Small Store
                purpose = pgettext("europeans_building", "Store building to purchase wares from other allied tribes.")
            }
        },
        {
            name = "europeans_store_big",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans warehouse: Big Store
                purpose = pgettext("europeans_building", "Store building to purchase wares from other allied tribes.")
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
                note = pgettext("europeans_building", "Produces weapons and armor from basic materials and trains soldiers in ‘Evade’, ‘Health’ and ‘Attack’ with this tools."),
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
        {
            name = "europeans_training_center_health",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Dungeon
                note = pgettext("europeans_building", "Trains soldiers only in ‘Health’."),
            }
        },
        {
            name = "europeans_training_center_evade",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Trainingscamp
                note = pgettext("europeans_building", "Trains soldiers only in ‘Evade’."),
            }
        },
        {
            name = "europeans_training_center_defense",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Labyrinth
                note = pgettext("europeans_building", "Trains soldiers only in ‘Defense’."),
            }
        },
        {
            name = "europeans_training_center_attack",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Fitness Center
                note = pgettext("europeans_building", "Trains soldiers only in ‘Attack’."),
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
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Guardhouse
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Blockhouse
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_sentry_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Small Tower
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Blockhouse
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_sentry_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Sentry
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Sentry
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
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
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Guardhall
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Barrier
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_barrier_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans military site: Outpost
                purpose = pgettext("europeans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Europeans military site: Outpost
                note = pgettext("europeans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_barrier_level_3",
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
        pgettext("warehousename", "Andorra"),
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
        pgettext("warehousename", "Frankfurt"),
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
        pgettext("warehousename", "Napoli"),
        pgettext("warehousename", "Nikosia"),
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
    carriers = {"europeans_carrier_1", "europeans_carrier_2", "europeans_carrier_3", "europeans_carrier_ox", "europeans_carrier_donkey", "europeans_carrier_horse"},
    ferry = "europeans_ferry",
    geologist = "europeans_geologist",
    port = "europeans_port",
    scouts_house = "europeans_scouts_house_basic",
    ship = "europeans_ship",
    soldier = "europeans_soldier",
    
    fastplace = {
        warehouse = "europeans_warehouse",
        port = "europeans_port",
        barracks = "europeans_trainingscamp_basic",
        training_small = "europeans_training_center_health",
        training_large = "europeans_battlearena_basic",
        shipyard = "europeans_shipyard_basic",
        ferry_yard = "europeans_shipyard_advanced",
        scout = "europeans_scouts_house_basic",
        military_small_primary = "europeans_sentry_basic",
        military_small_secondary = "europeans_sentry_level_3",
        military_medium_primary = "europeans_barrier_basic",
        military_medium_secondary = "europeans_barrier_level_3",
        military_tower = "europeans_tower_basic",
        military_fortress = "europeans_castle_basic",
        military_castle = "europeans_castle_level_3",
        well = "europeans_well_basic",
        farm_primary = "europeans_farm_small_basic",
        woodcutter = "europeans_lumberjacks_house_basic",
        forester = "europeans_tree_nursery_basic",
        quarry = "europeans_quarry_basic",
        mine_stone = "europeans_stonemine_basic",
        mine_coal = "europeans_coalmine_basic",
        mine_iron = "europeans_ironmine_basic",
        mine_gold = "europeans_goldmine_basic",
        charcoal = "europeans_charcoal_kiln_basic",
        smelting = "europeans_smelting_works_basic",
        building_materials_primary = "europeans_weaving_mill_basic",
        building_materials_secondary = "europeans_sawmill_basic",
        building_materials_tertiary = "europeans_stonemasons_house_basic",
        weaving_mill = "europeans_weaving_mill_basic",
        fisher = "europeans_fishers_house_basic",
        hunter = "europeans_hunters_house_basic",
        fish_meat_replenisher = "europeans_animal_farm_advanced",
        farm_primary = "europeans_farm_medium_basic",
        farm_secondary = "europeans_farm_basic",
        farm_tertiary = "europeans_farm_advanced",
        agriculture_producer = "europeans_farm_advanced",
        agriculture_consumer_primary = "europeans_mill_basic",
        agriculture_consumer_secondary = "europeans_brewery_basic",
        mill = "europeans_mill_basic",
        bakery = "europeans_bakery_basic",
        brewery = "europeans_brewery_basic",
        second_carrier = "europeans_animal_farm_advanced",
        armor_manufactory = "europeans_tailors_house_basic",
        boots_manufactory = "europeans_shoemakers_house_basic",
        weapon_manufactory = "europeans_weaponsmithy_basic",
        big_manufactory = "europeans_manufactory_basic",
    },
}

pop_textdomain()
