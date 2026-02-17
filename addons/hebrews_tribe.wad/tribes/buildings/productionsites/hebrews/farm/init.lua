push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_farm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Farm"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      clay = 4,
      granite = 3,
      branch = 3,
   },
   return_on_dismantle = {
      clay = 2,
      granite = 2
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 70, 97 },
      },
   },

   aihints = {
      basic_amount = 1,
      space_consumer = true,
      prohibited_till = 350,
      very_weak_ai_limit = 1,
      weak_ai_limit = 3,
   },

   working_positions = {
      hebrews_farmer = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=plant",
            "call=harvest",
         }
      },
      plant = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting wheat because ...
         descname = _("planting wheat"),
         actions = {
            "callworker=plant",
            "sleep=duration:7s",
            "sleep=duration:3s"
         }
      },
      harvest = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting wheat because ...
         descname = _("harvesting wheat"),
         actions = {
            "callworker=harvest",
            "sleep=duration:3s",
            "sleep=duration:1s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fields"),
      heading = _("Out of Fields"),
      message = pgettext("hebrews_building", "The farmer working at this farm has no cleared soil to plant his seeds."),
      productivity_threshold = 30
   },
}

pop_textdomain()
