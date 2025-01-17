addon_dirname = path.dirname(__file__)
push_textdomain("sumatran_tribe.wad", true)

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

-- original intension was to create a completely new building with basic carrier as a worker
-- but then as I didn't know how to remove the gardening centre, so I simply replaced it
-- by giving the new script to the gardening centre but help text is still missing now

-- wl.Descriptions():modify_unit("tribe", "amazons", "add_building", "amazons_thermal_springs", { helptexts = { 
--                   purpose = _"Distribution of thermal water makes terrain more suitable for tropical trees",
--                   note    = _"Thermal springs are useful especially while playing wasteland and winter maps. In first case to transform mountains is very advatageous, in second case, all types of terrain can be transformed."
--                }})

-- ----------------- --
-- CROCODILE HUNTERS --
-- ----------------- --

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
--                  note    = _".",
               }})
wl.Descriptions():modify_unit("tribe", "empire", "add_building", "empire_crocodile_hunters_house", { helptexts = {
                  purpose = _"Hunters working at this house can hunt crocodiles for meat.",
--                  note    = _".",
               }})
wl.Descriptions():modify_unit("tribe", "barbarians", "add_building", "barbarians_crocodile_hunters_hut", { helptexts = {
                  purpose = _"Hunters working at this house can hunt crocodiles for meat.",
--                  note    = _".",
               }})
wl.Descriptions():modify_unit("tribe", "atlanteans", "add_building", "atlanteans_crocodile_hunters_house", { helptexts = {
                  purpose = _"Hunters working at this house can hunt crocodiles for meat.",
--                  note    = _".",
               }})
wl.Descriptions():modify_unit("tribe", "amazons", "add_building", "amazons_crocodile_hunters_hut", { helptexts = {
                  purpose = _"Hunter-gatherer working at this house can hunt crocodiles for meat.",
--                  note    = _".",
               }})



pop_textdomain()
