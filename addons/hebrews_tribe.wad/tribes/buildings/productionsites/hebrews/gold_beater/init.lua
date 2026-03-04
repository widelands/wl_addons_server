push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_gold_beater",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Gold Beater's Workshop"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      clay = 4,
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
         hotspot = { 54, 85 },
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 54, 85 },
      },
   },

   aihints = {
      needs_rocks = false,
      prohibited_till = 1300,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      hebrews_talmid_chacham = 1
   },

   inputs = {
      { name = "gold_ore", amount = 8 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=gold_leaf",
            "call=menorah",
         }
      },
      gold_leaf = {
         -- TRANSLATORS: Completed/Skipped/Did not start making gold leaf because ...
         descname = _("making gold leaf"),
         actions = {
            "return=skipped unless economy needs gold_leaf",
            "consume=gold_ore",
            "sleep=duration:12s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:20s",
            "produce=gold_leaf"
         }
      },
      menorah = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a menorah because ...
         descname = _("making a menorah"),
         actions = {
            "return=skipped unless economy needs menorah",
            "consume=gold_ore:3",
            "sleep=duration:15s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:30s",
            "produce=menorah"
         }
      },
   },
}

pop_textdomain()
