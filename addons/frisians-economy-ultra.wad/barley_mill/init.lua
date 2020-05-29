dirname = path.dirname(__file__)

tribes:new_productionsite_type {
   msgctxt = "frisians_building",
   name = "frisians_barley_mill",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("frisians_building", "Barley Mill"),
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
         hotspot = { 41, 87 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 41, 87 },
         fps = 25
      },
   },

   aihints = {
      prohibited_till = 540
   },

   working_positions = {
      frisians_miller = 1
   },

   inputs = {
      { name = "barley", amount = 5 }
   },
   outputs = {
      "barley_flour"
   },

   programs = {
      work = {
         -- TRANSLATORS: Completed/Skipped/Did not start grinding barley because ...
         descname = _"grinding barley",
         actions = {
            "return=skipped unless economy needs barley_flour",
            "consume=barley",
            "sleep=5000",
            "playsound=sound/mill/mill_turning 240",
            "animate=working 10000",
            "produce=barley_flour"
         }
      },
   },
}
