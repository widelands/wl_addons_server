push_textdomain("new_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "newtribe_bakery",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("newtribe_building", "Bakery"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 2,
      reed = 1,
      granite = 4
   },
   return_on_dismantle = {
      granite = 3
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 52, 63 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 52, 75 },
         fps = 20
      }
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 590
   },

   working_positions = {
      newtribe_baker = 1
   },

   inputs = {
      { name = "water", amount = 7 },
      { name = "rye", amount = 7 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start baking bread because ...
         descname = pgettext("newtribe_building", "baking bread"),
         actions = {
            "return=skipped unless economy needs newtribe_bread",
            "consume=water:3 rye:3",
            "animate=working duration:35s",
            "sleep=duration:30s",
            "produce=newtribe_bread:2"
         }
      },
   },
}

pop_textdomain()
