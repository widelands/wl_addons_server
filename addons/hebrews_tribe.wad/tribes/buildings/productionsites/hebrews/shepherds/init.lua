push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_shepherds",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Shepherds Fire"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      cloth = 1,
      branch = 2,
   },
   return_on_dismantle = {
      cloth = 1,
      branch = 1,
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 40, 53 },
      },
   },

   aihints = {
      basic_amount = 2,
      forced_after = 60,
      very_weak_ai_limit = 1,
      weak_ai_limit = 3,
   },

   working_positions = {
      hebrews_shepherd = 3
   },

   inputs = {
      { name = "water", amount = 4 },
      { name = "branch", amount = 4 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- time total: 3 * 58 + 10 = 184 sec
            "call=release",
            "call=sheer",
            "call=sheer",
            "call=sheer",
            "call=hunt",
            "return=skipped"
         }
      },
      release = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("releasing sheep"),
         actions = {
            -- time total: 53 sec
            "return=skipped when not economy needs wool and not economy needs meat",
            "return=skipped unless site has water",
            "consume=water branch",
            "callworker=release",
            "sleep=duration:53s"
         }
      },
      hunt = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("hunting"),
         actions = {
            -- time total: 53 sec
            "return=skipped when not economy needs sheep2",
            "callworker=hunt",
            "sleep=duration:53s"
         }
      },
      sheer = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("sheering"),
         actions = {
            -- time total: 53 sec
            "return=skipped when not economy needs wool",
            "callworker=sheer",
            "sleep=duration:53s"
         }
      },
   },
}

pop_textdomain()
