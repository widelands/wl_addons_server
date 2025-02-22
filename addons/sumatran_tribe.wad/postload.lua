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
-- new "sumatran_tree" atribute is added so that these trees may be recognized by amazons as sort of normal trees
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
         -- steps from building to crocodile: 2-13, + 35 sec sleep
         -- min. worker time: 2 * 2 * 1.8 + 1.5 = 8.7 sec -> 43.7 sec
         -- max. worker time: 2 * 13 * 1.8 + 1.5 = 46.8 sec -> 1 m 21.8 sec

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
                  purpose = _"Hunters working at this house can hunt crocodiles for meat.",
                  note    = _"This building is useful only when you have a Sumatran opponent and there are crocodiles coming from his territory into your territory.",
                  performance = {
                     -- TRANSLATORS: Performance helptext for a Frisian production site: Crocodile Hunter’s House, part 1
                     pgettext("frisians_building", "This building can produce one meat between %1$s and %2$s, depending on how far the hunter has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 22)),
                     -- TRANSLATORS: Performance helptext for a Frisian production site: Crocodile Hunter’s House, part 2
                     pgettext("frisians_building", "In case of slopes or obstacles in the way, the time is increased.")
                   }
               }})
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
                  purpose = _"Hunters working at this house can hunt crocodiles for meat.",
                  note    = _"This building is useful only when you have a Sumatran opponent and there are crocodiles coming from his territory into your territory.",
                  performance = {
                     -- TRANSLATORS: Performance helptext for an Empire production site: Crocodile Hunter’s House, part 1
                     pgettext("empire_building", "This building can produce one meat between %1$s and %2$s, depending on how far the hunter has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 22)),
                     -- TRANSLATORS: Performance helptext for an Empire production site: Crocodile Hunter’s House, part 2
                     pgettext("empire_building", "In case of slopes or obstacles in the way, the time is increased.")
                   }
               }})
wl.Descriptions():modify_unit("tribe", "barbarians", "add_building", "barbarians_crocodile_hunters_hut", { helptexts = {
                  purpose = _"Hunters working at this house can hunt crocodiles for meat.",
                  note    = _"This building is useful only when you have a Sumatran opponent and there are crocodiles coming from his territory into your territory.",
                  performance = {
                     -- TRANSLATORS: Performance helptext for a Barbarian production site: Crocodile Hunter’s House, part 1
                     pgettext("barbarians_building", "This building can produce one meat between %1$s and %2$s, depending on how far the hunter has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 22)),
                     -- TRANSLATORS: Performance helptext for a Barbarian production site: Crocodile Hunter’s House, part 2
                     pgettext("barbarians_building", "In case of slopes or obstacles in the way, the time is increased.")
                   }
               }})
wl.Descriptions():modify_unit("tribe", "atlanteans", "add_building", "atlanteans_crocodile_hunters_house", { helptexts = {
                  purpose = _"Hunters working at this house can hunt crocodiles for meat.",
                  note    = _"This building is useful only when you have a Sumatran opponent and there are crocodiles coming from his territory into your territory.",
                  performance = {
                     -- TRANSLATORS: Performance helptext for an Atlantean production site: Crocodile Hunter’s House, part 1
                     pgettext("atlanteans_building", "This building can produce one meat between %1$s and %2$s, depending on how far the hunter has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 22)),
                     -- TRANSLATORS: Performance helptext for an Atlantean production site: Crocodile Hunter’s House, part 2
                     pgettext("atlanteans_building", "In case of slopes or obstacles in the way, the time is increased.")
                   }
               }})
wl.Descriptions():modify_unit("tribe", "amazons", "add_building", "amazons_crocodile_hunters_hut", { helptexts = {
                  purpose = _"Hunter-gatherer working at this house can hunt crocodiles for meat.",
                  note    = _"This building is useful only when you have a Sumatran opponent and there are crocodiles coming from his territory into your territory.",
                  performance = {
                     -- TRANSLATORS: Performance helptext for an Amazon production site: Crocodile Hunter’s House, part 1
                     pgettext("amazons_building", "This building can produce one meat between %1$s and %2$s, depending on how far the hunter has to walk."):bformat(format_seconds(44), format_minutes_seconds(1, 22)),
                     -- TRANSLATORS: Performance helptext for an Amazon production site: Crocodile Hunter’s House, part 2
                     pgettext("amazons_building", "In case of slopes or obstacles in the way, the time is increased.")
                   }
               }})



pop_textdomain()
