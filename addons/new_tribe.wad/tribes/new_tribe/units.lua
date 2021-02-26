descriptions = wl.Descriptions()

image_dirname = path.dirname(__file__)

push_textdomain("new_tribe.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

descriptions:new_tribe {
   name = "new_tribe",
   animation_directory = image_dirname,
   military_capacity_script = image_dirname .. "military_capacity.lua",
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

   collectors_points_table = {
      { ware = "tool", points = 1},
   },

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
         [0] = "newtribe_resi_none",
      },
      resource_water = {
         [100] = "newtribe_resi_water",
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
                  pgettext("newtribe_ware", "The New Tribe produces granite blocks in quarries.")
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
                  pgettext("newtribe_ware", "NewTribe woodcutters fell the trees; foresters take care of the supply of trees.")
               }
            }
         },
         {
            name = "reed",
            preciousness = 0,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: reed
                  pgettext("newtribe_ware", "The New Tribe produces reed in reed yards. Roofs are thatched with it.")
               }
            }
         },
      },
      {
         -- Food
         {
            name = "fish",
            preciousness = 3,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Fish
               purpose = pgettext("newtribe_ware", "Besides bread and meat, fish is also a foodstuff for the New Tribe. Fish are used in the training sites (colosseum).")
            }
         },
         {
            name = "meat",
            default_target_quantity = 20,
            preciousness = 2,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Meat
                  pgettext("ware", "Meat contains a lot of energy, and it is obtained from wild game taken by hunters."),
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
                  pgettext("newtribe_ware", "Water is used in the bakery. The donkey farm also needs to be supplied with water.")
               }
            }
         },
         {
            name = "rye",
            preciousness = 12,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: rye, part 1
                  pgettext("ware", "Rye is essential for survival."),
                  -- TRANSLATORS: Helptext for a NewTribe ware: rye, part 2
                  pgettext("newtribe_ware", "Rye is produced by farms and used by bakeries. Donkey farms also need to be supplied with rye.")
               }
            }
         },
         {
            name = "newtribe_bread",
            default_target_quantity = 20,
            preciousness = 7,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe ware: Bread
               purpose = pgettext("newtribe_ware", "The bakers of the New Tribe make really tasty bread out of rye and water. Bread is consumed at the training sites (colosseum).")
            }
         },
      },
      {
         -- Tools
         {
            name = "tool",
            default_target_quantity = 6,
            preciousness = 1,
            helptexts = {
               purpose = {
                  -- TRANSLATORS: Helptext for a NewTribe ware: Tool
                  pgettext("newtribe_ware", "All workers need a tool!"),
               }
            }
         },
      }
   },
   -- Workers positions in workers windows.
   -- This also gives us the information which workers the tribe uses.
   -- Each subtable is a column in the workers windows.
   workers_order = {
      {
         -- Carriers
         {
            name = "newtribe_carrier",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Carrier
               purpose = pgettext("newtribe_worker", "Carries items along your roads.")
            }
         },
         {
            name = "newtribe_ferry",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Ferry
               purpose = pgettext("newtribe_worker", "Ships wares across narrow rivers.")
            }
         },
         {
            name = "newtribe_donkey",
            default_target_quantity = 10,
            preciousness = 2,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Donkey
               purpose = pgettext("newtribe_worker", "Donkeys help to carry items along busy roads. They are reared in a donkey farm.")
            }
         },
         {
            name = "newtribe_donkeybreeder",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Donkey Breeder
               purpose = pgettext("newtribe_worker", "Breeds cute and helpful donkeys for adding them to the transportation system.")
            }
         }
      },
      {
         -- Building Materials
         {
            name = "newtribe_stonecutter",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Stonecutter
               purpose = pgettext("newtribe_worker", "Cuts blocks of granite out of rocks in the vicinity.")
            }
         },
         {
            name = "newtribe_woodcutter",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: woodcutter
               purpose = pgettext("newtribe_worker", "Fells trees.")
            }
         },
         {
            name = "newtribe_forester",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Forester
               purpose = pgettext("newtribe_worker", "Plants trees.")
            }
         },
         {
            name = "newtribe_builder",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Builder
               purpose = pgettext("newtribe_worker", "Works at construction sites to raise new buildings.")
            }
         },
         {
            name = "newtribe_shipwright",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Shipwright
               purpose = pgettext("newtribe_worker", "Works at the shipyard and constructs new ships.")
            }
         }
      },
      {
         -- Food
         {
            name = "newtribe_fisher",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Fisher
               purpose = pgettext("newtribe_worker", "Catches fish in the sea.")
            }
         },
         {
            name = "newtribe_fishbreeder",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Fishbreeder
               purpose = pgettext("newtribe_worker", "Breeds fish.")
            }
         },
         {
            name = "newtribe_hunter",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Hunter
               purpose = pgettext("newtribe_worker", "The hunter brings fresh, raw meat to the colonists.")
            }
         },
         {
            name = "newtribe_farmer",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Farmer
               purpose = pgettext("newtribe_worker", "Plants rye and reed fields.")
            }
         },
         {
            name = "newtribe_baker",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Baker
               purpose = pgettext("newtribe_worker", "Bakes bread for workers.")
            }
         },
      },
      {
         -- Mining
         {
            name = "newtribe_geologist",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Geologist
               purpose = pgettext("newtribe_worker", "Discovers resources for mining.")
            }
         },
      },
      {
         -- Tools
         {
            name = "newtribe_toolsmith",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Toolsmith
               purpose = pgettext("newtribe_worker", "Produces tools for the workers.")
            }
         }
      },
      {
         {
            name = "newtribe_soldier",
            default_target_quantity = 10,
            preciousness = 5,
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Soldier
               purpose = pgettext("newtribe_worker", "Defend and Conquer!")
            }
         },
         {
            name = "newtribe_trainer",
            helptexts = {
               -- TRANSLATORS: Helptext for a NewTribe worker: Trainer
               purpose = pgettext("newtribe_worker", "Trains the soldiers.")
            }
         },
         {
            name = "newtribe_scout",
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
         name = "ryefield_tiny",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: rye field
            purpose = _("This field has just been planted.")
         }
      },
      {
         name = "ryefield_small",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: rye field
            purpose = _("This field is growing.")
         }
      },
      {
         name = "ryefield_medium",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: rye field
            purpose = _("This field is growing.")
         }
      },
      {
         name = "ryefield_ripe",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: rye field
            purpose = _("This field is ready for harvesting.")
         }
      },
      {
         name = "newtribe_resi_none",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe resource indicator: No resources
            purpose = _("There are no resources in the ground here.")
         }
      },
      {
         name = "newtribe_resi_water",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe resource indicator: Water
            purpose = _("There is water in the ground here that can be pulled up by a well.")
         }
      },
      {
         name = "newtribe_shipconstruction",
         helptexts = {
            -- TRANSLATORS: Helptext for a NewTribe immovable: Ship Under Construction
            purpose = _("A ship is being constructed at this site.")
         }
      },
      {
         name = "reedfield_tiny",
         helptexts = {
            -- TRANSLATORS: Helptext for a frisian immovable: Reed Field
            purpose = _("This reed field has just been planted.")
         }
      },
      {
         name = "reedfield_small",
         helptexts = {
            -- TRANSLATORS: Helptext for a frisian immovable: Reed Field
            purpose = _("This reed field is growing.")
         }
      },
      {
         name = "reedfield_medium",
         helptexts = {
            -- TRANSLATORS: Helptext for a frisian immovable: Reed Field
            purpose = _("This reed field is flowering. Honey can be produced from it by a beekeeper.")
         }
      },
      {
         name = "reedfield_ripe",
         helptexts = {
            -- TRANSLATORS: Helptext for a frisian immovable: Reed Field
            purpose = _("This reed field is ready for harvesting.")
         }
      },
      -- foreign Immovables used by the woodcutter
      {
         name = "deadtree7",
         helptexts = {
            -- TRANSLATORS: Helptext for an amazon immovable usable by frisians: Dead Tree
            purpose = _("The remains of an old tree.")
         }
      },
      {
         name = "balsa_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an amazon immovable usable by frisians: Balsa Tree
            purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "balsa_black_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an amazon immovable usable by frisians: Balsa Tree
            purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "balsa_desert_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an amazon immovable usable by frisians: Balsa Tree
            purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "balsa_winter_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an amazon immovable usable by frisians: Balsa Tree
            purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "ironwood_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an amazon immovable usable by frisians: Ironwood Tree
            purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "ironwood_black_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an amazon immovable usable by frisians: Ironwood Tree
            purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "ironwood_desert_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an amazon immovable usable by frisians: Ironwood Tree
            purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "ironwood_winter_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an amazon immovable usable by frisians: Ironwood Tree
            purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "rubber_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an amazon immovable usable by frisians: Rubber Tree
            purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "rubber_black_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an amazon immovable usable by frisians: Rubber Tree
            purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "rubber_desert_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an amazon immovable usable by frisians: Rubber Tree
            purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
         }
      },
      {
         name = "rubber_winter_amazons_old",
         helptexts = {
            -- TRANSLATORS: Helptext for an amazon immovable usable by frisians: Rubber Tree
            purpose = _("This tree is only planted by the amazon tribe but can be harvested for logs.")
         }
      },
   },

   -- The order here also determines the order in lists on screen.
   buildings = {
      -- Warehouses
      {
         name = "newtribe_headquarters",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe warehouse: Headquarters
            purpose = pgettext("newtribe_building", "Accommodation for your people. Also stores your wares and tools."),
            -- TRANSLATORS: Note Helptext for a NewTribe warehouse: Headquarters
            note = pgettext("newtribe_building", "The headquarters is your main building.")
         }
      },
      {
         name = "newtribe_port",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe warehouse: Port
            purpose = pgettext("newtribe_building", "Serves as a base for overseas colonization and trade. Also stores your soldiers, wares and tools.")
         }
      },

      -- Small
      {
         name = "newtribe_quarry",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Quarry
            purpose = pgettext("newtribe_building", "Cuts blocks of granite and marble out of rocks in the vicinity."),
            -- TRANSLATORS: Note Helptext for a NewTribe production site: Quarry
            note = pgettext("newtribe_building", "The quarry needs rocks to cut within the work area.")
         }
      },
      {
         name = "newtribe_woodcutters_house",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: woodcutter's House
            purpose = pgettext("building", "Fells trees in the surrounding area and processes them into logs."),
            -- TRANSLATORS: Note Helptext for a NewTribe production site: woodcutter's House
            note = pgettext("newtribe_building", "The woodcutter's house needs trees to fell within the work area.")
         }
      },
      {
         name = "newtribe_foresters_house",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Forester's House
            purpose = pgettext("building", "Plants trees in the surrounding area."),
            -- TRANSLATORS: Note Helptext for a NewTribe production site: Forester's House
            note = pgettext("newtribe_building", "The forester’s house needs free space within the work area to plant the trees.")
         }
      },
      {
         name = "newtribe_fishers_house",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Fisher's House
            purpose = pgettext("newtribe_building", "Fishes on the coast near the fisher’s house."),
            -- TRANSLATORS: Note Helptext for a NewTribe production site: Fisher's House
            note = pgettext("newtribe_building", "The fisher’s house needs water full of fish within the work area.")
         }
      },
      {
         name = "newtribe_fishbreeders_house",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Fishbreeder's House
            purpose = pgettext("newtribe_building", "Replenishes the fishing grounds."),
            -- TRANSLATORS: Note Helptext for a NewTribe production site: Fishbreeder's House
            note = pgettext("newtribe_building", "The fishbreeder’s house needs water with some fish within the work area.")
         }
      },
      {
         name = "newtribe_hunters_house",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Hunter's House
            purpose = pgettext("building", "Hunts animals to produce meat."),
            -- TRANSLATORS: Note Helptext for a NewTribe production site: Hunter's House
            note = pgettext("newtribe_building", "The hunter’s house needs animals to hunt within the work area.")
         }
      },
      {
         name = "newtribe_well",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Well
            purpose = pgettext("building", "Draws water out of the deep.")
         }
      },
      {
         name = "newtribe_scouts_house",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Scout's House
            purpose = pgettext("building", "Explores unknown territory.")
         }
      },

      -- Medium
      {
         name = "newtribe_reed_yard",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Reed Yard
            purpose = pgettext("building", "Plants and harvests reed.")
         }
      },
      {
         name = "newtribe_toolsmithy",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Toolsmithy
            purpose = pgettext("building", "Forges all the tools that your workers need.")
         }
      },
      {
         name = "newtribe_bakery",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Bakery
            purpose = pgettext("newtribe_building", "Bakes bread for soldiers and miners alike."),
            -- TRANSLATORS: Performance Helptext for a NewTribe production site: Bakery
            performance = pgettext("newtribe_building", "The baker needs %1% on average to bake a loaf of bread."):bformat(format_seconds(34))
         }
      },
      {
         name = "newtribe_barracks",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Barracks
            purpose = pgettext("newtribe_building", "Equips recruits and trains them as soldiers.")
         }
      },

      -- Big
      {
         name = "newtribe_donkeyfarm",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Donkey Farm
            purpose = pgettext("newtribe_building", "Breeds cute and helpful donkeys for adding them to the transportation system.")
         }
      },
      {
         name = "newtribe_rye_farm",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Farm
            purpose = pgettext("building", "Sows and harvests rye."),
            -- TRANSLATORS: Performance Helptext for a NewTribe production site: Farm
            performance = pgettext("newtribe_building", "The farmer needs %1% on average to sow and harvest a sheaf of rye."):bformat(format_minutes_seconds(1, 20))
         }
      },
      -- Training Sites
      {
         name = "newtribe_colosseum",
         helptexts = {
            purpose = {
               -- TRANSLATORS: Purpose Helptext for a NewTribe training site: Colosseum, part 1
               pgettext("newtribe_building", "Trains soldiers in ‘Evade’."),
               -- TRANSLATORS: Purpose Helptext for a NewTribe training site: Colosseum, part 2
               pgettext("newtribe_building", "‘Evade’ increases the soldier’s chance not to be hit by the enemy and so to remain totally unaffected.")
            },
            -- TRANSLATORS: Note Helptext for a NewTribe training site: Colosseum
            note = pgettext("newtribe_building", "NewTribe soldiers cannot be trained in ‘Defense’, ‘Attack’, and ‘Health’ and will remain at the levels with which they came.")
         }
      },

      -- Military Sites
      {
         name = "newtribe_sentry",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe military site: Sentry
            purpose = pgettext("building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note Helptext for a NewTribe military site: Sentry
            note = pgettext("building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
         }
      },
      {
         name = "newtribe_tower",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe military site: Tower
            purpose = pgettext("building", "Garrisons soldiers to expand your territory."),
            -- TRANSLATORS: Note Helptext for a NewTribe military site: Tower
            note = pgettext("building", "If you’re low on soldiers to occupy new military sites, use the downward arrow button to decrease the capacity. You can also click on a soldier to send him away.")
         }
      },

      -- Seafaring/Ferry Sites - these are only displayed on seafaring/ferry maps
      {
         name = "newtribe_ferry_yard",
         helptexts = {
            -- TRANSLATORS: Purpose Helptext for a NewTribe production site: Ferry Yard
            purpose = pgettext("building", "Builds ferries."),
            -- TRANSLATORS: Note Helptext for a NewTribe production site: Ferry Yard
            note = pgettext("building", "Needs water nearby.")
         }
      },
      {
         name = "newtribe_shipyard",
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
   carrier = "newtribe_carrier",
   carrier2 = "newtribe_donkey",
   builder = "newtribe_builder",
   geologist = "newtribe_geologist",
   soldier = "newtribe_soldier",
   ship = "newtribe_ship",
   ferry = "newtribe_ferry",
   port = "newtribe_port",
   scouts_house = "newtribe_scouts_house",
}

pop_textdomain()
