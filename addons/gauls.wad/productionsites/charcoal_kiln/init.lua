push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_charcoal_kiln",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Charcoal Kiln"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      granite = 3,
      planks = 2,
      reed = 1,
   },
   return_on_dismantle = {
      granite = 2,
      planks = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 50, 71 },
      },
   },

   spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 50, 51 }
      },
      working = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 50, 71 }
      },
   },

   aihints = {
      prohibited_till = 1800,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 2,
      normal_ai_limit = 3,
   },

   working_positions = {
      gauls_charcoal_burner = 1
   },

   inputs = {
      { name = "log", amount = 10 },
      { name = "reed", amount = 5 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
         descname = _("producing coal"),
         actions = {
            -- time: 65 + 11.4 + 3.6 = 80 sec
            "return=skipped unless economy needs coal",
            "consume=log:4 reed",
            "animate=working duration:1m5s",
            "produce=coal",
            "sleep=duration:11s400ms"
         }
      },

   },
}

pop_textdomain()
