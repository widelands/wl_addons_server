push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_armorsmithy",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Armor Smithy"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      granite = 2,
      planks = 4,
      quartz = 1
   },
   return_on_dismantle = {
      granite = 1,
      planks = 2,
      quartz = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 56, 61 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 56, 61 },
      }
   },

   aihints = {
      prohibited_till = 1380
   },

   working_positions = {
      lutas_atlanteans_armorsmith = 1
   },

   inputs = {
      { name = "coal", amount = 8 },
      { name = "iron", amount = 8 },
      { name = "gold", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 71 + 81 = 152 sec
            "call=produce_shield_steel",
            "call=produce_shield_advanced",
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
            "consume=iron coal:2 gold",
            "sleep=duration:32s400ms",
            "animate=working duration:45s",
            "produce=shield_advanced"
         }
      },
   },
}

pop_textdomain()
