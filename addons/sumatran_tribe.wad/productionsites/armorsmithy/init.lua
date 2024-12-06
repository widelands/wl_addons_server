
push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_armorsmithy",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Armorsmithy"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 2,
      stone = 3,
      tropicalwood = 3,
      palmleaves = 1,
      reed = 3
   },
   return_on_dismantle = {
      stone = 2,
      tropicalwood = 2,
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
      prohibited_till = 2220,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
      normal_ai_limit = 3,
   },

   working_positions = {
      sumatran_armorsmith = 1
   },

   inputs = {
      { name = "copper_sheet", amount = 8 },
      { name = "gold_sheet", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            --total time: 45 + 50 + 45  + 10 = 150 sec (50s/item)
            "call=produce_armor_copper",
            "call=produce_armor_golden",
            "call=produce_shield_golden",
            "return=skipped"
         }
      },
      produce_armor_copper = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a copper armor because ...
         descname = _("forging a copper armor"),
         actions = {
            -- time: 11.4 + 30 + 3.6 = 45 sec
            "return=skipped unless economy needs armor_copper",
            "return=failed unless site has copper_sheet:2",
            "return=failed unless site has gold_sheet",
            "consume=copper_sheet:2 gold_sheet",
            "animate=working duration:30s",
            "produce=armor_copper",
            "sleep=duration:11s400ms"
         }
      },
      produce_armor_golden = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a golden armor because ...
         descname = _("forging a golden armor"),
         actions = {
            -- time: 11.4 + 35 + 3.6 = 50 sec
            "return=skipped unless economy needs armor_golden",
            "return=failed unless site has gold_sheet:2",
            "return=failed unless site has copper_sheet",
            "consume=copper_sheet gold_sheet:2",
            "animate=working duration:35s",
            "produce=armor_golden",
            "sleep=duration:11s400ms"
         }
      },
      produce_shield_golden = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a golden shield because ...
         descname = _("forging a golden shield"),
         actions = {
            -- time: 11.4 + 30 + 3.6 = 45 sec
            "return=skipped unless economy needs shield_golden",
            "return=failed unless site has gold_sheet",
            "return=failed unless site has copper_sheet:2",
            "consume=copper_sheet:2 gold_sheet",
            "animate=working duration:30s",
            "produce=shield_golden",
            "sleep=duration:11s400ms"
         }
      },
   },
}

pop_textdomain()
