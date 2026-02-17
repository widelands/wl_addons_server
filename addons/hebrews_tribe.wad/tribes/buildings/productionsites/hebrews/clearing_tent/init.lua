push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_clearing_tent",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Clearing Tent"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      cloth = 1,
      branch = 2,
   },
   return_on_dismantle = {
      cloth = 1,
      branch = 1,
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 40, 50 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 800,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
   },

   working_positions = {
      hebrews_talmid = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start clearing trees because ...
         descname = _("clearing trees"),
         actions = {
            "callworker=clear",
            "sleep=duration:20s"
         }
      },
   },
   out_of_resource_notification = {
      -- TRANSLATORS: Short for "No Trees" for a resource
      title = _("No Trees"),
      heading = _("No Trees to Clear"),
      message = pgettext("hebrews_building", "The worker at the clearing tent can't find any trees in his work area."),
      productivity_threshold = 33
   },
}

pop_textdomain()
