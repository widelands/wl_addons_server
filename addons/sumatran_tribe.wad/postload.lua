addon_dirname = path.dirname(__file__)
push_textdomain("sumatran_tribe.wad", true)

-- For formatting time strings
include "tribes/scripting/help/time_strings.lua"

-- For lore texts
-- TRANSLATORS: Format string for a latin quote and its translation
quote_with_translation_format = pgettext("empire_lore", "‘%1%’<br>(%2%)")
function latin_lore(latin, translation)
   return quote_with_translation_format:bformat(latin, translation)
end

-- --------- --
-- NEW TREES --
-- --------- --

-- palms and new tropical trees are missing "normal_tree" atribute for Sumatrans purposes
-- (the trees should not be recognized as normal trees by Sumatrans)
-- new "sumatran_tree" atribute is added so that these trees may be recognized by Amazons as sort of normal trees
-- other tribes use atribute "tree" for all trees without change

-- WORKER
wl.Descriptions():modify_unit("worker", "amazons_woodcutter", "programs", "set", "harvest_sumatran", {
         "findobject=attrib:sumatran_tree radius:10",
         "walk=object",
         "playsound=sound/woodcutting/woodcutting priority:100% allow_multiple",
         "animate=hacking duration:30s",
         "playsound=sound/woodcutting/tree_falling priority:100%",
         "callobject=fall",
         "animate=hacking duration:2s",
         "createware=log",
         "return"
      })
wl.Descriptions():modify_unit("worker", "amazons_woodcutter_master", "programs", "set", "harvest_sumatran", {
         "findobject=attrib:sumatran_tree radius:10",
         "walk=object",
         "playsound=sound/woodcutting/woodcutting priority:100% allow_multiple",
         "animate=hacking duration:30s",
         "playsound=sound/woodcutting/tree_falling priority:100%",
         "callobject=fall",
         "animate=hacking duration:2s",
         "createware=log",
         "return"
      })

-- BUILDING
wl.Descriptions():modify_unit("productionsite", "amazons_woodcutters_hut", "programs", "set", "main", {
         -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
         descname = _("felling trees"), actions = {
            "call=harvest", -- standard program for "normal_tree"
            "call=harvest_sumatran", -- new program added
            "call=harvest2", -- standard program for "normal_tree"
            "call=harvest_sumatran2", -- new program added
            "return=skipped"
      }})

wl.Descriptions():modify_unit("productionsite", "amazons_woodcutters_hut", "programs", "set", "harvest", {
         -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
         descname = _("felling trees"), actions = {
            "callworker=harvest on failure skip", 
            "sleep=duration:3s",
      }})
wl.Descriptions():modify_unit("productionsite", "amazons_woodcutters_hut", "programs", "set", "harvest2", {
         -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
         descname = _("felling trees"), actions = {
            "callworker=harvest", 
            "sleep=duration:3s",
      }})
wl.Descriptions():modify_unit("productionsite", "amazons_woodcutters_hut", "programs", "set", "harvest_sumatran", {
         -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
         descname = _("felling trees"), actions = {
            "callworker=harvest_sumatran on failure skip", 
            "sleep=duration:2s",
      }})
wl.Descriptions():modify_unit("productionsite", "amazons_woodcutters_hut", "programs", "set", "harvest_sumatran2", {
         -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
         descname = _("felling trees"), actions = {
            "callworker=harvest_sumatran", 
            "sleep=duration:2s",
      }})

-- --------- --
-- TERRAFORM --
-- --------- --
wl.Descriptions():modify_unit("worker", "amazons_jungle_master", "programs", "set", "terraform", {
         "findspace=size:any radius:8 terraform:amazons",
         "walk=coords",
         "terraform=amazons",
         "return"
      })

 wl.Descriptions():modify_unit("worker", "amazons_jungle_master", "programs", "set", "check", {
          "findspace=size:any radius:8 terraform:amazons",
       })

-- original intention was to create a completely new building with basic carrier as a worker
-- but then as I didn't know how to remove the gardening center, so I simply replaced it
-- by giving the new script to the gardening center but help text is still missing now

-- wl.Descriptions():modify_unit("tribe", "amazons", "add_building", "amazons_thermal_springs", { helptexts = { 
--                   purpose = _"Distribution of thermal water makes terrain more suitable for tropical trees",
--                   note    = _"Thermal springs are useful especially while playing wasteland and winter maps. In first case to transform mountains is very advatageous, in second case, all types of terrain can be transformed."
--                }})

