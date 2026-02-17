push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_oliveplant",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Olive Plant"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      clay = 5,
      granite = 2,
      branch = 3,
   },
   return_on_dismantle = {
      clay = 2,
      granite = 1,
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 70, 98 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 380,
      space_consumer = true,
      very_weak_ai_limit = 1,
      weak_ai_limit = 3,
   },

   working_positions = {
      hebrews_talmid = 1
   },

   inputs = {
      { name = "water", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=plant_olives",
            "call=harvest_olives",
         }
      },
      plant_olives = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting olive trees because ...
         descname = _("planting olive trees"),
         actions = {
            "consume=water",
            "callworker=plant_olives",
            "sleep=duration:5s"
         }
      },
      harvest_olives = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting olives because ...
         descname = _("harvesting olives"),
         actions = {
            "callworker=harvest_olives",
            "sleep=duration:5s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fields"),
      heading = _("Out of Fields"),
      message = pgettext("hebrews_building", "The worker at this olive plantation has no cleared soil to plant his olive trees."),
      productivity_threshold = 30
   },
}

pop_textdomain()
