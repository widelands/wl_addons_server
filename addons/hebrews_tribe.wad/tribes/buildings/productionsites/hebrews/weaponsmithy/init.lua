push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_weaponsmithy",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Weapon Smithy"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      clay = 6,
      granite = 2,
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
         hotspot = { 55, 88 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 1400,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      hebrews_talmid_chacham = 1
   },

   inputs = {
      { name = "fur", amount = 8 },
      { name = "granite", amount = 8 },
      { name = "copper", amount = 8 },
      { name = "yarn", amount = 8 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=produce_slingshot",
            "call=produce_dagger",
         }
      },
      produce_slingshot = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a slingshot because ...
         descname = _("forging a slingshot"),
         actions = {
            -- time: 20.4 + 21 + 9 + 3.6 = 54 sec
            "return=skipped unless economy needs slingshot",
            "consume=granite yarn:2",
            "sleep=duration:20s400ms",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "sleep=duration:21s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=slingshot"
         }
      },
      produce_dagger = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a dagger because ...
         descname = _("forging a dagger"),
         actions = {
            "return=skipped unless economy needs dagger",
            "consume=fur copper",
            "sleep=duration:32s400ms",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "sleep=duration:36s",
            "playsound=sound/smiths/sharpening priority:90%",
            "sleep=duration:9s",
            "produce=dagger"
         }
      },
   },
}

pop_textdomain()