-- ----------------- --
-- CROCODILE HUNTERS --
-- ----------------- --
         -- steps from building to crocodile: 2-13, + 9 sec sleep
         -- min. worker time: 2 * 2 * 1.8 + 1.5 = 8.7 sec -> 17.7 sec
         -- max. worker time: 2 * 13 * 1.8 + 1.5 = 46.8 sec -> 55.8 sec
         -- mean worker time: 2 * 8.2 * 1.8 + 1.5 = 31 sec -> 40 sec

         -- amazons frisians steps from building to animal: 2-17, mean 10.819
         -- min. worker time: 2 * 2 * 1.8 + 1 = 8.2 sec
         -- max. worker time: 2 * 17 * 1.8 + 1 = 62.2 sec
         -- mean worker time: 2 * 10.819 * 1.8 + 1 = 39.948 sec

         -- empire barbarians steps from building to animal: 2-16, mean 10.175
         -- min. worker time: 2 * 2 * 1.8 + 1 = 8.2 sec
         -- max. worker time: 2 * 16 * 1.8 + 1 = 58.6 sec
         -- mean worker time: 2 * 10.175 * 1.8 + 1 = 37.63 sec

         -- atlanteans steps from building to animal: 2-16, mean 10.175
         -- min. worker time: 2 * 2 * 1.8 + 1.5 = 8.7 sec
         -- max. worker time: 2 * 16 * 1.8 + 1.5 = 59.1 sec
         -- mean worker time: 2 * 10.175 * 1.8 + 1.5 = 38.13 sec

-- WORKERS
wl.Descriptions():modify_unit("worker", "frisians_hunter", "programs", "set", "hunt_crocodile", {
         "findobject=type:bob radius:10 attrib:crocodile",
         "walk=object",
         "animate=idle duration:1s500ms",
         "removeobject",
         "createware=meat",
         "return"
      })
wl.Descriptions():modify_unit("worker", "empire_hunter", "programs", "set", "hunt_crocodile", {
         "findobject=type:bob radius:10 attrib:crocodile",
         "walk=object",
         "animate=idle duration:1s500ms",
         "removeobject",
         "createware=meat",
         "return"
      })
wl.Descriptions():modify_unit("worker", "barbarians_hunter", "programs", "set", "hunt_crocodile", {
         "findobject=type:bob radius:10 attrib:crocodile",
         "walk=object",
         "animate=idle duration:1s500ms",
         "removeobject",
         "createware=meat",
         "return"
      })
wl.Descriptions():modify_unit("worker", "atlanteans_hunter", "programs", "set", "hunt_crocodile", {
         "findobject=type:bob radius:10 attrib:crocodile",
         "walk=object",
         "animate=idle duration:1s500ms",
         "removeobject",
         "createware=meat",
         "return"
      })
wl.Descriptions():modify_unit("worker", "amazons_hunter_gatherer", "programs", "set", "hunt_crocodile", {
         "findobject=type:bob radius:10 attrib:crocodile",
         "walk=object",
         "animate=idle duration:1s500ms",
         "removeobject",
         "createware=meat",
         "return"
      })


-- BUILDINGS

wl.Descriptions():modify_unit("tribe", "frisians", "add_building", "frisians_crocodile_hunters_house", { helptexts = {
                  lore = pgettext("frisians_building", "Of course hunting crocodiles is a good idea. "..
                                                       "The efficiency of hunting should not increase much but the productivity can increase, if there are not enough animals in the nearby forests."),
                  -- TRANSLATORS: Lore author helptext for a Frisian production site: Crocodile Hunter’s House
                  lore_author = pgettext("frisians_building", "Hunter advocates the idea of building a crocodile hunter's house"),
                  purpose = _"Hunts animals to produce meat. Hunters working at this house can hunt crocodiles too.",
                  note = {
                     -- TRANSLATORS: Note helptext for a Frisian production site: Crocodile Hunter’s House, part 1
                     pgettext("frisians_building", "This building is useful only when you have a Sumatran opponent and there are crocodiles coming from his territory into your territory."),
                     -- TRANSLATORS: Note helptext for a Frisian production site: Crocodile Hunter’s House, part 2
                     pgettext("frisians_building", "The building has 2 different working areas, the smaller for crocodile hunting and the larger for game hunting."),
                  },
                  performance = {
                     -- TRANSLATORS: Performance helptext for a Frisian production site: Crocodile Hunter’s House, part 1
                     pgettext("frisians_building", "If there is a sufficient amount of crocodiles and other animals, the hunters need %1$s on average to produce one meat. If there are no crocodiles, the building operates as a basic hunter's house and the hunters need %2$s on average to produce one meat."):bformat(format_minutes_seconds(1, 2), format_minutes_seconds(1, 15)),
                     -- TRANSLATORS: Performance helptext for a Frisian production site: Crocodile Hunter’s House, part 2
                     pgettext("frisians_building", "In case of slopes or obstacles in the way, the time is increased."),
                     -- TRANSLATORS: Performance helptext for a Frisian production site: Crocodile Hunter’s House, part 3
                     pgettext("frisians_building", "If there is a sufficient amount of crocodiles and other animals, the hunters produce one fur after they have produced four pieces of meat."),
                   }
               }})

