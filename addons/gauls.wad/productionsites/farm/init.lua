push_textdomain("gauls.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_farm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("gauls_building", "Farm"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      granite = 1,
      planks = 2,
      brick = 3,
      reed = 2,
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1,
      brick = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {55, 73}},
   },

   aihints = {
      prohibited_till = 240,
      space_consumer = true,
      basic_amount = 4,
      very_weak_ai_limit = 4,
      weak_ai_limit = 5,
      normal_ai_limit = 8,
   },

   working_positions = {
      gauls_farmer = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- min. time total: 2 * 34.2 + 5 + 11 = 84.4 sec (42.2 sec)
            -- max. time total: 2 * 48.6 + 5 + 11 = 113.2 sec (56.6 sec)
            -- avg. time total: 2 * 40.2 + 5 + 11 = 96.4 sec (48.2 sec)
            "call=plant",
            "call=harvest",
            "sleep=duration:5s",
         }
      },
      plant = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting wheat because ...
         descname = _("planting wheat"),
         actions = {
            "callworker=plant",
            "sleep=duration:11s"
         }
      },
      harvest = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting wheat because ...
         descname = _("harvesting wheat"),
         actions = {
            "callworker=harvest",
            "produce=wheat_sheaf",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fields"),
      heading = _("Out of Fields"),
      message = pgettext ("gauls_building", "The farmer working at this farm has no cleared soil to grow wheat."),
      productivity_threshold = 30
   },
}

pop_textdomain()
