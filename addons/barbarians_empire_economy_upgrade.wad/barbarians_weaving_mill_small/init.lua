push_textdomain("barbarians_empire_economy_upgrade.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "barbarians_weaving_mill_small",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("barbarians_building_small", "Small Weaving Mill"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 2,
      granite = 2,
      reed = 2
   },
   return_on_dismantle = {
      log = 1,
      granite = 1
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
      prohibited_till = 990,
   },

   working_positions = {
      barbarians_weaver = 1
   },

   inputs = {
      { name = "reed", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start weaving because ...
         descname = _("weaving"),
         actions = {
            "sleep=duration:22s",
            "return=skipped unless economy needs cloth",
            "consume=reed:2",
            "playsound=sound/barbarians/weaver priority:90%",
            "animate=working duration:35s",
            "produce=cloth"
         }
      },
   },
}

pop_textdomain()
