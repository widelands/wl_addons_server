push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_weaving_mill",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Weaving Mill"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 1,
      granite = 2,
      tropicalwood = 2,
      palmleaves = 1,
      reed = 2
   },
   return_on_dismantle = {
      granite = 1,
      tropicalwood = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 66, 71 },
      },
      working = {
         hotspot = { 66, 71 },
      }
   },

   aihints = {
      prohibited_till = 420,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 1,
   },

   working_positions = {
      sumatran_weaver = 1
   },

   inputs = {
      { name = "reed", amount = 8 },
      { name = "palmleaves", amount = 8 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
         descname = _("weaving cloth"),
         actions = {
            --time: 20 + 20.4 + 3.6 = 44 sec
            "return=skipped unless economy needs cloth",
            "return=failed unless site has reed",
            "return=failed unless site has palmleaves",
            "consume=reed palmleaves",
            "playsound=sound/mill/weaving priority:90%",
            "animate=working duration:20s",
            "produce=cloth",
            "sleep=duration:20s400ms"
         }
      },
   },
}

pop_textdomain()
