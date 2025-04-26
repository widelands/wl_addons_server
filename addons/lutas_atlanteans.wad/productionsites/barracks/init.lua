push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_barracks",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Barracks"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      granite = 2,
      planks = 4,
      spidercloth = 3,
   },
   return_on_dismantle = {
      log = 1,
      granite = 1,
      planks = 2,
      spidercloth = 1,
   },

   animation_directory = dirname,
   -- TODO(Nordfriese): Make animations.
   animations = {idle = {hotspot = {50, 56}}},
   spritesheets = {
      build = {
         hotspot = {50, 56},
         frames = 3,
         columns = 1,
         rows = 3
      }
   },

   aihints = {
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
      prohibited_till = 900
   },

   working_positions = {
      lutas_atlanteans_trainer = 1
   },

   inputs = {
      { name = "tabard", amount = 8 },
      { name = "trident_light", amount = 8 },
      { name = "lutas_atlanteans_recruit", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("lutas_atlanteans_building", "recruiting soldier"),
         actions = {
            -- time total: 30 sec
            "return=skipped unless economy needs lutas_atlanteans_soldier",
            "consume=tabard trident_light lutas_atlanteans_recruit",
            "sleep=duration:30s",
            "recruit=lutas_atlanteans_soldier"
         }
      },
   }
}

pop_textdomain()
