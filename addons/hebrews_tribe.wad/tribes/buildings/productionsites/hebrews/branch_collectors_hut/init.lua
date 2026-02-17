push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_branch_collectors_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Branch Collector's Hut"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      clay = 4,
   },
   return_on_dismantle = {
      clay = 1,
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 40, 67 },
      },
   },

   aihints = {
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
      basic_amount = 1,
   },

   working_positions = {
      hebrews_branch_collector = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start collecting branches because ...
         descname = _("collecting branches"),
         actions = {
            -- time of worker: 14.2-43 sec
            -- min. time total: 14.2 + 30 = 44.2 sec
            -- max. time total: 43 + 30 = 73 sec
            "return=skipped unless economy needs branch",
            "callworker=collect",
            "sleep=duration:30s",
         },
      },
   },
   out_of_resource_notification = {
      -- TRANSLATORS: Short for "No Tree to Collect Branches" for a resource
      title = _("No Trees"),
      heading = _("No Trees to Collect Branches"),
      message = pgettext("hebrews_building", "The branch collector working at this site can't find any tree in his work area. You should consider dismantling or destroying the building or planting trees nearby."),
      productivity_threshold = 33
   },
}

pop_textdomain()
