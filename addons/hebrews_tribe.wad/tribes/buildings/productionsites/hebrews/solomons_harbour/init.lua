push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_solomons_harbour",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Solomon's Harbour"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      clay = 6,
      granite = 8,
      branch = 4,
      cloth = 3,
      menorah = 2,
   },
   return_on_dismantle = {
      granite = 4,
      clay = 2,
      cloth = 1,
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 70, 106 },
      },
   },

   aihints = {
      prohibited_till = 1800,
      very_weak_ai_limit = 0,
      weak_ai_limit = 1
   },

   working_positions = {
      hebrews_donkey = 1
   },

   inputs = {
      { name = "menorah", amount = 4 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
         descname = _("trading"),
         actions = {
            "return=skipped unless economy needs log",
            "consume=menorah",
            "sleep=duration:45s",
            "playsound=sound/hammering/hammering priority:50%",
            "sleep=duration:30s",
            "produce=log:2"
         }
      },
   },
}

pop_textdomain()