wl.Descriptions():modify_unit("building", "frisians_hunters_house", "enhancement", {
        name = "frisians_crocodile_hunters_house",
        enhancement_cost = {
            brick = 1,
            log = 1,
            reed = 1,
        },
        enhancement_return_on_dismantle = {
            reed = 1,
        },
    })

wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_crocodile_hunters_house", { helptexts = {
                  lore = latin_lore(
                     -- TRANSLATORS: DO NOT TRANSLATE, but you may transliterate into non-latin fonts.
                     --    Adaptation of a classical Latin quote meaning:
                     --    "Here be crocodiles."
                     _("Hic sunt crocodili."),
                     -- TRANSLATORS: Lore helptext for an Empire production site: Crocodile Hunter’s House
                     --    Translation for adaptation of a classical Latin quote:
                     --    "Hic sunt crocodili."
                     _("Here be crocodiles.")),
                  -- TRANSLATORS: Lore author helptext for an Empire production site: Crocodile Hunter’s House
                  lore_author = pgettext("empire_building", "Written on uncharted territories of imperial maps"),
                  purpose = _"Hunts animals to produce meat. Hunters working at this house can hunt crocodiles too.",
                  note = {
                     -- TRANSLATORS: Note helptext for an Empire production site: Crocodile Hunter’s House, part 1
                     pgettext("empire_building", "This building is useful only when you have a Sumatran opponent and there are crocodiles coming from his territory into your territory."),
                     -- TRANSLATORS: Note helptext for an Empire production site: Crocodile Hunter’s House, part 2
                     pgettext("empire_building", "The building has 2 different working areas, the smaller for crocodile hunting and the larger for game hunting."),
                  },
                  performance = {
                     -- TRANSLATORS: Performance helptext for an Empire production site: Crocodile Hunter’s House, part 1
                     pgettext("empire_building", "If there is a sufficient amount of crocodiles and other animals, the hunters need %1$s on average to produce one meat. If there are no crocodiles, the building operates as a basic hunter's house and the hunters need %2$s on average to produce one meat."):bformat(format_minutes_seconds(1, 2), format_minutes_seconds(1, 13)),
                     -- TRANSLATORS: Performance helptext for an Empire production site: Crocodile Hunter’s House, part 2
                     pgettext("empire_building", "In case of slopes or obstacles in the way, the time is increased."),
                   }
               }})

wl.Descriptions():modify_unit("building", "empire_hunters_house", "enhancement", {
        name = "empire_crocodile_hunters_house",
        enhancement_cost = {
            log = 1,
            planks = 1,
            granite = 1,
        },
        enhancement_return_on_dismantle = {
            log = 1,
            planks = 1,
        },
    })

