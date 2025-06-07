descriptions = wl.Descriptions()

image_dirname = path.dirname(__file__) .. "images/"

push_textdomain("europeans_all.wad", true)

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
            [0] = "empire_resi_none",
        },
        resource_coal = {
            [10] = "empire_resi_coal_1",
            [20] = "empire_resi_coal_2",
        },
        resource_iron = {
            [10] = "empire_resi_iron_1",
            [20] = "empire_resi_iron_2",
        },
        resource_gold = {
            [10] = "empire_resi_gold_1",
            [20] = "empire_resi_gold_2",
        },
        resource_stones = {
            [10] = "empire_resi_stones_1",
            [20] = "empire_resi_stones_2",
        },
        resource_water = {
            [100] = "empire_resi_water",
        },
    },

    -- Wares positions in wares windows.
    -- This also gives us the information which wares the tribe uses.
    -- Each subtable is a column in the wares windows.
    wares_order = {
        {
            -- Building Materials 1 (Wood)
            {
                name = "log",
                default_target_quantity = 256,
                preciousness = 2,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Log, part 1
                        pgettext("ware", "Logs are an important basic building material. They are produced by felling trees."),
                        -- TRANSLATORS: Helptext for an Empire ware: Log, part 2
                        pgettext("empire_ware", "Imperial lumberjacks fell the trees; foresters take care of the supply of trees. Logs are also used by the charcoal kiln, the toolsmithy and the sawmill.")
                    }
                }
            },
            {
                name = "planks",
                default_target_quantity = 128,
                preciousness = 2,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Planks, part 1
                        pgettext("ware", "Planks are an important building material."),
                        -- TRANSLATORS: Helptext for an Empire ware: Planks, part 2
                        pgettext("empire_ware", "They are produced out of logs by the sawmill."),
                        -- TRANSLATORS: Helptext for an Empire ware: Planks, part 3
                        pgettext("empire_ware", "They are also used by the weapon smithy.")
                    }
                }
            },
            {
                name = "blackwood",
                default_target_quantity = 64,
                preciousness = 2,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Blackwood
                    purpose = pgettext("barbarians_ware", "This fire-hardened wood is as hard as iron and it is used for several buildings. It is produced out of logs in the wood hardener.")
                }
            },
            {
                name = "balsa",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Balsa
                        pgettext("amazons_ware", "Balsa wood is an important building material. It is also used to make light armor. Balsa trees are cut by an experienced woodcutter.")
                    }
                }
            },
            {
                name = "ironwood",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Ironwood
                        pgettext("amazons_ware", "This very hard wood is as hard as iron and it is used for several buildings, tools and weapons. It is cut by a very experienced woodcutter.")
                    }
                }
            },
            {
                name = "rubber",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Rubber
                        pgettext("amazons_ware", "Rubber is important for making warriors’ armor and shoes. Rubber trees are collected by experienced woodcutters.")
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
                        pgettext("europeans_ware", "Scrap wood is a waste material that arises from the demolition of buildings or from procession wood in sawmills."),
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
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Reed
                    purpose = pgettext("barbarians_ware", "Reed is produced in a reed yard and used to make the roofs of buildings waterproof.")
                }
            },
            {
                name = "liana",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Liana
                        pgettext("amazons_ware", "Lianas grow on trees. Very durable ropes are made out of them.")
                    }
                }
            },
            {
                name = "rope",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Rope
                        pgettext("amazons_ware", "This rope is made out of lianas. It is used for armor dresses and to construct buildings and ships.")
                    }
                }
            },
            {
                name = "cotton",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazons ware: Cotton, part 1
                        pgettext("amazons_ware", "Cotton is a raw material used to make clothing."),
                        -- TRANSLATORS: Helptext for an Amazons ware: Cotton, part 2
                        pgettext("amazons_ware", "It is produced by normal farms."),
                    }
                }
            },
            {
                name = "wool",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Wool
                    purpose = pgettext("empire_ware", "Wool is the hair of sheep. Weaving mills use it to make cloth.")
                }
            },
            {
                name = "fur",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Fur
                    purpose = pgettext("frisians_ware", "Fur is won from reindeer in a reindeer farm. It is woven into cloth or turned into fur garments for soldiers.")
                }
            },
            {
                name = "fur_garment_old",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Old Fur Garment
                    purpose = pgettext("frisians_ware", "Old garments can be turned into fur in a recycling center.")
                }
            },
            {
                name = "leather",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Frisian ware: Wool
                    purpose = pgettext("frisians_ware", "Leather is made out of fur, which is used as a raw material for making clothes.")
                }
            },
            {
                name = "cloth",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Cloth
                    purpose = pgettext("barbarians_ware", "Cloth is needed for Barbarian ships. It is produced out of reed.")
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
            -- Drinks (raw material and processed)
            {
                name = "water",
                default_target_quantity = 64,
                preciousness = 2,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Water, part 1
                        pgettext("ware", "Water is the essence of life!"),
                        -- TRANSLATORS: Helptext for an Empire ware: Water, part 2
                        pgettext("empire_ware", "Water is used in the bakery and the brewery. The donkey farm, the sheep farm and the piggery also need to be supplied with water.")
                    }
                }
            },
            {
                name = "beer",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Beer
                    purpose = pgettext("barbarians_ware", "Beer is produced in micro breweries and used in inns and big inns to produce snacks.")
                }
            },
            {
                name = "beer_strong",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Strong Beer
                    purpose = pgettext("barbarians_ware", "Only this beer is acceptable for the soldiers in a battle arena. Some say that the whole power of the Barbarians lies in this ale. It helps to train the soldiers’ evade level from 0 to 1 to 2. Strong beer is also used in big inns to prepare meals.")
                }
            },
            {
                name = "cocoa_beans",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Cocoa Beans
                        pgettext("amazons_ware", "Cocoa beans are gathered from cocoa trees by a cocoa farmer. They are used for producing chocolate.")
                    }
                }
            },
            {
                name = "chocolate",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Chocolate
                        pgettext("amazons_ware", "Chocolate is produced by chocolate breweries and used to train soldiers.")
                    }
                }
            },
            {
                name = "grape",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Grape
                    purpose = pgettext("empire_ware", "These grapes are the base for a tasty wine. They are harvested in a vineyard and processed in a winery.")
                }
            },
            {
                name = "wine",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Wine
                    purpose = pgettext("empire_ware", "This tasty wine is drunk by the miners working the marble and gold mines. It is produced in a winery.")
                }
            },
            {
                name = "honey",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Honey
                    purpose = pgettext("frisians_ware", "Honey is produced by bees belonging to a beekeeper. It is used to bake honey bread and brew mead.")
                }
            },
            {
                name = "mead",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Mead
                    purpose = pgettext("frisians_ware", "Mead is produced by mead breweries. Soldiers drink mead during advanced training.")
                }
            },
        },
        {
            -- Food (farming)
            {
                name = "wheat",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Wheat, part 1
                        pgettext("ware", "Wheat is essential for survival."),
                        -- TRANSLATORS: Helptext for an Empire ware: Wheat, part 2
                        pgettext("empire_ware", "Wheat is produced by farms and used by mills and breweries. Donkey farms, sheep farms and piggeries also need to be supplied with wheat.")
                    }
                }
            },
            {
                name = "rye",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: rye, part 1
                        pgettext("ware", "rye is essential for survival."),
                        -- TRANSLATORS: Helptext for an Empire ware: rye, part 2
                        pgettext("empire_ware", "rye is produced by farms and used by mills and breweries. Donkey farms, sheep farms and piggeries also need to be supplied with rye.")
                    }
                }
            },
            {
                name = "corn",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Corn
                    purpose = pgettext("atlanteans_ware", "This corn is processed in the mill into fine cornmeal that every Atlantean baker needs for a good bread. Also horse and spider farms need to be provided with corn.")
                }
            },
            {
                name = "blackroot",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Blackroot
                    purpose = pgettext("atlanteans_ware", "Blackroots are a special kind of root produced at blackroot farms and processed in mills. The Atlanteans like their strong taste and use their flour for making bread.")
                }
            },
            {
                name = "barley",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Barley
                    purpose = pgettext("frisians_ware", "Barley is a slow-growing grain that is used for baking bread and brewing beer. It is also eaten by reindeer.")
                }
            },
            {
                name = "oat",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: oat
                    purpose = pgettext("frisians_ware", "oat is a slow-growing grain that is used for baking bread and feeding animals.")
                }
            },
            {
                name = "cassavaroot",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Cassava Root
                        pgettext("amazons_ware", "Cassava roots are a special kind of root produced at cassava plantations. The Amazons like their strong taste for making bread and they also feed their tapirs with them.")
                    }
                }
            },
            {
                name = "fruit",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Fruit
                    purpose = pgettext("frisians_ware", "Fruit are berries gathered from berry bushes by a fruit collector. They are used for rations and for feeding the fish at the aqua farms.")
                }
            },
        },
        {
            -- Food (processed 1)
            {
                name = "flour",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Flour
                    purpose = pgettext("empire_ware", "Flour is produced by the mill out of wheat and is needed in the bakery to produce the tasty Empire bread.")
                }
            },
            {
                name = "rye_flour",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Flour
                    purpose = pgettext("empire_ware", "Rye flour is produced by the mill out of rye and is needed in the bakery to produce the tasty Empire bread.")
                }
            },
            {
                name = "cornmeal",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Cornmeal
                    purpose = pgettext("atlanteans_ware", "Cornmeal is produced in a mill out of corn and is one of three parts of the Atlantean bread produced in bakeries.")
                }
            },
            {
                name = "blackroot_flour",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Blackroot Flour
                    purpose = pgettext("atlanteans_ware", "Blackroot Flour is produced in mills out of blackroots. It is used in bakeries to make a tasty bread.")
                }
            },
            {
                name = "barley_flour",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Frisian ware: Barley Flour
                    purpose = pgettext("frisians_ware", "Barley flour is produced by the mill out of barley and is needed in the bakery to produce the tasty Frisian bread.")
                }
            },
            {
                name = "oat_flour",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Frisian ware: Oat Flour
                    purpose = pgettext("frisians_ware", "Oat flour is produced by the mill out of oat and is needed in the bakery to produce the tasty Frisian bread.")
                }
            },
            {
                name = "fish",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Fish
                    purpose = pgettext("empire_ware", "Besides bread and meat, fish is also a foodstuff for the Empire. Fish are used in taverns, inns and training sites (arena, colosseum, training camp).")
                }
            },
            {
                name = "smoked_fish",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Smoked Fish
                    purpose = pgettext("atlanteans_ware", "As no Atlantean likes raw fish, smoking it in a smokery is the most common way to make it edible.")
                }
            },
            {
                name = "meat",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Meat, part 1
                        pgettext("ware", "Meat contains a lot of energy, and it is obtained from wild game taken by hunters."),
                        -- TRANSLATORS: Helptext for an Empire ware: Meat, part 2
                        pgettext("empire_ware", "Meat can also be obtained as pork from piggeries. It is used in the inns and taverns to prepare lunch for the miners and is consumed at the training sites (arena, colosseum, training camp).")
                    }
                }
            },
            {
                name = "smoked_meat",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Smoked Meat
                    purpose = pgettext("atlanteans_ware", "Smoked meat is made out of meat in a smokery. It is delivered to the mines and training sites (labyrinth and dungeon) where the miners and soldiers prepare a nutritious lunch for themselves.")
                }
            },
        },
        {
            -- Food (processed 2)
            {
                name = "barbarians_bread",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Pitta Bread
                    purpose = pgettext("barbarians_ware", "The Barbarian bakers are best in making this flat and tasty pitta bread. It is made out of wheat and water following a secret recipe. Pitta bread is used in the taverns, inns and big inns to prepare rations, snacks and meals. It is also consumed at training sites (training camp and battle arena).")
                }
            },
            {
                name = "amazons_bread",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Bread
                        pgettext("amazons_ware", "This tasty bread is made in cassava root cookeries out of cassava root and water. It is the basic ingredient of a ration that is made by a food preserver. Soldiers like it too.")
                    }
                }
            },
            {
                name = "atlanteans_bread",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Bread
                    purpose = pgettext("atlanteans_ware", "This tasty bread is made in bakeries out of cornmeal, blackroot flour and water. It is appreciated as basic food by miners, scouts and soldiers in training sites (labyrinth and dungeon).")
                }
            },
            {
                name = "empire_bread",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Bread
                    purpose = pgettext("empire_ware", "The bakers of the Empire make really tasty bread out of flour and water. It is used in taverns and inns to prepare rations and meals. Bread is also consumed at the training sites (arena, colosseum, training camp).")
                }
            },
            {
                name = "bread_frisians",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Bread
                    purpose = pgettext("frisians_ware", "Bread is made out of barley and water and is used in the taverns to prepare rations. It is also consumed by training soldiers.")
                }
            },
            {
                name = "honey_bread",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Honey Bread
                    purpose = pgettext("frisians_ware", "This bread is sweetened with honey. It is consumed by the most experienced miners and in advanced soldier training.")
                }
            },
            {
                name = "ration",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Barbarian ware: Ration, part 1
                        pgettext("ware", "A small bite to keep miners strong and working. The scout also consumes rations on his scouting trips."),
                        -- TRANSLATORS: Helptext for a Barbarian ware: Ration, part 2
                        pgettext("barbarians_ware", "Rations are produced in a tavern, an inn or a big inn out of fish or meat or pitta bread.")
                    }
                }
            },
            {
                name = "snack",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Snack
                    purpose = pgettext("barbarians_ware", "A bigger morsel than the ration to provide miners in deep mines. It is produced in an inn or a big inn out of fish/meat and pitta bread.")
                }
            },
            {
                name = "meal",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Meal
                    purpose = pgettext("barbarians_ware", "A meal is made out of pitta bread and fish/meat in a big inn. This substantial food is exactly what workers in a deeper mine need.")
                }
            }
        },
        {
            -- Building Materials 3 (Stone, Clay and Marble)
            {
                name = "coal",
                default_target_quantity = 64,
                preciousness = 2,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Coal, part 1
                        pgettext("ware", "Coal is mined in coal mines or produced out of logs by a charcoal kiln."),
                        -- TRANSLATORS: Helptext for an Empire ware: Coal, part 2
                        pgettext("empire_ware", "The fires of the Empire smelting works, armor smithies and weapon smithies are usually fed with coal.")
                    }
                }
            },
            {
                name = "granite",
                default_target_quantity = 128,
                preciousness = 2,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Barbarian ware: Granite, part 1
                        pgettext("ware", "Granite is a basic building material."),
                        -- TRANSLATORS: Helptext for a Barbarian ware: Granite, part 2
                        pgettext("barbarians_ware", "The Barbarians produce granite blocks in quarries and granite mines.")
                    }
                }
            },
            {
                name = "grout",
                default_target_quantity = 32,
                preciousness = 2,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Grout
                    purpose = pgettext("barbarians_ware", "Granite can be processed into grout which provides a solid, non burning building material. Grout is produced in a lime kiln.")
                }
            },
            {
                name = "clay",
                default_target_quantity = 32,
                preciousness = 2,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Clay
                    purpose = pgettext("frisians_ware", "Clay is made out of water and mud to be turned into bricks, used in ship construction and to improve the charcoal kiln.")
                }
            },
            {
                name = "brick",
                default_target_quantity = 32,
                preciousness = 2,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Brick
                    purpose = pgettext("frisians_ware", "Bricks are the best and most important building material. They are made out of a mix of clay and granite dried in a coal fire.")
                }
            },
            {
                name = "marble",
                default_target_quantity = 32,
                preciousness = 2,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Marble
                    purpose = pgettext("empire_ware", "Marble is the beautiful stone which is cut out of the mountains or produced in a quarry. Marble is used as a building material and gets chiseled into marble columns in the stonemason’s house.")
                }
            },
            {
                name = "marble_column",
                default_target_quantity = 32,
                preciousness = 2,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Marble Column
                    purpose = pgettext("empire_ware", "Marble columns represent the high culture of the Empire, so they are needed for nearly every larger building. They are produced out of marble at a stonemason’s house.")
                }
            },
            {
                name = "quartz",
                default_target_quantity = 32,
                preciousness = 2,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Quartz
                    purpose = pgettext("atlanteans_ware", "These transparent quartz gems are used to build some exclusive buildings. They are produced in a crystal mine.")
                }
            },
            {
                name = "diamond",
                default_target_quantity = 32,
                preciousness = 2,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Diamond
                    purpose = pgettext("atlanteans_ware", "These wonderful diamonds are used to build some exclusive buildings. They are mined in a crystal mine.")
                }
            },
        },
        {
            -- Metal Economy and Trading
            {
                name = "iron_ore",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Iron Ore, part 1
                        pgettext("default_ware", "Iron ore is mined in iron mines."),
                        -- TRANSLATORS: Helptext for an Empire ware: Iron Ore, part 2
                        pgettext("empire_ware", "It is smelted in a smelting works to retrieve the iron.")
                    }
                }
            },
            {
                name = "scrap_iron",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Scrap Iron
                    purpose = pgettext("frisians_ware", "Discarded weapons and armor can be recycled in a recycling center to produce new tools, weapon and armor.")
                }
            },
            {
                name = "iron",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Iron, part 1
                        pgettext("ware", "Iron is smelted out of iron ores."),
                        -- TRANSLATORS: Helptext for an Empire ware: Iron, part 2
                        pgettext("empire_ware", "It is produced by the smelting works. Weapons, armor and tools are made of iron.")
                    }
                }
            },
            {
                name = "gold_ore",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Gold Ore, part 1
                        pgettext("ware", "Gold ore is mined in a gold mine."),
                        -- TRANSLATORS: Helptext for an Empire ware: Gold Ore, part 2
                        pgettext("empire_ware", "Smelted in a smelting works, it turns into gold which is used as a precious building material and to produce weapons and armor.")
                    }
                }
            },
            {
                name = "gold_dust",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Gold Dust, part 1
                        pgettext("amazons_ware", "Gold dust is washed in a gold digger dwelling."),
                        -- TRANSLATORS: Helptext for an Amazon ware: Gold Dust, part 2
                        pgettext("amazons_ware", "Smelted in a furnace, it turns into gold which is used as a precious building material and to produce armor.")
                    }
                }
            },
            {
                name = "scrap_metal_mixed",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Scrap metal (mixed)
                    purpose = pgettext("frisians_ware", "Discarded weapons and armor can be recycled in a recycling center to produce new tools, weapon and armor.")
                }
            },
            {
                name = "gold",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Gold, part 1
                        pgettext("ware", "Gold is the most valuable of all metals, and it is smelted out of gold ore."),
                        -- TRANSLATORS: Helptext for an Empire ware: Gold, part 2
                        pgettext("empire_ware", "It is produced by the smelting works. Armor and weapons are embellished with gold in the armor smithy and the weapon smithy.")
                    }
                }
            },
            {
                name = "gold_thread",
                default_target_quantity = 32,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Gold Thread
                    purpose = pgettext("atlanteans_ware", "This thread, made of gold by the gold spinning mill, is used for weaving the exclusive golden tabard in the weaving mill.")
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
            -- Tools (1)
            {
                name = "felling_ax",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Felling Ax, part 1
                        pgettext("ware", "The felling ax is the tool to chop down trees."),
                        -- TRANSLATORS: Helptext for an Empire ware: Felling Ax, part 2
                        pgettext("empire_ware", "Felling axes are used by lumberjacks and produced by the toolsmithy.")
                    }
                }
            },
            {
                name = "machete",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Machete
                        pgettext("amazons_ware", "The machete is the tool of the liana cutters."),
                    }
                }
            },
            {
                name = "saw",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Saw
                    purpose = pgettext("empire_ware", "This saw is needed by the carpenter. It is produced by the toolsmith.")
                }
            },
            {
                name = "pick",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Pick
                    purpose = pgettext("empire_ware", "Picks are used by stonemasons and miners. They are produced by the toolsmith.")
                }
            },
            {
                name = "shovel",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Shovel, part 1
                        pgettext("ware", "Shovels are needed for the proper handling of plants."),
                        -- TRANSLATORS: Helptext for an Empire ware: Shovel, part 2
                        pgettext("empire_ware", "Therefore the forester and the vine farmer use them. They are produced by the toolsmith.")
                    }
                }
            },
            {
                name = "scythe",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Scythe, part 1
                        pgettext("ware", "The scythe is the tool of the farmers."),
                        -- TRANSLATORS: Helptext for an Empire ware: Scythe, part 2
                        pgettext("empire_ware", "Scythes are produced by the toolsmith.")
                    }
                }
            },
            {
                name = "milking_tongs",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Milking Tongs
                    purpose = pgettext("atlanteans_ware", "Milking tongs are used by the spider breeder to milk the spiders. They are produced by the toolsmith.")
                }
            },
            {
                name = "fire_tongs",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Fire Tongs, part 1
                        pgettext("ware", "Fire tongs are the tools for smelting ores."),
                        -- TRANSLATORS: Helptext for an Empire ware: Fire Tongs, part 2
                        pgettext("empire_ware", "They are used in the smelting works and produced by the toolsmith.")
                    }
                }
            },
            {
                name = "hammer",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Hammer, part 1
                        pgettext("ware", "The hammer is an essential tool."),
                        -- TRANSLATORS: Helptext for an Empire ware: Hammer, part 2
                        pgettext("empire_ware", "Geologists, builders, weaponsmiths and armorsmiths all need a hammer. Make sure you’ve always got some in reserve! They are produced by the toolsmith.")
                    }
                }
            },
            {
                name = "chisel",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Chisel, part 1
                        pgettext("ware", "The chisel is an essential tool."),
                        -- TRANSLATORS: Helptext for an Amazon ware: Chisel, part 2
                        pgettext("amazons_ware", "Stone carvers need a chisel. Make sure you’ve always got some in reserve! They are produced by the stone carvers themselves.")
                    }
                }
            },
            {
                name = "needles",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Needles
                        pgettext("amazons_ware", "Needles are used by dressmakers to make dresses, boots and armor for the soldiers.")
                    }
                }
            },
        },
        {
            -- Tools (2)
            {
                name = "basket",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Basket
                    purpose = pgettext("empire_ware", "This basket is needed by the vine farmer for harvesting the grapes. It is produced by the toolsmith.")
                }
            },
            {
                name = "fishing_net",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Fishing Net
                    purpose = pgettext("atlanteans_ware", "The fishing net is used by the fisher and produced by the toolsmith.")
                }
            },
            {
                name = "fishing_rod",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for a Barbarian ware: Fishing Rod, part 1
                        pgettext("ware", "Fishing rods are needed by fishers to catch fish."),
                        -- TRANSLATORS: Helptext for a Barbarian ware: Fishing Rod, part 2
                        pgettext("barbarians_ware", "They are one of the basic tools produced in a metal workshop (but cease to be produced by the building if it is enhanced to an ax workshop and war mill).")
                    }
                }
            },
            {
                name = "buckets",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Buckets
                    purpose = pgettext("atlanteans_ware", "Big buckets for the fish breeder – produced by the toolsmith.")
                }
            },
            {
                name = "hunting_bow",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Hunting Bow
                    purpose = pgettext("atlanteans_ware", "This bow is used by the Atlantean hunter. It is produced by the toolsmith.")
                }
            },
            {
                name = "hunting_spear",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Hunting Spear, part 1
                        pgettext("ware", "This spear is light enough to be thrown, but heavy enough to kill any animal in one blow. It is only used by hunters."),
                        -- TRANSLATORS: Helptext for an Empire ware: Hunting Spear, part 2
                        pgettext("empire_ware", "They are produced by the toolsmith.")
                    }
                }
            },
            {
                name = "hook_pole",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Hook Pole
                    purpose = pgettext("atlanteans_ware", "This hook pole is used by the smoker to suspend all the meat and fish from the top of the smokery. It is created by the toolsmith.")
                }
            },
            {
                name = "bread_paddle",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Empire ware: Bread Paddle, part 1
                        pgettext("ware", "The bread paddle is the tool of the baker, each baker needs one."),
                        -- TRANSLATORS: Helptext for an Empire ware: Bread Paddle, part 2
                        pgettext("empire_ware", "Bread paddles are produced by the toolsmith.")
                    }
                }
            },
            {
                name = "kitchen_tools",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Kitchen Tools
                    purpose = pgettext("empire_ware", "Kitchen tools are needed for preparing rations and meals. They are produced in a toolsmithy and used in taverns and inns.")
                }
            },
            {
                name = "stone_bowl",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Stone Bowl
                        pgettext("amazons_ware", "Stone bowls are used to wash gold and to smelt gold dust.")
                    }
                }
            },
            {
                name = "firestones",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Firestones
                        pgettext("amazons_ware", "Firestones are used to light the fires of charcoal kilns and furnaces.")
                    }
                }
            },
        },
        {
            -- Weapons (1)
            {
                name = "trident_light",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Light Trident
                    purpose = pgettext("atlanteans_ware", "This is the basic weapon of the Atlantean soldiers. Together with a tabard, it makes up the equipment of young soldiers. Light tridents are produced in the weapon smithy as are all other tridents.")
                }
            },
            {
                name = "trident_long",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Long Trident
                    purpose = pgettext("atlanteans_ware", "The long trident is the first trident in the training of soldiers. It is produced in the weapon smithy and used in the dungeon – together with food – to train soldiers from attack level 0 to level 1.")
                }
            },
            {
                name = "trident_steel",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Steel Trident
                    purpose = pgettext("atlanteans_ware", "This is the medium trident. It is produced in the weapon smithy and used by advanced soldiers in the dungeon – together with food – to train from attack level 1 to level 2.")
                }
            },
            {
                name = "trident_double",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Double Trident
                    purpose = pgettext("atlanteans_ware", "The double trident is one of the best tridents produced by the Atlantean weapon smithy. It is used in a dungeon – together with food – to train soldiers from attack level 2 to level 3.")
                }
            },
            {
                name = "trident_heavy_double",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Heavy Double Trident
                    purpose = pgettext("atlanteans_ware", "This is the most dangerous weapon of the Atlantean military. Only the best of the best soldiers may use it. It is produced in the weapon smithy and used in the dungeon – together with food – to train soldiers from attack level 3 to level 4.")
                }
            },
            {
                name = "ax",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Ax
                    purpose = pgettext("barbarians_ware", "The ax is the basic weapon of the Barbarians. All young soldiers are equipped with it.")
                }
            },
            {
                name = "ax_sharp",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Sharp Ax
                    purpose = pgettext("barbarians_ware", "Young soldiers are proud to learn to fight with this powerful weapon. It is heavier and sharper than the ordinary ax. It is produced in ax workshops and war mills. In training camps, it is used – together with food – to train soldiers from attack level 0 to level 1.")
                }
            },
            {
                name = "ax_broad",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Broad Ax
                    purpose = pgettext("barbarians_ware", "The broad ax is produced by the ax workshop and the war mill. It is used in the training camp – together with food – to train soldiers with a fundamental fighting knowledge from attack level 1 to attack level 2.")
                }
            },
            {
                name = "ax_bronze",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Bronze Ax
                    purpose = pgettext("barbarians_ware", "The bronze ax is considered a weapon that is hard to handle. Only skilled soldiers can use it. It is produced at the war mill and used in the training camp – together with food – to train soldiers from attack level 2 to level 3.")
                }
            },
            {
                name = "ax_battle",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Battle Ax
                    purpose = pgettext("barbarians_ware", "This is a dangerous weapon the Barbarians are able to produce. It is produced in the war mill. Only trained soldiers are able to wield such a weapon. It is used – together with food – in the training camp to train soldiers from attack level 3 to 4.")
                }
            },
            {
                name = "ax_warriors",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Warrior’s Ax
                    purpose = pgettext("barbarians_ware", "The warrior’s ax is the most dangerous of all Barbarian weapons. Only a few soldiers ever were able to handle this huge and powerful ax. It is produced in a war mill and used – together with food – in a training camp to train soldiers from attack level 4 to level 5.")
                }
            },
        },
        {
            -- Weapons (2)
            {
                name = "spear_wooden",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Wooden Spear, part 1
                        pgettext("amazons_ware", "This spear is the basic weapon in the Amazon military system. It is produced by the stone carver. In combination with a tunic, it is the equipment to fit out young soldiers."),
                        -- TRANSLATORS: Helptext for an Amazon ware: Wooden Spear, part 2
                        pgettext("amazons_ware", "It is used by the Amazon hunter-gatherers as well.")
                    }
                }
            },
            {
                name = "spear",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Spear
                    purpose = pgettext("empire_ware", "This spear has an iron spike. It is produced in a weapon smithy and used in a training camp – together with food – to train soldiers from attack level 0 to attack level 1.")
                }
            },
            {
                name = "spear_stone_tipped",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Stone Tipped Spear
                        pgettext("amazons_ware", "This spear has a stone spike. It is produced in a stone workshop and used in a warriors’ gathering – together with food – to train soldiers from attack level 0 to attack level 1.")
                    }
                }
            },
            {
                name = "spear_hardened",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Hardened Spear
                        pgettext("amazons_ware", "This is a hardened spear with a stone tip. It is produced in a stone workshop and used in a warriors’ gathering – together with food – to train soldiers from attack level 1 to level 2.")
                    }
                }
            },
            {
                name = "spear_advanced",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Advanced Spear
                    purpose = pgettext("empire_ware", "This is an advanced spear with a steel tip. It is produced in a weapon smithy and used in a training camp – together with food – to train soldiers from attack level 1 to level 2.")
                }
            },
            {
                name = "spear_heavy",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Heavy Spear
                    purpose = pgettext("empire_ware", "This is a strong spear with a steel-tip and a little blade. It is produced in the weapon smithy and used in the training camp – together with food – train soldiers from attack level 2 to level 3.")
                }
            },
            {
                name = "spear_war",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: War Spear
                    purpose = pgettext("empire_ware", "This is the best and sharpest weapon the Empire weaponsmith creates for the soldiers. It is used in the training camp – together with food – to train soldiers from attack level 3 to level 4.")
                }
            },
            {
                name = "sword_short",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Short sword
                    purpose = pgettext("frisians_ware", "This is the basic weapon of the Frisian soldiers. Together with a fur garment, it makes up the equipment of young soldiers. Short swords are produced by the small armor smithy.")
                }
            },
            {
                name = "sword_long",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Long Sword
                    purpose = pgettext("frisians_ware", "The long sword is the weapon used by level 1 soldiers. Level 4 soldiers are equipped with a long and a double-edged sword.")
                }
            },
            {
                name = "sword_broad",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Broadsword
                    purpose = pgettext("frisians_ware", "The broadsword is the weapon used by level 2 soldiers. Level 5 soldiers are equipped with a broadsword and a double-edged sword.")
                }
            },
            {
                name = "sword_double",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Double-edged Sword
                    purpose = pgettext("frisians_ware", "The double-edged sword is the weapon used by level 3 soldiers. Level 6 soldiers are equipped with two of these ferocious swords.")
                }
            },
        },
        {
            -- Armor (1)
            {
                name = "boots_sturdy",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Sturdy Boots
                        pgettext("amazons_ware", "Sturdy boots are excellent footwear for soldiers to be quicker on their feet. They are produced by the dressmaker and used to train soldiers’ evade from level 0 to level 1.")
                    }
                }
            },
            {
                name = "boots_swift",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Swift Boots
                        pgettext("amazons_ware", "Swift boots are light and durable footwear for soldiers to be quicker on their feet. They are produced by the dressmaker and used to train soldiers’ evade from level 1 to level 2.")
                    }
                }
            },
            {
                name = "boots_hero",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Hero Boots
                        pgettext("amazons_ware", "Hero boots! The only suitable footwear for a real hero. They are produced by the dressmaker and used to train soldiers’ evade from level 2 to level 3.")
                    }
                }
            },
            {
                name = "helmet_wooden",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Wodden Helmet
                        pgettext ("amazons_ware", "A wooden helmet is a basic piece of equipment for protecting soldiers. It is produced by the dressmaker and used to train soldiers from health level 1 to level 2."),
                    }
                }
            },
            {
                name = "armor_helmet",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Helmet
                    purpose = pgettext("empire_ware", "The helmet is the basic defense of a soldier.")
                }
            },
            {
                name = "helmet",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Helmet
                    purpose = pgettext("barbarians_ware", "A helmet is a basic tool to protect soldiers.")
                }
            },
            {
                name = "helmet_mask",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Mask
                    purpose = pgettext("barbarians_ware", "A mask is an enhanced armor for Barbarian soldiers. It is produced in the helm smithy and used in the training camp – together with food – to train soldiers from health level 1 to level 2.")
                }
            },
            {
                name = "shield_steel",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Steel Shield
                    purpose = pgettext("atlanteans_ware", "This steel shield is produced in the armor smithy and used in the labyrinth – together with food – to train soldiers from defense level 0 to level 1.")
                }
            },
            {
                name = "helmet_golden",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Golden Helmet
                    purpose = pgettext("frisians_ware", "A golden helmet protects soldiers.")
                }
            },
            {
                name = "helmet_warhelm",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian ware: Warhelm
                    purpose = pgettext("barbarians_ware", "This is the most enhanced Barbarian armor.")
                }
            },
            {
                name = "shield_advanced",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Advanced Shield
                    purpose = pgettext("atlanteans_ware", "These advanced shields are used by the best soldiers of the Atlanteans. They are produced in the armor smithy and used in the labyrinth – together with food – to train soldiers from defense level 1 to level 2.")
                }
            },
        },
        {
            -- Armor (2)
            {
                name = "fur_garment",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Fur Garment
                    purpose = pgettext("frisians_ware", "Fur can be sewn into garments. They are used as basic armor.")
                }
            },
            {
                name = "tabard",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Tabard
                    purpose = pgettext("atlanteans_ware", "A tabard and a light trident are the basic equipment for young soldiers.")
                }
            },
            {
                name = "tunic",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Tunic
                        pgettext("amazons_ware", "Rubber can be bound into a tunic, which is used as basic armor. All new soldiers are clothed in a tunic.")
                    }
                }
            },
            {
                name = "armor_wooden",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Wooden Armor
                        pgettext("amazons_ware", "This light wooden armor is a basic piece of armor.")
                    }
                }
            },
            {
                name = "armor",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Armor
                    purpose = pgettext("empire_ware", "Basic armor for Empire soldiers.")
                }
            },
            {
                name = "fur_garment_studded",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Studded Fur Garment
                    purpose = pgettext("frisians_ware", "Ordinary fur garments can be decorated with iron to give them a silvery shine. These clothes make good armor.")
                }
            },
            {
                name = "vest_padded",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Padded Vest
                        pgettext("amazons_ware", "Padded vests are light but durable armor.")
                    }
                }
            },
            {
                name = "armor_chain",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Chain Armor
                    purpose = pgettext("empire_ware", "The chain armor is a medium armor for soldiers.")
                }
            },
            {
                name = "protector_padded",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Padded Protector
                        pgettext("amazons_ware", "Padded protectors are strong and durable armor.")
                    }
                }
            },
            {
                name = "armor_gilded",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire ware: Gilded Armor
                    purpose = pgettext("empire_ware", "The gilded armor is the strongest armor an soldier can have.")
                }
            },
            {
                name = "fur_garment_golden",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian ware: Golden Fur Garment
                    purpose = pgettext("frisians_ware", "Ordinary fur garments can be decorated with iron and gold. Such clothes are the best armor.")
                }
            },
            {
                name = "tabard_golden",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean ware: Golden Tabard
                    purpose = pgettext("atlanteans_ware", "Golden tabards are produced in weaving mills out of gold thread.")
                }
            },
            {
                name = "warriors_coat",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    purpose = {
                        -- TRANSLATORS: Helptext for an Amazon ware: Warrior's Coat
                        pgettext("amazons_ware", "Ordinary tunics can be decorated and reinforced with gold and wood chunks. Such tunics are the best armor.")
                    }
                }
            },
        },
    },
    -- Workers positions in workers windows.
    -- This also gives us the information which workers the tribe uses.
    -- Each subtable is a column in the workers windows.
    workers_order = {
        {
            -- Carriers
            {
                name = "europeans_carrier",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans worker: Builder
                    purpose = pgettext("europeans_worker", "Carries items along your roads.")
                }
            },
            {
                name = "barbarians_carrier",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Carrier
                    purpose = pgettext("barbarians_worker", "Carries items along your roads.")
                }
            },
            {
                name = "amazons_carrier",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Carrier
                    purpose = pgettext("amazons_worker", "Carries items along your roads.")
                }
            },
            {
                name = "atlanteans_carrier",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                   -- TRANSLATORS: Helptext for an Atlantean worker: Carrier
                   purpose = pgettext("atlanteans_worker", "Carries items along your roads.")
                }
            },
            {
                name = "empire_carrier",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Carrier
                    purpose = pgettext("empire_worker", "Carries items along your roads.")
                }
            },
            {
                name = "frisians_carrier",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Carrier
                    purpose = pgettext("frisians_worker", "Carries items along your roads.")
                }
            },
            {
                name = "barbarians_ox",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Ox
                    purpose = pgettext("barbarians_worker", "Oxen help to carry items along busy roads. They are reared in a cattle farm.")
                }
            },
            {
                name = "amazons_tapir",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Tapir
                    purpose = pgettext("amazons_worker", "Tapirs help to carry items along busy roads. They are reared in a tapir farm.")
                }
            },
            {
                name = "atlanteans_horse",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                   -- TRANSLATORS: Helptext for an Atlantean worker: Horse
                   purpose = pgettext("atlanteans_worker", "Horses help to carry items along busy roads. They are reared in a horse farm.")
                }
            },
            {
                name = "empire_donkey",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Donkey
                    purpose = pgettext("empire_worker", "Donkeys help to carry items along busy roads. They are reared in a donkey farm.")
                }
            },
            {
                name = "frisians_reindeer",
                default_target_quantity = 64,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Reindeer
                    purpose = pgettext("frisians_worker", "Reindeer help to carry items along busy roads. They are reared in a reindeer farm.")
                }
            },
            {
                name = "barbarians_ferry",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Ferry
                    purpose = pgettext("barbarians_worker", "Ships wares across narrow rivers.")
                }
            },
            {
                name = "amazons_ferry",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Ferry
                    purpose = pgettext("amazons_worker", "Ships wares across narrow rivers.")
                }
            },
            {
                name = "atlanteans_ferry",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Ferry
                    purpose = pgettext("atlanteans_worker", "Ships wares across narrow rivers.")
                }
            },
            {
                name = "empire_ferry",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Ferry
                    purpose = pgettext("empire_worker", "Ships wares across narrow rivers.")
                }
            },
            {
                name = "frisians_ferry",
                default_target_quantity = 2,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Ferry
                    purpose = pgettext("frisians_worker", "Ships wares across narrow rivers.")
                }
            },
        },
        {
            -- Builders
            {
                name = "europeans_builder",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans worker: Builder
                    purpose = pgettext("europeans_worker", "Works at construction sites to raise new buildings.")
                }
            },
            {
                name = "barbarians_builder",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Builder
                    purpose = pgettext("barbarians_worker", "Works at construction sites to raise new buildings.")
                }
            },
            {
                name = "amazons_builder",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Builder
                    purpose = pgettext("amazons_worker", "Works at construction sites to raise new buildings.")
                }
            },
            {
                name = "atlanteans_builder",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Builder
                    purpose = pgettext("atlanteans_worker", "Works at construction sites to raise new buildings.")
                }
            },
            {
                name = "empire_builder",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Builder
                    purpose = pgettext("empire_worker", "Works at construction sites to raise new buildings.")
                }
            },
            {
                name = "frisians_builder",
                default_target_quantity = 16,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Builder
                    purpose = pgettext("frisians_worker", "Works at construction sites to raise new buildings.")
                }
            },
            {
                name = "barbarians_shipwright",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Shipwright
                    purpose = pgettext("barbarians_worker", "Works at the shipyard and constructs new ships.")
                }
            },
            {
                name = "amazons_shipwright",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Shipwright
                    purpose = pgettext("amazons_worker", "Works at the shipyard and constructs new ships.")
                }
            },
            {
                name = "atlanteans_shipwright",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Shipwright
                    purpose = pgettext("atlanteans_worker", "Works at the shipyard and constructs new ships.")
                }
            },
            {
                name = "empire_shipwright",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Shipwright
                    purpose = pgettext("empire_worker", "Works at the shipyard and constructs new ships.")
                }
            },
            {
                name = "frisians_shipwright",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Shipwright
                    purpose = pgettext("frisians_worker", "Works at the shipyard and constructs new ships.")
                }
            },
        },
        {
            -- Special Workers
            {
                name = "europeans_geologist",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Europeans worker: Geologist
                    purpose = pgettext("europeans_worker", "Discovers resources for mining.")
                }
            },
            {
                name = "barbarians_geologist",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Geologist
                    purpose = pgettext("barbarians_worker", "Discovers resources for mining.")
                }
            },
            {
                name = "amazons_geologist",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Geologist
                    purpose = pgettext("amazons_worker", "Discovers resources for mining.")
                }
            },
            {
                name = "atlanteans_geologist",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Geologist
                    purpose = pgettext("atlanteans_worker", "Discovers resources for mining.")
                }
            },
            {
                name = "empire_geologist",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Geologist
                    purpose = pgettext("empire_worker", "Discovers resources for mining.")
                }
            },
            {
                name = "frisians_geologist",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Geologist
                    purpose = pgettext("frisians_worker", "Discovers resources for mining.")
                }
            },
            {
                name = "barbarians_scout",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Scout
                    purpose = pgettext("barbarians_worker", "Scouts like Scotty the scout scouting unscouted areas in a scouty fashion.")
                    -- (c) WiHack Team 02.01.2010
                }
            },
            {
                name = "amazons_scout",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Scout
                    purpose = pgettext("amazons_worker", "Explores unknown territory.")
                }
            },
            {
                name = "atlanteans_scout",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Scout
                    purpose = pgettext("atlanteans_worker", "Scouts like Scotty the scout scouting unscouted areas in a scouty fashion.")
                    -- (c) WiHack Team 02.01.2010
                }
            },
            {
                name = "empire_scout",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Scout
                    purpose = pgettext("empire_worker", "Scouts like Scotty the scout scouting unscouted areas in a scouty fashion.")
                    -- (c) WiHack Team 02.01.2010
                }
            },
            {
                name = "frisians_scout",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Scout
                    purpose = pgettext("frisians_worker", "Explores unknown territory.")
                }
            },
            {
                name = "atlanteans_trader",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Purpose helptext for an Atlantean worker: Trader
                    purpose = pgettext("atlanteans_worker", "Transports wares to share with other players."),
                    note = pgettext("atlanteans_worker", "A trader is a scout who needs a horse to transport the wares.")
                }
            },
        },
        {
            -- Building Materials (Wood)
            {
                name = "amazons_woodcutter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Woodcutter
                    purpose = pgettext("amazons_worker", "Fells trees.")
                }
            },
            {
                name = "amazons_woodcutter_master",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Master Woodcutter
                    purpose = pgettext("amazons_worker", "Harvests special trees: ironwood, rubber and balsa.")
                }
            },
            {
                name = "amazons_jungle_preserver",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Jungle Preserver
                    purpose = pgettext("amazons_worker", "Plants trees.")
                }
            },
            {
                name = "amazons_jungle_master",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Jungle Master
                    purpose = pgettext("amazons_worker", "Plants special trees: ironwood, rubber and balsa.")
                }
            },
            {
                name = "amazons_liana_cutter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Liana Cutter
                    purpose = pgettext("amazons_worker", "Cuts lianas from trees.")
                }
            },
            {
                name = "barbarians_lumberjack",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Lumberjack
                    purpose = pgettext("barbarians_worker", "Fells trees.")
                }
            },
            {
                name = "atlanteans_woodcutter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Woodcutter
                    purpose = pgettext("atlanteans_worker", "Fells trees.")
                }
            },
            {
                name = "empire_lumberjack",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Lumberjack
                    purpose = pgettext("empire_worker", "Fells trees.")
                }
            },
            {
                name = "frisians_woodcutter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Woodcutter
                    purpose = pgettext("frisians_worker", "Fells trees.")
                }
            },
            {
                name = "barbarians_ranger",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Ranger
                    purpose = pgettext("barbarians_worker", "Plants trees.")
                }
            },
            {
                name = "atlanteans_forester",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Forester
                    purpose = pgettext("atlanteans_worker", "Plants trees.")
                }
            },
            {
                name = "empire_forester",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Forester
                    purpose = pgettext("empire_worker", "Plants trees.")
                }
            },
            {
                name = "frisians_forester",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Forester
                    purpose = pgettext("frisians_worker", "Plants trees.")
                }
            },
            {
                name = "frisians_diker",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Purpose helptext for a Frisian worker: Diker
                    purpose = pgettext("frisians_worker", "Constructs breakwaters to gain new land from the sea.")
                }
            }
        },
        {
            -- Farmer
            {
                name = "barbarians_gardener",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Gardener
                    purpose = pgettext("barbarians_worker", "Plants and harvests reed fields.")
                }
            },
            {
                name = "barbarians_farmer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Farmer
                    purpose = pgettext("barbarians_worker", "Plants fields.")
                }
            },
            {
                name = "amazons_cassava_farmer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Cassava Farmer
                    purpose = pgettext("amazons_worker", "Grows cassava.")
                }
            },
            {
                name = "amazons_cocoa_farmer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Cocoa Farmer
                    purpose = pgettext("amazons_worker", "Grows cocoa.")
                }
            },
            {
                name = "atlanteans_farmer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Farmer
                    purpose = pgettext("atlanteans_worker", "Plants and harvests cornfields.")
                }
            },
            {
                name = "atlanteans_blackroot_farmer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Blackroot Farmer
                    purpose = pgettext("atlanteans_worker", "Plants and harvests blackroot.")
                }
            },
            {
                name = "empire_farmer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Farmer
                    purpose = pgettext("empire_worker", "Plants fields.")
                }
            },
            {
                name = "empire_vinefarmer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Vine Farmer
                    purpose = pgettext("empire_worker", "Grows grapevines.")
                }
            },
            {
                name = "frisians_reed_farmer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Gardener
                    purpose = pgettext("frisians_worker", "Plants and harvests reed fields.")
                }
            },
            {
                name = "frisians_farmer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Farmer
                    purpose = pgettext("frisians_worker", "Plants fields.")
                }
            },
            {
                name = "frisians_berry_farmer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Berry Farmer
                    purpose = pgettext("frisians_worker", "Plants berry bushes.")
                }
            },
            {
                name = "frisians_fruit_collector",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Fruit Collector
                    purpose = pgettext("frisians_worker", "Gathers berries.")
                }
            },
        },
        {
            -- Agriculture Workers (1)
            {
                name = "barbarians_cattlebreeder",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Cattle Breeder
                    purpose = pgettext("barbarians_worker", "Breeds strong oxen for adding them to the transportation system.")
                }
            },
            {
                name = "amazons_tapir_breeder",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Tapir Breeder
                    purpose = pgettext("amazons_worker", "Breeds tapirs for adding them to the transportation system.")
                }
            },
            {
                name = "atlanteans_spiderbreeder",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Spider Breeder
                    purpose = pgettext("atlanteans_worker", "Breeds spiders for silk.")
                }
            },
            {
                name = "atlanteans_horsebreeder",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Horse Breeder
                    purpose = pgettext("atlanteans_worker", "Breeds the strong Atlantean horses for adding them to the transportation system.")
                }
            },
            {
                name = "empire_donkeybreeder",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Donkey Breeder
                    purpose = pgettext("empire_worker", "Breeds cute and helpful donkeys for adding them to the transportation system.")
                }
            },
            {
                name = "empire_pigbreeder",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Pig Breeder
                    purpose = pgettext("empire_worker", "Breeds pigs.")
                }
            },
            {
                name = "empire_shepherd",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Shepherd
                    purpose = pgettext("empire_worker", "Keeping sheep.")
                }
            },
            {
                name = "frisians_beekeeper",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Beekeeper
                    purpose = pgettext("frisians_worker", "Lets bees swarm over flowers, then gathers the honey.")
                }
            },
            {
                name = "frisians_reindeer_breeder",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Reindeer Breeder
                    purpose = pgettext("frisians_worker", "Breeds reindeer as carriers and for their fur.")
                }
            }
        },
        {
            -- Agriculture Workers (2)
            {
                name = "barbarians_fisher",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Fisher
                    purpose = pgettext("barbarians_worker", "Catches fish in the sea.")
                }
            },
            {
                name = "atlanteans_fisher",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Fisher
                    purpose = pgettext("atlanteans_worker", "The fisher fishes delicious fish.")
                }
            },
            {
                name = "empire_fisher",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Fisher
                    purpose = pgettext("empire_worker", "Catches fish in the sea.")
                }
            },
            {
                name = "frisians_fisher",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Fisher
                    purpose = pgettext("frisians_worker", "Catches fish in the sea.")
                }
            },
            {
                name = "barbarians_hunter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Hunter
                    purpose = pgettext("barbarians_worker", "The hunter brings fresh, raw meat to the colonists.")
                }
            },
            {
                name = "amazons_hunter_gatherer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Hunter-Gatherer
                    purpose = pgettext("amazons_worker", "The hunter-gatherer gets fresh fish and raw meat for the tribe.")
                }
            },
            {
                name = "atlanteans_hunter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Hunter
                    purpose = pgettext("atlanteans_worker", "The hunter brings fresh, raw meat to the colonists.")
                }
            },
            {
                name = "empire_hunter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Hunter
                    purpose = pgettext("empire_worker", "The hunter brings fresh, raw meat to the colonists.")
                }
            },
            {
                name = "frisians_hunter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Hunter
                    purpose = pgettext("frisians_worker", "The hunter brings fresh, raw meat to the colonists.")
                }
            },
            {
                name = "barbarians_gamekeeper",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Gamekeeper
                    purpose = pgettext("barbarians_worker", "The gamekeeper makes sure that the natural population of animals never drops too low.")
                }
            },
            {
                name = "amazons_wilderness_keeper",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Wilderness Keeper
                    purpose = pgettext("amazons_worker", "Breeds game or fish.")
                }
            },
            {
                name = "atlanteans_fishbreeder",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Fish Breeder
                    purpose = pgettext("atlanteans_worker", "Breeds fish.")
                }
            },
        },
        {
            -- Food Production (1)
            {
                name = "atlanteans_miller",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Miller
                    purpose = pgettext("atlanteans_worker", "Grinds blackroots and corn to produce blackroot flour and cornmeal, respectively.")
                }
            },
            {
                name = "empire_miller",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Miller
                    purpose = pgettext("empire_worker", "Grinds wheat to produce flour.")
                }
            },
            {
                name = "barbarians_baker",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Baker
                    purpose = pgettext("barbarians_worker", "Bakes pitta bread for the miners, soldiers and scouts.")
                }
            },
            {
                name = "amazons_cook",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Cook
                    purpose = pgettext("amazons_worker", "Prepares rations, bakes cassava bread and brews chocolate.")
                }
            },
            {
                name = "atlanteans_baker",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Baker
                    purpose = pgettext("atlanteans_worker", "Bakes bread for workers.")
                }
            },
            {
                name = "empire_baker",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Baker
                    purpose = pgettext("empire_worker", "Bakes bread for workers.")
                }
            },
            {
                name = "frisians_baker",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Baker
                    purpose = pgettext("frisians_worker", "Bakes bread for miners and soldiers.")
                }
            },
            {
                name = "frisians_baker_master",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Master Baker
                    purpose = pgettext("frisians_worker", "This baker is skilled enough to bake bread sweetened with honey.")
                }
            },
        },
        {
            -- Food Production (2)
            {
                name = "barbarians_brewer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Brewer
                    purpose = pgettext("barbarians_worker", "Produces beer to keep the miners strong and happy.")
                }
            },
            {
                name = "barbarians_brewer_master",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Master Brewer
                    purpose = pgettext("barbarians_worker", "Produces the finest ales to keep soldiers strong and happy in training.")
                }
            },
            {
                name = "empire_brewer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Brewer
                    purpose = pgettext("empire_worker", "Produces beer.")
                }
            },
            {
                name = "empire_vintner",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Vintner
                    purpose = pgettext("empire_worker", "Produces wine.")
                }
            },
            {
                name = "frisians_brewer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Brewer
                    purpose = pgettext("frisians_worker", "Brews beer.")
                }
            },
            {
                name = "frisians_brewer_master",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Master Brewer
                    purpose = pgettext("frisians_worker", "Brews beer and mead.")
                }
            },
            {
                name = "atlanteans_smoker",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Smoker
                    purpose = pgettext("atlanteans_worker", "Smokes meat and fish.")
                }
            },
            {
                name = "frisians_smoker",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Smoker
                    purpose = pgettext("frisians_worker", "Refines meat and fish by smoking them.")
                }
            },
            {
                name = "barbarians_innkeeper",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Innkeeper
                    purpose = pgettext("barbarians_worker", "Produces food for miners.")
                }
            },
            {
                name = "empire_innkeeper",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Innkeeper
                    purpose = pgettext("empire_worker", "Produces food for miners.")
                }
            },
            {
                name = "frisians_landlady",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Landlady
                    purpose = pgettext("frisians_worker", "Prepares rations and meals for miners and scouts.")
                }
            }
        },
        {
            -- Building Materials (Quarrying and Mining)
            {
                name = "barbarians_stonemason",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Stonemason
                    purpose = pgettext("barbarians_worker", "Cuts raw pieces of granite out of rocks in the vicinity.")
                }
            },
            {
                name = "amazons_stonecutter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Stonecutter
                    purpose = pgettext("amazons_worker", "Cuts blocks of granite out of rocks in the vicinity or mines granite and quartz in stone mines.")
                }
            },
            {
                name = "atlanteans_stonecutter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Stonecutter
                    purpose = pgettext("atlanteans_worker", "Cuts blocks of granite out of rocks in the vicinity.")
                }
            },
            {
                name = "empire_stonemason",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Stonemason
                    purpose = pgettext("empire_worker", "Cuts blocks of granite and marble out of rocks in the vicinity.")
                }
            },
            {
                name = "frisians_stonemason",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Stonemason
                    purpose = pgettext("frisians_worker", "Cuts raw pieces of granite out of rocks in the vicinity.")
                }
            },
            {
                name = "frisians_claydigger",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Clay Digger
                    purpose = pgettext("frisians_worker", "Makes clay out of mud and water.")
                }
            },
            {
                name = "amazons_gold_digger",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Gold Digger
                    purpose = pgettext("amazons_worker", "Works hard in the gold dwellings in mountains to obtain gold by washing it from gravel.")
                }
            },
            {
                name = "barbarians_miner",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Miner
                    purpose = pgettext("barbarians_worker", "Works deep in the mines to obtain coal, iron, gold or granite.")
                }
            },
            {
                name = "barbarians_miner_chief",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Chief Miner
                    purpose = pgettext("barbarians_worker", "Works deep in the mines to obtain coal, iron, gold or granite.")
                }
            },
            {
                name = "barbarians_miner_master",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Master Miner
                    purpose = pgettext("barbarians_worker", "Works deep in the mines to obtain coal, iron, gold or granite.")
                }
            },
            {
                name = "atlanteans_miner",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Miner
                    purpose = pgettext("atlanteans_worker", "Works deep in the mines to obtain coal, iron, gold or precious stones.")
                }
            },
            {
                name = "empire_miner",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Miner
                    purpose = pgettext("empire_worker", "Works deep in the mines to obtain coal, iron, gold or marble.")
                }
            },
            {
                name = "empire_miner_master",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Master Miner
                    purpose = pgettext("empire_worker", "Works deep in the mines to obtain coal, iron, gold or marble.")
                }
            },
            {
                name = "frisians_miner",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Miner
                    purpose = pgettext("frisians_worker", "Works deep in the mines to obtain coal, iron, gold or granite.")
                }
            },
            {
                name = "frisians_miner_master",
                default_target_quantity = 8,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Master Miner
                    purpose = pgettext("frisians_worker", "Works deep in the mines to obtain coal, iron, gold or granite.")
                }
            },
        },
        {
            -- Craft Workers (1)
            {
                name = "atlanteans_sawyer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Sawyer
                    purpose = pgettext("atlanteans_worker", "Saws logs to produce planks.")
                }
            },
            {
                name = "empire_carpenter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Carpenter
                    purpose = pgettext("empire_worker", "Works in the sawmill.")
                }
            },
            {
                name = "barbarians_charcoal_burner",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Charcoal Burner
                    purpose = pgettext("barbarians_worker", "Burns coal.")
                }
            },
            {
                name = "amazons_charcoal_burner",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Charcoal Burner
                    purpose = pgettext("amazons_worker", "Burns logs to produce charcoal.")
                }
            },
            {
                name = "atlanteans_charcoal_burner",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Charcoal Burner
                    purpose = pgettext("atlanteans_worker", "Burns coal.")
                }
            },
            {
                name = "empire_charcoal_burner",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Charcoal Burner
                    purpose = pgettext("empire_worker", "Burns coal.")
                }
            },
            {
                name = "frisians_charcoal_burner",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Charcoal Burner
                    purpose = pgettext("frisians_worker", "Burns logs and clay to produce coal.")
                }
            },
            {
                name = "barbarians_lime_burner",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Lime-Burner
                    purpose = pgettext("barbarians_worker", "Mixes grout out of granite, water and coal in the lime kiln.")
                }
            },
            {
                name = "frisians_brickmaker",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Brickmaker
                    purpose = pgettext("frisians_worker", "Burns bricks out of clay and granite.")
                }
            },
            {
                name = "barbarians_smelter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Smelter
                    purpose = pgettext("barbarians_worker", "Smelts ores into metal.")
                }
            },
            {
                name = "amazons_gold_smelter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Gold Smelter
                    purpose = pgettext("amazons_worker", "Smelts gold at furnaces.")
                }
            },
            {
                name = "atlanteans_smelter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Smelter
                    purpose = pgettext("atlanteans_worker", "Smelts ores into metal.")
                }
            },
            {
                name = "empire_smelter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Smelter
                    purpose = pgettext("empire_worker", "Smelts ores into metal.")
                }
            },
            {
                name = "frisians_smelter",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Smelter
                    purpose = pgettext("frisians_worker", "Smelts iron and gold at furnaces or recycling centers.")
                }
            },
        },
        {
            -- Craft Workers (2)
            {
                name = "barbarians_weaver",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Weaver
                    purpose = pgettext("barbarians_worker", "Produces cloth for ships’ sails.")
                }
            },
            {
                name = "amazons_dressmaker",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Dressmaker
                    purpose = pgettext("amazons_worker", "Produces all kinds of dresses, boots and armor.")
                }
            },
            {
                name = "atlanteans_weaver",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Weaver
                    purpose = pgettext("atlanteans_worker", "Produces spidercloth for buildings, ships and soldiers.")
                }
            },
            {
                name = "empire_weaver",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Weaver
                    purpose = pgettext("empire_worker", "Produces cloth for ships and soldiers.")
                }
            },
            {
                name = "frisians_seamstress",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Seamstress
                    purpose = pgettext("frisians_worker", "Produces cloth and sews fur garments.")
                }
            },
            {
                name = "frisians_seamstress_master",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Master Seamstress
                    purpose = pgettext("frisians_worker", "Sews armor out of fur garments and metal.")
                }
            },
        },
        {
            -- Smiths
            {
                name = "barbarians_blacksmith",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Blacksmith
                    purpose = pgettext("barbarians_worker", "Produces weapons for soldiers and tools for workers.")
                }
            },
            {
                name = "barbarians_blacksmith_master",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Master Blacksmith
                    purpose = pgettext("barbarians_worker", "Produces weapons for soldiers and tools for workers.")
                }
            },
            {
                name = "barbarians_helmsmith",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Helmsmith
                    purpose = pgettext("barbarians_worker", "Forges helmets for soldiers.")
                }
            },
            {
                name = "amazons_stone_carver",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Stone Carver
                    purpose = pgettext("amazons_worker", "Produces spears for soldiers and tools for workers.")
                }
            },
            {
                name = "atlanteans_toolsmith",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Toolsmith
                    purpose = pgettext("atlanteans_worker", "Produces tools for the workers.")
                }
            },
            {
                name = "atlanteans_armorsmith",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Armorsmith
                    purpose = pgettext("atlanteans_worker", "Produces armor for the soldiers.")
                }
            },
            {
                name = "atlanteans_weaponsmith",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Weaponsmith
                    purpose = pgettext("atlanteans_worker", "Produces weapons for the soldiers.")
                }
            },
            {
                name = "empire_toolsmith",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Toolsmith
                    purpose = pgettext("empire_worker", "Produces tools for the workers.")
                }
            },
            {
                name = "empire_armorsmith",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Armorsmith
                    purpose = pgettext("empire_worker", "Produces armor for the soldiers.")
                }
            },
            {
                name = "empire_weaponsmith",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Weaponsmith
                    purpose = pgettext("empire_worker", "Produces weapons for the soldiers.")
                }
            },
            {
                name = "frisians_blacksmith",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Blacksmith
                    purpose = pgettext("frisians_worker", "Produces weapons and armor for soldiers and tools for workers.")
                }
            },
            {
                name = "frisians_blacksmith_master",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Master Blacksmith
                    purpose = pgettext("frisians_worker", "Produces the best weapons and armor for soldiers and tools for workers.")
                }
            }
        },
        {
            -- Military
            {
                name = "barbarians_trainer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Trainer
                    purpose = pgettext("barbarians_worker", "Trains the soldiers.")
                }
            },
            {
                name = "amazons_trainer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Amazon worker: Trainer
                    purpose = pgettext("amazons_worker", "Trains the soldiers.")
                }
            },
            {
                name = "atlanteans_trainer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Trainer
                    purpose = pgettext("atlanteans_worker", "Trains the soldiers.")
                }
            },
            {
                name = "empire_trainer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Trainer
                    purpose = pgettext("empire_worker", "Trains the soldiers.")
                }
            },
            {
                name = "frisians_trainer",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Frisian worker: Trainer
                    purpose = pgettext("frisians_worker", "Trains the soldiers.")
                }
            },
            {
                name = "barbarians_recruit",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for a Barbarian worker: Recruit
                    purpose = pgettext("barbarians_worker", "Eager to become a soldier and defend his tribe!")
                }
            },
            {
                name = "atlanteans_recruit",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Atlantean worker: Recruit
                    purpose = pgettext("atlanteans_worker", "Eager to become a soldier and defend his tribe!")
                }
            },
            {
                name = "empire_recruit",
                default_target_quantity = 4,
                preciousness = 1,
                helptexts = {
                    -- TRANSLATORS: Helptext for an Empire worker: Recruit
                    purpose = pgettext("empire_worker", "Eager to become a soldier and defend his tribe!")
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
            name = "deadtree7",
            helptexts = {
                -- TRANSLATORS: Helptext for an Europeans immovable usable by Europeans: Dead Tree
                purpose = _("The remains of an old tree.")
            }
        },
        {
            name = "dike",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: Dike
                purpose = _("A breakwater erected by a diker to gain new land from the sea."),
                -- TRANSLATORS: Note helptext for a Frisian production site: Diker's House
                note = _("You can manually remove the dike when the land is sufficiently secured to prevent wasting resources. To do so, build a flag, road, or building in its place.")
            }
        },
        {
            name = "balsa_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Sapling
                purpose = _("This balsa tree has just been planted.")
            }
        },
        {
            name = "balsa_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Pole
                purpose = _("This balsa tree is growing.")
            }
        },
        {
            name = "balsa_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Mature
                purpose = _("This balsa tree is fully grown. Lianas can be gathered from it.")
            }
        },
        {
            name = "balsa_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Old
                purpose = _("This balsa tree is ready for harvesting balsa wood by a master woodcutter. Other tribes can harvest it for normal logs.")
            }
        },
        {
            name = "balsa_black_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Sapling
                purpose = _("This balsa tree has just been planted.")
            }
        },
        {
            name = "balsa_black_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Pole
                purpose = _("This balsa tree is growing.")
            }
        },
        {
            name = "balsa_black_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Mature
                purpose = _("This balsa tree is fully grown. Lianas can be gathered from it.")
            }
        },
        {
            name = "balsa_black_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Old
                purpose = _("This balsa tree is ready for harvesting balsa wood by a master woodcutter. Other tribes can harvest it for normal logs.")
            }
        },
        {
            name = "balsa_desert_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Sapling
                purpose = _("This balsa tree has just been planted.")
            }
        },
        {
            name = "balsa_desert_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Pole
                purpose = _("This balsa tree is growing.")
            }
        },
        {
            name = "balsa_desert_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Mature
                purpose = _("This balsa tree is fully grown. Lianas can be gathered from it.")
            }
        },
        {
            name = "balsa_desert_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Old
                purpose = _("This balsa tree is ready for harvesting balsa wood by a master woodcutter. Other tribes can harvest it for normal logs.")
            }
        },
        {
            name = "balsa_winter_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Sapling
                purpose = _("This balsa tree has just been planted.")
            }
        },
        {
            name = "balsa_winter_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Pole
                purpose = _("This balsa tree is growing.")
            }
        },
        {
            name = "balsa_winter_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Mature
                purpose = _("This balsa tree is fully grown. Lianas can be gathered from it.")
            }
        },
        {
            name = "balsa_winter_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Balsa Tree Old
                purpose = _("This balsa tree is ready for harvesting balsa wood by a master woodcutter. Other tribes can harvest it for normal logs.")
            }
        },
        {
            name = "berry_bush_blueberry_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_blueberry_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_blueberry_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it by a beekeeper.")
            }
        },
        {
            name = "berry_bush_blueberry_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_currant_red_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_currant_red_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_currant_red_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it by a beekeeper.")
            }
        },
        {
            name = "berry_bush_currant_red_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_juniper_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_juniper_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_juniper_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it by a beekeeper.")
            }
        },
        {
            name = "berry_bush_juniper_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_raspberry_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_raspberry_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_raspberry_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it by a beekeeper.")
            }
        },
        {
            name = "berry_bush_raspberry_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_currant_black_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_currant_black_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_currant_black_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it by a beekeeper.")
            }
        },
        {
            name = "berry_bush_currant_black_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_strawberry_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_strawberry_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_strawberry_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it by a beekeeper.")
            }
        },
        {
            name = "berry_bush_strawberry_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_stink_tree_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_stink_tree_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_stink_tree_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it by a beekeeper.")
            }
        },
        {
            name = "berry_bush_stink_tree_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_desert_hackberry_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_desert_hackberry_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_desert_hackberry_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it by a beekeeper.")
            }
        },
        {
            name = "berry_bush_desert_hackberry_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "berry_bush_sea_buckthorn_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush has just been planted.")
            }
        },
        {
            name = "berry_bush_sea_buckthorn_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is growing.")
            }
        },
        {
            name = "berry_bush_sea_buckthorn_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is flowering. Honey can be produced from it by a beekeeper.")
            }
        },
        {
            name = "berry_bush_sea_buckthorn_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: One of the berry bushes
                purpose = _("This berry bush is ready for harvesting.")
            }
        },
        {
            name = "barleyfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: Barley Field
                purpose = _("This field has just been planted.")
            }
        },
        {
            name = "barleyfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: Barley Field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "barleyfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: Barley Field
                purpose = _("This field is flowering. Honey can be produced from it by a beekeeper.")
            }
        },
        {
            name = "barleyfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: Barley Field
                purpose = _("This field is ready for harvesting.")
            }
        },
        {
            name = "barleyfield_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: Barley Field
                purpose = _("This field has been harvested.")
            }
        },
        {
            name = "blackrootfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for an Atlanteans immovable: blackroot field
                purpose = _("This field has just been planted.")
            }
        },
        {
            name = "blackrootfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for an Atlanteans immovable: blackroot field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "blackrootfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for an Atlanteans immovable: blackroot field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "blackrootfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for an Atlanteans immovable: blackroot field
                purpose = _("This field is ready for harvesting.")
            }
        },
        {
            name = "blackrootfield_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for an Atlanteans immovable: blackroot field
                purpose = _("This field has been harvested.")
            }
        },
        {
            name = "cassavafield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Cassava Field
                purpose = _("This field has just been planted.")
            }
        },
        {
            name = "cassavafield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Cassava Field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "cassavafield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Cassava Field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "cassavafield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Cassava Field
                purpose = _("This field is ready for harvesting.")
            }
        },
        {
            name = "cassavafield_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Cassava Field
                purpose = _("This field has been harvested.")
            }
        },
        {
            name = "cottonfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Cotton Field
                purpose = _("This field has just been planted.")
            }
        },
        {
            name = "cottonfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Cotton Field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "cottonfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Cotton Field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "cottonfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Cotton Field
                purpose = _("This field is ready for harvesting.")
            }
        },
        {
            name = "cocoa_tree_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Cocoa Tree Sapling
                purpose = _("This cocoa tree has just been planted.")
            }
        },
        {
            name = "cocoa_tree_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Cocoa Tree Pole
                purpose = _("This cocoa tree is growing.")
            }
        },
        {
            name = "cocoa_tree_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Cocoa Tree Mature
                purpose = _("This cocoa tree is fully grown.")
            }
        },
        {
            name = "cocoa_tree_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Cocoa Tree Old
                purpose = _("The beans on this cocoa tree are ready for harvesting.")
            }
        },
        {
            name = "cornfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for an Atlanteans immovable: corn field
                purpose = _("This field has just been planted.")
            }
        },
        {
            name = "cornfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for an Atlanteans immovable: corn field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "cornfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for an Atlanteans immovable: corn field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "cornfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for an Atlanteans immovable: corn field
                purpose = _("This field is ready for harvesting.")
            }
        },
        {
            name = "cornfield_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for an Atlanteans immovable: corn field
                purpose = _("This field has been harvested.")
            }
        },
        {
            name = "grapevine_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Grapevine
                purpose = _("This grapevine has just been planted.")
            }
        },
        {
            name = "grapevine_small",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Grapevine
                purpose = _("This grapevine is growing.")
            }
        },
        {
            name = "grapevine_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Grapevine
                purpose = _("This grapevine is growing.")
            }
        },
        {
            name = "grapevine_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Grapevine
                purpose = _("This grapevine is ready for harvesting.")
            }
        },
        {
            name = "ironwood_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Sapling
                purpose = _("This ironwood tree has just been planted.")
            }
        },
        {
            name = "ironwood_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Pole
                purpose = _("This ironwood tree is growing.")
            }
        },
        {
            name = "ironwood_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Mature
                purpose = _("This ironwood tree is fully grown. Lianas can be gathered from it.")
            }
        },
        {
            name = "ironwood_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Old
                purpose = _("This ironwood tree is ready for harvesting ironwood by a master woodcutter. Other tribes can harvest it for normal logs.")
            }
        },
        {
            name = "ironwood_black_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Sapling
                purpose = _("This ironwood tree has just been planted.")
            }
        },
        {
            name = "ironwood_black_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Pole
                purpose = _("This ironwood tree is growing.")
            }
        },
        {
            name = "ironwood_black_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Mature
                purpose = _("This ironwood tree is fully grown. Lianas can be gathered from it.")
            }
        },
        {
            name = "ironwood_black_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Old
                purpose = _("This ironwood tree is ready for harvesting ironwood by a master woodcutter. Other tribes can harvest it for normal logs.")
            }
        },
        {
            name = "ironwood_desert_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Sapling
                purpose = _("This ironwood tree has just been planted.")
            }
        },
        {
            name = "ironwood_desert_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Pole
                purpose = _("This ironwood tree is growing.")
            }
        },
        {
            name = "ironwood_desert_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Mature
                purpose = _("This ironwood tree is fully grown. Lianas can be gathered from it.")
            }
        },
        {
            name = "ironwood_desert_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Old
                purpose = _("This ironwood tree is ready for harvesting ironwood by a master woodcutter. Other tribes can harvest it for normal logs.")
            }
        },
        {
            name = "ironwood_winter_amazons_sapling",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Sapling
                purpose = _("This ironwood tree has just been planted.")
            }
        },
        {
            name = "ironwood_winter_amazons_pole",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Pole
                purpose = _("This ironwood tree is growing.")
            }
        },
        {
            name = "ironwood_winter_amazons_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Mature
                purpose = _("This ironwood tree is fully grown. Lianas can be gathered from it.")
            }
        },
        {
            name = "ironwood_winter_amazons_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ironwood Tree Old
                purpose = _("This ironwood tree is ready for harvesting ironwood by a master woodcutter. Other tribes can harvest it for normal logs.")
            }
        },
        {
            name = "oatfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: Oat Field
                purpose = _("This field has just been planted.")
            }
        },
        {
            name = "oatfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: Oat Field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "oatfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: Oat Field
                purpose = _("This field is flowering. Honey can be produced from it by a beekeeper.")
            }
        },
        {
            name = "oatfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: Oat Field
                purpose = _("This field is ready for harvesting.")
            }
        },
        {
            name = "oatfield_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: Oat Field
                purpose = _("This field has been harvested.")
            }
        },
        {
            name = "pond_dry",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Pond
                purpose = _("When claydiggers dig up earth, they leave holes in the ground. These holes vanish after a while. Aqua farms can use them as ponds to grow fish in them, whereas charcoal burners erect their charcoal stacks in them.")
            }
        },
        {
            name = "pond_growing",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Pond
                purpose = _("Fish are maturing in this pond. A fisher working from an aqua farm will be able to catch them when they are bigger.")
            }
        },
        {
            name = "pond_mature",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Pond
                purpose = _("Fish are living in this pond. A fisher working from an aqua farm can catch them as food.")
            }
        },
        {
            name = "pond_burning",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Pond
                purpose = _("A charcoal stack is burning in this earthen hole. When it has burnt down, a charcoal burner will be able to gather coal from it.")
            }
        },
        {
            name = "pond_coal",
            helptexts = {
                -- TRANSLATORS: Helptext for a Europeans immovable: Pond
                purpose = _("A charcoal stack, which had been erected in this earthen hole, is ready for a charcoal burner to gather coal from it.")
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
                -- TRANSLATORS: Helptext for a Barbarians immovable: Reed Field
                purpose = _("This reed field has just been planted.")
            }
        },
        {
            name = "reedfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for a Barbarians immovable: Reed Field
                purpose = _("This reed field is growing.")
            }
        },
        {
            name = "reedfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for a Barbarians immovable: Reed Field
                purpose = _("This reed field is flowering. Honey can be produced from it.")
            }
        },
        {
            name = "reedfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for a Barbarians immovable: Reed Field
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
            name = "ryefield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Rye field
                purpose = _("This field has just been planted.")
            }
        },
        {
            name = "ryefield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Rye field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "ryefield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Rye field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "ryefield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Rye field
                purpose = _("This field is ready for harvesting.")
            }
        },
        {
            name = "ryefield_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Rye field
                purpose = _("This field has been harvested.")
            }
        },
        {
            name = "wheatfield_tiny",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Wheat field
                purpose = _("This field has just been planted.")
            }
        },
        {
            name = "wheatfield_small",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Wheat field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "wheatfield_medium",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Wheat field
                purpose = _("This field is growing.")
            }
        },
        {
            name = "wheatfield_ripe",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Wheat field
                purpose = _("This field is ready for harvesting.")
            }
        },
        {
            name = "wheatfield_harvested",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Wheat field
                purpose = _("This field has been harvested.")
            }
        },
        {
            name = "empire_resi_none",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire resource indicator: No resources
                purpose = _("There are no resources in the ground here.")
            }
        },
        {
            name = "empire_resi_water",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire resource indicator: Water
                purpose = _("There is water in the ground here that can be pulled up by a well.")
            }
        },
        {
            name = "empire_resi_coal_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Coal, part 1
                    _("Coal veins contain coal that can be dug up by coal mines."),
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Coal, part 2
                    _("There is only a little bit of coal here.")
                }
            }
        },
        {
            name = "empire_resi_iron_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Iron, part 1
                    _("Iron veins contain iron ore that can be dug up by iron mines."),
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Iron, part 2
                    _("There is only a little bit of iron here.")
                }
            }
        },
        {
            name = "empire_resi_gold_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Gold, part 1
                    _("Gold veins contain gold ore that can be dug up by gold mines."),
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Gold, part 2
                    _("There is only a little bit of gold here.")
                }
            }
        },
        {
            name = "empire_resi_stones_1",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Stones, part 1
                    _("Marble is a basic building material and can be dug up by a marble mine. You will also get granite from the mine."),
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Stones, part 2
                    _("There is only a little bit of marble here.")
                }
            }
        },
        {
            name = "empire_resi_coal_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Coal, part 1
                    _("Coal veins contain coal that can be dug up by coal mines."),
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Coal, part 2
                    _("There is a lot of coal here.")
                }
            }
        },
        {
            name = "empire_resi_iron_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Iron, part 1
                    _("Iron veins contain iron ore that can be dug up by iron mines."),
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Iron, part 2
                    _("There is a lot of iron here.")
                }
            }
        },
        {
            name = "empire_resi_gold_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Gold, part 1
                    _("Gold veins contain gold ore that can be dug up by gold mines."),
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Gold, part 2
                    _("There is a lot of gold here.")
                }
            }
        },
        {
            name = "empire_resi_stones_2",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Stones, part 1
                    _("Marble is a basic building material and can be dug up by a marble mine. You will also get granite from the mine."),
                    -- TRANSLATORS: Helptext for an Empire resource indicator: Stones, part 2
                    _("There is a lot of marble here.")
                }
            }
        },
        {
            name = "europeans_amazons_shipconstruction",
            helptexts = {
                -- TRANSLATORS: Helptext for an Amazon immovable: Ship Under Construction
                purpose = _("A ship is being constructed at this site.")
            }
        },
        {
            name = "europeans_atlanteans_shipconstruction",
            helptexts = {
                -- TRANSLATORS: Helptext for an Atlantean immovable: Ship Under Construction
                purpose = _("A ship is being constructed at this site.")
            }
        },
        {
            name = "europeans_barbarians_shipconstruction",
            helptexts = {
                -- TRANSLATORS: Helptext for a Barbarian immovable: Ship Under Construction
                purpose = _("A ship is being constructed at this site.")
            }
        },
        {
            name = "europeans_empire_shipconstruction",
            helptexts = {
                -- TRANSLATORS: Helptext for an Empire immovable: Ship Under Construction
                purpose = _("A ship is being constructed at this site.")
            }
        },
        {
            name = "europeans_frisians_shipconstruction",
            helptexts = {
                -- TRANSLATORS: Helptext for a Frisian immovable: Ship Under Construction
                purpose = _("A ship is being constructed at this site.")
            }
        },
        -- non imperial Immovables used by the woodcutter
        {
            name = "balsa_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Balsa Tree
                purpose = _("This tree is only planted by the european and amazon tribes but can be harvested for balsa wood.")
            }
        },
        {
            name = "balsa_black_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Balsa Tree
                purpose = _("This tree is only planted by the european and amazon tribes but can be harvested for balsa wood.")
            }
        },
        {
            name = "balsa_desert_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Balsa Tree
                purpose = _("This tree is only planted by the european and amazon tribes but can be harvested for balsa wood.")
            }
        },
        {
            name = "balsa_winter_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Balsa Tree
                purpose = _("This tree is only planted by the european and amazon tribes but can be harvested for balsa wood.")
            }
        },
        {
            name = "ironwood_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Ironwood Tree
                purpose = _("This tree is only planted by the european and amazon tribes but can be harvested for ironwood.")
            }
        },
        {
            name = "ironwood_black_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Ironwood Tree
                purpose = _("This tree is only planted by the european and amazon tribes but can be harvested for ironwood.")
            }
        },
        {
            name = "ironwood_desert_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Ironwood Tree
                purpose = _("This tree is only planted by the european and amazon tribes but can be harvested for ironwood.")
            }
        },
        {
            name = "ironwood_winter_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Ironwood Tree
                purpose = _("This tree is only planted by the european and amazon tribes but can be harvested for ironwood.")
            }
        },
        {
            name = "liana_wasteland_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Liana Tree
                purpose = _("This tree is only planted by the european and amazon tribes but can be harvested for liana.")
            }
        },
        {
            name = "rubber_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Rubber Tree
                purpose = _("This tree is only planted by the european and amazon tribes but can be harvested for rubber.")
            }
        },
        {
            name = "rubber_black_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Rubber Tree
                purpose = _("This tree is only planted by the european and amazon tribes but can be harvested for rubber.")
            }
        },
        {
            name = "rubber_desert_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Corn Field
                purpose = _("This tree is only planted by the european and amazon tribes but can be harvested for rubber.")
            }
        },
        {
            name = "rubber_winter_old",
            helptexts = {
                -- TRANSLATORS: Helptext for an amazon immovable usable by Europeans: Rubber Tree
                purpose = _("This tree is only planted by the european and amazon tribes but can be harvested for rubber.")
            }
        },
    },

    -- The order here also determines the order in lists on screen.
    buildings = {
        -- Warehouses
        {
            name = "europeans_amazons_headquarters",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Amazon warehouse: Headquarters
                purpose = pgettext("amazons_building", "Accommodation for your people. Also stores your wares and tools."),
                -- TRANSLATORS: Note helptext for an Amazon warehouse: Headquarters
                note = pgettext("amazons_building", "The headquarters is your main building.")
            }
        },
        {
            name = "europeans_amazons_warehouse",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Amazon warehouse: Warehouse
                purpose = pgettext("amazons_building", "Your workers and soldiers will find shelter here. Also stores your wares and tools.")
            }
        },
        {
            name = "europeans_amazons_port",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Amazon warehouse: Port
                purpose = pgettext("amazons_building", "Serves as a base for overseas colonization and trade. Also stores your soldiers, wares and tools."),
                -- TRANSLATORS: Note helptext for an Amazon warehouse: Port
                note = pgettext("amazons_building", "Similar to the Headquarters a Port can be attacked and destroyed by an enemy. It is recommendable to send soldiers to defend it.")
            }
        },
        {
            name = "europeans_atlanteans_headquarters",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Atlantean warehouse: Headquarters
                purpose = pgettext("atlanteans_building", "Accommodation for your people. Also stores your wares and tools."),
                -- TRANSLATORS: Note helptext for an Atlantean warehouse: Headquarters
                note = pgettext("atlanteans_building", "The headquarters is your main building."),
                -- TRANSLATORS: Note lore for an Europeans production site: Headquarters
                lore = pgettext("atlanteans_building", "We founded this new colony, now go with Satul and do the best you can do for your tribe."),
                -- TRANSLATORS: Note lore_autor for an Europeans production site: Headquarters
                lore_author = pgettext("atlanteans_building", "Priest of Satul inaugurating you as leader of the Atleantean tribe")

            }
        },
        {
            name = "europeans_atlanteans_warehouse",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Atlantean warehouse: Warehouse
                purpose = pgettext("atlanteans_building", "Your workers and soldiers will find shelter here. Also stores your wares and tools. "..
                          "It will help you to stabilize your economy."),
                -- TRANSLATORS: Note lore for an Europeans production site: Warehouse
                lore = pgettext("atlanteans_building", "Maybe you think it’s a boring task to store, count and retrieve all this stuff, "..
                            "but do you really want your carriers to walk all the way to your Headquarters?"),
                -- TRANSLATORS: Note lore_autor for an Europeans production site: Headquarters
                lore_author = pgettext("atlanteans_building", "Head of the warehouse")

            }
        },
        {
            name = "europeans_atlanteans_port",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Atlantean warehouse: Port
                purpose = pgettext("atlanteans_building", "Serves as a base for overseas colonization and trade. Also stores your soldiers, wares and tools."),
                -- TRANSLATORS: Note helptext for an Atlantean warehouse: Port
                note = pgettext("atlanteans_building", "Similar to the Headquarters a Port can be attacked and destroyed by an enemy. It is recommendable to send soldiers to defend it."),
                -- TRANSLATORS: Note lore for an Europeans production site: Port
                lore = pgettext("atlanteans_building", "This is the building where expeditions will be equipped to boldly go and find new shores."),
                -- TRANSLATORS: Note lore_autor for an Europeans production site: Port
                lore_author = pgettext("atlanteans_building", "Ostur, the designer of the new Expedition ship class, during the opening of a new Port")
            }
        },
        {
            name = "europeans_barbarians_headquarters",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Barbarian warehouse: Headquarters
                lore = pgettext("barbarians_building", "‘Steep like the slopes of Kal’mavrath, shiny like the most delicate armor and strong like our ancestors, that’s how the headquarters of Chat’Karuth presented itself to us.’"),
                -- TRANSLATORS: Lore author helptext for a Barbarian warehouse: Headquarters
                lore_author = pgettext("barbarians_building", "Ballad ‘The Battle of Kal’mavrath’ by Hakhor the Bard"),
                -- TRANSLATORS: Purpose helptext for a Barbarian warehouse: Headquarters
                purpose = pgettext("barbarians_building", "Accommodation for your people. Also stores your wares and tools."),
                -- TRANSLATORS: Note helptext for a Barbarian warehouse: Headquarters
                note = pgettext("barbarians_building", "The headquarters is your main building.")
            }
        },
        {
            name = "europeans_barbarians_warehouse",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Barbarian warehouse: Warehouse
                lore = pgettext("barbarians_building", "‘Who still owns a warehouse is not yet defeated!’"),
                -- TRANSLATORS: Lore author helptext for a Barbarian warehouse: Warehouse
                lore_author = pgettext("barbarians_building", "Berthron, chief military adviser of Chat’Karuth,<br>when they lost the headquarters in the battle around the heights of Kal’Megarath"),
                -- TRANSLATORS: Purpose helptext for a Barbarian warehouse: Warehouse
                purpose = pgettext("barbarians_building", "Your workers and soldiers will find shelter here. Also stores your wares and tools.")
            }
        },
        {
            name = "europeans_barbarians_port",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Barbarian warehouse: Port
                lore = pgettext("barbarians_building", "‘I prefer the planks of a ship to any fortress, no matter how strong it is.’"),
                -- TRANSLATORS: Lore author helptext for a Barbarian warehouse: Port
                lore_author = pgettext("barbarians_building", "Captain Thanlas the Elder,<br>Explorer"),
                -- TRANSLATORS: Purpose helptext for a Barbarian warehouse: Port
                purpose = pgettext("barbarians_building", "Serves as a base for overseas colonization and trade. Also stores your soldiers, wares and tools."),
                -- TRANSLATORS: Note helptext for an Barbarian warehouse: Port
                note = pgettext("barbarians_building", "Similar to the Headquarters a Port can be attacked and destroyed by an enemy. It is recommendable to send soldiers to defend it.")
            }
        },
        {
            name = "europeans_empire_headquarters",
            helptexts = {
                lore = latin_lore(
                    -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                    --    Adaptation of a classical Latin quote meaning:
                    --    "All roads lead to Fremil."
                    _("Omnes viæ ducunt Fremilem."),
                    -- TRANSLATORS: Lore helptext for an Empire warehouse: Headquarters
                    --    Translation for the adapted classical Latin quote:
                    --    "Omnes viæ ducunt Fremilem."
                    _("All roads lead to Fremil.")
                ),
                -- TRANSLATORS: Lore author helptext for an Empire warehouse: Headquarters
                lore_author = pgettext("empire_building",
                    "Proverb signifying the glory of the Empire and its capital"
                ),
                -- TRANSLATORS: Purpose helptext for an Empire warehouse: Headquarters
                purpose = pgettext("empire_building", "Accommodation for your people. Also stores your wares and tools."),
                -- TRANSLATORS: Note helptext for an Empire warehouse: Headquarters
                note = pgettext("empire_building", "The headquarters is your main building.")
            }
        },
        {
            name = "europeans_empire_warehouse",
            helptexts = {
                lore = latin_lore(
                    -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                    --    Classical Latin quote meaning:
                    --    "Who gives promptly, gives twice, who gives late, gives nothing."
                    _("Bis dat, qui cito dat, nil dat, qui munera tardat."),
                    -- TRANSLATORS: Lore helptext for an Empire warehouse: Warehouse
                    --    Translation for the classical Latin quote:
                    --    "Bis dat, qui cito dat, nil dat, qui munera tardat."
                    _("Who gives promptly, gives twice, who gives late, gives nothing.")
                ),
                -- TRANSLATORS: Lore author helptext for an Empire warehouse: Warehouse
                lore_author = pgettext("empire_building", "Proverb written over the doors of a warehouse"),
                -- TRANSLATORS: Purpose helptext for an Empire warehouse: Warehouse
                purpose = pgettext("empire_building", "Your workers and soldiers will find shelter here. Also stores your wares and tools.")
            }
        },
        {
            name = "europeans_empire_port",
            helptexts = {
                lore = latin_lore(
                    -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                    --    Classical Latin quote meaning:
                    --    "To sail is necessary."
                    _("Navigare necesse est."),
                    -- TRANSLATORS: Lore helptext for an Empire warehouse: Port
                    --    Translation for the classical Latin quote:
                    --    "Navigare necesse est."
                    _("To sail is necessary.")
                ),
                -- TRANSLATORS: Lore author helptext for an Empire warehouse: Port
                lore_author = pgettext("empire_building",
                    "Admiral Litus Marius Exsiccatus, sending out the fleet to break the naval blockade "..
                    "during the First Atlantean War"
                ),
                -- TRANSLATORS: Purpose helptext for an Empire warehouse: Port
                purpose = pgettext("empire_building", "Serves as a base for overseas colonization and trade. Also stores your soldiers, wares and tools."),
                -- TRANSLATORS: Note helptext for an Empire warehouse: Port
                note = pgettext("empire_building", "Similar to the Headquarters a Port can be attacked and destroyed by an enemy. It is recommendable to send soldiers to defend it.")
            }
        },
        {
            name = "europeans_frisians_headquarters",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Frisian warehouse: Headquarters
                purpose = pgettext("frisians_building", "Accommodation for your people. Also stores your wares and tools."),
                -- TRANSLATORS: Note helptext for a Frisian warehouse: Headquarters
                note = pgettext("frisians_building", "The headquarters is your main building.")
            }
        },
        {
            name = "europeans_frisians_warehouse",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Frisian warehouse: Warehouse
                purpose = pgettext("frisians_building", "Your workers and soldiers will find shelter here. Also stores your wares and tools.")
            }
        },
        {
            name = "europeans_frisians_port",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Frisian warehouse: Port
                purpose = pgettext("frisians_building", "Serves as a base for overseas colonization and trade. Also stores your soldiers, wares and tools."),
                -- TRANSLATORS: Note helptext for a Frisian warehouse: Port
                note = pgettext("frisians_building", "Similar to the Headquarters a Port can be attacked and destroyed by an enemy. It is recommendable to send soldiers to defend it.")
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
            name = "europeans_quarry_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Stonecutters Hut
                purpose = pgettext("europeans_building", "Cuts raw pieces of granite out of rocks in the vicinity."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Stonecutters Hut
                note = pgettext("europeans_building", "The quarry needs rocks to cut within the work area."),
            }
        },
        {
            name = "europeans_quarry_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Quarry
                purpose = pgettext("europeans_building", "Cuts raw pieces of granite out of rocks in the vicinity."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Quarry
                note = pgettext("europeans_building", "The quarry needs rocks to cut within the work area."),
            }
        },
        {
            name = "europeans_quarry_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Quarry
                purpose = pgettext("europeans_building", "Cuts blocks of granite and marble out of rocks in the vicinity."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Quarry
                note = pgettext("europeans_building", "The quarry needs rocks to cut within the work area.")
            }
        },
        {
            name = "europeans_quarry_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Quarry
                purpose = pgettext("europeans_building", "Cuts blocks of granite and marble out of rocks in the vicinity."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Quarry
                note = pgettext("europeans_building", "The quarry needs rocks to cut within the work area.")
            }
        },
        {
            name = "europeans_clay_pit",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Clay Pit
                purpose = pgettext("building", "Digs up mud from the ground and uses water to turn it into clay. Clay is used to make bricks, reinforce the charcoal kiln and to build ships.")
            }
        },
        {
            name = "europeans_hunters_house_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Hunters Hut
                purpose = pgettext("europeans_building", "Hunts animals to produce meat and leather."),
                -- TRANSLATORS: Purpose helptext for Europeans production site: Hunters Hut
                note = pgettext("europeans_building", "The hunter’s hut needs animals to hunt within the work area."),
            }
        },
        {
            name = "europeans_hunters_house_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Hunter-Gatherer's Hut
                purpose = pgettext("europeans_building", "Hunts animals to produce meat and leather."),
                -- TRANSLATORS: Purpose helptext for Europeans production site: Hunter-Gatherer's Hut
                note = pgettext("europeans_building", "The hunter’s hut needs animals to hunt within the work area."),
            }
        },
        {
            name = "europeans_hunters_house_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Hunters House
                purpose = pgettext("europeans_building", "Hunts animals to produce meat and leather."),
                -- TRANSLATORS: Purpose helptext for Europeans production site: Hunters House
                note = pgettext("europeans_building", "The hunter’s hut needs animals to hunt within the work area."),
            }
        },
        {
            name = "europeans_hunters_house_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Hunters House
                purpose = pgettext("europeans_building", "Hunts animals to produce meat and leather."),
                -- TRANSLATORS: Purpose helptext for Europeans production site: Hunters House
                note = pgettext("europeans_building", "The hunter’s hut needs animals to hunt within the work area."),
            }
        },
        {
            name = "europeans_hunters_house_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Hunters House
                purpose = pgettext("europeans_building", "Hunts animals to produce meat and leather."),
                -- TRANSLATORS: Purpose helptext for Europeans production site: Hunters House
                note = pgettext("europeans_building", "The hunter’s hut needs animals to hunt within the work area."),
            }
        },
        {
            name = "europeans_fishers_house_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Fishers Hut
                purpose = pgettext("europeans_building", "Fishes on the coast or in lakes near the fisher’s house."),
                note = {
                   -- TRANSLATORS: Note helptext for an Europeans production site: Fisher's Hut, part 1
                   pgettext("europeans_building", "The fisher’s house needs water full of fish within the work area."),
                   -- TRANSLATORS: Note helptext for an Europeans production site: Fisher's Hut, part 2
                   pgettext("europeans_building", "Roads and trees along the shoreline block fishing."),
                },
            }
        },
        {
            name = "europeans_fishers_house_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Hunter-Gatherer's Hut
                purpose = pgettext("europeans_building", "Fishes on the coast or in lakes near the fisher’s house."),
                note = {
                   -- TRANSLATORS: Note helptext for an Europeans production site: Hunter-Gatherer's Hut, part 1
                   pgettext("europeans_building", "The fisher’s house needs water full of fish within the work area."),
                   -- TRANSLATORS: Note helptext for an Europeans production site: Hunter-Gatherer's Hut, part 2
                   pgettext("europeans_building", "Roads and trees along the shoreline block fishing."),
                },
            }
        },
        {
            name = "europeans_fishers_house_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Fishers House
                purpose = pgettext("europeans_building", "Fishes on the coast or in lakes near the fisher’s house."),
                note = {
                   -- TRANSLATORS: Note helptext for an Europeans production site: Fishers House, part 1
                   pgettext("europeans_building", "The fisher’s house needs water full of fish within the work area."),
                   -- TRANSLATORS: Note helptext for an Europeans production site: Fishers House, part 2
                   pgettext("europeans_building", "Roads and trees along the shoreline block fishing."),
                },
            }
        },
        {
            name = "europeans_fishers_house_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Fishers House
                purpose = pgettext("europeans_building", "Fishes on the coast or in lakes near the fisher’s house."),
                note = {
                   -- TRANSLATORS: Note helptext for an Europeans production site: Fishers House, part 1
                   pgettext("europeans_building", "The fisher’s house needs water full of fish within the work area."),
                   -- TRANSLATORS: Note helptext for an Europeans production site: Fishers House, part 2
                   pgettext("europeans_building", "Roads and trees along the shoreline block fishing."),
                },
            }
        },
        {
            name = "europeans_fishers_house_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Fishers House
                purpose = pgettext("europeans_building", "Fishes on the coast or in lakes near the fisher’s house."),
                note = {
                   -- TRANSLATORS: Note helptext for an Europeans production site: Fishers House, part 1
                   pgettext("europeans_building", "The fisher’s house needs water full of fish within the work area."),
                   -- TRANSLATORS: Note helptext for an Europeans production site: Fishers House, part 2
                   pgettext("europeans_building", "Roads and trees along the shoreline block fishing."),
                },
            }
        },
        {
            name = "europeans_aqua_farm",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Aqua Farm
                purpose = pgettext("europeans_building", "Breeds fish as food for soldiers and miners."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Aqua Farm
                note = pgettext("europeans_building", "The aqua farm needs holes in the ground that were dug by a clay pit’s worker nearby to use as fishing ponds.")
            }
        },
        {
            name = "europeans_beekeepers_house",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Beekeeper's House
                purpose = pgettext("europeans_building", "Keeps bees and lets them swarm over flowering fields to produce honey."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Beekeeper's House
                note = pgettext("europeans_building", "Needs medium-sized fields (barley, wheat, reed, corn or blackroot) or bushes (berry bushes or grapevines) nearby."),
            }
        },
        {
            name = "europeans_charcoal_burners_house",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Charcoal Burner's House
                purpose = pgettext("europeans_building", "Burns logs into charcoal."),
                -- TRANSLATORS: Note helptext for a Europeans production site: Charcoal Burner's House
                note = pgettext("europeans_building", "The charcoal burner’s house needs holes in the ground that were dug by a clay pit’s worker nearby to erect charcoal stacks in them."),
            }
        },
        {
            name = "europeans_gold_spinning_mill",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Gold Spinning Mill
                purpose = pgettext("europeans_building", "Spins gold thread out of gold."),
                -- TRANSLATORS: Note helptext for an Europeans production site: Gold Spinning Mill
                note = pgettext("europeans_building", "Do not build until you have a steady gold supply."),
            }
        },
        -- Medium
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
            name = "europeans_charcoal_kiln_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Charcoal Kiln
                purpose = pgettext("europeans_building", "Burns scrap_wood into charcoal.")
            }
        },
        {
            name = "europeans_charcoal_kiln_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Charcoal Kiln
                purpose = pgettext("europeans_building", "Burns scrap_wood into charcoal.")
            }
        },
        {
            name = "europeans_charcoal_kiln_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Charcoal Kiln
                purpose = pgettext("europeans_building", "Burns scrap_wood into charcoal.")
            }
        },
        {
            name = "europeans_charcoal_kiln_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Charcoal Kiln
                purpose = pgettext("europeans_building", "Burns scrap_wood or logs into charcoal.")
            }
        },
        {
            name = "europeans_charcoal_kiln_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Charcoal Kiln
                purpose = pgettext("europeans_building", "Burns scrap_wood or logs into charcoal.")
            }
        },
        {
            name = "europeans_smelting_works_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Smelting Works
                purpose = pgettext("europeans_building", "Smelts iron ore into iron.")
            }
        },
        {
            name = "europeans_smelting_works_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Furnace
                purpose = pgettext("europeans_building", "Smelts iron ore into iron and gold dust into gold.")
            }
        },
        {
            name = "europeans_smelting_works_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Smelting Works
                purpose = pgettext("europeans_building", "Smelts iron ore into iron and gold dust or gold ore into gold.")
            }
        },
        {
            name = "europeans_smelting_works_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Smelting Works
                purpose = pgettext("europeans_building", "Smelts iron ore into iron and gold dust or gold ore into gold.")
            }
        },
        {
            name = "europeans_smelting_works_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Furnace
                purpose = pgettext("europeans_building", "Smelts iron ore into iron and gold dust or gold ore into gold.")
            }
        },
        {
            name = "europeans_smelting_works_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Recycling Center
                purpose = pgettext("europeans_building", "Smelts scrap iron into iron and scrap metal mixed into iron and gold.")
            }
        },
        {
            name = "europeans_brewery_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Micro Brewery
                purpose = pgettext("europeans_building", "Produces simple barbarians beer out of water and wheat."),
            }
        },
        {
            name = "europeans_brewery_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Brewery
                purpose = pgettext("europeans_building", "Produces additional barbarians strong beer out of water and wheat."),
            }
        },
        {
            name = "europeans_brewery_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Chocolate Brewery
                purpose = pgettext("europeans_building", "Produces additional amazons chocolate out of water and cacao."),
            }
        },
        {
            name = "europeans_brewery_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Brewery
                purpose = pgettext("europeans_building", "Produces empire beer out of water and barley."),
            }
        },
        {
            name = "europeans_brewery_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Vinery
                purpose = pgettext("europeans_building", "Produces additional wine out of grapes."),
            }
        },
        {
            name = "europeans_brewery_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Brewery
                purpose = pgettext("europeans_building", "Produces frisians beer out of water and barley."),
            }
        },
        {
            name = "europeans_brewery_level_6",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Mead Brewery
                purpose = pgettext("europeans_building", "Produces additional mead out of water, honey and barley."),
            }
        },
        {
            name = "europeans_mill_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Mill
                purpose = pgettext("europeans_building", "Grinds corn and blackroot to produce cornmeal and blackroot_flour.")
            }
        },
        {
            name = "europeans_mill_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Mill
                purpose = pgettext("europeans_building", "Grinds grain, corn and blackroot to produce various kinds of flour.")
            }
        },
        {
            name = "europeans_bakery_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Bakery
                purpose = pgettext("europeans_building", "Produces simple barbarians bread out of water and wheat.")
            }
        },
        {
            name = "europeans_bakery_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Cassava Root Cooker
                purpose = pgettext("europeans_building", "Produces additional amazons bread out of water and cassavaroot.")
            }
        },
        {
            name = "europeans_bakery_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Bakery
                purpose = pgettext("europeans_building", "Produces additional atlanteans bread out of water, cornmeal and blackroot flour.")
            }
        },
        {
            name = "europeans_bakery_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Bakery
                purpose = pgettext("europeans_building", "Produces additional empire bread out of water, flour and rye flour.")
            }
        },
        {
            name = "europeans_bakery_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Bakery
                purpose = pgettext("europeans_building", "Produces additional frisians bread out of water, barley flour and oat flour.")
            }
        },
        {
            name = "europeans_bakery_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Honey Bakery
                purpose = pgettext("europeans_building", "Produces additional honey bread out of water, barley flour, out flour and honey.")
            }
        },
        {
            name = "europeans_smokery_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Smokery
                purpose = pgettext("europeans_building", "Smokes meat and fish."),

            }
        },
        {
            name = "europeans_smokery_advanced",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Smokery
                purpose = pgettext("europeans_building", "Smokes meat and fish."),
            }
        },
        {
            name = "europeans_tavern_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Tavern
                purpose = pgettext("europeans_building", "Prepares rations to feed the scouts and miners."),
            }
        },
        {
            name = "europeans_tavern_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Food Preserver
                purpose = pgettext("europeans_building", "Prepares rations to feed the scouts and miners."),
            }
        },
        {
            name = "europeans_tavern_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Tavern
                purpose = pgettext("europeans_building", "Prepares rations to feed the scouts and miners."),
            }
        },
        {
            name = "europeans_tavern_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Tavern
                purpose = pgettext("europeans_building", "Prepares rations to feed the miners."),
            }
        },
        {
            name = "europeans_inn_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Inn
                purpose = pgettext("europeans_building", "Prepares rations and snacks to feed the miners in the basic and deep mines."),
            }
        },
        {
            name = "europeans_inn_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Big Inn
                purpose = pgettext("europeans_building", "Prepares rations, snacks and meals to feed all miners."),
            }
        },
        {
            name = "europeans_inn_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Inn
                purpose = pgettext("europeans_building", "Prepares rations, snacks and meals to feed all miners."),
            }
        },
        {
            name = "europeans_inn_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Drinking Hall
                purpose = pgettext("europeans_building", "Prepares rations, snacks and meals to feed all miners."),
            }
        },
        -- Big
        {
            name = "europeans_grain_farm_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Farm
                purpose = pgettext("europeans_building", "Sows and harvests wheat."),
                -- TRANSLATORS: Note helptext for Europeans production site: Farm
                note = pgettext ("europeans_building", "This farm needs free space within the work area to plant seeds.")
            }
        },
        {
            name = "europeans_grain_farm_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Farm
                purpose = pgettext("europeans_building", "Sows and harvests rye and wheat."),
                -- TRANSLATORS: Note helptext for Europeans production site: Farm
                note = pgettext ("europeans_building", "This farm needs free space within the work area to plant seeds.")
            }
        },
        {
            name = "europeans_grain_farm_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Farm
                purpose = pgettext("europeans_building", "Sows and harvests barley, oat, rye and wheat."),
                -- TRANSLATORS: Note helptext for Europeans production site: Farm
                note = pgettext ("europeans_building", "This farm needs free space within the work area to plant seeds.")
            }
        },
        {
            name = "europeans_blackroot_farm",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Blackroot Farm
                purpose = pgettext("europeans_building", "Sows and harvests blackroot."),
                -- TRANSLATORS: Note helptext for Europeans production site: Blackroot Farm
                note = pgettext ("europeans_building", "This farm needs free space within the work area to plant seeds.")
            }
        },
        {
            name = "europeans_cassava_farm",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Cassava Plantation
                purpose = pgettext("europeans_building", "Sows and harvests cassava root."),
                -- TRANSLATORS: Note helptext for Europeans production site: Cotton Plantation
                note = pgettext ("europeans_building", "This farm needs free space within the work area to plant seeds.")
            }
        },
        {
            name = "europeans_cocoa_farm",
            helptexts = {
                 -- TRANSLATORS: Purpose helptext for Europeans production site: Cocoa Farm
                purpose = pgettext("europeans_building", "Sows and harvests cocoa beans."),
                -- TRANSLATORS: Note helptext for Europeans production site: Cocoa Farm
                note = pgettext ("europeans_building", "This farm needs free space within the work area to plant seeds.")
            }
        },
        {
            name = "europeans_corn_farm",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Corn Farm
                purpose = pgettext("europeans_building", "Sows and harvests corn."),
                -- TRANSLATORS: Note helptext for Europeans production site: Corn Farm
                note = pgettext ("europeans_building", "This farm needs free space within the work area to plant seeds.")
            }
        },
        {
            name = "europeans_cotton_farm",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Cotton Plantation
                purpose = pgettext("europeans_building", "Sows and harvests corn."),
                -- TRANSLATORS: Note helptext for Europeans production site: Cotton Plantation
                note = pgettext ("europeans_building", "This farm needs free space within the work area to plant seeds.")
            }
        },
        {
            name = "europeans_spiderfarm",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Spider Farm
                purpose = pgettext("europeans_building", "Breeds spiders for silk."),
            }
        },
        {
            name = "europeans_building_material_manufactory",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Building Material Manufactory
                purpose = pgettext("europeans_building", "Produces improved materials needed to construct buildings. This includes planks, bricks, grout, ropes or marble columns."),
            }
        },
        {
            name = "europeans_big_manufactory",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Big Manufactory
                purpose = pgettext("europeans_building", "Produces all tools and armor that do not require iron."),
            }
        },
        {
            name = "europeans_metal_manufactory",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Metal Manufactory
                purpose = pgettext("europeans_building", "Produces all tools, weapons and armor that require iron."),
            }
        },
        -- Advanced carrier recruitement and wool/fur/leather-production
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
        -- Terraforming
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
                -- TRANSLATORS: Purpose helptext for Europeans production site: Granite Mine
                purpose = pgettext("europeans_building", "Digs granite, marble and other valuable minerals out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_stonemine_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Stone Mine
                purpose = pgettext("europeans_building", "Digs granite, marble and other valuable minerals out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_stonemine_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Crystal Mine
                purpose = pgettext("europeans_building", "Digs granite, marble and other valuable minerals out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_stonemine_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Marble Mine
                purpose = pgettext("europeans_building", "Digs granite, marble and other valuable minerals out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_stonemine_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Deep Marble Mine
                purpose = pgettext("europeans_building", "Digs granite, marble and other valuable minerals out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_stonemine_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Rock Mine
                purpose = pgettext("europeans_building", "Digs granite, marble and other valuable minerals out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_stonemine_level_6",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Deep Rock Mine
                purpose = pgettext("europeans_building", "Digs granite, marble and other valuable minerals out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_coalmine_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Coal Mine
                purpose = pgettext("europeans_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_coalmine_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Deep Coal Mine
                purpose = pgettext("europeans_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_coalmine_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Deeper Coal Mine
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
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Coal Mine
                purpose = pgettext("europeans_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_coalmine_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Deep Coal Mine
                purpose = pgettext("europeans_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_coalmine_level_6",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Coal Mine
                purpose = pgettext("europeans_building", "Digs coal out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_coalmine_level_7",
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
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Iron Mine
                purpose = pgettext("europeans_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_ironmine_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Deep Iron Mine
                purpose = pgettext("europeans_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_ironmine_level_6",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Iron Mine
                purpose = pgettext("europeans_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_ironmine_level_7",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Deep Iron Mine
                purpose = pgettext("europeans_building", "Digs iron ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_goldmine_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Gold Mine
                purpose = pgettext("europeans_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_goldmine_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Deep Gold Mine
                purpose = pgettext("europeans_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_goldmine_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Deeper Gold Mine
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
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Gold Mine
                purpose = pgettext("europeans_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_goldmine_level_5",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Deep Gold Mine
                purpose = pgettext("europeans_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_goldmine_level_6",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Gold Mine
                purpose = pgettext("europeans_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        {
            name = "europeans_goldmine_level_7",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Deep Gold Mine
                purpose = pgettext("europeans_building", "Digs gold ore out of the ground in mountain terrain.")
            }
        },
        -- Scouting Sites
        {
            name = "europeans_scouts_house_basic",
            helptexts = {
                -- TRANSLATORS: Special helptext for an Europeans production site: Scout's Hut without road connection
                no_scouting_building_connected = pgettext("europeans_building", "You need to connect this flag to a scout’s hut before you can send a scout here."),
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Scout's Hut
                purpose = pgettext("europeans_building", "Explores unknown territory."),
            }
        },
        {
            name = "europeans_scouts_house_level_1",
            helptexts = {
                -- TRANSLATORS: Special helptext for an Europeans production site: Scout's Hut without road connection
                no_scouting_building_connected = pgettext("europeans_building", "You need to connect this flag to a scout’s hut before you can send a scout here."),
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Scout's Hut
                purpose = pgettext("europeans_building", "Explores unknown territory."),
            }
        },
        {
            name = "europeans_scouts_house_level_2",
            helptexts = {
                -- TRANSLATORS: Special helptext for an Europeans production site: Scout's House without road connection
                no_scouting_building_connected = pgettext("europeans_building", "You need to connect this flag to a scout’s house before you can send a scout here."),
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Scout's House
                purpose = pgettext("europeans_building", "Explores unknown territory."),
            }
        },
        {
            name = "europeans_scouts_house_level_3",
            helptexts = {
                -- TRANSLATORS: Special helptext for an Europeans production site: Scout's House without road connection
                no_scouting_building_connected = pgettext("europeans_building", "You need to connect this flag to a scout’s house before you can send a scout here."),
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Scout's House
                purpose = pgettext("building", "Explores unknowneuropeans_buildingterritory."),
            }
        },
        {
            name = "europeans_scouts_house_level_4",
            helptexts = {
                -- TRANSLATORS: Special helptext for an Europeans production site: Scout's House without road connection
                no_scouting_building_connected = pgettext("europeans_building", "You need to connect this flag to a scout’s house before you can send a scout here."),
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Scout's House
                purpose = pgettext("europeans_building", "Explores unknown territory."),
            }
        },
        -- Trading
        {
            name = "europeans_atlanteans_trading_post",
            helptexts = {
               -- TRANSLATORS: Purpose helptext for an Atlantean market site: Trading post
               purpose = pgettext("europeans_building", "Allows sharing goods with other players.")
            }
        },
        {
            name = "europeans_empire_temple_of_vesta",
            helptexts = {
               -- TRANSLATORS: Purpose helptext for an Empire market site: Temple of Vesta
               purpose = pgettext("europeans_building", "Allows sharing goods with other players.")
            }
        },
        -- Seafaring
        {
            name = "europeans_ferry_yard_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for Europeans production site: Ferry Yard
                purpose = pgettext("europeans_building", "Builds ferries."),
                note = {
                    -- TRANSLATORS: Note helptext for a Europeans production site: Ferry Yard, part 1
                    pgettext("europeans_building", "Needs water nearby. Be aware ferries carry wares only, no workers."),
                    -- TRANSLATORS: Note helptext for a Europeans production site: Ferry Yard, part 2
                    pgettext("europeans_building", "Roads and trees along the shoreline block access to water."),
                },
            }
        },
        {
            name = "europeans_ferry_yard_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Ferry Yard
                purpose = pgettext("europeans_building", "Builds ferries."),
                note = {
                    -- TRANSLATORS: Note helptext for an Europeans production site: Ferry Yard, part 1
                    pgettext("europeans_building", "Needs water nearby. Be aware ferries carry wares only, no workers."),
                    -- TRANSLATORS: Note helptext for an Europeans production site: Ferry Yard, part 2
                    pgettext("europeans_building", "Roads and trees along the shoreline block access to water."),
                },
            }
        },
        {
            name = "europeans_ferry_yard_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Ferry Yard
                purpose = pgettext("europeans_building", "Builds ferries."),
                note = {
                    -- TRANSLATORS: Note helptext for an Europeans production site: Ferry Yard, part 1
                    pgettext("europeans_building", "Needs water nearby. Be aware ferries carry wares only, no workers."),
                    -- TRANSLATORS: Note helptext for an Europeans production site: Ferry Yard, part 2
                    pgettext("europeans_building", "Roads and trees along the shoreline block access to water."),
                },
            }
        },
        {
            name = "europeans_ferry_yard_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Ferry Yard
                purpose = pgettext("europeans_building", "Builds ferries."),
                note = {
                    -- TRANSLATORS: Note helptext for an Europeans production site: Ferry Yard, part 1
                    pgettext("europeans_building", "Needs water nearby. Be aware ferries carry wares only, no workers."),
                    -- TRANSLATORS: Note helptext for an Europeans production site: Ferry Yard, part 2
                    pgettext("europeans_building", "Roads and trees along the shoreline block access to water."),
                },
            }
        },
        {
            name = "europeans_ferry_yard_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Ferry Yard
                purpose = pgettext("europeans_building", "Builds ferries."),
                note = {
                    -- TRANSLATORS: Note helptext for a Europeans production site: Ferry Yard, part 1
                    pgettext("europeans_building", "Needs water nearby. Be aware ferries carry wares only, no workers."),
                    -- TRANSLATORS: Note helptext for an Europeans production site: Ferry Yard, part 2
                    pgettext("europeans_building", "Roads and trees along the shoreline block access to water."),
                },
            }
        },
        {
            name = "europeans_shipyard_basic",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Shipyard
                purpose = pgettext("europeans_building", "Constructs ships that are used for overseas colonization and for trading between ports."),
                note = {
                    -- TRANSLATORS: Note helptext for a Europeans production site: Shipyard, part 1
                    pgettext("europeans_building", "Needs wide open water nearby."),
                    -- TRANSLATORS: Note helptext for a Europeans production site: Shipyard, part 2
                    pgettext("europeans_building", "Roads and trees along the shoreline block access to water."),
                },
            }
        },
        {
            name = "europeans_shipyard_level_1",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Shipyard
                purpose = pgettext("europeans_building", "Constructs ships that are used for overseas colonization and for trading between ports."),
                note = {
                    -- TRANSLATORS: Note helptext for an Europeans production site: Shipyard, part 1
                    pgettext("europeans_building", "Needs wide open water nearby."),
                    -- TRANSLATORS: Note helptext for an Europeans production site: Shipyard, part 2
                    pgettext("europeans_building", "Roads and trees along the shoreline block access to water."),
                },
            }
        },
        {
            name = "europeans_shipyard_level_2",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Shipyard
                purpose = pgettext("europeans_building", "Constructs ships that are used for overseas colonization and for trading between ports."),
                note = {
                    -- TRANSLATORS: Note helptext for an Europeans production site: Shipyard, part 1
                    pgettext("europeans_building", "Needs wide open water nearby."),
                    -- TRANSLATORS: Note helptext for an Europeans production site: Shipyard, part 2
                    pgettext("europeans_building", "Roads and trees along the shoreline block access to water."),
                },
            }
        },
        {
            name = "europeans_shipyard_level_3",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Europeans production site: Shipyard
                purpose = pgettext("europeans_building", "Constructs ships that are used for overseas colonization and for trading between ports."),
                note = {
                    -- TRANSLATORS: Note helptext for an Europeans production site: Shipyard, part 1
                    pgettext("europeans_building", "Needs wide open water nearby."),
                    -- TRANSLATORS: Note helptext for an Europeans production site: Shipyard, part 2
                    pgettext("europeans_building", "Roads and trees along the shoreline block access to water."),
                },
            }
        },
        {
            name = "europeans_shipyard_level_4",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Europeans production site: Shipyard
                purpose = pgettext("europeans_building", "Constructs ships that are used for overseas colonization and for trading between ports."),
                note = {
                    -- TRANSLATORS: Note helptext for a Europeans production site: Shipyard, part 1
                    pgettext("europeans_building", "Needs wide open water nearby."),
                    -- TRANSLATORS: Note helptext for a Europeans production site: Shipyard, part 2
                    pgettext("europeans_building", "Roads and trees along the shoreline block access to water."),
                },
            }
        },
        -- Recruitement and Training Sites
        {
            name = "europeans_big_barracks",
            helptexts = {
                purpose = {
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Big Barracks, part 1
                    pgettext("europeans_building", "Trains recruits to soldiers."),
                    -- TRANSLATORS: Purpose helptext for an Europeans training site: Big Barracks, part 2
                    pgettext("europeans_building", "Equips the recruits with all necessary armor parts and weapons.")
                },
            }
        },
        {
            name = "europeans_battlearena_basic",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Battle Arena
                note = pgettext("europeans_building", "Trains soldiers in ‘Evade’."),
            }
        },
        {
            name = "europeans_barracks_basic",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Barracks
                note = pgettext("europeans_building", "Improves soldiers' ‘Health’ through additional armor."),
            }
        },
        {
            name = "europeans_barracks_level_1",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Initiation Site
                note = pgettext("europeans_building", "Improves soldiers' ‘Health’ through additional armor."),
            }
        },
        {
            name = "europeans_barracks_level_2",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Barracks
                note = pgettext("europeans_building", "Improves soldiers' ‘Health’ through additional armor."),
            }
        },
        {
            name = "europeans_barracks_level_3",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Barracks
                note = pgettext("europeans_building", "Improves soldiers' ‘Health’ through additional armor."),
            }
        },
        {
            name = "europeans_barracks_level_4",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Barracks
                note = pgettext("europeans_building", "Improves soldiers' ‘Health’ through additional armor."),
            }
        },
        {
            name = "europeans_battlearena_level_1",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Training Glade
                note = pgettext("europeans_building", "Trains soldiers in ‘Evade’ and ‘Defense’."),
            }
        },
        {
            name = "europeans_battlearena_level_2",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Labyrinth
                note = pgettext("europeans_building", "Trains soldiers in ‘Evade’ and ‘Defense’."),
            }
        },
        {
            name = "europeans_battlearena_level_3",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Arena
                note = pgettext("europeans_building", "Trains soldiers in ‘Evade’ and ‘Defense’."),
            }
        },
        {
            name = "europeans_battlearena_level_4",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Colosseum
                note = pgettext("europeans_building", "Trains soldiers in ‘Evade’ and ‘Defense’."),
            }
        },
        {
            name = "europeans_battlearena_level_5",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Training Arena
                note = pgettext("europeans_building", "Trains soldiers in ‘Evade’ and ‘Defense’."),
            }
        },
        {
            name = "europeans_trainingcamp_basic",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Trainingcamp
                note = pgettext("europeans_building", "Trains soldiers in ‘Attack’."),
            }
        },
        {
            name = "europeans_trainingcamp_level_1",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Warriors Gathering
                note = pgettext("europeans_building", "Trains soldiers in ‘Attack’."),
            }
        },
        {
            name = "europeans_trainingcamp_level_2",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Dungeon
                note = pgettext("europeans_building", "Trains soldiers in ‘Attack’."),
            }
        },
        {
            name = "europeans_trainingcamp_level_3",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Trainingcamp
                note = pgettext("europeans_building", "Trains soldiers in ‘Attack’."),
            }
        },
        {
            name = "europeans_trainingcamp_level_4",
            helptexts = {
                -- TRANSLATORS: Note helptext for a Europeans training site: Training Camp
                note = pgettext("europeans_building", "Trains soldiers in ‘Attack’."),
            }
        },
        -- Amazons Military Sites
        {
            name = "europeans_amazons_patrol_post",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Amazon military site: Patrol Post
                purpose = pgettext("amazons_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Amazon military site: Patrol Post
                note = pgettext("amazons_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send her away.")
            }
        },
        {
            name = "europeans_amazons_treetop_sentry",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Amazon military site: Treetop Sentry
                purpose = pgettext("amazons_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Amazon military site: Treetop Sentry
                note = pgettext("amazons_building", "You can only build this building on top of a tree.")
            }
        },
        {
            name = "europeans_amazons_warriors_dwelling",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Amazon military site: Warriors’ Dwelling
                purpose = pgettext("amazons_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Amazon military site: Warriors’ Dwelling
                note = pgettext("amazons_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send her away.")
            }
        },
        {
            name = "europeans_amazons_tower",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Amazon military site: Tower
                purpose = pgettext("amazons_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Amazon military site: Tower
                note = pgettext("amazons_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send her away.")
            }
        },
        {
            name = "europeans_amazons_observation_tower",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Amazon military site: Observation Tower
                purpose = pgettext("amazons_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Amazon military site: Observation Tower
                note = pgettext("amazons_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send her away.")
            }
        },
        {
            name = "europeans_amazons_fortress",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Amazon military site: Fortress
                purpose = pgettext("amazons_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Amazon military site: Fortress
                note = pgettext("amazons_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send her away.")
            }
        },
        {
            name = "europeans_amazons_fortification",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Amazon military site: Fortification
                purpose = pgettext("amazons_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Amazon military site: Fortification
                note = pgettext("amazons_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send her away.")
            }
        },
        -- Atlanteans Military Sites
        {
            name = "europeans_atlanteans_guardhouse",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Atlantean military site: Guardhouse
                purpose = pgettext("atlanteans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Atlantean military site: Guardhouse
                note = pgettext("atlanteans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow "..
                            "button to decrease the capacity. You can also click on a soldier to send him away."),
                -- TRANSLATORS: Lore helptext for an Europeans production site: Guardhouse
                lore = pgettext("atlanteans_building", "Hey soldier, even if this is the smallest of our military buildings you still must not sleep all day!"),
                -- TRANSLATORS: Lore author helptext for an Europeans production site: Guardhouse
                lore_author = pgettext("atlanteans_building", "Officer visiting a remote guardhouse")
            }
        },
        {
            name = "europeans_atlanteans_guardhall",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Atlantean military site: Guardhall
                purpose = pgettext("atlanteans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Atlantean military site: Guardhall
                note = pgettext("atlanteans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away."),
                -- TRANSLATORS: Lore helptext for an Europeans production site: Guardhall
                lore = pgettext("atlanteans_building", "In this hall we praise the fight, Satul will warm us day and night."),
                -- TRANSLATORS: Lore author helptext for an Europeans production site: Guardhall
                lore_author = pgettext("atlanteans_building", "Scribbling on the wall of a guardhall")
            }
        },
        {
            name = "europeans_atlanteans_tower_small",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Atlantean military site: Small Tower
                purpose = pgettext("atlanteans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Atlantean military site: Small Tower
                note = pgettext("atlanteans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away."),
                -- TRANSLATORS: Lore helptext for an Europeans production site: Small Tower
                lore = pgettext("atlanteans_building", "With three soldiers we can achieve an optimal balance between military power and building cost."),
                -- TRANSLATORS: Lore author helptext for an Europeans production site: Small Tower
                lore_author = pgettext("atlanteans_building", "Notes on the building instructions")

            }
        },
        {
            name = "europeans_atlanteans_tower",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Atlantean military site: Tower
                purpose = pgettext("atlanteans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Atlantean military site: Tower
                note = pgettext("atlanteans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away."),
                -- TRANSLATORS: Lore helptext for an Europeans production site: Tower
                lore = pgettext("atlanteans_building", "All the other tribes envy us for our towers, elegant outside, comfortable inside, still perfect for defense."),
                -- TRANSLATORS: Lore author helptext for an Europeans production site: Tower
                lore_author = pgettext("atlanteans_building", "Soldier handing over his duties to a younger one")

            }
        },
        {
            name = "europeans_atlanteans_tower_high",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Atlantean military site: High Tower
                purpose = pgettext("atlanteans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Atlantean military site: High Tower
                note = pgettext("atlanteans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow "..
                            "button to decrease the capacity. You can also click on a soldier to send him away."),
                -- TRANSLATORS: Lore helptext for an Europeans production site: High Tower
                lore = pgettext("atlanteans_building", "Beware our mighty high towers! From the topmost spot we can see wide into the "..
                            "lands and spot the enemy far away."),
                -- TRANSLATORS: Lore author helptext for an Europeans production site: High Tower
                lore_author = pgettext("atlanteans_building", "Soldier showing off a High Tower")

            }
        },
        {
            name = "europeans_atlanteans_castle",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for an Atlantean military site: Castle
                purpose = pgettext("atlanteans_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Atlantean military site: Castle
                note = pgettext("atlanteans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow "..
                                     "button to decrease the capacity. You can also click on a soldier to send him away."),
                -- TRANSLATORS: Lore helptext for an Europeans production site: Castle
                lore = pgettext("atlanteans_building", "Sometimes even we Atlanteans need to use brute force, but we always play it wisely."),
                -- TRANSLATORS: Lore author helptext for an Europeans production site: Castle
                lore_author = pgettext("atlanteans_building", "‘Wisdom of the Fight’ by the warriors’ guild")
            }
        },
        -- Barbarians Military Sites
        {
            name = "europeans_barbarians_sentry",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Barbarian military site: Sentry
                lore = pgettext("barbarians_building", "‘The log cabin was so small that two men could hardly live there. But we were young and carefree. We just relished our freedom and the responsibility as an outpost.’"),
                -- TRANSLATORS: Lore author helptext for a Barbarian military site: Sentry
                lore_author = pgettext("barbarians_building", "Boldreth,<br>about his time as young soldier"),
                -- TRANSLATORS: Purpose helptext for a Barbarian military site: Sentry
                purpose = pgettext("barbarians_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for a Barbarian military site: Sentry
                note = pgettext("barbarians_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_barbarians_barrier",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Barbarian military site: Barrier
                lore = pgettext("barbarians_building", "‘When we looked down to the valley from our newly established barrier, we felt that the spirit of our fathers was with us.’"),
                -- TRANSLATORS: Lore author helptext for a Barbarian military site: Barrier
                lore_author = pgettext("barbarians_building", "Ballad ‘The Battle of Kal’mavrath’ by Hakhor the Bard"),
                -- TRANSLATORS: Purpose helptext for a Barbarian military site: Barrier
                purpose = pgettext("barbarians_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for a Barbarian military site: Barrier
                note = pgettext("barbarians_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },

        {
            name = "europeans_barbarians_tower",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Barbarian military site: Tower
                lore = pgettext("barbarians_building", "‘From the height of our tower we could see far into enemy territory. The enemy was well prepared, but we also noticed some weak points in their defense.’"),
                -- TRANSLATORS: Lore author helptext for a Barbarian military site: Tower
                lore_author = pgettext("barbarians_building", "Ballad ‘The Battle of Kal’mavrath’ by Hakhor the Bard"),
                -- TRANSLATORS: Purpose helptext for a Barbarian military site: Tower
                purpose = pgettext("barbarians_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for a Barbarian military site: Tower
                note = pgettext("barbarians_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_barbarians_fortress",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Barbarian military site: Fortress
                lore = pgettext("barbarians_building", "‘This stronghold made from blackwood and stones will be a hard nut to crack for them.’"),
                -- TRANSLATORS: Lore author helptext for a Barbarian military site: Fortress
                lore_author = pgettext("barbarians_building", "Berthron,<br>chief military adviser of Chat’Karuth"),
                -- TRANSLATORS: Purpose helptext for a Barbarian military site: Fortress
                purpose = pgettext("barbarians_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for a Barbarian military site: Fortress
                note = pgettext("barbarians_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_barbarians_citadel",
            helptexts = {
                -- TRANSLATORS: Lore helptext for a Barbarian military site: Citadel
                lore = pgettext("barbarians_building", "‘The Citadel of Adlen surely is the finest masterpiece of Barbarian craftsmanship. Nothing as strong and big and beautiful has ever been built in such a short time.’"),
                -- TRANSLATORS: Lore author helptext for a Barbarian military site: Citadel
                lore_author = pgettext("barbarians_building", "Colintan, chief planner of the Citadel of Adlen,<br>at its opening ceremony"),
                -- TRANSLATORS: Purpose helptext for a Barbarian military site: Citadel
                purpose = pgettext("barbarians_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for a Barbarian military site: Citadel
                note = pgettext("barbarians_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        -- Empire Military Sites
        {
            name = "europeans_empire_blockhouse",
            helptexts = {
                lore = latin_lore(
                    -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                    --    Classical Latin quote meaning:
                    --    "An eagle doesn’t catch flies."
                    _("Aquila non captat muscas."),
                    -- TRANSLATORS: Lore helptext for an Empire military site: Blockhouse
                    --    Translation for the classical Latin quote:
                    --    "Aquila non captat muscas."
                    _("An eagle doesn’t catch flies.")
                ),
                -- TRANSLATORS: Lore author helptext for an Empire military site: Blockhouse
                lore_author = pgettext("empire_building",
                    "General Passerus Claudius Pedestrus on why he didn’t order the destruction of a"..
                    " rebel Blockhouse"
                ),
                -- TRANSLATORS: Purpose helptext for an Empire military site: Blockhouse
                purpose = pgettext("empire_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Empire military site: Blockhouse
                note = pgettext("empire_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_empire_sentry",
            helptexts = {
                lore = latin_lore(
                    -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                    --    Classical Latin quote meaning:
                    --    "Who watches the watchmen?"
                    _("Quis custodiet ipsos custodes?"),
                    -- TRANSLATORS: Lore helptext for an Empire production site: Sentry
                    --    Translation for the classical Latin quote:
                    --    "Quis custodiet ipsos custodes?"
                    _("Who watches the watchmen?")
                ),
                -- TRANSLATORS: Lore author helptext for an Empire production site: Sentry
                --              (the Limes was the border defence system of fortifications of the Roman Empire)
                lore_author = pgettext("empire_building",
                    "Saledus warning Lutius that sentries are not adequate protection for the Limes"
                ),
                -- TRANSLATORS: Purpose helptext for an Empire military site: Sentry
                purpose = pgettext("empire_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Empire military site: Sentry
                note = pgettext("empire_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_empire_outpost",
            helptexts = {
                lore = latin_lore(
                    -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                    --    Classical Latin quote meaning:
                    --    "Two were stationed on the other side of the city than the camp: one over the river, the other by
                    --     the river above the camp."
                    _("Binæ contra urbem a castris station erant, una ultra flumen, altera eis flumen supra castra."),
                    -- TRANSLATORS: Lore helptext for an Empire military site: Outpost
                    --    Translation for the classical Latin quote:
                    --    "Binæ contra urbem a castris station erant, una ultra flumen, altera eis flumen supra castra."
                    _("Two were stationed on the other side of the city than the camp: one over the river, the other by"..
                      " the river above the camp.")
                ),
                -- TRANSLATORS: Lore author helptext for an Empire military site: Outpost
                lore_author = pgettext("empire_building",
                    "History of the Empire, Part III, preparation for the battle of Uliginosium"
                ),
                -- TRANSLATORS: Purpose helptext for an Empire military site: Outpost
                purpose = pgettext("empire_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Empire military site: Outpost
                note = pgettext("empire_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_empire_barrier",
            helptexts = {
                lore = latin_lore(
                    -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                    --    Classical Latin quote meaning:
                    --    "The die is cast!"
                    _("Alea iacta est!"),
                    -- TRANSLATORS: Lore helptext for an Empire military site: Barrier
                    --    Translation for the classical Latin quote:
                    --    "Alea iacta est!"
                    _("The die is cast!")
                ),
                -- TRANSLATORS: Lore author helptext for an Empire military site: Barrier
                lore_author = pgettext("empire_building",
                    "Rebel general Certus Ignavus Fidelius upon entering the limits of Fremil to"..
                    " overthrow the government"
                ),
                -- TRANSLATORS: Purpose helptext for an Empire military site: Barrier
                purpose = pgettext("empire_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Empire military site: Barrier
                note = pgettext("empire_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_empire_tower",
            helptexts = {
                lore = latin_lore(
                    -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                    --    Classical Latin quote meaning:
                    --    "I came, I saw, I conquered!"
                    _("Veni, Vidi, Vici!"),
                    -- TRANSLATORS: Lore helptext for an Empire military site: Tower
                    --    Translation for the classical Latin quote:
                    --    "Veni, Vidi, Vici!"
                    _("I came, I saw, I conquered!")
                ),
                -- TRANSLATORS: Lore author helptext for an Empire military site: Tower
                lore_author = pgettext("empire_building",
                    "General Claudius Cæcus Cessus reporting a quick victory over the Barbarians thanks to "..
                    "the superior vision of a tower"
                ),
                -- TRANSLATORS: Purpose helptext for an Empire military site: Tower
                purpose = pgettext("empire_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Empire military site: Tower
                note = pgettext("empire_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_empire_fortress",
            helptexts = {
                lore = latin_lore(
                    -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                    --    Classical Latin quote meaning:
                    --    "If you want peace, prepare for war."
                    _("Si vis pacem, para bellum."),
                    -- TRANSLATORS: Lore helptext for an Empire production site: Fortress
                    --    Translation for the classical Latin quote:
                    --    "Si vis pacem, para bellum."
                    _("If you want peace, prepare for war.")
                ),
                -- TRANSLATORS: Lore author helptext for an Empire military site: Fortress
                lore_author = pgettext("empire_building", "Saledus arguing with Amalea"),
                -- TRANSLATORS: Purpose helptext for an Empire military site: Fortress
                purpose = pgettext("empire_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Empire military site: Fortress
                note = pgettext("empire_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_empire_castle",
            helptexts = {
                lore = latin_lore(
                    -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                    --    Adaptation of a classical Latin quote meaning:
                    --    "Furthermore, I think that Al’thunran must be destroyed!"
                    _("Ceterum autem censeo Althunranam esse delendam!"),
                    -- TRANSLATORS: Lore helptext for an Empire military site: Castle
                    --    Translation for the adapted classical Latin quote:
                    --    "Ceterum autem censeo Althunranam esse delendam!"
                    _("Furthermore, I think that Al’thunran must be destroyed!")
                ),
                -- TRANSLATORS: Lore author helptext for an Empire military site: Castle
                lore_author = pgettext("empire_building",
                    "Saledus in the Senate, urging final victory over the Barbarians"
                ),
                -- TRANSLATORS: Purpose helptext for an Empire military site: Castle
                purpose = pgettext("empire_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for an Empire military site: Castle
                note = pgettext("empire_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        -- Frisian Military Sites
        {
            name = "europeans_frisians_wooden_tower",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Frisian military site: Wooden Tower
                purpose = pgettext("frisians_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for a Frisian military site: Wooden Tower
                note = pgettext("frisians_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_frisians_wooden_tower_high",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Frisian military site: High Wooden Tower
                purpose = pgettext("frisians_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for a Frisian military site: High Wooden Tower
                note = pgettext("frisians_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_frisians_sentinel",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Frisian military site: Sentinel
                purpose = pgettext("frisians_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for a Frisian military site: Sentinel
                note = pgettext("frisians_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_frisians_outpost",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Frisian military site: Outpost
                purpose = pgettext("frisians_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for a Frisian military site: Outpost
                note = pgettext("frisians_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_frisians_tower",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Frisian military site: Tower
                purpose = pgettext("frisians_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for a Frisian military site: Tower
                note = pgettext("frisians_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
            }
        },
        {
            name = "europeans_frisians_fortress",
            helptexts = {
                -- TRANSLATORS: Purpose helptext for a Frisian military site: Fortress
                purpose = pgettext("frisians_building", "Garrisons soldiers to expand your territory."),
                -- TRANSLATORS: Note helptext for a Frisian military site: Fortress
                note = pgettext("frisians_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
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
        pgettext("warehousename", "Europa"),
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
    carriers = { "amazons_carrier", "atlanteans_carrier", "barbarians_carrier", "empire_carrier", "frisians_carrier", },
    -- carriers = {"amazons_carrier", "atlanteans_carrier", "barbarians_carrier", "empire_carrier", "frisians_carrier", "amazons_tapir", "atlanteans_horse", "barbarians_ox", "empire_donkey", "frisians_reindeer"},
    ferry = "atlanteans_ferry",
    geologist = "europeans_geologist",
    port = "europeans_atlanteans_port",
    scouts_house = "europeans_scouts_house_basic",
    ship = "europeans_ship",
    soldier = "europeans_soldier",

    fastplace = {
        barracks = "europeans_big_barracks",
    },
}

pop_textdomain()
