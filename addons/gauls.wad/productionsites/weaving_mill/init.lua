push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_weaving_mill",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building_small", "Weaving Mill"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      granite = 2,
      planks = 2,
      brick = 2,
      reed = 2
   },
   return_on_dismantle = {
      granite = 2,
      planks = 1,
      brick = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 36, 74 },
      },
      build = {
         hotspot = { 36, 74 },
      },
      working = {
         hotspot = { 36, 74 },
      },
   },

   aihints = {
      prohibited_till = 900,
      basic_amount = 1,
   },

   working_positions = {
      gauls_weaver = 1
   },

   inputs = {
      { name = "wool", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start weaving because ...
         descname = _("weaving"),
         actions = {
            -- time: 15.4 + 35 + 3.6 = 54 sec
            "sleep=duration:15s400ms",
            "return=skipped unless economy needs cloth",
            "consume=wool",
            "playsound=sound/barbarians/weaver priority:90%",
            "animate=working duration:35s",
            "produce=cloth"
         }
      },
   },
}

pop_textdomain()
