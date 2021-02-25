push_textdomain("new_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "newtribe_donkeyfarm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("newtribe_building", "Donkey Farm"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 3,
      granite = 3,
      reed = 1
   },
   return_on_dismantle = {
      log = 2,
      granite = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 85, 78 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 85, 78 },
      },
   },

   aihints = {
      prohibited_till = 610,
   },

   working_positions = {
      newtribe_donkeybreeder = 1
   },

   inputs = {
      { name = "water", amount = 8 },
      { name = "rye", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start rearing donkeys because ...
         descname = pgettext("newtribe_building", "rearing donkeys"),
         actions = {
            "return=skipped unless economy needs newtribe_donkey",
            "consume=rye water",
            "sleep=duration:15s",
            "playsound=sound/farm/donkey priority:50% allow_multiple",
            "animate=working duration:15s",
            "recruit=newtribe_donkey"
         }
      },
   },
}

pop_textdomain()
