push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_mill",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Mill"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      granite = 2,
      planks = 1,
      brick = 2,
      reed = 1
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1,
      brick = 1
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 44, 90 },
      },
      build = {
         frames = 2,
         columns = 2,
         rows = 1,
         hotspot = { 44, 90 },
      },
      unoccupied = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 44, 90 },
      },
      working = {
         fps = 15,
         frames = 19,
         columns = 10,
         rows = 2,
         hotspot = { 44, 90 },
      },
   },

   aihints = {
      prohibited_till = 660,
      basic_amount = 2,
   },

   working_positions = {
      gauls_miller = 1
   },

   inputs = {
      { name = "wheat", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start grinding wheat because ...
         descname = _("grinding wheat"),
         actions = {
            -- time total: 1.4 + 10 + 3.6 = 15 sec
            "return=skipped unless economy needs flour",
            "consume=wheat",
            "sleep=duration:1s400ms",
            "playsound=sound/mill/mill_turning priority:90% allow_multiple",
            "animate=working duration:10s",
            "produce=flour"
         }
      },
   },
}

pop_textdomain()
