push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_fishers_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Fisher’s Hut"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      clay = 3,
      branch = 2,
   },
   return_on_dismantle = {
      clay = 1,
      branch = 1
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 40, 52 },
      },
   },

   aihints = {
      needs_water = true,
      prohibited_till = 490,
      very_weak_ai_limit = 1,
      weak_ai_limit = 3
   },

   working_positions = {
      hebrews_fisher = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
         descname = _("fishing"),
         actions = {
            "callworker=fish",
            "sleep=duration:10s500ms"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fish"),
      heading = _("Out of Fish"),
      message = pgettext("hebrews_building", "The fisher working out of this fisher’s hut can’t find any fish in his work area."),
   },
}

pop_textdomain()
