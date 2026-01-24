push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_sewing_workshop",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("sumatran_building", "Sewing Workshop"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      granite = 3,
      tropicalwood = 2,
      palmleaves = 1,
      reed = 2,
      cloth = 2,
      diamond =1
   },
   return_on_dismantle = {
      granite = 2,
      tropicalwood = 1,
      cloth = 1,
      diamond =1
   },

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {50, 50}},
      unoccupied = {hotspot = {50, 50}},
      working = {hotspot = {50, 50}},
   },

   aihints = {
      prohibited_till = 1980,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 1,
   },

   working_positions = {
      sumatran_dressmaker= 1
   },

   inputs = {
      { name = "cloth", amount = 8 },
      { name = "crocodile_skin", amount = 8 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start sewing warrior’s dress because ...
         descname = _("sewing warriors dress"),
         actions = {
            "call=produce_warriors_dress",
            "call=produce_crocodile_jacket",
            "call=produce_crocodile_shoes",
         },
      },
      produce_warriors_dress = {
         -- TRANSLATORS: Completed/Skipped/Did not start sewing warrior’s dress because ...
         descname = _("sewing warriors dress"),
         actions = {
            -- time: 1.4 + 35 + 3.6 + 15 = 55 sec
            "return=skipped unless economy needs warriors_dress",
            "return=failed unless site has cloth:2",
            "consume=cloth:2",
            "sleep=duration:1s400ms",
            "animate=working duration:35s",
            "produce=warriors_dress",
            "sleep=duration:15s"
         },
      },
      produce_crocodile_jacket = {
         -- TRANSLATORS: Completed/Skipped/Did not start sewing crocodile jacket because ...
         descname = _("sewing crocodile jacket"),
         actions = {
            -- time: 1.4 + 35 + 3.6 + 15 = 55 sec
            "return=skipped unless economy needs crocodile_jacket",
            "return=failed unless site has cloth",
            "return=failed unless site has crocodile_skin:2",
            "consume=cloth crocodile_skin:2",
            "sleep=duration:1s400ms",
            "animate=working duration:35s",
            "produce=crocodile_jacket",
            "sleep=duration:15s"
         },
      },
      produce_crocodile_shoes = {
         -- TRANSLATORS: Completed/Skipped/Did not start making crocodile shoes because ...
         descname = _("making crocodile shoes"),
         actions = {
            -- time: 1.4 + 35 + 3.6 + 15 = 55 sec
            "return=skipped unless economy needs crocodile_shoes",
            "return=failed unless site has crocodile_skin:2",
            "consume=crocodile_skin:2",
            "sleep=duration:1s400ms",
            "animate=working duration:35s",
            "produce=crocodile_shoes",
            "sleep=duration:15s"
         },
      },
   },
}

pop_textdomain()
