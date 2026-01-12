descriptions = wl.Descriptions()

image_dirname = path.dirname(__file__) .. "images/"

push_textdomain("lutas_atlanteans.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

-- For lore texts
-- TRANSLATORS: Format string for a Latin quote and its translation
quote_with_translation_format = pgettext("empire_lore", "‘%1%’<br>(%2%)")
function latin_lore(latin, translation)
   return quote_with_translation_format:bformat(latin, translation)
end


wl.Descriptions():new_tribe {
   name = "lutas_atlanteans",
   animation_directory = image_dirname,
   animations = {
      frontier = { hotspot = {6, 18} },
      pinned_note = { hotspot = {18, 67} },
      bridge_normal_e = { hotspot = {0, 17} },
      bridge_busy_e = { hotspot = {0, 17} },
      bridge_normal_se = { hotspot = {8, 8} },
      bridge_busy_se = { hotspot = {8, 8} },
      bridge_normal_sw = { hotspot = {40, 8} },
      bridge_busy_sw = { hotspot = {40, 8} }
   },
   spritesheets = {
      flag = {
         fps = 10,
         frames = 15,
         columns = 8,
         rows = 2,
         hotspot = { 12, 37 }
      },
   },

   bridge_height = 8,

   collectors_points_table = {
      { ware = "gold", points = 3},
      { ware = "trident_light", points = 2},
      { ware = "trident_long", points = 3},
      { ware = "trident_steel", points = 4},
      { ware = "trident_diamond_double", points = 7},
      { ware = "trident_heavy_double", points = 8},
      { ware = "shield_steel", points = 4},
      { ware = "shield_advanced", points = 7},
      { ware = "tabard", points = 1},
      { ware = "tabard_golden", points = 5},
   },

   -- Image file paths for this tribe's road and waterway textures
   roads = {
      busy = {
         image_dirname .. "roadt_busy.png",
      },
      normal = {
         image_dirname .. "roadt_normal_00.png",
         image_dirname .. "roadt_normal_01.png",
      },
      waterway = {
         image_dirname .. "waterway_0.png",
      },
   },

   resource_indicators = {
      [""] = {
         [0] = "lutas_atlanteans_resi_none",
      },
      resource_coal = {
         [10] = "lutas_atlanteans_resi_coal_1",
         [20] = "lutas_atlanteans_resi_coal_2",
      },
      resource_iron = {
         [10] = "lutas_atlanteans_resi_iron_1",
         [20] = "lutas_atlanteans_resi_iron_2",
      },
      resource_gold = {
         [10] = "lutas_atlanteans_resi_gold_1",
         [20] = "lutas_atlanteans_resi_gold_2",
      },
      resource_stones = {
         [10] = "lutas_atlanteans_resi_stones_1",
         [20] = "lutas_atlanteans_resi_stones_2",
      },
      resource_water = {
         [100] = "lutas_atlanteans_resi_water",
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
            default_target_quantity = 20,
            preciousness = 5,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Granite, part 1
                  pgettext("ware", "Granite is a basic building material."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Granite, part 2
                  pgettext("lutas_atlanteans_ware", "The Atlanteans produce granite blocks in quarries and crystal mines.")
               }
            }
         },
         {
            name = "log",
            preciousness = 14,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Log, part 1
                  pgettext("ware", "Logs are an important basic building material. They are produced by felling trees."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Log, part 2
                  pgettext("lutas_atlanteans_ware", "Atlanteans use logs also as the base for planks, which are used in nearly every building. Besides the sawmill, the charcoal kiln, the toolsmithy and the smokery also need logs for their work.")
               }
            }
         },
         {
            name = "planks",
            default_target_quantity = 40,
            preciousness = 10,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Planks, part 1
                  pgettext("ware", "Planks are an important building material."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Planks, part 2
                  pgettext("lutas_atlanteans_ware", "They are produced out of logs by the sawmill."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Planks, part 3
                  pgettext("lutas_atlanteans_ware", "The weapon smithy and the shipyard also use planks to produce the different tridents and mighty ships.")
               }
            }
         },
         {
            name = "spider_silk",
            default_target_quantity = 15,
            preciousness = 11,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Spider Silk
               purpose = pgettext("lutas_atlanteans_ware", "Spider silk is produced by spiders, which are bred by spider farms. It can be processed into spidercloth or tabards in a weaving mill, or used to make tools in the toolsmithy.")
            }
         },
         {
            name = "spidercloth",
            default_target_quantity = 15,
            preciousness = 7,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Spidercloth
               purpose = pgettext("lutas_atlanteans_ware", "Spidercloth is made out of spider silk in a weaving mill. It is used in the shipyard. Also some higher developed buildings need spidercloth for their construction.")
            }
         },
      },
      {
         -- Food
         {
            name = "fish",
            preciousness = 4,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Fish
               purpose = pgettext("lutas_atlanteans_ware", "Fish is one of the biggest food resources of the Atlanteans. It has to be smoked in a smokery before being delivered to mines, training sites and scouts.")
            }
         },
         {
            name = "smoked_fish",
            default_target_quantity = 30,
            preciousness = 3,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Smoked Fish
               purpose = pgettext("lutas_atlanteans_ware", "As no Atlantean likes raw fish, smoking it in a smokery is the most common way to make it edible.")
            }
         },
         {
            name = "meat",
            preciousness = 2,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Meat, part 1
                  pgettext("ware", "Meat contains a lot of energy, and it is obtained from wild game taken by hunters or from seashells collected by fishers."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Meat, part 2
                  pgettext("lutas_atlanteans_ware", "Meat has to be smoked in a smokery before being delivered to mines and training sites (dungeon, labyrinth and temple).")
               }
            }
         },
         {
            name = "smoked_meat",
            default_target_quantity = 20,
            preciousness = 2,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Smoked Meat
               purpose = pgettext("lutas_atlanteans_ware", "Smoked meat is made out of meat in a smokery. It is delivered to the mines and training sites (labyrinth, dungeon and temple) where the miners and soldiers prepare a nutritious lunch for themselves.")
            }
         },
         {
            name = "water",
            preciousness = 7,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Water, part 1
                  pgettext("ware", "Water is the essence of life!"),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Water, part 2
                  pgettext("lutas_atlanteans_ware", "Water is used in the bakery and the horse and spider farms.")
               }
            }
         },
         {
            name = "corn",
            preciousness = 12,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Corn
               purpose = pgettext("lutas_atlanteans_ware", "This corn is processed in the mill into fine cornmeal that every Atlantean baker needs for a good bread. Also horse and spider farms need to be provided with corn.")
            }
         },
         {
            name = "cornmeal",
            default_target_quantity = 15,
            preciousness = 7,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Cornmeal
               purpose = pgettext("lutas_atlanteans_ware", "Cornmeal is produced in a mill out of corn and is one of three parts of the Atlantean bread produced in bakeries.")
            }
         },
         {
            name = "blackroot",
            preciousness = 10,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Blackroot
               purpose = pgettext("lutas_atlanteans_ware", "Blackroots are a special kind of root produced at blackroot farms and processed in mills. The Atlanteans like their strong taste and use their flour for making bread.")
            }
         },
         {
            name = "blackroot_flour",
            default_target_quantity = 0,
            preciousness = 2,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Blackroot Flour
               purpose = pgettext("lutas_atlanteans_ware", "Blackroot Flour is produced in mills out of blackroots. It is used in bakeries to make a tasty bread.")
            }
         },
         {
            name = "atlanteans_bread",
            default_target_quantity = 20,
            preciousness = 5,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Bread
               purpose = pgettext("lutas_atlanteans_ware", "This tasty bread is made in bakeries out of cornmeal, blackroot flour and water. It is appreciated as basic food by miners, scouts and soldiers in training sites (labyrinth, dungeon and temple).")
            }
         }
      },
      {
         -- Mining
         {
            name = "quartz",
            default_target_quantity = 5,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Quartz
               purpose = pgettext("lutas_atlanteans_ware", "These transparent quartz gems are used to build some exclusive buildings. They are produced in crystal mines.")
            }
         },
         {
            name = "diamond",
            default_target_quantity = 5,
            preciousness = 2,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Diamond
               purpose = pgettext("lutas_atlanteans_ware", "These wonderful diamonds are used to build some exclusive buildings. They are mined in crystal mines.")
            }
         },
         {
            name = "coal",
            default_target_quantity = 20,
            preciousness = 10,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Coal, part 1
                  pgettext("ware", "Coal is mined in coal mines or produced out of logs by a charcoal kiln."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Coal, part 2
                  pgettext("lutas_atlanteans_ware", "The Atlantean fires in smelting works, armor smithies and weapon smithies are fed with coal.")
               }
            }
         },
         {
            name = "iron_ore",
            default_target_quantity = 15,
            preciousness = 4,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Iron Ore, part 1
                  pgettext("default_ware", "Iron ore is mined in iron mines."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Iron Ore, part 2
                  pgettext("lutas_atlanteans_ware", "It is smelted in a smelting works to retrieve the iron.")
               }
            }
         },
         {
            name = "iron",
            default_target_quantity = 20,
            preciousness = 4,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Iron, part 1
                  pgettext("ware", "Iron is smelted out of iron ore."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Iron, part 2
                  pgettext("lutas_atlanteans_ware", "It is produced by the smelting works and used in the toolsmithy, armor smithy and weapon smithy.")
               }
            }
         },
         {
            name = "gold_ore",
            default_target_quantity = 15,
            preciousness = 2,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Gold Ore, part 1
                  pgettext("ware", "Gold ore is mined in a gold mine."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Gold Ore, part 2
                  pgettext("lutas_atlanteans_ware", "Smelted in a smelting works, it turns into gold which is used as a precious building material and to produce weapons and armor.")
               }
            }
         },
         {
            name = "gold",
            default_target_quantity = 20,
            preciousness = 2,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Gold, part 1
                  pgettext("ware", "Gold is the most valuable of all metals, and it is smelted out of gold ore."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Gold, part 2
                  pgettext("lutas_atlanteans_ware", "It is produced by the smelting works and used by the armor smithy, the weapon smithy and the gold spinning mill.")
               }
            }
         },
         -- Tools
         {
            name = "pick",
            default_target_quantity = 3,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Pick
               purpose = pgettext("ware", "Picks are used by stonecutters and miners. They are produced by the toolsmith.")
            }
         },
         {
            name = "fire_tongs",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Fire Tongs, part 1
                  pgettext("ware", "Fire tongs are the tools for smelting ores."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Fire Tongs, part 2
                  pgettext("lutas_atlanteans_ware_fire_tongs", "They are used in the smelting works and produced by the toolsmith.")
               }
            }
         }
      },
      {
         {
            name = "saw",
            default_target_quantity = 2,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Saw
               purpose = pgettext("lutas_atlanteans_ware", "The saw is needed by the sawyer, the woodcutter and the toolsmith. It is produced by the toolsmith.")
            }
         },
         {
            name = "shovel",
            default_target_quantity = 2,
            preciousness = 1,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Shovel, part 1
                  pgettext("ware", "Shovels are needed for the proper handling of plants."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Shovel, part 2
                  pgettext("lutas_atlanteans_ware", "Therefore the forester and the blackroot farmer use them. They are produced by the toolsmith.")
               }
            }
         },
         {
            name = "hammer",
            default_target_quantity = 2,
            preciousness = 1,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Hammer, part 1
                  pgettext("ware", "The hammer is an essential tool."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Hammer, part 2
                  pgettext("lutas_atlanteans_ware", "Geologists, builders, weaponsmiths, armorsmiths and shipwrights all need a hammer. Make sure you’ve always got some in reserve! They are produced by the toolsmith.")
               }
            }
         },
         {
            name = "spider_tongs",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Spider Tongs
               purpose = pgettext("lutas_atlanteans_ware", "Spider tongs are used by the spider breeder to handle the spiders. They are produced by the toolsmith.")
            }
         },
         {
            name = "fishing_net",
            default_target_quantity = 2,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Fishing Net
               purpose = pgettext("lutas_atlanteans_ware", "The fishing net is used by the fisher and produced by the toolsmith.")
            }
         },
         {
            name = "buckets",
            default_target_quantity = 2,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Buckets
               purpose = pgettext("lutas_atlanteans_ware", "Big buckets for the fish breeder – produced by the toolsmith.")
            }
         },
         {
            name = "hunting_bow",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Hunting Bow
               purpose = pgettext("lutas_atlanteans_ware", "This bow is used by the Atlantean hunter. It is produced by the toolsmith.")
            }
         },
         {
            name = "hook_pole",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Hook Pole
               purpose = pgettext("lutas_atlanteans_ware", "This hook pole is used by the smoker to suspend all the meat and fish from the top of the smokery. It is created by the toolsmith.")
            }
         },
         {
            name = "scythe",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Scythe, part 1
                  pgettext("ware", "The scythe is the tool of the farmers."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Scythe, part 2
                  pgettext("lutas_atlanteans_ware", "Scythes are produced by the toolsmith.")
               }
            }
         },
         {
            name = "bread_paddle",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Bread Paddle, part 1
                  pgettext("ware", "The bread paddle is the tool of the baker, each baker needs one."),
                  -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Bread Paddle, part 2
                  pgettext("lutas_atlanteans_ware", "Bread paddles are produced by the toolsmith.")
               }
            }
         },
      },
      {
         -- Military
         {
            name = "trident_light",
            default_target_quantity = 30,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Light Trident
               purpose = pgettext("lutas_atlanteans_ware", "This is the basic weapon of the Atlantean soldiers. Together with a tabard, it makes up the equipment of young soldiers. Light tridents are produced in the weapon smithy as are all other tridents.")
            }
         },
         {
            name = "trident_long",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Long Trident
               purpose = pgettext("lutas_atlanteans_ware", "The long trident is the first trident in the training of soldiers. It is produced in the weapon smithy and used in the dungeon – together with food – to train soldiers from attack level 0 to level 1.")
            }
         },
         {
            name = "trident_steel",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Steel Trident
               purpose = pgettext("lutas_atlanteans_ware", "This is the medium trident. It is produced in the weapon smithy and used by advanced soldiers in the dungeon – together with food – to train from attack level 1 to level 2.")
            }
         },
         {
            name = "trident_diamond_double",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Diamond Double Trident
               purpose = pgettext("lutas_atlanteans_ware", "The diamond double trident is one of the best tridents produced by the Atlantean weapon smithy. It is used in a dungeon – together with food – to train soldiers from attack level 2 to level 3.")
            }
         },
         {
            name = "trident_heavy_double",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Heavy Double Trident
               purpose = pgettext("lutas_atlanteans_ware", "This is the most dangerous weapon of the Atlantean military. Only the best of the best soldiers may use it. It is produced in the weapon smithy and used in the dungeon – together with food – to train soldiers from attack level 3 to level 4.")
            }
         },
         {
            name = "shield_steel",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Steel Shield
               purpose = pgettext("lutas_atlanteans_ware", "This steel shield is produced in the armor smithy and used in the labyrinth – together with food – to train soldiers from defense level 0 to level 1.")
            }
         },
         {
            name = "shield_advanced",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Advanced Shield
               purpose = pgettext("lutas_atlanteans_ware", "These advanced shields are used by the best soldiers of the Atlanteans. They are produced in the armor smithy and used in the labyrinth – together with food – to train soldiers from defense level 1 to level 2.")
            }
         },
         {
            name = "tabard",
            default_target_quantity = 30,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Tabard
               purpose = pgettext("lutas_atlanteans_ware", "A tabard and a light trident are the basic equipment for young soldiers. Tabards are produced in the weaving mill and used in the temple – together with food – to improve soldiers’ health from level 0 to level 1.")
            }
         },
         {
            name = "gold_thread",
            default_target_quantity = 5,
            preciousness = 2,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Gold Thread
               purpose = pgettext("lutas_atlanteans_ware", "This thread, made of gold by the gold spinning mill, is used for weaving the exclusive golden tabard in the weaving mill.")
            }
         },
         {
            name = "tabard_golden",
            default_target_quantity = 1,
            preciousness = 1,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean ware: Golden Tabard
               purpose = pgettext("lutas_atlanteans_ware", "Golden tabards are produced in Atlantean weaving mills out of gold thread. They are used in the temple – together with food – to improve soldiers’ health from level 1 to level 2.")
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
            name = "lutas_atlanteans_carrier",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Carrier
               purpose = pgettext("lutas_atlanteans_worker", "Carries items along your roads.")
            }
         },
         {
            name = "lutas_atlanteans_ferry",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Ferry
               purpose = pgettext("lutas_atlanteans_worker", "Ships wares across narrow rivers.")
            }
         },
         {
            name = "lutas_atlanteans_horse",
            default_target_quantity = 10,
            preciousness = 2,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Horse
               purpose = pgettext("lutas_atlanteans_worker", "Horses help to carry items along busy roads. They are reared in a horse farm.")
            }
         },
         {
            name = "lutas_atlanteans_horsebreeder",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Horse Breeder
               purpose = pgettext("lutas_atlanteans_worker", "Breeds the strong Atlantean horses for adding them to the transportation system.")
            }
         }
      },
      {
         -- Building Materials
         {
            name = "lutas_atlanteans_stonecutter",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Stonecutter
               purpose = pgettext("lutas_atlanteans_worker", "Cuts blocks of granite out of rocks in the vicinity.")
            }
         },
         {
            name = "lutas_atlanteans_woodcutter",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Woodcutter
               purpose = pgettext("lutas_atlanteans_worker", "Fells trees.")
            }
         },
         {
            name = "lutas_atlanteans_sawyer",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Sawyer
               purpose = pgettext("lutas_atlanteans_worker", "Saws logs to produce planks.")
            }
         },
         {
            name = "lutas_atlanteans_forester",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Forester
               purpose = pgettext("lutas_atlanteans_worker", "Plants trees.")
            }
         },
         {
            name = "lutas_atlanteans_builder",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Builder
               purpose = pgettext("lutas_atlanteans_worker", "Works at construction sites to raise new buildings.")
            }
         },
         {
            name = "lutas_atlanteans_spiderbreeder",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean female worker: Spider Breeder
               purpose = pgettext("lutas_atlanteans_worker", "Breeds spiders for silk.")
            }
         },
         {
            name = "lutas_atlanteans_weaver",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Weaver
               purpose = pgettext("lutas_atlanteans_worker", "Produces spidercloth for buildings, ships and soldiers.")
            }
         },
         {
            name = "lutas_atlanteans_shipwright",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Shipwright
               purpose = pgettext("lutas_atlanteans_worker", "Works at the shipyard and constructs new ships.")
            }
         }
      },
      {
         -- Food
         {
            name = "lutas_atlanteans_fisher",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Fisher
               purpose = pgettext("lutas_atlanteans_worker", "The fisher fishes delicious fish and collects seashels.")
            }
         },
         {
            name = "lutas_atlanteans_fishbreeder",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Fish Breeder
               purpose = pgettext("lutas_atlanteans_worker", "Breeds fish.")
            }
         },
         {
            name = "lutas_atlanteans_hunter",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Hunter
               purpose = pgettext("lutas_atlanteans_worker", "The hunter brings fresh, raw meat to the colonists.")
            }
         },
         {
            name = "lutas_atlanteans_smoker",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Smoker
               purpose = pgettext("lutas_atlanteans_worker", "Smokes meat and fish.")
            }
         },
         {
            name = "lutas_atlanteans_farmer",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Farmer
               purpose = pgettext("lutas_atlanteans_worker", "Plants and harvests cornfields.")
            }
         },
         {
            name = "lutas_atlanteans_blackroot_farmer",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Blackroot Farmer
               purpose = pgettext("lutas_atlanteans_worker", "Plants and harvests blackroot.")
            }
         },
         {
            name = "lutas_atlanteans_miller",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Miller
               purpose = pgettext("lutas_atlanteans_worker", "Grinds blackroots and corn to produce blackroot flour and cornmeal, respectively.")
            }
         },
         {
            name = "lutas_atlanteans_baker",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Baker
               purpose = pgettext("lutas_atlanteans_worker", "Bakes bread for workers.")
            }
         }
      },
      {
         -- Mining
         {
            name = "lutas_atlanteans_geologist",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Geologist
               purpose = pgettext("lutas_atlanteans_worker", "Discovers resources for mining.")
            }
         },
         {
            name = "lutas_atlanteans_miner",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Miner
               purpose = pgettext("lutas_atlanteans_worker", "Works deep in the mines to obtain coal, iron, gold or precious stones.")
            }
         },
         {
            name = "lutas_atlanteans_charcoal_burner",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Charcoal Burner
               purpose = pgettext("lutas_atlanteans_worker", "Burns coal.")
            }
         },
         {
            name = "lutas_atlanteans_smelter",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Smelter
               purpose = pgettext("lutas_atlanteans_worker", "Smelts ores into metal.")
            }
         },
         -- Tools
         {
            name = "lutas_atlanteans_toolsmith",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Toolsmith
               purpose = pgettext("lutas_atlanteans_worker", "Produces tools for the workers.")
            }
         }
      },
      {
         -- Military
         {
            name = "lutas_atlanteans_recruit",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Recruit
               purpose = pgettext("lutas_atlanteans_worker", "Eager to become a soldier and defend his tribe!")
            }
         },
         {
            name = "lutas_atlanteans_soldier",
            default_target_quantity = 10,
            preciousness = 5,
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Soldier
               purpose = pgettext("lutas_atlanteans_worker", "Defend and Conquer!")
            }
         },
         {
            name = "lutas_atlanteans_trainer",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Trainer
               purpose = pgettext("lutas_atlanteans_worker", "Trains the soldiers.")
            }
         },
         {
            name = "lutas_atlanteans_priestess",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean worker: Priestess
            purpose = pgettext("lutas_atlanteans_worker", "Works in the temple and improves soldiers in ‘Health’."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean worker: Priestess
            note = pgettext("lutas_atlanteans_worker", "The priestess has to pray to the God Lutas on a shore. Make sure she has free access to water. Lutas is showing her his favour when a seashell appears on the cost. This seashell can be collected by a fisher for meat later."),
            }
         },
         {
            name = "lutas_atlanteans_weaponsmith",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Weaponsmith
               purpose = pgettext("lutas_atlanteans_worker", "Produces weapons for the soldiers.")
            }
         },
         {
            name = "lutas_atlanteans_armorsmith",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Armorsmith
               purpose = pgettext("lutas_atlanteans_worker", "Produces armor for the soldiers.")
            }
         },
         {
            name = "lutas_atlanteans_scout",
            helptexts = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean worker: Scout
               purpose = pgettext("lutas_atlanteans_worker", "Scouts like Scotty the scout scouting unscouted areas in a scouty fashion.")
            }
         }
      }
   },

   immovables = {
      {
         name = "ashes",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Ashes
            purpose = _("The remains of a destroyed building.")
         }
      },
      {
         name = "seashell1",
	 helptexts = { 
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Seashell 1
            purpose = _"Fishers can collect this type of seashells for meat. They appear on shores around temple when priestess prays to the God Lutas before improving soldiers health."
         }
      },
      {
         name = "seashell2",
	 helptexts = { 
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Seashell 2
	    purpose = _"Fishers can collect this type of seashells for meat. They appear on shores around temple when priestess prays to the God Lutas before improving soldiers health."
         }
      },
      {
         name = "blackrootfield_tiny",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Blackroot Field
            purpose = _("This field has just been planted.")
         }
      },
      {
         name = "blackrootfield_small",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Blackroot Field
            purpose = _("This field is growing.")
         }
      },
      {
         name = "blackrootfield_medium",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Blackroot Field
            purpose = _("This field is growing.")
         }
      },
      {
         name = "blackrootfield_ripe",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Blackroot Field
            purpose = _("This field is ready for harvesting.")
         }
      },
      {
         name = "blackrootfield_harvested",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Blackroot Field
            purpose = _("This field has been harvested.")
         }
      },
      {
         name = "cornfield_tiny",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Corn Field
            purpose = _("This field has just been planted.")
         }
      },
      {
         name = "cornfield_small",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Corn Field
            purpose = _("This field is growing.")
         }
      },
      {
         name = "cornfield_medium",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Corn Field
            purpose = _("This field is growing.")
         }
      },
      {
         name = "cornfield_ripe",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Corn Field
            purpose = _("This field is ready for harvesting.")
         }
      },
      {
         name = "cornfield_harvested",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Corn Field
            purpose = _("This field has been harvested.")
         }
      },
      {
         name = "destroyed_building",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Destroyed Building
            purpose = _("The remains of a destroyed building.")
         }
      },
      {
         name = "lutas_atlanteans_resi_none",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: No resources
            purpose = _("There are no resources in the ground here.")
         }
      },
      {
         name = "lutas_atlanteans_resi_water",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Water
            purpose = _("There is water in the ground here that can be pulled up by a well.")
         }
      },
      {
         name = "lutas_atlanteans_resi_coal_1",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Coal, part 1
               _("Coal veins contain coal that can be dug up by coal mines."),
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Coal, part 2
               _("There is only a little bit of coal here.")
            }
         }
      },
      {
         name = "lutas_atlanteans_resi_iron_1",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Iron, part 1
               _("Iron veins contain iron ore that can be dug up by iron mines."),
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Iron, part 2
               _("There is only a little bit of iron here.")
            }
         }
      },
      {
         name = "lutas_atlanteans_resi_gold_1",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Gold, part 1
               _("Gold veins contain gold ore that can be dug up by gold mines."),
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Gold, part 2
               _("There is only a little bit of gold here.")
            }
         }
      },
      {
         name = "lutas_atlanteans_resi_stones_1",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Stones, part 1
               _("Precious stones are used in the construction of big buildings. They can be dug up by a crystal mine. You will also get granite from the mine."),
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Stones, part 2
               _("There are only a few precious stones here.")
            }
         }
      },
      {
         name = "lutas_atlanteans_resi_coal_2",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Coal, part 1
               _("Coal veins contain coal that can be dug up by coal mines."),
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Coal, part 2
               _("There is a lot of coal here.")
            }
         }
      },
      {
         name = "lutas_atlanteans_resi_iron_2",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Iron, part 1
               _("Iron veins contain iron ore that can be dug up by iron mines."),
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Iron, part 2
               _("There is a lot of iron here.")
            }
         }
      },
      {
         name = "lutas_atlanteans_resi_gold_2",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Gold, part 1
               _("Gold veins contain gold ore that can be dug up by gold mines."),
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Gold, part 2
               _("There is a lot of gold here.")
            }
         }
      },
      {
         name = "lutas_atlanteans_resi_stones_2",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Stones, part 1
               _("Precious stones are used in the construction of big buildings. They can be dug up by a crystal mine. You will also get granite from the mine."),
               -- TRANSLATORS: Helptext for a Lutas’ Atlantean resource indicator: Stones, part 2
               _("There are many precious stones here.")
            }
         }
      },
      {
         name = "lutas_atlanteans_shipconstruction",
         helptexts = {
            -- TRANSLATORS: Helptext for a Lutas’ Atlantean immovable: Ship Under Construction
            purpose = _("A ship is being constructed at this site.")
         }
      },
      -- non Atlantean immovables used by the woodcutter
      {
         name = "deadtree7",
         helptexts = {
            -- TRANSLATORS: Helptext for an Amazon immovable usable by Atlanteans: Dead Tree
            purpose = _("The remains of an old tree.")
         }
      },
      {
         name = "balsa_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an Amazon immovable usable by Atlanteans: Balsa Tree
            purpose = _("This tree is only planted by the Amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "balsa_black_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an Amazon immovable usable by Atlanteans: Balsa Tree
            purpose = _("This tree is only planted by the Amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "balsa_desert_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an Amazon immovable usable by Atlanteans: Balsa Tree
            purpose = _("This tree is only planted by the Amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "balsa_winter_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an Amazon immovable usable by Atlanteans: Balsa Tree
            purpose = _("This tree is only planted by the Amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "ironwood_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an Amazon immovable usable by Atlanteans: Ironwood Tree
            purpose = _("This tree is only planted by the Amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "ironwood_black_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an Amazon immovable usable by Atlanteans: Ironwood Tree
            purpose = _("This tree is only planted by the Amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "ironwood_desert_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an Amazon immovable usable by Atlanteans: Ironwood Tree
            purpose = _("This tree is only planted by the Amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "ironwood_winter_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an Amazon immovable usable by Atlanteans: Ironwood Tree
            purpose = _("This tree is only planted by the Amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "rubber_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an Amazon immovable usable by Atlanteans: Rubber Tree
            purpose = _("This tree is only planted by the Amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "rubber_black_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an Amazon immovable usable by Atlanteans: Rubber Tree
            purpose = _("This tree is only planted by the Amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "rubber_desert_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an Amazon immovable usable by Atlanteans: Rubber Tree
            purpose = _("This tree is only planted by the Amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "rubber_winter_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an Amazon immovable usable by Atlanteans: Rubber Tree
            purpose = _("This tree is only planted by the Amazon tribe but can be harvested for logs.")
         }
      },
   },

   -- The order here also determines the order in lists on screen.
   buildings = {
      -- Warehouses
      {
         name = "lutas_atlanteans_headquarters",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean warehouse: Headquarters
            purpose = pgettext("lutas_atlanteans_building", "Accommodation for your people. Also stores your wares and tools."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean warehouse: Headquarters
            note = pgettext("lutas_atlanteans_building", "The headquarters is your main building."),
            -- TRANSLATORS: Note lore for a Lutas’ Atlantean production site: Headquarters
            lore = pgettext("lutas_atlanteans_building", "We founded this new colony, now go with Lutas and do the best you can do for your tribe."),
            -- TRANSLATORS: Note lore_autor for a Lutas’ Atlantean production site: Headquarters
            lore_author = pgettext("lutas_atlanteans_building", "Priestess of Lutas inaugurating you as leader of the Atleantean tribe")
         }
      },
      {
         name = "lutas_atlanteans_warehouse",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean warehouse: Warehouse
            purpose = pgettext("lutas_atlanteans_building", "Your workers and soldiers will find shelter here. Also stores your wares and tools. "..
                    "It will help you to stabilize your economy."),
            -- TRANSLATORS: Note lore for a Lutas’ Atlantean production site: Warehouse
            lore = pgettext("lutas_atlanteans_building", "Maybe you think it’s a boring task to store, count and retrieve all this stuff, "..
                     "but do you really want your carriers to walk all the way to your Headquarters?"),
            -- TRANSLATORS: Note lore_autor for a Lutas’ Atlantean production site: Headquarters
            lore_author = pgettext("lutas_atlanteans_building", "Head of the warehouse")
         }
      },
      {
         name = "lutas_atlanteans_port",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean warehouse: Port
            purpose = pgettext("lutas_atlanteans_building", "Serves as a base for overseas colonization and trade. Also stores your soldiers, wares and tools."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean warehouse: Port
            note = pgettext("lutas_atlanteans_building", "Similar to the Headquarters a Port can be attacked and destroyed by an enemy. It is recommendable to send soldiers to defend it."),
            -- TRANSLATORS: Note lore for a Lutas’ Atlantean production site: Port
            lore = pgettext("lutas_atlanteans_building", "This is the building where expeditions will be equipped to boldly go and find new shores."),
            -- TRANSLATORS: Note lore_autor for a Lutas’ Atlantean production site: Port
            lore_author = pgettext("lutas_atlanteans_building", "The designer of the new Expedition ship class, during the opening of a new Port")
         }
      },
      -- Small
      {
         name = "lutas_atlanteans_quarry",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Quarry
            purpose = pgettext("lutas_atlanteans_building", "Cuts blocks of granite out of rocks in the vicinity."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Quarry
            note = pgettext("lutas_atlanteans_building", "The quarry needs rocks to cut within the work area."),
            -- TRANSLATORS: Note lore for a Lutas’ Atlantean production site: Quarry
            lore = pgettext("lutas_atlanteans_building", "You must not assume Atlanteans will play everything soft, there are hard times we cannot avoid."),
            -- TRANSLATORS: Note lore_autor for a Lutas’ Atlantean production site: Quarry
            lore_author = pgettext("lutas_atlanteans_building", "Priestess of Lutas asked why stones are needed for buildings"),
            performance = {
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Quarry, part 1
               pgettext("lutas_atlanteans_building", "This building can produce one granite between %1$s and %2$s, depending on how far the stonecutter has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 9)),
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Quarry, part 2
               pgettext("lutas_atlanteans_building", "In case of slopes or obstacles in the way, the time is increased.")
            }
         }
      },
      {
         name = "lutas_atlanteans_woodcutters_house",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Woodcutter's House
            purpose = pgettext("building", "Fells trees in the surrounding area and processes them into logs."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Woodcutter's House
            note = pgettext("lutas_atlanteans_building", "The woodcutter’s house needs trees to fell within the work area. The woodcutter in this house is %1$s faster than a normal Atlantean woodcutter."):bformat(format_seconds(5)),
            -- TRANSLATORS: Note lore for a Lutas’ Atlantean production site: Woodcutter's House
            lore = pgettext("lutas_atlanteans_building", "We want to fell trees in a clean and dignified way, therefore we use saws. An ax is a tool used by other tribes only."),
            -- TRANSLATORS: Note lore_autor for a Lutas’ Atlantean production site: Woodcutter's House
            lore_author = pgettext("lutas_atlanteans_building", "Atlantean woodcutter asked why saws are used to cut trees"),
            performance = {
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Woodcutter's House, part 1
               pgettext("lutas_atlanteans_building", "This building can produce one log between %1$s and %2$s, depending on how far the woodcutter has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 24)),
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Woodcutter's House, part 2
               pgettext("lutas_atlanteans_building", "In case of slopes or obstacles in the way, the time is increased.")
            }
         }
      },
      {
         name = "lutas_atlanteans_foresters_house",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Forester's House
            purpose = pgettext("building", "Plants trees in the surrounding area."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Forester's House
            note = pgettext("lutas_atlanteans_building", "The forester’s house needs free space within the work area to plant the trees."),
            -- TRANSLATORS: Note lore for a Lutas’ Atlantean production site: Forester's House
            lore = pgettext("lutas_atlanteans_building", [[‘Only after the last tree has been cut<br>]] ..
                                          [[Only after the last forest was devastated<br>]] ..
                                          [[Only after the last piece of green has become bare soil<br>]] ..
                                          [[Then will you find that nature needs to be cared for.’]]),
            -- TRANSLATORS: Note lore_autor for a Lutas’ Atlantean production site: Forester's House
            lore_author = pgettext("lutas_atlanteans_building", "Prophecy of the foresters’ guild"),
            performance = {
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Forester's House, part 1
               pgettext("lutas_atlanteans_building", "The forester plants one tree between %1$s and %2$s, depending on how far he has to walk."):bformat(format_seconds(23), format_seconds(45)),
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Forester's House, part 2
               pgettext("lutas_atlanteans_building", "In case of slopes or obstacles in the way, the time is increased.")
            }
         }
      },
      {
         name = "lutas_atlanteans_fishers_house",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Fisher's House
            purpose = pgettext("lutas_atlanteans_building", "Fishes on the coast near the fisher’s house and collects seashells too."),
            note = {
               -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Fisher's House, part 1
               pgettext("lutas_atlanteans_building", "The fisher’s house needs water full of fish within the work area."),
               -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Fisher's House, part 2
               pgettext("lutas_atlanteans_building", "Build a fish breeder’s house close to the fisher’s house to make sure that you don’t run out of fish."),
               -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Fisher's House, part 3
               pgettext("lutas_atlanteans_building", "Roads and trees along the shoreline block fishing."),
            },
            -- TRANSLATORS: Note lore for a Lutas’ Atlantean production site: Fisher's House use some local fise song as you like
            lore = pgettext("lutas_atlanteans_building", [[‘Take your net and come to the sea<br>]] ..
                                          [[In the early morning the moon ya still see<br>]] ..
                                          [[Collect ya catch by net or by spear,<br>]] ..
                                          [[and don’t forget to give Lutas his share.’]]),
            -- TRANSLATORS: Note lore_autor for a Lutas’ Atlantean production site: Fisher's House
            lore_author = pgettext("lutas_atlanteans_building", "A song from the fishers’ guild"),
            performance = {
               -- TRANSLATORS: Performance helptext for an Atlantean production site: Fisher's House, part 1
               pgettext("lutas_atlanteans_building", "The fisher can catch two fishes and collect one seashell between %1$s and %2$s, depending on how far he has to walk. If there are no seashells, it takes between %3$s and %4$s to catch one fish."):bformat(format_minutes_seconds(1, 11), format_minutes_seconds(2, 37), format_seconds(26), format_seconds(55)),
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Fisher's House, part 2
               pgettext("lutas_atlanteans_building", "In case of slopes or obstacles in the way, the time is increased.")
            }
         }
      },
      {
         name = "lutas_atlanteans_fishbreeders_house",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Fish Breeder's House
            purpose = pgettext("building", "Breeds fish."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Fish Breeder's House
            note = pgettext("lutas_atlanteans_building", "The fish breeder needs open access to the coast."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Fish Breeder's House
            lore = pgettext("lutas_atlanteans_building", [[‘Only after the last duck has been shot down<br>]] ..
                                          [[Only after the last deer has been put to death<br>]] ..
                                          [[Only after the last fish has been caught<br>]] ..
                                          [[Then will you find that spiders are not to be eaten.’]]),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Fish Breeder's House
            lore_author = pgettext("lutas_atlanteans_building", "Prophecy of the fish breeders")
         }
      },
      {
         name = "lutas_atlanteans_hunters_house",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Hunter's House
            purpose = pgettext("building", "Hunts animals to produce meat."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Hunter's House
            note = pgettext("lutas_atlanteans_building", "The hunter’s house needs animals to hunt within the work area."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Hunter's House
            lore = pgettext("lutas_atlanteans_building", "Sometimes we end up in a region with no fish, so we must hunt. "..
                                                   "Game will reproduce by itself, if not hunted too much. But yes, fish is our main meal."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Hunter's House
            lore_author = pgettext("lutas_atlanteans_building", "Hunter answering a fisher"),
            performance = {
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Hunter's House, part 1
               pgettext("lutas_atlanteans_building", "This building can produce one meat between %1$s and %2$s, depending on how far the hunter has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 34)),
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Hunter's House, part 2
               pgettext("lutas_atlanteans_building", "In case of slopes or obstacles in the way, the time is increased.")
            }
         }
      },
      {
         name = "lutas_atlanteans_well",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Well
            purpose = pgettext("building", "Draws water out of the deep."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Well
            note = pgettext("lutas_atlanteans_building", "I hope you have checked this spot with a geologist."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Well
            lore = pgettext("lutas_atlanteans_building", "Well, there is no wellbeing without a well."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Well
            lore_author = pgettext("lutas_atlanteans_building", "Water carrier muttering to himself"),
            performance = {
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Well, part 1
               pgettext("lutas_atlanteans_building", "The carrier needs %s to get one bucket full of water."):bformat(format_seconds(44)),
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Well, part 2
               pgettext("lutas_atlanteans_building", "If the water resource is depleted, the carrier needs %s on average."):bformat(format_minutes_seconds(1, 11))
            }
         }
      },
      {
         name = "lutas_atlanteans_gold_spinning_mill",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Gold Spinning Mill
            purpose = pgettext("lutas_atlanteans_building", "Spins gold thread out of gold."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Gold Spinning Mill
            note = pgettext("lutas_atlanteans_building", "Do not build until you have a steady gold supply."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Gold Spinning Mill
            lore = pgettext("lutas_atlanteans_building", "No, we can’t spin gold thread from straw. We need real gold. What kind of fairy tale did you get that idea from?"),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Gold Spinning Mill
            lore_author = pgettext("lutas_atlanteans_building", "Painted on a gold spinning mill without supplies")
         }
      },
      {
         name = "lutas_atlanteans_scouts_house",
         helptexts = {
            -- TRANSLATORS: Special helptext for a Lutas’ Atlantean production site: Scout's House without road connection
            no_scouting_building_connected = pgettext("lutas_atlanteans_building", "You need to connect this flag to a scout’s house before you can send a scout here."),
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Scout's House
            purpose = pgettext("building", "Explores unknown territory."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Scout's House
            note = pgettext("lutas_atlanteans_building", "Will need fish and bread to have his meal the Atlantean way."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site:  Scout's House
            lore = pgettext("lutas_atlanteans_building", "You do not see everything from your high towers. Sometimes you need someone to find out in person, that’s me!"),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site:  Scout's House
            lore_author = pgettext("lutas_atlanteans_building", "A scout answering a soldier"),
            performance = {
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Scout's House, part 1
               pgettext("lutas_atlanteans_building", "One exploration trip of the scout takes between %1$s and %2$s."):bformat(format_minutes_seconds(1, 52), format_minutes_seconds(4, 5)),
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Scout's House, part 2
               pgettext("lutas_atlanteans_building", "In case of slopes or obstacles in the way, the time is increased.")
            }
         }
      },

      -- Medium sized Buildings
      {
         name = "lutas_atlanteans_sawmill",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Sawmill
            purpose = pgettext("building", "Saws logs to produce planks."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Sawmill
            note = pgettext("lutas_atlanteans_building", "Will need at least four woodcutters for a constant supply of planks."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site:  Sawmill
            lore = pgettext("lutas_atlanteans_building", "The design of our sawmills makes operation simple, yet powerful. Patent pending."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site:  Sawmill
            lore_author = pgettext("lutas_atlanteans_building", "Askadus, Inventor of the vertical axis windmill"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Sawmill
            performance = pgettext("lutas_atlanteans_building", "The sawmill needs %s on average to produce one plank."):bformat(format_seconds(40))
         }
      },
      {
         name = "lutas_atlanteans_smokery",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Smokery
            purpose = pgettext("lutas_atlanteans_building", "Smokes meat and fish to feed the scouts and miners and to train soldiers in the dungeon, labyrinth and temple."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site:  Smokery
            lore = pgettext("lutas_atlanteans_building", "We are using pure logs, no other ingredients! Which drunken foreigner hath told you that myth?"),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site:  Smokery
            lore_author = pgettext("lutas_atlanteans_building", "A Smoker answering a passer-by"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Smokery
            performance = pgettext("lutas_atlanteans_building", "If this building is fully supplied and all kinds of smoked food are needed by the economy, production of one smoked fish takes %1$s and one smoked meat takes %2$s on average. If only one kind of food is needed by the economy, production of one smoked fish takes %3$s and one smoked meat takes %4$s on average."):bformat(format_seconds(51), format_minutes_seconds(1, 42), format_seconds(34), format_seconds(34))

         }
      },
      {
         name = "lutas_atlanteans_mill",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Mill
            purpose = pgettext("lutas_atlanteans_building", "Grinds blackroots and corn to produce blackroot flour and cornmeal, respectively."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Mill
            note = pgettext("lutas_atlanteans_building", "When no cornmeal is required, the mill will try to produce blackroot flour even when there is no demand for it."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site:  Mill
            lore = pgettext("lutas_atlanteans_building", "We invented this vertical axis design first, the sawmill just copied our ideas but never acknowledged our claim."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Mill
            lore_author = pgettext("lutas_atlanteans_building", "Miller arguing with a sawyer"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Mill
            performance = pgettext("lutas_atlanteans_building", "If this building is fully supplied and both kinds of flour are needed by the economy, production of one sack of each kind of flour takes %1$s on average. If only one kind of flour is needed by the economy, its production takes %2$s on average."):bformat(format_seconds(44), format_seconds(22))
         }
      },
      {
         name = "lutas_atlanteans_bakery",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Bakery
            purpose = pgettext("lutas_atlanteans_building", "Bakes bread to feed the scouts and miners and to train soldiers."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Bakery
            note = pgettext("lutas_atlanteans_building", "Will need cornmeal and blackroot flour."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site:  Bakery
            lore = pgettext("lutas_atlanteans_building", "You cannot compare our bread to anything from those other tribes. This recipe was inherited for generations. "..
                                                   "It is more nutritious than that paper-like bread you find elsewhere. And it is needed for the personal rite "..
                                                   "of preparing one’s meal. May God bless you."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Bakery
            lore_author = pgettext("lutas_atlanteans_building", "Head of the bakers’ guild"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Bakery
            performance = pgettext("lutas_atlanteans_building", "If all needed wares are delivered in time, this building can produce one bread in %s on average."):bformat(format_seconds(36))
         }
      },
      {
         name = "lutas_atlanteans_charcoal_kiln",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Charcoal Kiln
            purpose = pgettext("building", "Burns logs into charcoal."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Charcoal Kiln
            note = pgettext("lutas_atlanteans_building", "Build only if you absolutely must produce some coal, or when you have a very large amount of logs."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Charcoal Kiln
            lore = pgettext("lutas_atlanteans_building", "We must admit that this business is not really the Atlantean way, but in times of need we do what’s necessary."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Charcoal Kiln
            lore_author = pgettext("lutas_atlanteans_building", "A black voice from inside the charcoal kiln"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Charcoal Kiln
            performance = pgettext("lutas_atlanteans_building", "The charcoal kiln needs %s on average to produce one coal."):bformat(format_minutes_seconds(2, 4))
         }
      },
      {
         name = "lutas_atlanteans_smelting_works",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Smelting Works
            purpose = pgettext("building", "Smelts iron ore into iron and gold ore into gold."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Smelting Works
            lore = pgettext("lutas_atlanteans_building", "We learned the smelting from our forefathers, a basic craftsmanship taming the fire and the ore into pure metals."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Smelting Works
            lore_author = pgettext("lutas_atlanteans_building", "A member of the smelters’ guild"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Smelting Works
            performance = pgettext("lutas_atlanteans_building", "If this building is fully supplied and all metals are needed by the economy, production of one iron takes %1$s and one gold takes %2$s on average. If only one kind of metal is needed by the economy, production of one iron takes %3$s and one gold takes %4$s on average."):bformat(format_minutes_seconds(1, 36), format_minutes_seconds(3, 12), format_minutes_seconds(1, 4), format_minutes_seconds(1, 4))
         }
      },
      {
         name = "lutas_atlanteans_toolsmithy",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Toolsmithy
            purpose = pgettext("building", "Forges all the tools that your workers need."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Toolsmithy
            lore = pgettext("lutas_atlanteans_building", "People’s power working for the benefit of all"),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Toolsmithy
            lore_author = pgettext("lutas_atlanteans_building", "Faded sign found on top of this building"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Toolsmithy
            performance = pgettext("lutas_atlanteans_building", "If this building is fully supplied and all tools are needed by the economy, production of one of each tool takes %1$s on average. If only one kind of tool is needed by the economy, its production takes %2$s on average."):bformat(format_minutes_seconds(14, 12), format_minutes_seconds(1, 11))
         }
      },
      {
         name = "lutas_atlanteans_weaponsmithy",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Weapon Smithy
            purpose = pgettext("lutas_atlanteans_building", "Forges tridents to equip the soldiers and to train their attack in the dungeon."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site:  Weapon Smithy
            lore = pgettext("lutas_atlanteans_building", "You hear that sound of metal strident? The weapon smith just forged a trident!"),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Weapon Smithy
            lore_author = pgettext("lutas_atlanteans_building", "Atlantean nursery rhyme"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Weapon Smithy
            performance = pgettext("lutas_atlanteans_building", "If this building is fully supplied and all tridents are needed by the economy, production of one of each trident takes %1$s on average. If only one kind of trident is needed by the economy, production of one light trident takes %2$s and one long trident, one steel trident, one diamond double trident or one heavy double trident takes %3$s on average."):bformat(format_minutes_seconds(6, 18), format_seconds(54), format_minutes_seconds(1, 21))
         }
      },
      {
         name = "lutas_atlanteans_armorsmithy",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Armor Smithy
            purpose = pgettext("lutas_atlanteans_building", "Forges shields that are used for training soldiers’ defense in the labyrinth."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Armor Smithy
            lore = pgettext("lutas_atlanteans_building", [[‘She twists and tweaks the steel with might<br>]] ..
                                          [[that soldiers may therewith once fight<br>]] ..
                                          [[most skillful foes, whose lethal lance<br>]] ..
                                          [[from this their armour off will glance!’]]),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Armor Smithy
            lore_author = pgettext("lutas_atlanteans_building", "Atlantean nursery rhyme"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Armor Smithy
            performance = pgettext("lutas_atlanteans_building", "If this building is fully supplied and both kinds of shields are needed by the economy, production of one of each kind takes %1$s on average. If only one kind of shield is needed by the economy, production of one steel shield takes %2$s and one advanced shield takes %3$s on average."):bformat(format_minutes_seconds(2, 32), format_minutes_seconds(1, 11), format_minutes_seconds(1, 21))
         }
      },
      {
         name = "lutas_atlanteans_barracks",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Barracks
            purpose = pgettext("lutas_atlanteans_building", "Equips recruits and trains them as soldiers."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Barracks
            lore = pgettext("lutas_atlanteans_building", "See these fine silk tabards and those sharp tridents? This is your way to defend your tribe!"),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Barracks
            lore_author = pgettext("lutas_atlanteans_building", "Recruiting poster"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Barracks
            performance = pgettext("lutas_atlanteans_building", "The barracks need %s on average to recruit one soldier."):bformat(format_seconds(30))
         }
      },

      -- Big
      {
         name = "lutas_atlanteans_horsefarm",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Horse Farm
            purpose = pgettext("lutas_atlanteans_building", "Breeds the strong Atlantean horses for adding them to the transportation system."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Horse Farm
            lore = pgettext("lutas_atlanteans_building", "I walk all day just back and forth. I need? I need … I need a horse!"),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Horse Farm
            lore_author = pgettext("lutas_atlanteans_building", "Busy carrier murmuring to himself")
         }
      },
      {
         name = "lutas_atlanteans_farm",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Farm
            purpose = pgettext("lutas_atlanteans_building", "Sows and harvests corn."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Farm
            lore = pgettext("lutas_atlanteans_building", "I use my feet, I use my arm, I’m caring for this farm!"),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Farm
            lore_author = pgettext("lutas_atlanteans_building", "Atlantean harvesting song"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Farm
            performance = pgettext("lutas_atlanteans_building", "The farmer needs %1% on average to sow and harvest a sheaf of corn."):bformat(format_minutes_seconds(1, 20))
         }
      },
      {
         name = "lutas_atlanteans_blackroot_farm",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Blackroot Farm 
            purpose = pgettext("lutas_atlanteans_building", "Sows and harvests blackroot."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Blackroot Farm
            lore = pgettext("lutas_atlanteans_building", "The secret of Atlantean health and strength is hidden in these roots. "..
                     "It’s not spinach, it’s not a carrot, it’s … a secret."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Blackroot Farm
            lore_author = pgettext("lutas_atlanteans_building", "Blackroot farmer asked by a foreigner"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Blackroot Farm
            performance = pgettext("lutas_atlanteans_building", "The blackroot farmer needs %1% on average to sow and harvest a bundle of blackroot."):bformat(format_minutes_seconds(1, 20))
         }
      },
      {
         name = "lutas_atlanteans_spiderfarm",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Spider Farm
            purpose = pgettext("building", "Breeds spiders for silk."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Spider Farm
            lore = pgettext("lutas_atlanteans_building", "No, the spiders are not fed with corn. We feed it to fat grasshoppers, which in turn are digested by our spiders. "..
                                                   "We put them on a special device to gain the spider silk once a day. There is no need to spin this again. " ..
                     "The thread can directly be used by the weaving mill. Oh hello, here is one of our nice spiders … Hey! Why are you running away?"),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Spider Farm
            lore_author = pgettext("lutas_atlanteans_building", "A spider breeder showing his farm")

         }
      },
      {
         name = "lutas_atlanteans_weaving_mill",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Weaving Mill
            purpose = pgettext("lutas_atlanteans_building", "Weaves spidercloth for buildings and ships’ sails, and tabards to equip and train the soldiers."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Weaving Mill
            lore = pgettext("lutas_atlanteans_building", "Here are the Wide Lands where people may dwell, "..
                                                   "walking around caring everything’s well."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Weaving Mill
            lore_author = pgettext("lutas_atlanteans_building", "Part of the silkweavers’ song"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Weaving Mill
            performance = pgettext("lutas_atlanteans_building", "If this building is fully supplied and all kinds of cloth and tabards are needed by the economy, production of one of each cloth and tabard takes %1$s on average. If only one kind of cloth or tabard is needed by the economy, its production takes %2$s on average."):bformat(format_minutes_seconds(2, 12), format_seconds(44))
         }
      },

      -- Mines
      {
         name = "lutas_atlanteans_low_ironmine",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for an Atlantean production site: Low Iron Mine
            purpose = pgettext("building", "Digs iron ore out of the ground in mountain terrain."),
            -- TRANSLATORS: Lore helptext for an Atlantean production site: Low Iron Mine
           lore = pgettext("lutas_atlanteans_building", [[‘Way down here in this low mine<br>]] ..
                                          [[where the sun it dare not shine,<br>]] ..
                                          [[I sweat and toil till day is done,<br>]] ..
                                          [[but I’ll be back with morning come.’]]),
            -- TRANSLATORS: Lore author helptext for an Atlantean production site:  Low Iron Mine
            lore_author = pgettext("lutas_atlanteans_building", "Song from the miners’ guild"),
            -- TRANSLATORS: Performance helptext for an Atlantean production site: Low Iron Mine
            performance = pgettext("lutas_atlanteans_building", "If the food supply is steady, this mine can produce iron ore in %s on average."):bformat(format_seconds(25))
         }
      },
      {
         name = "lutas_atlanteans_low_coalmine",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for an Atlantean production site: Low Coal Mine
            purpose = pgettext("building", "Digs coal out of the ground in mountain terrain."),
            -- TRANSLATORS: Lore helptext for an Atlantean production site: Low Coal Mine
            lore = pgettext("lutas_atlanteans_building", [[‘Way down here in this low mine<br>]] ..
                                          [[where the sun it dare not shine,<br>]] ..
                                          [[I sweat and toil till day is done,<br>]] ..
                                          [[but I’ll be back with morning come.’]]),
            -- TRANSLATORS: Lore author helptext for an Atlantean production site:  Low Coal Mine
            lore_author = pgettext("lutas_atlanteans_building", "Song from the miners’ guild"),
            -- TRANSLATORS: Performance helptext for an Atlantean production site: Low Coal Mine
            performance = pgettext("lutas_atlanteans_building", "If the food supply is steady, this mine can produce coal in %s on average."):bformat(format_seconds(19))
         }
      },
      {
         name = "lutas_atlanteans_low_crystalmine",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for an Atlantean production site: Low Crystal Mine
            purpose = pgettext("lutas_atlanteans_building", "Carves precious (and normal) stones out of the rock in mountain terrain."),
            -- TRANSLATORS: Lore helptext for an Atlantean production site: Low Crystal Mine
            lore = pgettext("lutas_atlanteans_building", "No, no, there is no need to build a deep mine. This low mine ensures a quick supply of sufficient amount of the hardest diamonds for our double tridents."),
            -- TRANSLATORS: Lore author helptext for an Atlantean production site: Low Crystal Mine
            lore_author = pgettext("lutas_atlanteans_building", "An impatient trainer can’t wait to receive his first double trident delivery"),
            -- TRANSLATORS: Performance helptext for an Atlantean production site: Low Crystal Mine
            performance = pgettext("lutas_atlanteans_building", "If this building is fully supplied and all minerals are needed by the economy, production of one granite takes %1$s, one quartz takes %2$s and one diamond takes %3$s on average. If only one kind of mineral is needed by the economy, production of one granite takes %4$s, one quartz takes %5$s and one diamond takes %6$s on average."):bformat(format_seconds(43), format_minutes_seconds(1, 37), format_minutes_seconds(3, 14), format_seconds(29), format_seconds(42), format_seconds(58))
         }
      },
      {
         name = "lutas_atlanteans_low_goldmine",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for an Atlantean production site: Low Gold Mine
            purpose = pgettext("building", "Digs gold ore out of the ground in mountain terrain."),
            -- TRANSLATORS: Lore helptext for an Atlantean production site: Low Gold Mine
            lore = pgettext("lutas_atlanteans_building", "We Atlanteans are very proud of our weaving abilities and we are especially proud of our golden tabards. That is why a quick supply of gold into our spinning mills is question of honour for us."),
            -- TRANSLATORS: Lore author helptext for an Atlantean production site: Low Gold Mine
            lore_author = pgettext("lutas_atlanteans_building", "A priestess is ashamed by not having golden tabards for soldiers"),
            -- TRANSLATORS: Performance helptext for an Atlantean production site: Low Gold Mine
            performance = pgettext("lutas_atlanteans_building", "If the food supply is steady, this mine can produce gold ore in %s on average."):bformat(format_seconds(39))
         }
      },
      {
         name = "lutas_atlanteans_crystalmine",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Crystal Mine
            purpose = pgettext("lutas_atlanteans_building", "Carves precious (and normal) stones out of the rock in mountain terrain."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Crystal Mine
            lore = pgettext("lutas_atlanteans_building", "Only the pure, white stones Diamond and Quartz will enlighten our people. "..
                                                   "Thus, every major building will need them so the inhabitants may worship Lutas to give them joy."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Crystal Mine
            lore_author = pgettext("lutas_atlanteans_building", "First part of the Atlantean almanach on architecture"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Crystal Mine
            performance = pgettext("lutas_atlanteans_building", "If this building is fully supplied and all minerals are needed by the economy, production of one granite takes %1$s, one quartz takes %2$s and one diamond takes %3$s on average. If only one kind of mineral is needed by the economy, production of one granite takes %4$s, one quartz takes %5$s and one diamond takes %6$s on average."):bformat(format_seconds(43), format_minutes_seconds(1, 37), format_minutes_seconds(3, 14), format_seconds(29), format_seconds(42), format_seconds(58))
         }
      },
      {
         name = "lutas_atlanteans_coalmine",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Coal Mine
            purpose = pgettext("building", "Digs coal out of the ground in mountain terrain."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Coal Mine
            lore = pgettext("lutas_atlanteans_building", [[‘Way down here in this deep mine<br>]] ..
                                          [[where the sun it dare not shine,<br>]] ..
                                          [[I sweat and toil till day is done,<br>]] ..
                                          [[but I’ll be back with morning come.’]]),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site:  Coal Mine
            lore_author = pgettext("lutas_atlanteans_building", "Song from the miners’ guild"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Coal Mine
            performance = pgettext("lutas_atlanteans_building", "If the food supply is steady, this mine can produce coal in %s on average."):bformat(format_seconds(19))
         }
      },
      {
         name = "lutas_atlanteans_ironmine",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Iron Mine
            purpose = pgettext("building", "Digs iron ore out of the ground in mountain terrain."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Iron Mine
           lore = pgettext("lutas_atlanteans_building", [[‘Way down here in this deep mine<br>]] ..
                                          [[where the sun it dare not shine,<br>]] ..
                                          [[I sweat and toil till day is done,<br>]] ..
                                          [[but I’ll be back with morning come.’]]),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site:  Iron Mine
            lore_author = pgettext("lutas_atlanteans_building", "Song from the miners’ guild"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Iron Mine
            performance = pgettext("lutas_atlanteans_building", "If the food supply is steady, this mine can produce iron ore in %s on average."):bformat(format_seconds(25))
         }
      },
      {
         name = "lutas_atlanteans_goldmine",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Gold Mine
            purpose = pgettext("building", "Digs gold ore out of the ground in mountain terrain."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Gold Mine
            lore = pgettext("lutas_atlanteans_building", [[‘Way down here in these golden grounds<br>]] ..
                                          [[with stones above us the thousand pounds<br>]] ..
                                          [[I dig in the dust until I see the spark;<br>]] ..
                                          [[The golden ore I find in the dark.’]]),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Gold Mine
            lore_author = pgettext("lutas_atlanteans_building", "Miner’s prayer"),
            -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Gold Mine
            performance = pgettext("lutas_atlanteans_building", "If the food supply is steady, this mine can produce gold ore in %s on average."):bformat(format_seconds(39))
         }
      },

      -- Training Sites
      {
         name = "lutas_atlanteans_dungeon",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean training site: Dungeon, part 1
               pgettext("lutas_atlanteans_building", "Trains soldiers in ‘Attack’."),
               -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean training site: Dungeon, part 2
               pgettext("lutas_atlanteans_building", "Equips the soldiers with all necessary weapons.")
            },
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Dungeon
            lore = pgettext("lutas_atlanteans_building", "Make our enemies feel the pain, so enter here to gain your train!"),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Dungeon
            lore_author = pgettext("lutas_atlanteans_building", "Engraving on the entrance to the dungeon"),
            performance = {
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean training site: Dungeon, part 1
               pgettext("lutas_atlanteans_building", "If all needed wares are delivered in time, a dungeon can train one soldier one level in attack in %s on average."):bformat(format_seconds(36)),
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean training site: Dungeon, part 2
               pgettext("lutas_atlanteans_building", "Complete training of one soldier takes %s on average."):bformat(format_minutes_seconds(2, 24))
            }
         }
      },
      {
         name = "lutas_atlanteans_labyrinth",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean training site: Labyrinth, part 1
               pgettext("lutas_atlanteans_building", "Trains soldiers in ‘Defense’ and ‘Evade’."),
               -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean training site: Labyrinth, part 2
               pgettext("lutas_atlanteans_building", "Equips the soldiers with all necessary weapons and armor parts.")
            },
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Labyrinth
            lore = pgettext("lutas_atlanteans_building", "Our enemies claim: we have a ruddy twisted way to fight. "..
           "Check the way we train, in this labyrinth they may be right."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Labyrinth
            lore_author = pgettext("lutas_atlanteans_building", "Atlantean hero after first contact with a real enemy"),
            performance = {
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean training site: Labyrinth, part 1
               pgettext("lutas_atlanteans_building", "If all needed wares are delivered in time, a labyrinth can train one soldier one level in defense or evade in %s on average."):bformat(format_seconds(36)),
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean training site: Labyrinth, part 2
               pgettext("lutas_atlanteans_building", "Complete training of one soldier takes %s on average."):bformat(format_minutes_seconds(2, 24))
            }
         }
      },
      {
         name = "lutas_atlanteans_temple",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Temple
            purpose = pgettext("building", "Improves soldiers in ‘Health’."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Temple
            note = pgettext("lutas_atlanteans_building", "The priestess has to pray to the God Lutas on a shore. Make sure she has free access to water. Lutas is showing her his favour when a seashell appears on the cost. This seashell can be collected by a fisher for meat."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean training site: Temple
            lore = pgettext("lutas_atlanteans_building", "She spells seashells on the seashore of shallow sea. S-E-A-S-H-E-L-L-S."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Temple
            lore_author = pgettext("lutas_atlanteans_building", "An Atlantean spell, which is to be repeated ten times in quick pace"),
            performance = {
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Temple, part 1
               pgettext("lutas_atlanteans_building", "If all needed wares are delivered in time, a temple needs between %1$s and %2$s to train one soldier one level in health, depending on how far the priestess has to walk."):bformat(format_seconds(15), format_minutes_seconds(1, 9)),
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Temple, part 2
               pgettext("lutas_atlanteans_building", "In case of slopes or obstacles in the way, the time is increased."),
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Temple, part 3
               pgettext("lutas_atlanteans_building", "Complete training of one soldier takes %s on average."):bformat(format_minutes_seconds(1, 35))
            }
         }
      },

      -- Military Sites
      {
         name = "lutas_atlanteans_guard",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean military site: Guard
            purpose = pgettext("lutas_atlanteans_building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean military site: Guard
            note = pgettext("lutas_atlanteans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow "..
                     "button to decrease the capacity. You can also click on a soldier to send him away."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Guard
            lore = pgettext("lutas_atlanteans_building", "Hey soldier, even if this is the smallest of our military buildings you still must not sleep all day!"),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Guard
            lore_author = pgettext("lutas_atlanteans_building", "Officer visiting a remote guard")
         }
      },
      {
         name = "lutas_atlanteans_guardhall_big",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean military site: Big Guardhall
            purpose = pgettext("lutas_atlanteans_building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean military site: Big Guardhall
            note = pgettext("lutas_atlanteans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Big Guardhall
            lore = pgettext("lutas_atlanteans_building", "In this hall we praise the fight, for God’s honour day and night."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Big Guardhall
            lore_author = pgettext("lutas_atlanteans_building", "Scribbling on the wall of a big guardhall")
         }
      },
      {
         name = "lutas_atlanteans_tower_low",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean military site: Low Tower
            purpose = pgettext("lutas_atlanteans_building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean military site: Low Tower
            note = pgettext("lutas_atlanteans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Low Tower
            lore = pgettext("lutas_atlanteans_building", "With three soldiers we can achieve an optimal balance between military power and building cost."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Low Tower
            lore_author = pgettext("lutas_atlanteans_building", "Notes on the building instructions")

         }
      },
      {
         name = "lutas_atlanteans_tower_round",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean military site: Round Tower
            purpose = pgettext("lutas_atlanteans_building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean military site: Round Tower
            note = pgettext("lutas_atlanteans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Round Tower
            lore = pgettext("lutas_atlanteans_building", "All the other tribes envy us for our towers, elegant outside, comfortable inside, still perfect for defense."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Round Tower
            lore_author = pgettext("lutas_atlanteans_building", "Soldier handing over his duties to a younger one")

         }
      },
      {
         name = "lutas_atlanteans_tower_cone_shaped",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean military site: Cone Shaped Tower
            purpose = pgettext("lutas_atlanteans_building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean military site: Cone Shaped Tower
            note = pgettext("lutas_atlanteans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow "..
                     "button to decrease the capacity. You can also click on a soldier to send him away."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Cone Shaped Tower
            lore = pgettext("lutas_atlanteans_building", "Beware our mighty high towers! From the topmost spot we can see wide into the "..
                     "lands and spot the enemy far away."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Cone Shaped Tower
            lore_author = pgettext("lutas_atlanteans_building", "Soldier showing off a cone shaped tower")

         }
      },
      {
         name = "lutas_atlanteans_diamond_castle",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean military site: Diamond Castle
            purpose = pgettext("lutas_atlanteans_building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note helptext for a Lutas’ Atlantean military site: Diamond Castle
            note = pgettext("lutas_atlanteans_building", "If you’re low on soldiers to occupy new military sites, use the downward arrow "..
                            "button to decrease the capacity. You can also click on a soldier to send him away."),
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Diamond Castle
            lore = pgettext("lutas_atlanteans_building", "Sometimes even we Atlanteans need to use brute force, but we always play it wisely."),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Diamond Castle
            lore_author = pgettext("lutas_atlanteans_building", "‘Wisdom of the Fight’ by the warriors’ guild")
         }
      },

      -- Seafaring/Ferry Sites - these are only displayed on seafaring/ferry maps
      {
         name = "lutas_atlanteans_ferry_yard",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Ferry Yard
            purpose = pgettext("building", "Builds ferries."),
            note = {
               -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Ferry Yard, part 1
               pgettext("building", "Needs water nearby. Be aware ferries carry wares only, no workers."),
               -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Ferry Yard, part 2
               pgettext("building", "Roads and trees along the shoreline block access to water."),
            },
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Ferry Yard
            lore = pgettext("lutas_atlanteans_building", [[‘Row, row, row your boat<br>]] ..
                                          [[gently ’long the shore.<br>]] ..
                                          [[Steadily steadily steadily steadily<br>]] ..
                                          [[bring the wares ashore.’]]),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Ferry Yard
            lore_author = pgettext("lutas_atlanteans_building", "Traditional song of the ferrymen"),
            performance = {
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Ferry Yard, part 1
               pgettext("lutas_atlanteans_building", "This building can produce one ferry between %1$s and %2$s, depending on how far the shipwright has to walk."):bformat(format_seconds(37), format_seconds(59)),
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Ferry Yard, part 2
               pgettext("lutas_atlanteans_building", "In case of slopes or obstacles in the way, the time is increased.")
            }
         }
      },
      {
         name = "lutas_atlanteans_shipyard",
         helptexts = {
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean production site: Shipyard
            purpose = pgettext("building", "Constructs ships that are used for overseas colonization and for trading between ports."),
            note = {
               -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Shipyard, part 1
               pgettext("building", "Needs wide open water nearby."),
               -- TRANSLATORS: Note helptext for a Lutas’ Atlantean production site: Shipyard, part 2
               pgettext("building", "Roads and trees along the shoreline block access to water."),
            },
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean production site: Shipyard
            lore = pgettext("lutas_atlanteans_building", [[‘Soon may the wellerman come,<br>]] ..
                                          [[to bring us bread and smoked fish.<br>]] ..
                                          [[We set sail for a faraway shore<br>]] ..
                                          [[we praise Lutas the best we wish.’]]),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean production site: Shipyard -- not directly stolen from the wellerman song
            lore_author = pgettext("lutas_atlanteans_building", "Transcript from oral tradition"),
            performance = {
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Shipyard, part 1
               pgettext("lutas_atlanteans_building", "This building can produce one ship between %1$s and %2$s, depending on how far the shipwright has to walk."):bformat(format_minutes_seconds(18, 3), format_minutes_seconds(24, 46)),
               -- TRANSLATORS: Performance helptext for a Lutas’ Atlantean production site: Shipyard, part 2
               pgettext("lutas_atlanteans_building", "In case of slopes or obstacles in the way, the time is increased.")
            }
         }
      },

      -- Partially Finished Buildings - these are the same 2 buildings for all tribes -- TODO(k.halfmann) Not used any longer?
      {
         name = "constructionsite",
         helptexts = {
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean building: Construction Site
            lore = pgettext("building", "‘Don’t swear at the builder who is short of building materials.’"),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean building: Construction Site
            lore_author = pgettext("building", "Proverb widely used for impossible tasks of any kind"),
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean building: Construction Site
            purpose = pgettext("building", "A new building is being built at this construction site.")
         }
      },
      {
         name = "dismantlesite",
         helptexts = {
            -- TRANSLATORS: Lore helptext for a Lutas’ Atlantean building: Dismantle Site
            lore = pgettext("building", "‘New paths will appear when you are willing to tear down the old.’"),
            -- TRANSLATORS: Lore author helptext for a Lutas’ Atlantean building: Dismantle Site
            lore_author = pgettext("building", "Proverb"),
            -- TRANSLATORS: Purpose helptext for a Lutas’ Atlantean building: Dismantle Site
            purpose = pgettext("building", "A building is being dismantled at this dismantle site, returning some of the resources that were used during this building’s construction to your tribe’s stores.")
         }
      }
   },

   warehouse_names = {
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Aegina"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Constantinos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Kirikos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Aggistri"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Alonissos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Anafi"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Andros"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Antikythira"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Arkyi"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Astypalea"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Chalki"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Chania"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Chios"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Diafani"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Donoussa"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Euboea"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Folegandros"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Fourni"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Gytheio"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Heraklion"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Hydra"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Igoumenitsa"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Ios"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Iraklia"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Ithaki"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Kalamata"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Kalymnos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Karlovassi"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Karpathos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Kasos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Kastelorizo"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Katapola"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Kavala"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Kefalonia"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Kilini"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Kimolos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Kissamos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Korfu"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Kos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Koufonissi"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Kythira"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Kythnos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Lavrio"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Leros"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Lesvos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Limnos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Lipsi"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Milos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Mykonos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Naxos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Nisyros"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Paros"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Patmos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Patras"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Paxoi"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Piraeus"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Poros"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Rafina"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Rhodos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Samos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Santorini"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Schinoussa"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Serifos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Sifnos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Sikinos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Sitia"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Skiathos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Skopelos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Symi"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Syros"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Thessaloniki"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Tilos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Tinos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Volos"),
      -- TRANSLATORS: This Atlantean warehouse is named after a harbour in Greece
      pgettext("warehousename", "Zakynthos"),
   },

   -- Productionsite status strings

   -- TRANSLATORS: Productivity label on a Lutas’ Atlantean building if there is 1 worker missing
   productionsite_worker_missing = pgettext("lutas_atlanteans", "Worker missing"),
   -- TRANSLATORS: Productivity label on a Lutas’ Atlantean building if there is 1 worker coming
   productionsite_worker_coming = pgettext("lutas_atlanteans", "Worker is coming"),
   -- TRANSLATORS: Productivity label on a Lutas’ Atlantean building if there is more than 1 worker missing. If you need plural forms here, please let us know.
   productionsite_workers_missing = pgettext("lutas_atlanteans", "Workers missing"),
   -- TRANSLATORS: Productivity label on a Lutas’ Atlantean building if there is more than 1 worker coming. If you need plural forms here, please let us know.
   productionsite_workers_coming = pgettext("lutas_atlanteans", "Workers are coming"),
   -- TRANSLATORS: Productivity label on a Lutas’ Atlantean building if there is 1 experienced worker missing
   productionsite_experienced_worker_missing = pgettext("lutas_atlanteans", "Expert missing"),
   -- TRANSLATORS: Productivity label on a Lutas’ Atlantean building if there is more than 1 experienced worker missing. If you need plural forms here, please let us know.
   productionsite_experienced_workers_missing = pgettext("lutas_atlanteans", "Experts missing"),

   -- Soldier strings to be used in Military Status strings

   soldier_context = "lutas_atlanteans_soldier",
   soldier_0_sg = "%1% soldier (+%2%)",
   soldier_0_pl = "%1% soldiers (+%2%)",
   soldier_1_sg = "%1% soldier",
   soldier_1_pl = "%1% soldiers",
   soldier_2_sg = "%1%(+%2%) soldier (+%3%)",
   soldier_2_pl = "%1%(+%2%) soldiers (+%3%)",
   soldier_3_sg = "%1%(+%2%) soldier",
   soldier_3_pl = "%1%(+%2%) soldiers",
   -- TRANSLATORS: %1% is the number of Atlantean soldiers the plural refers to. %2% is the maximum number of soldier slots in the building.
   UNUSED_soldier_0 = npgettext("lutas_atlanteans_soldier", "%1% soldier (+%2%)", "%1% soldiers (+%2%)", 0),
   -- TRANSLATORS: Number of Atlantean soldiers stationed at a militarysite.
   UNUSED_soldier_1 = npgettext("lutas_atlanteans_soldier", "%1% soldier", "%1% soldiers", 0),
   -- TRANSLATORS: %1% is the number of Atlantean soldiers the plural refers to. %2% are currently open soldier slots in the building. %3% is the maximum number of soldier slots in the building
   UNUSED_soldier_2 = npgettext("lutas_atlanteans_soldier", "%1%(+%2%) soldier (+%3%)", "%1%(+%2%) soldiers (+%3%)", 0),
   -- TRANSLATORS: %1% is the number of Atlantean soldiers the plural refers to. %2% are currently open soldier slots in the building.
   UNUSED_soldier_3 = npgettext("lutas_atlanteans_soldier", "%1%(+%2%) soldier", "%1%(+%2%) soldiers", 0),

   -- Special types
   builder = "lutas_atlanteans_builder",
   carriers = {"lutas_atlanteans_carrier", "lutas_atlanteans_horse"},
   geologist = "lutas_atlanteans_geologist",
   scouts_house = "lutas_atlanteans_scouts_house",
   soldier = "lutas_atlanteans_soldier",
   ship = "lutas_atlanteans_ship",
   ferry = "lutas_atlanteans_ferry",
   port = "lutas_atlanteans_port",

   fastplace = {
      warehouse = "lutas_atlanteans_warehouse",
      port = "lutas_atlanteans_port",
      training_small = "lutas_atlanteans_labyrinth",
      training_large = "lutas_atlanteans_dungeon",
      military_small_primary = "lutas_atlanteans_guard",
      military_small_secondary = "lutas_atlanteans_tower_low",
      military_medium_primary = "lutas_atlanteans_guardhall_big",
      military_tower = "lutas_atlanteans_tower_round",
      military_fortress = "lutas_atlanteans_diamond_castle",
      woodcutter = "lutas_atlanteans_woodcutters_house",
      forester = "lutas_atlanteans_foresters_house",
      quarry = "lutas_atlanteans_quarry",
      building_materials_primary = "lutas_atlanteans_sawmill",
      building_materials_secondary = "lutas_atlanteans_weaving_mill",
      building_materials_tertiary = "lutas_atlanteans_spiderfarm",
      fisher = "lutas_atlanteans_fishers_house",
      hunter = "lutas_atlanteans_hunters_house",
      fish_meat_replenisher = "lutas_atlanteans_fishbreeders_house",
      well = "lutas_atlanteans_well",
      farm_primary = "lutas_atlanteans_farm",
      farm_secondary = "lutas_atlanteans_blackroot_farm",
      mill = "lutas_atlanteans_mill",
      bakery = "lutas_atlanteans_bakery",
      smokery = "lutas_atlanteans_smokery",
      smelting = "lutas_atlanteans_smelting_works",
      tool_smithy = "lutas_atlanteans_toolsmithy",
      weapon_smithy = "lutas_atlanteans_weaponsmithy",
      armor_smithy = "lutas_atlanteans_armorsmithy",
      weaving_mill = "lutas_atlanteans_gold_spinning_mill",
      shipyard = "lutas_atlanteans_shipyard",
      ferry_yard = "lutas_atlanteans_ferry_yard",
      scout = "lutas_atlanteans_scouts_house",
      barracks = "lutas_atlanteans_barracks",
      second_carrier = "lutas_atlanteans_horsefarm",
      charcoal = "lutas_atlanteans_charcoal_kiln",
      mine_stone = "lutas_atlanteans_crystalmine",
      mine_coal = "lutas_atlanteans_coalmine",
      mine_iron = "lutas_atlanteans_ironmine",
      mine_gold = "lutas_atlanteans_goldmine",
   },
}


pop_textdomain()