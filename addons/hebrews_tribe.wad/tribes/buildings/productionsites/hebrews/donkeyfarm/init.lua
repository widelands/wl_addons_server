push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_donkeyfarm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Donkey Farm"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      clay = 7,
      granite = 2,
      branch = 3,
   },
   return_on_dismantle = {
      clay = 3,
      granite = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 77, 88 },
      },
      working = {
         hotspot = { 77, 88 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 610,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      hebrews_carrier = 2
   },

   inputs = {
      { name = "water", amount = 8 },
      { name = "wheat_grains", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start rearing donkeys because ...
         descname = pgettext("hebrews_building", "rearing donkeys"),
         actions = {
            "return=skipped unless economy needs hebrews_donkey",
            "consume=wheat_grains water",
            "sleep=duration:15s",
            "playsound=sound/farm/donkey priority:50% allow_multiple",
            "animate=working duration:15s", -- Feeding cute little baby donkeys ;)
            "recruit=hebrews_donkey"
         }
      },
   },
}

pop_textdomain()
