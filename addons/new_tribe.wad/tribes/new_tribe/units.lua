descriptions = wl.Descriptions()

image_dirname = path.dirname(__file__)

push_textdomain("new_tribe.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

descriptions:new_tribe {
   name = "new_tribe",
   animation_directory = image_dirname,
   animations = {
      frontier = { hotspot = {1, 19} },
      flag = { hotspot = {14, 38}},
      bridge_normal_e = { hotspot = {-2, 12} },
      bridge_busy_e = { hotspot = {-2, 12} },
      bridge_normal_se = { hotspot = {5, 2} },
      bridge_busy_se = { hotspot = {5, 2} },
      bridge_normal_sw = { hotspot = {36, 3} },
      bridge_busy_sw = { hotspot = {36, 3} }
   },

   bridge_height = 8,

   -- Image file paths for this tribe's road and waterway textures
   roads = {
      busy = {
         image_dirname .. "roadt_busy.png",
      },
      normal = {
         image_dirname .. "roadt_normal.png",
      },
      waterway = {
         image_dirname .. "waterway_0.png",
      },
   },

   resource_indicators = {
      [""] = {
         [0] = "frisians_resi_none",
      },
      resource_coal = {
         [10] = "frisians_resi_coal_1",
         [20] = "frisians_resi_coal_2",
      },
      resource_iron = {
         [10] = "frisians_resi_iron_1",
         [20] = "frisians_resi_iron_2",
      },
      resource_gold = {
         [10] = "frisians_resi_gold_1",
         [20] = "frisians_resi_gold_2",
      },
      resource_stones = {
         [10] = "frisians_resi_stones_1",
         [20] = "frisians_resi_stones_2",
      },
      resource_water = {
         [100] = "frisians_resi_water",
      },
   },

   -- Wares positions in wares windows.
   -- This also gives us the information which wares the tribe uses.
   -- Each subtable is a column in the wares windows.
   wares_order = {
      {
         -- Building Materials
         {
            name = "granite",
            default_target_quantity = 30,
            preciousness = 0,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Granite, part 1
                  pgettext("ware", "Granite is a basic building material."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Granite, part 2
                  pgettext("newtribe_ware", "The Empire produces granite blocks in quarries and marble mines.")
               }
            }
         },
         {
            name = "log",
            preciousness = 14,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Log, part 1
                  pgettext("ware", "Logs are an important basic building material. They are produced by felling trees."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Log, part 2
                  pgettext("newtribe_ware", "Imperial lumberjacks fell the trees; foresters take care of the supply of trees. Logs are also used by the charcoal kiln, the toolsmithy and the sawmill.")
               }
            }
         },
         {
            name = "planks",
            default_target_quantity = 20,
            preciousness = 10,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Planks, part 1
                  pgettext("ware", "Planks are an important building material."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Planks, part 2
                  pgettext("newtribe_ware", "They are produced out of logs by the sawmill."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Planks, part 3
                  pgettext("newtribe_ware", "They are also used by the weapon smithy.")
               }
            }
         },
         {
            name = "wool",
            default_target_quantity = 10,
            preciousness = 2,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Wool
               purpose = pgettext("newtribe_ware", "Wool is the hair of sheep. Weaving mills use it to make cloth.")
            }
         },
         {
            name = "cloth",
            default_target_quantity = 15,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Cloth
               purpose = pgettext("newtribe_ware", "Cloth is needed to build several buildings. It is also consumed in the armor smithy.")
            }
         }
      },
      {
         -- Food
         {
            name = "fish",
            preciousness = 3,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Fish
               purpose = pgettext("newtribe_ware", "Besides bread and meat, fish is also a foodstuff for the Empire. Fish are used in taverns, inns and training sites (arena, colosseum, training camp).")
            }
         },
         {
            name = "meat",
            default_target_quantity = 20,
            preciousness = 2,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Meat, part 1
                  pgettext("ware", "Meat contains a lot of energy, and it is obtained from wild game taken by hunters."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Meat, part 2
                  pgettext("newtribe_ware", "Meat can also be obtained as pork from piggeries. It is used in the inns and taverns to prepare lunch for the miners and is consumed at the training sites (arena, colosseum, training camp).")
               }
            }
         },
         {
            name = "water",
            preciousness = 7,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Water, part 1
                  pgettext("ware", "Water is the essence of life!"),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Water, part 2
                  pgettext("newtribe_ware", "Water is used in the bakery and the brewery. The donkey farm, the sheep farm and the piggery also need to be supplied with water.")
               }
            }
         },
         {
            name = "wheat",
            preciousness = 12,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Wheat, part 1
                  pgettext("ware", "Wheat is essential for survival."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Wheat, part 2
                  pgettext("newtribe_ware", "Wheat is produced by farms and used by mills and breweries. Donkey farms, sheep farms and piggeries also need to be supplied with wheat.")
               }
            }
         },
         {
            name = "flour",
            default_target_quantity = 20,
            preciousness = 9,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Flour
               purpose = pgettext("newtribe_ware", "Flour is produced by the mill out of wheat and is needed in the bakery to produce the tasty Empire bread.")
            }
         },
         {
            name = "empire_bread",
            default_target_quantity = 20,
            preciousness = 7,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Bread
               purpose = pgettext("newtribe_ware", "The bakers of the Empire make really tasty bread out of flour and water. It is used in taverns and inns to prepare rations and meals. Bread is also consumed at the training sites (arena, colosseum, training camp).")
            }
         },
         {
            name = "beer",
            default_target_quantity = 15,
            preciousness = 5,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Beer
               purpose = pgettext("newtribe_ware", "This beer is produced in a brewery out of wheat and water. It is consumed by miners in coal and iron mines.")
            }
         },
         {
            name = "grape",
            preciousness = 10,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Grape
               purpose = pgettext("newtribe_ware", "These grapes are the base for a tasty wine. They are harvested in a vineyard and processed in a winery.")
            }
         },
         {
            name = "wine",
            preciousness = 8,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Wine
               purpose = pgettext("newtribe_ware", "This tasty wine is drunk by the miners working the marble and gold mines. It is produced in a winery.")
            }
         },
         {
            name = "ration",
            default_target_quantity = 20,
            preciousness = 4,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Ration, part 1
                  pgettext("ware", "A small bite to keep miners strong and working. The scout also consumes rations on his scouting trips."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Ration, part 2
                  pgettext("newtribe_ware", "Rations are produced in a tavern out of fish or meat or bread.")
               }
            }
         },
         {
            name = "meal",
            default_target_quantity = 20,
            preciousness = 4,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Meal
               purpose = pgettext("newtribe_ware", "A real meal is made in inns out of bread and fish/meat. It satisfies the needs of miners in deep mines.")
            }
         }
      },
      {
         -- Mining
         {
            name = "marble",
            default_target_quantity = 30,
            preciousness = 3,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Marble
               purpose = pgettext("newtribe_ware", "Marble is the beautiful stone which is cut out of the mountains or produced in a quarry. Marble is used as a building material and gets chiseled into marble columns in the stonemason’s house.")
            }
         },
         {
            name = "marble_column",
            default_target_quantity = 10,
            preciousness = 5,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Marble Column
               purpose = pgettext("newtribe_ware", "Marble columns represent the high culture of the Empire, so they are needed for nearly every larger building. They are produced out of marble at a stonemason’s house.")
            }
         },
         {
            name = "coal",
            default_target_quantity = 20,
            preciousness = 10,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Coal, part 1
                  pgettext("ware", "Coal is mined in coal mines or produced out of logs by a charcoal kiln."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Coal, part 2
                  pgettext("newtribe_ware", "The fires of the Empire smelting works, armor smithies and weapon smithies are usually fed with coal.")
               }
            }
         },
         {
            name = "iron_ore",
            default_target_quantity = 15,
            preciousness = 4,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Iron Ore, part 1
                  pgettext("default_ware", "Iron ore is mined in iron mines."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Iron Ore, part 2
                  pgettext("newtribe_ware", "It is smelted in a smelting works to retrieve the iron.")
               }
            }
         },
         {
            name = "iron",
            default_target_quantity = 20,
            preciousness = 4,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Iron, part 1
                  pgettext("ware", "Iron is smelted out of iron ores."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Iron, part 2
                  pgettext("newtribe_ware", "It is produced by the smelting works. Weapons, armor and tools are made of iron.")
               }
            }
         },
         {
            name = "gold_ore",
            default_target_quantity = 15,
            preciousness = 2,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Gold Ore, part 1
                  pgettext("ware", "Gold ore is mined in a gold mine."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Gold Ore, part 2
                  pgettext("newtribe_ware", "Smelted in a smelting works, it turns into gold which is used as a precious building material and to produce weapons and armor.")
               }
            }
         },
         {
            name = "gold",
            default_target_quantity = 20,
            preciousness = 2,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Gold, part 1
                  pgettext("ware", "Gold is the most valuable of all metals, and it is smelted out of gold ore."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Gold, part 2
                  pgettext("newtribe_ware", "It is produced by the smelting works. Armor and weapons are embellished with gold in the armor smithy and the weapon smithy.")
               }
            }
         }
      },
      {
         -- Tools
         {
            name = "pick",
            default_target_quantity = 2,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Pick
               purpose = pgettext("newtribe_ware", "Picks are used by stonemasons and miners. They are produced by the toolsmith.")
            }
         },
         {
            name = "felling_ax",
            default_target_quantity = 3,
            preciousness = 1,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Felling Ax, part 1
                  pgettext("ware", "The felling ax is the tool to chop down trees."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Felling Ax, part 2
                  pgettext("newtribe_ware", "Felling axes are used by lumberjacks and produced by the toolsmithy.")
               }
            }
         },
         {
            name = "saw",
            default_target_quantity = 1,
            preciousness = 0,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Saw
               purpose = pgettext("newtribe_ware", "This saw is needed by the carpenter. It is produced by the toolsmith.")
            }
         },
         {
            name = "shovel",
            default_target_quantity = 1,
            preciousness = 0,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Shovel, part 1
                  pgettext("ware", "Shovels are needed for the proper handling of plants."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Shovel, part 2
                  pgettext("newtribe_ware", "Therefore the forester and the vine farmer use them. They are produced by the toolsmith.")
               }
            }
         },
         {
            name = "hammer",
            default_target_quantity = 2,
            preciousness = 1,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Hammer, part 1
                  pgettext("ware", "The hammer is an essential tool."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Hammer, part 2
                  pgettext("newtribe_ware", "Geologists, builders, weaponsmiths and armorsmiths all need a hammer. Make sure you’ve always got some in reserve! They are produced by the toolsmith.")
               }
            }
         },
         {
            name = "fishing_rod",
            default_target_quantity = 1,
            preciousness = 0,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Fishing Rod, part 1
                  pgettext("ware", "Fishing rods are needed by fishers to catch fish."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Fishing Rod, part 2
                  pgettext("newtribe_ware", "They are produced by the toolsmith.")
               }
            }
         },
         {
            name = "fishing_net",
            default_target_quantity = 1,
            preciousness = 0,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Fishing Rod, part 1
                  pgettext("ware", "Fishing nets are needed by fishers to catch fish."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Fishing Rod, part 2
                  pgettext("newtribe_ware", "They are produced by the toolsmith.")
               }
            }
         },
         {
            name = "hunting_spear",
            default_target_quantity = 1,
            preciousness = 0,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Hunting Spear, part 1
                  pgettext("ware", "This spear is light enough to be thrown, but heavy enough to kill any animal in one blow. It is only used by hunters."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Hunting Spear, part 2
                  pgettext("newtribe_ware", "They are produced by the toolsmith.")
               }
            }
         },
         {
            name = "scythe",
            default_target_quantity = 1,
            preciousness = 0,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Scythe, part 1
                  pgettext("ware", "The scythe is the tool of the farmers."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Scythe, part 2
                  pgettext("newtribe_ware", "Scythes are produced by the toolsmith.")
               }
            }
         },
         {
            name = "bread_paddle",
            default_target_quantity = 1,
            preciousness = 0,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Bread Paddle, part 1
                  pgettext("ware", "The bread paddle is the tool of the baker, each baker needs one."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Bread Paddle, part 2
                  pgettext("newtribe_ware", "Bread paddles are produced by the toolsmith.")
               }
            }
         },
         {
            name = "basket",
            default_target_quantity = 1,
            preciousness = 0,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Basket
               purpose = pgettext("newtribe_ware", "This basket is needed by the vine farmer for harvesting the grapes. It is produced by the toolsmith.")
            }
         },
         {
            name = "kitchen_tools",
            default_target_quantity = 1,
            preciousness = 0,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Kitchen Tools
               purpose = pgettext("newtribe_ware", "Kitchen tools are needed for preparing rations and meals. They are produced in a toolsmithy and used in taverns and inns.")
            }
         },
         {
            name = "fire_tongs",
            default_target_quantity = 1,
            preciousness = 0,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Fire Tongs, part 1
                  pgettext("ware", "Fire tongs are the tools for smelting ores."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: Fire Tongs, part 2
                  pgettext("newtribe_ware", "They are used in the smelting works and produced by the toolsmith.")
               }
            }
         }
      },
      {
         -- Weapons & Armor
         {
            name = "spear_wooden",
            default_target_quantity = 30,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Wooden Spear
               purpose = pgettext("newtribe_ware", "This wooden spear is the basic weapon in the Empire military system. It is produced in the weapon smithy. In combination with a helmet, it is the equipment to fit out young soldiers.")
            }
         },
         {
            name = "spear",
            default_target_quantity = 1,
            preciousness = 0,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Spear
               purpose = pgettext("newtribe_ware", "This spear has an iron spike. It is produced in a weapon smithy and used in a training camp – together with food – to train soldiers from attack level 0 to attack level 1.")
            }
         },
         {
            name = "spear_advanced",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Advanced Spear
               purpose = pgettext("newtribe_ware", "This is an advanced spear with a steel tip. It is produced in a weapon smithy and used in a training camp – together with food – to train soldiers from attack level 1 to level 2.")
            }
         },
         {
            name = "spear_heavy",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Heavy Spear
               purpose = pgettext("newtribe_ware", "This is a strong spear with a steel-tip and a little blade. It is produced in the weapon smithy and used in the training camp – together with food – train soldiers from attack level 2 to level 3.")
            }
         },
         {
            name = "spear_war",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: War Spear
               purpose = pgettext("newtribe_ware", "This is the best and sharpest weapon the Empire weaponsmith creates for the soldiers. It is used in the training camp – together with food – to train soldiers from attack level 3 to level 4.")
            }
         },
         {
            name = "armor_helmet",
            default_target_quantity = 30,
            preciousness = 2,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Helmet
               purpose = pgettext("newtribe_ware", "The helmet is the basic defense of a warrior. It is produced in an armor smithy. In combination with a wooden spear, it is the equipment to fit out young soldiers. Helmets are also used in training camps – together with food – to train soldiers from health level 0 to level 1.")
            }
         },
         {
            name = "armor",
            default_target_quantity = 1,
            preciousness = 0,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Armor
               purpose = pgettext("newtribe_ware", "Basic armor for Empire soldiers. It is produced in the armor smithy and used in the training camp – together with food – to train soldiers from health level 1 to level 2.")
            }
         },
         {
            name = "armor_chain",
            default_target_quantity = 1,
            preciousness = 0,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Chain Armor
               purpose = pgettext("newtribe_ware", "The chain armor is a medium armor for Empire soldiers. It is produced in an armor smithy and used in a training camp – together with food – to train soldiers from health level 2 to level 3.")
            }
         },
         {
            name = "armor_gilded",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Gilded Armor
               purpose = pgettext("newtribe_ware", "The gilded armor is the strongest armor an Empire soldier can have. It is produced in the armor smithy and used in the training camp – together with food – to train soldiers from health level 3 to level 4.")
            }
         }
      }
   },
   -- Workers positions in workers windows.
   -- This also gives us the information which workers the tribe uses.
   -- Each subtable is a column in the workers windows.
   workers_order = {
      {
         -- Carriers
         {
            name = "barbarians_carrier",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Carrier
               purpose = pgettext("newtribe_worker", "Carries items along your roads.")
            }
         },
         {
            name = "atlanteans_carrier",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Carrier
               purpose = pgettext("newtribe_worker", "Carries items along your roads.")
            }
         },
         {
            name = "empire_carrier",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Carrier
               purpose = pgettext("newtribe_worker", "Carries items along your roads.")
            }
         },
         {
            name = "empire_ferry",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Ferry
               purpose = pgettext("newtribe_worker", "Ships wares across narrow rivers.")
            }
         },
         {
            name = "empire_donkey",
            default_target_quantity = 10,
            preciousness = 2,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Donkey
               purpose = pgettext("newtribe_worker", "Donkeys help to carry items along busy roads. They are reared in a donkey farm.")
            }
         },
         {
            name = "empire_donkeybreeder",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Donkey Breeder
               purpose = pgettext("newtribe_worker", "Breeds cute and helpful donkeys for adding them to the transportation system.")
            }
         }
      },
      {
         -- Building Materials
         {
            name = "empire_stonemason",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Stonemason
               purpose = pgettext("newtribe_worker", "Cuts blocks of granite and marble out of rocks in the vicinity.")
            }
         },
         {
            name = "empire_carpenter",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Carpenter
               purpose = pgettext("newtribe_worker", "Works in the sawmill.")
            }
         },
         {
            name = "empire_lumberjack",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Lumberjack
               purpose = pgettext("newtribe_worker", "Fells trees.")
            }
         },
         {
            name = "empire_forester",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Forester
               purpose = pgettext("newtribe_worker", "Plants trees.")
            }
         },
         {
            name = "empire_builder",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Builder
               purpose = pgettext("newtribe_worker", "Works at construction sites to raise new buildings.")
            }
         },
         {
            name = "empire_shepherd",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Shepherd
               purpose = pgettext("newtribe_worker", "Keeping sheep.")
            }
         },
         {
            name = "empire_weaver",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Weaver
               purpose = pgettext("newtribe_worker", "Produces cloth for ships and soldiers.")
            }
         },
         {
            name = "empire_shipwright",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Shipwright
               purpose = pgettext("newtribe_worker", "Works at the shipyard and constructs new ships.")
            }
         }
      },
      {
         -- Food
         {
            name = "atlanteans_fisher",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Fisher
               purpose = pgettext("newtribe_worker", "Catches fish in the sea.")
            }
         },
         {
            name = "empire_hunter",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Hunter
               purpose = pgettext("newtribe_worker", "The hunter brings fresh, raw meat to the colonists.")
            }
         },
         {
            name = "empire_farmer",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Farmer
               purpose = pgettext("newtribe_worker", "Plants fields.")
            }
         },
         {
            name = "empire_miller",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Miller
               purpose = pgettext("newtribe_worker", "Grinds wheat to produce flour.")
            }
         },
         {
            name = "empire_baker",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Baker
               purpose = pgettext("newtribe_worker", "Bakes bread for workers.")
            }
         },
         {
            name = "empire_brewer",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Brewer
               purpose = pgettext("newtribe_worker", "Produces beer.")
            }
         },
         {
            name = "empire_vinefarmer",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Vine Farmer
               purpose = pgettext("newtribe_worker", "Grows grapevines.")
            }
         },
         {
            name = "empire_vintner",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Vintner
               purpose = pgettext("newtribe_worker", "Produces wine.")
            }
         },
         {
            name = "empire_pigbreeder",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Pig Breeder
               purpose = pgettext("newtribe_worker", "Breeds pigs.")
            }
         },
         {
            name = "empire_innkeeper",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Innkeeper
               purpose = pgettext("newtribe_worker", "Produces food for miners.")
            }
         }
      },
      {
         -- Mining
         {
            name = "empire_geologist",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Geologist
               purpose = pgettext("newtribe_worker", "Discovers resources for mining.")
            }
         },
         {
            name = "empire_miner",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Miner
               purpose = pgettext("newtribe_worker", "Works deep in the mines to obtain coal, iron, gold or marble.")
            }
         },
         {
            name = "empire_miner_master",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Master Miner
               purpose = pgettext("newtribe_worker", "Works deep in the mines to obtain coal, iron, gold or marble.")
            }
         },
         {
            name = "empire_charcoal_burner",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Charcoal Burner
               purpose = pgettext("newtribe_worker", "Burns coal.")
            }
         },
         {
            name = "empire_smelter",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Smelter
               purpose = pgettext("newtribe_worker", "Smelts ores into metal.")
            }
         }
      },
      {
         -- Tools
         {
            name = "empire_toolsmith",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Toolsmith
               purpose = pgettext("newtribe_worker", "Produces tools for the workers.")
            }
         }
      },
      {
         -- Military
         {
            name = "empire_recruit",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Recruit
               purpose = pgettext("newtribe_worker", "Eager to become a soldier and defend his tribe!")
            }
         },
         {
            name = "empire_soldier",
            default_target_quantity = 10,
            preciousness = 5,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Soldier
               purpose = pgettext("newtribe_worker", "Defend and Conquer!")
            }
         },
         {
            name = "empire_trainer",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Trainer
               purpose = pgettext("newtribe_worker", "Trains the soldiers.")
            }
         },
         {
            name = "empire_weaponsmith",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Weaponsmith
               purpose = pgettext("newtribe_worker", "Produces weapons for the soldiers.")
            }
         },
         {
            name = "empire_armorsmith",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Armorsmith
               purpose = pgettext("newtribe_worker", "Produces armor for the soldiers.")
            }
         },
         {
            name = "barbarians_scout",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Scout
               purpose = pgettext("newtribe_worker", "Scouts like Scotty the scout scouting unscouted areas in a scouty fashion.")
               -- (c) WiHack Team 02.01.2010
            }
         }
      }
   },

   immovables = {
      {
         name = "ashes",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: Ashes
            purpose = _("The remains of a destroyed building.")
         }
      },
      {
         name = "destroyed_building",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: Destroyed Building
            purpose = _("The remains of a destroyed building.")
         }
      },
      {
         name = "wheatfield_tiny",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: Wheat field
            purpose = _("This field has just been planted.")
         }
      },
      {
         name = "wheatfield_small",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: Wheat field
            purpose = _("This field is growing.")
         }
      },
      {
         name = "wheatfield_medium",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: Wheat field
            purpose = _("This field is growing.")
         }
      },
      {
         name = "wheatfield_ripe",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: Wheat field
            purpose = _("This field is ready for harvesting.")
         }
      },
      {
         name = "wheatfield_harvested",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: Wheat field
            purpose = _("This field has been harvested.")
         }
      },
      {
         name = "grapevine_tiny",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: Grapevine
            purpose = _("This grapevine has just been planted.")
         }
      },
      {
         name = "grapevine_small",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: Grapevine
            purpose = _("This grapevine is growing.")
         }
      },
      {
         name = "grapevine_medium",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: Grapevine
            purpose = _("This grapevine is growing.")
         }
      },
      {
         name = "grapevine_ripe",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: Grapevine
            purpose = _("This grapevine is ready for harvesting.")
         }
      },
      {
         name = "frisians_resi_none",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe resource indicator: No resources
            purpose = _("There are no resources in the ground here.")
         }
      },
      {
         name = "frisians_resi_water",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe resource indicator: Water
            purpose = _("There is water in the ground here that can be pulled up by a well.")
         }
      },
      {
         name = "frisians_resi_coal_1",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Coal, part 1
               _("Coal veins contain coal that can be dug up by coal mines."),
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Coal, part 2
               _("There is only a little bit of coal here.")
            }
         }
      },
      {
         name = "frisians_resi_iron_1",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Iron, part 1
               _("Iron veins contain iron ore that can be dug up by iron mines."),
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Iron, part 2
               _("There is only a little bit of iron here.")
            }
         }
      },
      {
         name = "frisians_resi_gold_1",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Gold, part 1
               _("Gold veins contain gold ore that can be dug up by gold mines."),
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Gold, part 2
               _("There is only a little bit of gold here.")
            }
         }
      },
      {
         name = "frisians_resi_stones_1",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Stones, part 1
               _("Marble is a basic building material and can be dug up by a marble mine. You will also get granite from the mine."),
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Stones, part 2
               _("There is only a little bit of marble here.")
            }
         }
      },
      {
         name = "frisians_resi_coal_2",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Coal, part 1
               _("Coal veins contain coal that can be dug up by coal mines."),
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Coal, part 2
               _("There is a lot of coal here.")
            }
         }
      },
      {
         name = "frisians_resi_iron_2",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Iron, part 1
               _("Iron veins contain iron ore that can be dug up by iron mines."),
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Iron, part 2
               _("There is a lot of iron here.")
            }
         }
      },
      {
         name = "frisians_resi_gold_2",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Gold, part 1
               _("Gold veins contain gold ore that can be dug up by gold mines."),
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Gold, part 2
               _("There is a lot of gold here.")
            }
         }
      },
      {
         name = "frisians_resi_stones_2",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Stones, part 1
               _("Marble is a basic building material and can be dug up by a marble mine. You will also get granite from the mine."),
               -- TRANSLATORS: Helptext for a NewTribe resource indicator: Stones, part 2
               _("There is a lot of marble here.")
            }
         }
      },
      {
         name = "empire_shipconstruction",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: Ship Under Construction
            purpose = _("A ship is being constructed at this site.")
         }
      }
   },

   -- The order here also determines the order in lists on screen.
   buildings = {
      -- Warehouses
      {
         name = "atlanteans_headquarters",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe warehouse: Headquarters
            purpose = pgettext("newtribe_building", "Accommodation for your people. Also stores your wares and tools."),
            -- TRANSLATORS: Note Helptext for a NewTribe warehouse: Headquarters
            note = pgettext("newtribe_building", "The headquarters is your main building.")
         }
      },
      {
         name = "empire_warehouse",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe warehouse: Warehouse
            purpose = pgettext("building", "Your workers and soldiers will find shelter here. Also stores your wares and tools.")
         }
      },
      {
         name = "empire_port",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe warehouse: Port
            purpose = pgettext("newtribe_building", "Serves as a base for overseas colonization and trade. Also stores your soldiers, wares and tools.")
         }
      },

      -- Small
      {
         name = "empire_quarry",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Quarry
            purpose = pgettext("newtribe_building", "Cuts blocks of granite and marble out of rocks in the vicinity."),
            -- TRANSLATORS: Note Helptext for a NewTribe production site: Quarry
            note = pgettext("newtribe_building", "The quarry needs rocks to cut within the work area.")
         }
      },
      {
         name = "empire_lumberjacks_house",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Lumberjack's House
            purpose = pgettext("building", "Fells trees in the surrounding area and processes them into logs."),
            -- TRANSLATORS: Note Helptext for a NewTribe production site: Lumberjack's House
            note = pgettext("newtribe_building", "The lumberjack's house needs trees to fell within the work area.")
         }
      },
      {
         name = "empire_foresters_house",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Forester's House
            purpose = pgettext("building", "Plants trees in the surrounding area."),
            -- TRANSLATORS: Note Helptext for a NewTribe production site: Forester's House
            note = pgettext("newtribe_building", "The forester’s house needs free space within the work area to plant the trees.")
         }
      },
      {
         name = "atlanteans_fishers_house",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Fisher's House
            purpose = pgettext("newtribe_building", "Fishes on the coast near the fisher’s house."),
            -- TRANSLATORS: Note Helptext for a NewTribe production site: Fisher's House
            note = pgettext("newtribe_building", "The fisher’s house needs water full of fish within the work area.")
         }
      },
      {
         name = "empire_hunters_house",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Hunter's House
            purpose = pgettext("building", "Hunts animals to produce meat."),
            -- TRANSLATORS: Note Helptext for a NewTribe production site: Hunter's House
            note = pgettext("newtribe_building", "The hunter’s house needs animals to hunt within the work area.")
         }
      },
      {
         name = "barbarians_well",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Well
            purpose = pgettext("building", "Draws water out of the deep.")
         }
      },
      {
         name = "barbarians_scouts_hut",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Scout's House
            purpose = pgettext("building", "Explores unknown territory.")
         }
      },

      -- Medium
      {
         name = "empire_stonemasons_house",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Stonemason's House
            purpose = pgettext("newtribe_building", "Carves marble columns out of marble.")
         }
      },
      {
         name = "empire_sawmill",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Sawmill
            purpose = pgettext("building", "Saws logs to produce planks.")
         }
      },
      {
         name = "empire_mill",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Mill
            purpose = pgettext("building", "Grinds wheat to produce flour."),
            -- TRANSLATORS: Performance Helptext for a NewTribe production site: Mill
            performance = pgettext("newtribe_building", "The miller needs %1% on average to grind wheat into a sack of flour."):bformat(format_seconds(19))
         }
      },
      {
         name = "empire_bakery",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Bakery
            purpose = pgettext("newtribe_building", "Bakes bread for soldiers and miners alike."),
            -- TRANSLATORS: Performance Helptext for a NewTribe production site: Bakery
            performance = pgettext("newtribe_building", "The baker needs %1% on average to bake a loaf of bread."):bformat(format_seconds(34))
         }
      },
      {
         name = "empire_brewery",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Brewery
            purpose = pgettext("building", "Produces beer to keep the miners strong and happy."),
            -- TRANSLATORS: Performance Helptext for a NewTribe production site: Brewery
            performance = pgettext("newtribe_building", "The brewer needs %1% on average to brew a vat of beer."):bformat(format_minutes_seconds(1, 5))
         }
      },
      {
         name = "empire_vineyard",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Vineyard
            purpose = pgettext("newtribe_building", "Plants grapevines and harvests grapes.")
         }
      },
      {
         name = "empire_winery",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Winery
            purpose = pgettext("newtribe_building", "Produces wine.")
         }
      },
      {
         name = "empire_tavern",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Tavern
            purpose = pgettext("building", "Prepares rations to feed the scouts and miners."),
            -- TRANSLATORS: Performance Helptext for a NewTribe production site: Tavern
            performance = pgettext("newtribe_building", "The innkeeper needs %1% on average to prepare a ration."):bformat(format_seconds(36))
         }
      },
      {
         name = "empire_inn",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Inn
            purpose = pgettext("newtribe_building", "Prepares rations for scouts and rations and snacks to feed the miners in all mines."),
            -- TRANSLATORS: Performance Helptext for a NewTribe production site: Inn
            performance = pgettext("newtribe_building", "The innkeeper needs %1% on average to prepare a ration and a meal. If the economy doesn’t need both, the innkeeper needs %2% on average to prepare one ration or one meal."):bformat(format_minutes_seconds(1, 25), format_seconds(48))
         }
      },
      {
         name = "empire_charcoal_kiln",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Charcoal Kiln
            purpose = pgettext("building", "Burns logs into charcoal.")
         }
      },
      {
         name = "empire_smelting_works",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Smelting Works
            purpose = pgettext("building", "Smelts iron ore into iron and gold ore into gold.")
         }
      },
      {
         name = "empire_toolsmithy",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Toolsmithy
            purpose = pgettext("building", "Forges all the tools that your workers need.")
         }
      },
      {
         name = "empire_armorsmithy",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Armor Smithy
            purpose = pgettext("newtribe_building", "Forges armor and helmets that are used for training soldiers’ health in the training camp.")
         }
      },
      {
         name = "empire_barracks",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Barracks
            purpose = pgettext("newtribe_building", "Equips recruits and trains them as soldiers.")
         }
      },

      -- Big
      {
         name = "empire_donkeyfarm",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Donkey Farm
            purpose = pgettext("newtribe_building", "Breeds cute and helpful donkeys for adding them to the transportation system.")
         }
      },
      {
         name = "empire_farm",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Farm
            purpose = pgettext("building", "Sows and harvests wheat."),
            -- TRANSLATORS: Performance Helptext for a NewTribe production site: Farm
            performance = pgettext("newtribe_building", "The farmer needs %1% on average to sow and harvest a sheaf of wheat."):bformat(format_minutes_seconds(1, 20))
         }
      },
      {
         name = "empire_piggery",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Piggery
            purpose = pgettext("newtribe_building", "Breeds pigs for their meat."),
            -- TRANSLATORS: Performance Helptext for a NewTribe production site: Piggery
            performance = pgettext("newtribe_building", "The pig breeder needs %1% on average to raise and slaughter a pig."):bformat(format_minutes(1))
         }
      },
      {
         name = "empire_sheepfarm",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Sheep Farm
            purpose = pgettext("newtribe_building", "Keeps sheep for their wool.")
         }
      },
      {
         name = "empire_weaving_mill",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Weaving Mill
            purpose = pgettext("newtribe_building", "Weaves cloth out of wool.")
         }
      },
      {
         name = "empire_weaponsmithy",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Weapon Smithy
            purpose = pgettext("newtribe_building", "Forges spears to equip the soldiers and to train their attack in the training camp.")
         }
      },

      -- Mines
      {
         name = "empire_marblemine",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Marble Mine
               pgettext("newtribe_building", "Carves marble and granite out of the rock in mountain terrain.")
            }
         }
      },
      {
         name = "empire_marblemine_deep",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Deep Marble Mine
            purpose = pgettext("newtribe_building", "Carves marble and granite out of the rock in mountain terrain.")
         }
      },
      {
         name = "empire_coalmine",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Coal Mine
            purpose = pgettext("building", "Digs coal out of the ground in mountain terrain.")
         }
      },
      {
         name = "empire_coalmine_deep",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Deep Coal Mine
            purpose = pgettext("building", "Digs coal out of the ground in mountain terrain."),
         }
      },
      {
         name = "empire_ironmine",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Iron Mine
            purpose = pgettext("building", "Digs iron ore out of the ground in mountain terrain.")
         }
      },
      {
         name = "empire_ironmine_deep",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Deep Iron Mine
            purpose = pgettext("building", "Digs iron ore out of the ground in mountain terrain.")
         }
      },
      {
         name = "empire_goldmine",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Gold Mine
            purpose = pgettext("building", "Digs gold ore out of the ground in mountain terrain.")
         }
      },
      {
         name = "empire_goldmine_deep",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Deep Gold Mine
            purpose = pgettext("building", "Digs gold ore out of the ground in mountain terrain.")
         }
      },

      -- Training Sites
      {
         name = "empire_arena",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Purpose Helptext for a NewTribe training site: Arena, part 1
               pgettext("newtribe_building", "Trains soldiers in ‘Evade’."),
               -- TRANSLATORS: Purpose Helptext for a NewTribe training site: Arena, part 2
               pgettext("newtribe_building", "‘Evade’ increases the soldier’s chance not to be hit by the enemy and so to remain totally unaffected.")
            },
            -- TRANSLATORS: Note Helptext for a NewTribe training site: Arena
            note = pgettext("newtribe_building", "Imperial soldiers cannot be trained in ‘Defense’ and will remain at the level with which they came.")
         }
      },
      {
         name = "empire_colosseum",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Purpose Helptext for a NewTribe training site: Colosseum, part 1
               pgettext("newtribe_building", "Trains soldiers in ‘Evade’."),
               -- TRANSLATORS: Purpose Helptext for a NewTribe training site: Colosseum, part 2
               pgettext("newtribe_building", "‘Evade’ increases the soldier’s chance not to be hit by the enemy and so to remain totally unaffected.")
            },
            -- TRANSLATORS: Note Helptext for a NewTribe training site: Colosseum
            note = pgettext("newtribe_building", "Imperial soldiers cannot be trained in ‘Defense’ and will remain at the level with which they came.")
         }
      },
      {
         name = "empire_trainingcamp",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Purpose Helptext for a NewTribe training site: Training Camp, part 1
               pgettext("newtribe_building", "Trains soldiers in ‘Attack’ and in ‘Health’."),
               -- TRANSLATORS: Purpose Helptext for a NewTribe training site: Training Camp, part 2
               pgettext("newtribe_building", "Equips the soldiers with all necessary weapons and armor parts.")
            },
            -- TRANSLATORS: Note Helptext for a NewTribe training site: Training Camp
            note = pgettext("newtribe_building", "Imperial soldiers cannot be trained in ‘Defense’ and will remain at the level with which they came.")
         }
      },

      -- Military Sites
      {
         name = "empire_blockhouse",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe military site: Blockhouse
            purpose = pgettext("building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note Helptext for a NewTribe military site: Blockhouse
            note = pgettext("building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
         }
      },
      {
         name = "empire_sentry",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe military site: Sentry
            purpose = pgettext("building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note Helptext for a NewTribe military site: Sentry
            note = pgettext("building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
         }
      },
      {
         name = "empire_outpost",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe military site: Outpost
            purpose = pgettext("building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note Helptext for a NewTribe military site: Outpost
            note = pgettext("building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
         }
      },
      {
         name = "empire_barrier",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe military site: Barrier
            purpose = pgettext("building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note Helptext for a NewTribe military site: Barrier
            note = pgettext("building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
         }
      },
      {
         name = "empire_tower",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe military site: Tower
            purpose = pgettext("building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note Helptext for a NewTribe military site: Tower
            note = pgettext("building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
         }
      },
      {
         name = "empire_fortress",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe military site: Fortress
            purpose = pgettext("building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note Helptext for a NewTribe military site: Fortress
            note = pgettext("building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
         }
      },
      {
         name = "empire_castle",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe military site: Castle
            purpose = pgettext("building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note Helptext for a NewTribe military site: Castle
            note = pgettext("building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
         }
      },

      -- Seafaring/Ferry Sites - these are only displayed on seafaring/ferry maps
      {
         name = "empire_ferry_yard",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Ferry Yard
            purpose = pgettext("building", "Builds ferries."),
            -- TRANSLATORS: Note Helptext for a NewTribe production site: Ferry Yard
            note = pgettext("building", "Needs water nearby.")
         }
      },
      {
         name = "empire_shipyard",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Shipyard
            purpose = pgettext("building", "Constructs ships that are used for overseas colonization and for trading between ports.")
         }
      },

      -- Partially Finished Buildings - these are the same 2 buildings for all tribes
      {
         name = "constructionsite",
         helptexts = {
            -- TRANSLATORS: Lore Helptext for a NewTribe building: Construction Site
            lore = pgettext("building", "‘Don’t swear at the builder who is short of building materials.’"),
            -- TRANSLATORS: Lore author Helptext for a NewTribe building: Construction Site
            lore_author = pgettext("building", "Proverb widely used for impossible tasks of any kind"),
            -- TRANSLATORS: Purpose Helptext for a NewTribe building: Construction Site
            purpose = pgettext("building", "A new building is being built at this construction site.")
         }
      },
      {
         name = "dismantlesite",
         helptexts = {
            -- TRANSLATORS: Lore Helptext for a NewTribe building: Dismantle Site
            lore = pgettext("building", "‘New paths will appear when you are willing to tear down the old.’"),
            -- TRANSLATORS: Lore author Helptext for a NewTribe building: Dismantle Site
            lore_author = pgettext("building", "Proverb"),
            -- TRANSLATORS: Purpose Helptext for a NewTribe building: Dismantle Site
            purpose = pgettext("building", "A building is being dismantled at this dismantle site, returning some of the resources that were used during this building’s construction to your tribe’s stores.")
         }
      }
   },

   -- Special types
   builder = "empire_builder",
   carrier = "barbarians_carrier",
   carrier2 = "empire_donkey",
   geologist = "empire_geologist",
   soldier = "empire_soldier",
   ship = "empire_ship",
   ferry = "empire_ferry",
   port = "empire_port",
}

pop_textdomain()
