push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_tribal_gathering",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Tribal Gathering"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      log = 1,
      stone = 3,
      tropicalwood = 2,
      palmleaves = 1,
      reed = 1,
      cloth = 3,
      diamond =2
   },
   return_on_dismantle = {
      stone = 2,
      tropicalwood = 1,
      cloth = 1,
      diamond =1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = {78, 80}
      },
      working = {
         basename = "idle",
         hotspot = {78, 80}
      },
   },

   aihints = {
      prohibited_till = 720,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 1,
   },

   working_positions = {
      sumatran_tribal_chief = 1
   },

   inputs = {
      { name = "crocodile_jacket", amount = 8 },
      { name = "sumatran_spear", amount = 8 },
      { name = "meal", amount = 8 },
      { name = "sumatran_recruit", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting because ...
         descname = pgettext("sumatran_building", "recruiting"),
         actions = {
            "call=recruit_hunter",
            "call=recruit_chief",
            "call=recruit_warrior",
            "call=recruit_carrier",
         }
      },
      recruit_warrior = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting warrior because ...
         descname = _("recruiting warrior"),
         actions = {
            -- time: 6.4 + 20 + 3.6 = 30 sec
            "return=skipped unless economy needs sumatran_soldier",
            "consume=crocodile_jacket sumatran_spear sumatran_recruit",
            "sleep=duration:1s400ms",
            "animate=working duration:20s",
            "recruit=sumatran_soldier",
            "sleep=duration:5s"
         },
      },
      recruit_chief = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting chief because ...
         descname = _("recruiting chief"),
         actions = {
            -- time: 6.4 + 20 + 3.6 = 30 sec
            "return=skipped unless economy needs sumatran_chief",
            "consume=crocodile_jacket sumatran_recruit",
            "sleep=duration:1s400ms",
            "animate=working duration:20s",
            "recruit=sumatran_chief",
            "sleep=duration:5s"
         },
      },
      recruit_carrier = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting carrier because ...
         descname = _("recruiting carrier"),
         actions = {
            -- time: 6.4 + 10 + 3.6 = 20 sec
            "return=skipped unless economy needs sumatran_carrier_1",
            "consume=meal sumatran_recruit",
            "sleep=duration:1s400ms",
            "animate=working duration:10s",
            "recruit=sumatran_carrier_1",
            "sleep=duration:5s"
         },
      },
      recruit_hunter = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting hunter because ...
         descname = _("recruiting hunter"), actions = { -- time: 6.4 + 20 + 3.6 = 30 sec
            "return=skipped unless economy needs sumatran_hunter",
            "consume=sumatran_spear crocodile_jacket sumatran_recruit",
            "sleep=duration:1s400ms",
            "animate=working duration:20s",
            "recruit=sumatran_hunter",
            "sleep=duration:5s"
      },  },
   }
}

pop_textdomain()
