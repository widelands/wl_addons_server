push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_sawmill",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Sawmill"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 2,
      granite = 3
   },
   return_on_dismantle = {
      log = 1,
      granite = 2
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 60, 68 },
      },
   },

   spritesheets = {
      working = {
         fps = 25,
         frames = 19,
         columns = 10,
         rows = 2,
         hotspot = { 60, 68 },
      },
   },

   aihints = {
      prohibited_till = 120,
      forced_after = 480,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 2
   },

   working_positions = {
      lutas_atlanteans_sawyer = 1
   },

   inputs = {
      { name = "log", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
         descname = _("sawing logs"),
         actions = {
            -- time total: 16.4 + 20 + 3.6 = 40 sec
            "return=skipped unless economy needs planks",
            "sleep=duration:16s400ms", -- Much faster than Barbarians' wood hardener
            "consume=log:2",
            "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
            "animate=working duration:20s", -- Much faster than Barbarians' wood hardener
            "produce=planks"
         }
      },
   },
}

pop_textdomain()