wl.Descriptions():modify_unit("tribe", "barbarians", "add_building", "barbarians_crocodile_hunters_hut", { helptexts = {
                  lore = pgettext("barbarians_building", "Hunting crocodiles keeps our living space save. "..
                                                         "The crocodiles could easily become overpopulated once they appear in our territory."),
                  -- TRANSLATORS: Lore author helptext for a Barbarian production site: Crocodile Hunter’s Hut
                  lore_author = pgettext("barbarians_building", "Hunter advocates the idea of building a crocodile hunter's hut"),
                  purpose = _"Hunts animals to produce meat. Hunters working at this house can hunt crocodiles too.",
                  note = {
                     -- TRANSLATORS: Note helptext for a Barbarian production site: Crocodile Hunter’s Hut, part 1
                     pgettext("barbarians_building", "This building is useful only when you have a Sumatran opponent and there are crocodiles coming from his territory into your territory."),
                     -- TRANSLATORS: Note helptext for a Barbarian production site: Crocodile Hunter’s Hut, part 2
                     pgettext("barbarians_building", "The building has 2 different working areas, the smaller for crocodile hunting and the larger for game hunting."),
                  },
                  performance = {
                     -- TRANSLATORS: Performance helptext for a Barbarian production site: Crocodile Hunter’s Hut, part 1
                     pgettext("barbarians_building", "If there is a sufficient amount of crocodiles and other animals, the hunters need %1$s on average to produce one meat. If there are no crocodiles, the building operates as a basic hunter's hut and the hunters need %2$s on average to produce one meat."):bformat(format_minutes_seconds(1, 2), format_minutes_seconds(1, 13)),
                     -- TRANSLATORS: Performance helptext for a Barbarian production site: Crocodile Hunter’s Hut, part 2
                     pgettext("barbarians_building", "In case of slopes or obstacles in the way, the time is increased."),
                   }
               }})

wl.Descriptions():modify_unit("building", "barbarians_hunters_hut", "enhancement", {
        name = "barbarians_crocodile_hunters_hut",
        enhancement_cost = {
            log = 2,
            granite = 2,
        },
        enhancement_return_on_dismantle = {
            log = 1,
            granite = 1,
        },
    })

wl.Descriptions():modify_unit("tribe", "atlanteans", "add_building", "atlanteans_crocodile_hunters_house", { helptexts = {
                  lore = pgettext("atlanteans_building", "Of course hunting crocodiles is a good idea. "..
                                                         "The efficiency of hunting should not increase much but the productivity can increase, if there are not enough animals in the nearby forests."),
                  -- TRANSLATORS: Lore author helptext for an Atlantean production site: Crocodile Hunter’s House
                  lore_author = pgettext("atlanteans_building", "Hunter advocates the idea of building a crocodile hunter's house"),
                  purpose = _"Hunts animals to produce meat. Hunters working at this house can hunt crocodiles too.",
                  note = {
                     -- TRANSLATORS: Note helptext for an Atlantean production site: Crocodile Hunter’s House, part 1
                     pgettext("atlanteans_building", "This building is useful only when you have a Sumatran opponent and there are crocodiles coming from his territory into your territory."),
                     -- TRANSLATORS: Note helptext for an Atlantean production site: Crocodile Hunter’s House, part 2
                     pgettext("atlanteans_building", "The building has 2 different working areas, the smaller for crocodile hunting and the larger for game hunting."),
                  },
                  performance = {
                     -- TRANSLATORS: Performance helptext for an Atlantean production site: Crocodile Hunter’s House, part 1
                     pgettext("atlanteans_building", "If there is a sufficient amount of crocodiles and other animals, the hunters need %1$s on average to produce one meat. If there are no crocodiles, the building operates as a basic hunter's house and the hunters need %2$s on average to produce one meat."):bformat(format_minutes_seconds(1, 2), format_minutes_seconds(1, 13)),
                     -- TRANSLATORS: Performance helptext for an Atlantean production site: Crocodile Hunter’s House, part 2
                     pgettext("atlanteans_building", "In case of slopes or obstacles in the way, the time is increased."),
                   }
               }})

wl.Descriptions():modify_unit("building", "atlanteans_hunters_house", "enhancement", {
        name = "atlanteans_crocodile_hunters_house",
        enhancement_cost = {
            log = 1,
            planks = 1,
            granite = 1,
        },
        enhancement_return_on_dismantle = {
            log = 1,
            planks = 1,
        },
    })

