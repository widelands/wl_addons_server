push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_lime_kiln",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Lime Kiln"),
   icon = dirname .. "menu.png",
   size = "medium",
   
   enhancement = {
        name = "europeans_stonemasons_house",
        enhancement_cost = {
          planks = 2,
          cloth = 2,
          granite = 1,
          brick = 1,
          grout = 1,
          marble = 2,
          quartz = 1
        },
        enhancement_return_on_dismantle = {
          planks = 1,
          granite = 2,
          marble = 2,
          quartz = 1
        },
   },

   buildcost = {
      blackwood = 3,
      reed = 3,
      granite = 2
   },
   return_on_dismantle = {
      blackwood = 2,
      granite = 2
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 45, 53 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
         hotspot = { 45, 53 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_stonemason_basic = 1
   },

   inputs = {
      { name = "granite", amount = 8 },
      { name = "clay", amount = 6 },
      { name = "water", amount = 6 },
      { name = "coal", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=mixing_grout_basic",
            "call=burning_bricks_basic",
            "call=mixing_grout",
            "call=burning_bricks",
         }
      },
      mixing_grout_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start mixing grout because ...
         descname = _"mixing grout",
         actions = {
            "return=skipped when economy needs brick",
            "return=skipped when economy needs grout",
            "return=skipped when economy needs coal",
            "return=skipped when economy needs granite",
            "consume=coal granite water",
            "sleep=duration:40s",
            "playsound=sound/barbarians/stonegrind priority:80%",
            "animate=working duration:20s",
            "playsound=sound/barbarians/mortar priority:60%",
            "sleep=duration:3s",
            "produce=grout"
         }
      },
      mixing_grout = {
         -- TRANSLATORS: Completed/Skipped/Did not start mixing grout because ...
         descname = _"mixing grout",
         actions = {
            "return=skipped unless economy needs grout",
            "return=skipped when economy needs granite",
            "consume=coal:2 granite:3 water:3",
            "sleep=duration:40s",
            "playsound=sound/barbarians/stonegrind priority:80%",
            "animate=working duration:40s",
            "playsound=sound/barbarians/mortar priority:60%",
            "sleep=duration:3s",
            "produce=grout:3"
         }
      },
      burning_bricks_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start burning bricks because ...
         descname = _"burning bricks",
         actions = {
            "return=skipped when economy needs brick",
            "return=skipped when economy needs grout",
            "return=skipped when economy needs coal",
            "return=skipped when economy needs granite",
            "consume=coal granite clay",
            "sleep=duration:40s",
            "playsound=sound/barbarians/stonegrind priority:80%",
            "animate=working duration:20s",
            "sleep=duration:3s",
            "produce=brick",
         },
      },
      burning_bricks = {
         -- TRANSLATORS: Completed/Skipped/Did not start burning bricks because ...
         descname = _"burning bricks",
         actions = {
            "return=skipped unless economy needs brick",
            "return=skipped when economy needs granite",
            "consume=coal:2 granite clay:3",
            "sleep=duration:40s",
            "playsound=sound/barbarians/stonegrind priority:80%",
            "animate=working duration:40s",
            "sleep=duration:3s",
            "produce=brick:3"
         },
      }
   },
}

pop_textdomain()
