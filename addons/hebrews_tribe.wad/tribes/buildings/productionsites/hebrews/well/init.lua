push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_well",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Well"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      clay = 2,
      granite = 5,
   },
   return_on_dismantle = {
      clay = 1,
      granite = 2,
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 35, 59 },
      },
   },

   aihints = {
      basic_amount = 1,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3,
   },

   working_positions = {
      hebrews_carrier = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "sleep=duration:20s",
            "sleep=duration:20s",
            "mine=resource_water radius:1 yield:100% when_empty:65%",
            "produce=water",
         }
      },
   },

   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Water"),
      heading = _("Out of Water"),
      message = pgettext("hebrews_building", "The carrier working at this well can’t find any water in his well."),
      productivity_threshold = 33
   },
}

pop_textdomain()
