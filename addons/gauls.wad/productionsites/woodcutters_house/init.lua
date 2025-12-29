push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_woodcutters_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Woodcutter’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 3,
   },
   return_on_dismantle = {
      log = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 42, 57 },
      },
   },

   aihints = {
      requires_supporters = true,
      basic_amount = 5,
      very_weak_ai_limit = 5,
      weak_ai_limit = 7,
      normal_ai_limit = 9
   },

   working_positions = {
      gauls_woodcutter = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
         descname = _("felling trees"),
         actions = {
            -- area: 12, time of worker: 17.2-63.8 sec, average 44 sec
            -- min. time total: 17.2 + 20 = 37.2 sec
            -- max. time total: 63.8 + 20 = 83.8 sec
            -- avg. time total: 44 + 20 = 64 sec
            "callworker=harvest",
            "sleep=duration:20s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Trees"),
      heading = _("Out of Trees"),
      message = pgettext("gauls_building", "The woodcutter working at this house can’t find any trees in his work area. You should consider dismantling or destroying the building or building a forester’s house nearby."),
      productivity_threshold = 30
   },
}

pop_textdomain()
