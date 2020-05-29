dirname = path.dirname(__file__)

tribes:new_productionsite_type {
   msgctxt = "frisians_building",
   name = "frisians_rye_mill",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("frisians_building", "Rye Mill"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 3,
      brick = 3,
      granite = 1,
      reed = 2
   },
   return_on_dismantle = {
      log = 1,
      brick = 1,
      reed = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 58, 61 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 58, 61 },
         fps = 25
      }
   },

   aihints = {
      prohibited_till = 540
   },

   working_positions = {
      frisians_miller = 1
   },

   inputs = {
      { name = "rye", amount = 4 }
   },
   outputs = {
      "rye_flour"
   },

   programs = {
      work = {
         -- TRANSLATORS: Completed/Skipped/Did not start grinding rye because ...
         descname = _"grinding rye",
         actions = {
            "consume=rye",
            "sleep=5000",
            "playsound=sound/mill/mill_turning 240",
            "animate=working 10000",
            "produce=rye_flour"
         }
      },
   },
}