wl.Descriptions():modify_unit("tribe", "amazons", "add_building", "amazons_crocodile_hunters_hut", { helptexts = {
                  lore = pgettext("amazons_building", "Hunting crocodiles keeps our living space save. "..
                                                      "The crocodiles could easily become overpopulated once they appear in our territory."),
                  -- TRANSLATORS: Lore author helptext for an Amazon production site: Crocodile Hunter’s Hut
                  lore_author = pgettext("amazons_building", "Hunter-gatherer advocates the idea of building a crocodile hunter's hut"),
                  purpose = _"Hunts animals to produce meat. Catches fish in the waters. Hunter-gatherers working at this house can hunt crocodiles too.",
                  note = {
                     -- TRANSLATORS: Note helptext for an Amazon production site: Crocodile Hunter’s Hut, part 1
                     pgettext("amazons_building", "This building is useful only when you have a Sumatran opponent and there are crocodiles coming from his territory into your territory."),
                     -- TRANSLATORS: Note helptext for an Amazon production site: Crocodile Hunter’s Hut, part 2
                     pgettext("amazons_building", "The building has 2 different working areas, the smaller for crocodile hunting and the larger for game hunting and fishing."),
                  },
                  performance = {
                     -- TRANSLATORS: Performance helptext for an Amazon production site: Crocodile Hunter’s Hut, part 1
                     pgettext("amazons_building", "If there is a sufficient amount of crocodiles, other animals and fishes, the hunter-gatherers need %1$s on average to produce one meat or fish. If there are no crocodiles, the building operates as a basic hunter-gatherer's hut and needs %2$s on average to produce one meat or fish."):bformat(format_minutes_seconds(1, 3), format_minutes_seconds(1, 14)),
                     -- TRANSLATORS: Performance helptext for an Amazon production site: Crocodile Hunter’s Hut, part 2
                     pgettext("amazons_building", "In case of slopes or obstacles in the way, the time is increased."),
                   }
               }})

wl.Descriptions():modify_unit("building", "amazons_hunter_gatherers_hut", "enhancement", {
        name = "amazons_crocodile_hunters_hut",
        enhancement_cost = {
            log = 3,
            rope = 1,
        },
        enhancement_return_on_dismantle = {
            log = 1,
            rope = 1,
        },
    })


if 0 == 1 then -- pcall (wl.Game():immovable_exists("lutas_atlanteans_shipconstruction") ) then

-- ----------------------- --
-- LUTAS' CROCODILE HUNTER --
-- ----------------------- --

    wl.Descriptions():modify_unit("worker", "lutas_atlanteans_hunter", "programs", "set", "hunt_crocodile", {
         "findobject=type:bob radius:10 attrib:crocodile",
         "walk=object",
         "animate=idle duration:1s500ms",
         "removeobject",
         "createware=meat",
         "return"
      })

    wl.Descriptions():modify_unit("tribe", "lutas_atlanteans", "add_building", "lutas_atlanteans_crocodile_hunters_house", { helptexts = {
                  lore = pgettext("lutas_atlanteans_building", "Of course hunting crocodiles is a good idea. "..
                                                               "The efficiency of hunting should not increase much but the productivity can increase, if there are not enough animals in the nearby forests."),
                  -- TRANSLATORS: Lore author helptext for an Atlantean production site: Crocodile Hunter’s House
                  lore_author = pgettext("lutas_atlanteans_building", "Hunter advocates the idea of building a crocodile hunter's house"),
                  purpose = _"Hunts animals to produce meat. Hunters working at this house can hunt crocodiles too.",
                  note = {
                     -- TRANSLATORS: Note helptext for an Atlantean production site: Crocodile Hunter’s House, part 1
                     pgettext("lutas_atlanteans_building", "This building is useful only when you have a Sumatran opponent and there are crocodiles coming from his territory into your territory."),
                     -- TRANSLATORS: Note helptext for an Atlantean production site: Crocodile Hunter’s House, part 2
                     pgettext("lutas_atlanteans_building", "The building has 2 different working areas, the smaller for crocodile hunting and the larger for game hunting."),
                  },
                  performance = {
                     -- TRANSLATORS: Performance helptext for an Atlantean production site: Crocodile Hunter’s House, part 1
                     pgettext("lutas_atlanteans_building", "If there is a sufficient amount of crocodiles and other animals, the hunters need %1$s on average to produce one meat. If there are no crocodiles, the building operates as a basic hunter's house and the hunters need %2$s on average to produce one meat."):bformat(format_minutes_seconds(1, 2), format_minutes_seconds(1, 13)),
                     -- TRANSLATORS: Performance helptext for an Atlantean production site: Crocodile Hunter’s House, part 2
                     pgettext("lutas_atlanteans_building", "In case of slopes or obstacles in the way, the time is increased."),
                   }
               }})

    wl.Descriptions():modify_unit("building", "lutas_atlanteans_hunters_house", "enhancement", {
        name = "lutas_atlanteans_crocodile_hunters_house",
        enhancement_cost = {
            log = 1,
            planks = 1,
            granite = 1,
        },
        enhancement_return_on_dismantle = {
            log = 1,
            planks = 1,
        },
    })

end

pop_textdomain()
