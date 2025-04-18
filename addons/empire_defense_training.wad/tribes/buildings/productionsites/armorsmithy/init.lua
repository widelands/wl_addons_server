push_textdomain("tribes")

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "empire_armorsmithy",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("empire_building", "Armor Smithy"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 2,
      granite = 2,
      marble = 2,
      marble_column = 3
   },
   return_on_dismantle = {
      log = 1,
      granite = 1,
      marble = 2
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 50, 66 },
      },
      unoccupied = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 50, 66 },
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 50, 66 }
      },
      working = {
         fps = 5,
         frames = 20,
         columns = 10,
         rows = 2,
         hotspot = { 50, 66 }
      },
   },

   aihints = {
      prohibited_till = 1400,
   },

   working_positions = {
      empire_armorsmith = 1
   },

   inputs = {
      { name = "coal", amount = 10 },
      { name = "iron", amount = 10 },
      { name = "gold", amount = 10 },
      { name = "cloth", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 71 + 81 + 81 + 71 + 81 = 385 sec
            "call=produce_armor_helmet",
            "call=produce_armor",
            "call=produce_armor_chain",
            "call=produce_armor_helmet",
            "call=produce_armor_gilded",
            "call=produce_shield_steel",
            "call=produce_shield_advanced"
         }
      },
      produce_armor_helmet = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a helmet because ...
         descname = _("forging a helmet"),
         actions = {
            -- time: 47.4 + 20 + 3.6 = 71 sec
            "return=skipped unless economy needs armor_helmet",
            "consume=iron coal",
            "sleep=duration:47s400ms",
            "animate=working duration:20s",
            "produce=armor_helmet"
         }
      },
      produce_armor = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of armor because ...
         descname = _("forging a suit of armor"),
         actions = {
            -- time: 32.4 + 45 + 3.6 = 81 sec
            "return=skipped unless economy needs armor",
            "consume=iron coal cloth",
            "sleep=duration:32s400ms",
            "animate=working duration:45s",
            "produce=armor"
         }
      },
      produce_armor_chain = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of chain armor because ...
         descname = _("forging a suit of chain armor"),
         actions = {
            -- time: 32.4 + 45 + 3.6 = 81 sec
            "return=skipped unless economy needs armor_chain",
            "consume=iron:2 coal cloth",
            "sleep=duration:32s400ms",
            "animate=working duration:45s",
            "produce=armor_chain"
         }
      },
      produce_armor_gilded = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a suit of gilded armor because ...
         descname = _("forging a suit of gilded armor"),
         actions = {
            -- time: 32.4 + 45 + 3.6 = 81 sec
            "return=skipped unless economy needs armor_gilded",
            "consume=iron:2 coal:2 cloth gold",
            "sleep=duration:32s400ms",
            "animate=working duration:45s",
            "produce=armor_gilded"
         }
      },
      produce_shield_steel = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
         descname = _("forging a steel shield"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs shield_steel",
            "consume=iron:2 coal:2",
            "sleep=duration:32s400ms",
            "animate=working duration:35s",
            "produce=shield_steel"
         }
      },
      produce_shield_advanced = {
         -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced shield because ...
         descname = _("forging an advanced shield"),
         actions = {
            -- time: 32.4 + 45 + 3.6 = 81 sec
            "return=skipped unless economy needs shield_advanced",
            "consume=iron:2 coal:2 gold",
            "sleep=duration:32s400ms",
            "animate=working duration:45s",
            "produce=shield_advanced"
         }
      }
   },
}

pop_textdomain()
