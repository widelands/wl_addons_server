push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_weaponsmithy",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Weapon Smithy"),
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
      working = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 57, 64 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 57, 64 }
      }
   },

   aihints = {
      prohibited_till = 1880,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 1,
   },

   working_positions = {
      gauls_blacksmith = 1
   },

   inputs = {
      { name = "log", amount = 8 },
      { name = "planks", amount = 8 },
      { name = "coal", amount = 8 },
      { name = "iron", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=produce_spear",
            "call=produce_sword_short",
            "call=produce_sword_long"
         }
      },
      produce_spear = {
         -- TRANSLATORS: Completed/Skipped/Did not start making spear because ...
         descname = _("making spear"),
         actions = {
            -- time: 17.4 + 3.6 + 7.4 + 3.6 + 10 = 40 sec
            "return=skipped unless economy needs spear",
            "consume=coal:2 iron:2 planks",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:17s400ms",
            "produce=spear",
            "animate=working duration:7s400ms",
            "produce=spear",
            "sleep=duration:10s"
         }
      },
      produce_sword_short = {
         -- TRANSLATORS: Completed/Skipped/Did not start making short sword because ...
         descname = _("making short sword"),
         actions = {
            -- time: 12.4 + 3.6 + 10 = 25 sec
            "return=skipped unless economy needs sword_short",
            "consume=coal iron:2 log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:12s400ms",
            "produce=sword_short",
            "sleep=duration:10s"
         }
      },
      produce_sword_long = {
         -- TRANSLATORS: Completed/Skipped/Did not start making long sword because ...
         descname = _("making long sword"),
         actions = {
            -- time: 17.4 + 3.6 + 10 = 30 sec
            "return=skipped unless economy needs sword_long",
            "consume=coal:2 iron:3 log",
            "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
            "animate=working duration:17s400ms",
            "produce=sword_long",
            "sleep=duration:10s"
         }
      },
   },
}

pop_textdomain()
