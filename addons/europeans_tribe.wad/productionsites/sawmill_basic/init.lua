push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_sawmill_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Sawmill"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
        name = "europeans_sawmill_normal",
        enhancement_cost = {
          planks = 2,
          cloth = 2,
          spidercloth = 2,
          granite = 1,
          quartz = 1
        },
        enhancement_return_on_dismantle = {
          planks = 2,
          granite = 1,
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
      granite = 1
   },

   spritesheets = {
      idle = {
         basename = "idle",
         frames = 20,
         columns = 4,
         rows = 5,
         hotspot = { 50, 65 }
      },
      build = {
         basename = "build",
         frames = 4,
         columns = 2,
         rows = 2,
         hotspot = { 50, 61 }
      },
      working = {
         basename = "working",
         frames = 20,
         columns = 4,
         rows = 5,
         hotspot = { 53, 65 }
      }
   },

   aihints = {
        supports_seafaring = true,
        basic_amount = 1
   },

   working_positions = {
      europeans_carpenter_basic = 1
   },

   inputs = {
      { name = "log", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=saw_log_basic",
            "call=saw_log",
            "call=hardening_wood_basic",
            "call=hardening_wood",
            "return=skipped"
         }
      },
      saw_log_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
         descname = _"sawing logs",
         actions = {
            "return=skipped when economy needs blackwood",
            "return=skipped when economy needs planks",
            "return=skipped when economy needs log",
            "consume=log:2",
            "sleep=duration:30s",
            "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
            "animate=working duration:30s", 
            "produce=planks"
         }
      },
      hardening_wood_basic = {
         -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
         descname = _"hardening wood",
         actions = {
            "return=skipped when economy needs blackwood",
            "return=skipped when economy needs planks",
            "return=skipped when economy needs log",
            "consume=log:2",
            "sleep=duration:30s",
            "playsound=sound/barbarians/blackwood priority:60%",
            "animate=working duration:30s",
            "produce=blackwood"
         }
      },
      saw_log = {
         -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
         descname = _"sawing logs",
         actions = {
            "return=skipped unless economy needs planks",
            "consume=log:4",
            "sleep=duration:20s",
            "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
            "animate=working duration:30s",
            "produce=planks:3"
         }
      },
      hardening_wood = {
         -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
         descname = _"hardening wood",
         actions = {
            "return=skipped unless economy needs blackwood",
            "consume=log:4",
            "sleep=duration:20s",
            "playsound=sound/barbarians/blackwood priority:60%",
            "animate=working duration:30s",
            "produce=blackwood:3"
         }
      },
   },
}

pop_textdomain()
