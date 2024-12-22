push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_coppersmiths_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Coppersmith’s House"),
   icon = dirname .. "menu.png",
   size = "medium",

   enhancement = {
      name = "sumatran_armorsmithy",
      enhancement_cost = {
         log = 1,
         tropicalwood = 3,
         reed = 1
      },
      enhancement_return_on_dismantle = {
         tropicalwood = 2
      }
   },

   buildcost = {
      log = 1,
      stone = 3,
      palmleaves = 1,
      reed = 2
   },
   return_on_dismantle = {
      stone = 2,
      reed = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 56, 61 },
      },
      working = {
         basename = "idle",
         hotspot = { 56, 61 },
      }
   },

   aihints = {
      prohibited_till = 4800,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 2,
   },

   working_positions = {
      sumatran_coppersmith = 1
   },

   inputs = {
      { name = "gold", amount = 6 },
      { name = "copper", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=produce_copper_sheet",
            "call=produce_gold_sheet",
            "call=produce_copper_sheet2",
            "return=skipped"
         }
      },
      produce_copper_sheet = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a copper sheet because ...
         descname = _("making a copper sheet"),
         actions = {
            -- time: 6.4 + 5 + 3.6 = 15 sec
            "return=skipped unless economy needs copper_sheet",
            "consume=copper",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:5s",
            "produce=copper_sheet",
            "sleep=duration:6s400ms"
         }
      },
      produce_copper_sheet2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a copper sheet because ...
         descname = _("making a copper sheet"),
         actions = {
            -- time: 6.4 + 5 + 3.6 = 15 sec
            "return=skipped unless economy needs copper_sheet",
            "consume=copper",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:5s",
            "produce=copper_sheet",
            "sleep=duration:6s400ms"
         }
      },
      produce_gold_sheet = {
         -- TRANSLATORS: Completed/Skipped/Did not start making a gold sheet because ...
         descname = _("making a gold sheet"),
         actions = {
            -- time: 11.4 + 15 + 3.6 = 30 sec
            "return=skipped unless economy needs gold_sheet",
            "consume=gold",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:15s",
            "produce=gold_sheet",
            "sleep=duration:11s400ms"

         }
      },
   },
}

pop_textdomain()
