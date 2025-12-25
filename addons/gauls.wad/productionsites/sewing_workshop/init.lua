push_textdomain("gauls.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_sewing_workshop",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("gauls_building", "Sewing Workshop"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      granite = 2,
      planks = 2,
      brick = 3,
      reed = 2,
      cloth = 2
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1,
      brick = 1,
      cloth = 1
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 56, 58 },
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 56, 58 },
      },
      unoccupied = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 56, 58 },
      },
      working = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 56, 58 },
      },
   },

   aihints = {
      prohibited_till = 1980,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 1,
   },

   working_positions = {
      gauls_dressmaker= 1
   },

   inputs = {
      { name = "cloth", amount = 6 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start sewing because ...
         descname = _("sewing"),
         actions = {
            "call=produce_tunic",
         },
      },
      produce_tunic = {
         -- TRANSLATORS: Completed/Skipped/Did not start sewing tunic because ...
         descname = _("sewing tunic"),
         actions = {
            -- time: 1.4 + 35 + 3.6 + 15 = 55 sec
            "return=skipped unless economy needs tunic",
            "return=failed unless site has cloth",
            "consume=cloth",
            "sleep=duration:1s400ms",
            "animate=working duration:35s",
            "produce=tunic",
            "sleep=duration:15s"
         },
      },
   },
}

pop_textdomain()
