push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_armorsmithy",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Armor Smithy"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      granite = 3,
      planks = 3,
      brick = 1,
      reed = 3
   },
   return_on_dismantle = {
      granite = 2,
      planks = 1,
      reed = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 57, 76 },
      },
      unoccupied = {
         hotspot = { 57, 76 },
      },
   },
   spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 57, 64 }
      },
      working = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 57, 75 }
      }
   },

   aihints = {
      prohibited_till = 2460,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 2,
   },

   working_positions = {
      gauls_blacksmith = 1,
      gauls_craftsman = 1
   },

   inputs = {
      { name = "cloth", amount = 8 },
      { name = "coal", amount = 8 },
      { name = "iron", amount = 8 },
      { name = "bronze", amount = 8 },
      { name = "gold", amount = 8 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=produce_armor_chain",
            "call=produce_armor_bronze",
            "call=produce_helmet_golden",
            "call=produce_shield_bronze"
         }
      },
      produce_armor_chain = {
         -- TRANSLATORS: Completed/Skipped/Did not start making chain armor because ...
         descname = _("making chain armor"),
         actions = {
            -- time: 35.4 + 3.6 + 10 = 49 sec
            "return=skipped unless economy needs armor_chain",
            "consume=coal iron cloth",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s400ms",
            "produce=armor_chain",
            "sleep=duration:10s"
         }
      },
      produce_armor_bronze = {
         -- TRANSLATORS: Completed/Skipped/Did not start making bronze armor because ...
         descname = _("making bronze armor"),
         actions = {
            -- time: 35.4 + 3.6 + 10 = 49 sec
            "return=skipped unless economy needs armor_bronze",
            "consume=coal bronze:2 cloth",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s400ms",
            "produce=armor_bronze",
            "sleep=duration:10s"
         }
      },
      produce_helmet_golden = {
         -- TRANSLATORS: Completed/Skipped/Did not start making golden helmet because ...
         descname = _("making golden helmet"),
         actions = {
            -- time: 35.4 + 3.6 + 10 = 49 sec
            "return=skipped unless economy needs helmet_golden",
            "consume=coal iron gold:2",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:35s400ms",
            "produce=helmet_golden",
            "sleep=duration:10s"
         }
      },
      produce_shield_bronze = {
         -- TRANSLATORS: Completed/Skipped/Did not start making bronze shield because ...
         descname = _("making bronze shield"),
         actions = {
            -- time: 24.4 + 3.6 + 10 = 38 sec
            "return=skipped unless economy needs shield_bronze",
            "consume=coal bronze:2",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:24s400ms",
            "produce=shield_bronze",
            "sleep=duration:10s"
         }
      },
   },
}

pop_textdomain()
