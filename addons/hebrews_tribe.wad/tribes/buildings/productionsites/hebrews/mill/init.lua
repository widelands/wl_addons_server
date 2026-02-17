push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_mill",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Mill"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      clay = 4,
      granite = 5,
      branch = 2,
   },
   return_on_dismantle = {
      clay = 1,
      granite = 2,
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 54, 76 },
      },
      working = {
         fps = 10,
         frames = 20,
         columns = 5,
         rows = 4,
         hotspot = { 54, 76 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 540,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      hebrews_carrier = 1,
      hebrews_donkey = 1,
   },

   inputs = {
      { name = "wheat_grains", amount = 6 },
      { name = "olives", amount = 6 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- time total: 3 * 58 + 10 = 184 sec
            "call=grind_wheat",
            "call=grind_olives",
            "return=skipped"
         }
      },
      grind_wheat = {
         -- TRANSLATORS: Completed/Skipped/Did not start grinding wheat because ...
         descname = _("grinding wheat"),
         actions = {
            "return=skipped unless economy needs flour",
            "consume=wheat_grains",
            "sleep=duration:5s",
            "animate=working duration:30s",
            "playsound=sound/mill/mill_turning priority:90% allow_multiple",
            "produce=flour"
         }
      },
      grind_olives = {
         -- TRANSLATORS: Completed/Skipped/Did not start grinding olives because ...
         descname = _("grinding olives"),
         actions = {
            "return=skipped unless economy needs olive_oil",
            "consume=olives:2",
            "sleep=duration:5s",
            "animate=working duration:30s",
            "playsound=sound/mill/mill_turning priority:90% allow_multiple",
            "produce=olive_oil"
         }
      },
   },
}

pop_textdomain()
