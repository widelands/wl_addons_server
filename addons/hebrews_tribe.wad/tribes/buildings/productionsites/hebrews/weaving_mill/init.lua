push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_weaving_mill",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Weaving Mill"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      clay = 6,
      granite = 3,
      branch = 2,
   },
   return_on_dismantle = {
      clay = 2,
      granite = 1,
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 54, 81 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 420,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      hebrews_carrier = 2
   },

   inputs = {
      { name = "yarn", amount = 12 },
      { name = "fur", amount = 8 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=weave_yarn",
            "call=felt_fur",
            "return=skipped"
         }
      },
      weave_yarn = {
         -- TRANSLATORS: Completed/Skipped/Did not start weaving because ...
         descname = _("weaving"),
         actions = {
            "return=skipped unless economy needs cloth",
            "consume=yarn:6",
            "sleep=duration:20s",
            "playsound=sound/mill/weaving priority:90%",
            "sleep=duration:20s",
            "produce=cloth"
         }
      },
      felt_fur = {
         -- TRANSLATORS: Completed/Skipped/Did not start felting because ...
         descname = _("felting"),
         actions = {
            "return=skipped unless economy needs cloth",
            "consume=fur:4",
            "sleep=duration:20s",
            "playsound=sound/mill/weaving priority:90%",
            "sleep=duration:20s",
            "produce=cloth"
         }
      },
   },
}

pop_textdomain()
