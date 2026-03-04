push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_dressmakery",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("hebrews_building", "Dressmakery"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      clay = 5,
      granite = 2,
      branch = 2,
   },
   return_on_dismantle = {
      clay = 2,
      granite = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 59, 71 },
      },
      unoccupied = {
         hotspot = { 59, 71 },
      },
      working = {
         hotspot = { 59, 71 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 450,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      hebrews_carrier = 1
   },

   inputs = {
      { name = "cloth", amount = 6 },
      { name = "zizit", amount = 8 },
      { name = "gold_leaf", amount = 2 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 9 * 71 = 639 sec
            "call=produce_tunic",
            "call=produce_tallit_katan",
            "call=produce_tallit",
         },
      },
      produce_tunic = {
         -- TRANSLATORS: Completed/Skipped/Did not start sewing a tunic because ...
         descname = _("sewing a tunic"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs tunic",
            "consume=cloth:2",
            "sleep=duration:32s400ms",
            "animate=working duration:35s",
            "produce=tunic"
         },
      },
      produce_tallit_katan = {
         -- TRANSLATORS: Completed/Skipped/Did not start sewing a tallit katan because ...
         descname = _("sewing a tallit katan"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs tallit_katan",
            "consume=cloth:1 zizit:4",
            "sleep=duration:32s400ms",
            "animate=working duration:35s",
            "produce=tallit_katan"
         },
      },
      produce_tallit = {
         -- TRANSLATORS: Completed/Skipped/Did not start sewing a tallit because ...
         descname = _("sewing a tallit"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs tallit",
            "consume=cloth:2 zizit:4 gold_leaf",
            "sleep=duration:32s400ms",
            "animate=working duration:35s",
            "produce=tallit"
         },
      },
   },
}

pop_textdomain()
