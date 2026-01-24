push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_workshop_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Basic Workshop"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
      name = "sumatran_workshop_tools",
      enhancement_cost = {
         log = 1,
         granite = 1,
      },
      enhancement_return_on_dismantle = {
         granite = 1
      }
   },

   buildcost = {
      log = 1,
      granite = 2,
      palmleaves = 1,
      reed = 2
   },
   return_on_dismantle = {
      granite = 1,
      reed = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 60, 68 },
      },
   },

   spritesheets = {
      working = {
         fps = 25,
         frames = 19,
         columns = 10,
         rows = 2,
         hotspot = { 60, 68 },
      },
   },

   aihints = {
      prohibited_till = 180,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 2,
      normal_ai_limit = 2,
   },

   working_positions = {
      sumatran_craftsman = 1
   },

   inputs = {
      { name = "log", amount = 8 },
      { name = "diamond_raw", amount = 8 },
      { name = "granite", amount = 4 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=produce_sandedwood",
            "call=produce_diamond",
            "call=produce_whetstone",
            "return=skipped",
         }
      },
      produce_sandedwood = {
         -- TRANSLATORS: Completed/Skipped/Did not start sanding wood because ...
         descname = _("sanding wood"),
         actions = {
            -- time total: 20 sec
            "return=skipped unless economy needs sandedwood",
            "return=failed unless site has log",
            "consume=log",
            "sleep=duration:1s400ms",
            "animate=working duration:11s",
            "produce=sandedwood",
            "sleep=duration:5s"
         }
      },
      produce_diamond = {
         -- TRANSLATORS: Completed/Skipped/Did not start grinding diamond because ...
         descname = _("grinding diamond"),
         actions = {
            -- time total: 72 sec
            "return=skipped unless economy needs diamond",
            "return=skipped when economy needs whetstone",
            "return=failed unless site has diamond_raw",
            "return=failed unless site has granite",
            "consume=diamond_raw granite",
            "sleep=duration:1s400ms",
            "animate=working duration:58s",
            "produce=diamond",
            "sleep=duration:10s"
         }
      },
      produce_whetstone = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a whetstone because ...
         descname = _("making a whetstone"),
         actions = {
            -- time total: 67 sec
            "return=skipped unless economy needs whetstone",
            "consume=granite diamond_raw:2",
            "sleep=duration:1s400ms",
            "animate=working duration:53s",
            "produce=whetstone",
            "sleep=duration:10s"
         }
      },
   },
}

pop_textdomain()
