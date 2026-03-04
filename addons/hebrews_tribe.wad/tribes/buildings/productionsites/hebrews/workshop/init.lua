push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_workshop",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Workshop"),
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
   animations = {
      idle = {
         hotspot = { 50, 66 },
      },
      working = {
         basename = "idle",
         hotspot = { 50, 66 },
      }
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 900,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
   },

   working_positions = {
      hebrews_talmid_chacham = 1
   },

   inputs = {
      { name = "branch", amount = 8 },
      { name = "granite", amount = 8 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=produce_pick",
            "call=produce_hammer",
            "call=produce_fishing_rod",
         }
      },
      produce_pick = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
         descname = _("making a pick"),
         actions = {
            "return=skipped unless economy needs pick",
            "consume=branch granite",
            "sleep=duration:20s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=pick"
         }
      },
      produce_hammer = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
         descname = _("making a hammer"),
         actions = {
            "return=skipped unless economy needs hammer",
            "consume=branch granite",
            "sleep=duration:20s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:25s",
            "produce=hammer"
         }
      },
      produce_fishing_rod = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a fishing rod because ...
         descname = _("making a fishing rod"),
         actions = {
            "return=skipped unless economy needs fishing_rod",
            "consume=branch",
            "sleep=duration:15s",
            "playsound=sound/smiths/smith priority:50% allow_multiple",
            "animate=working duration:20s",
            "produce=fishing_rod"
         }
      },
   },
}

pop_textdomain()
