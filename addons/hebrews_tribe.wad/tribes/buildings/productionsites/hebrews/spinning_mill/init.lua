push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_spinning_mill",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Spinning Mill"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      clay = 3,
      branch = 2,
   },
   return_on_dismantle = {
      clay = 1,
      branch = 1
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 40, 55 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 400,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
   },

   working_positions = {
      hebrews_carrier = 1
   },

   inputs = {
      { name = "wool", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start spinning because ...
         descname = _("spinning"),
         actions = {
            "return=skipped unless economy needs yarn",
            "consume=wool",
            "sleep=duration:15s",
            "playsound=sound/atlanteans/goldspin priority:50% allow_multiple",
            "sleep=duration:15s",
            "produce=yarn",
            "produce=yarn"
         }
      },
   },
}

pop_textdomain()
