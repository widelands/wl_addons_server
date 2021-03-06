push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_lumberjacks_house_advanced",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Advanced Lumberjack’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 40, 59 },
      },
   },

   aihints = {},

   working_positions = {
      europeans_lumberjack_advanced = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
         descname = _"felling trees",
         actions = {
            "callworker=harvest",
            "sleep=duration:10s",
            "produce=log"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Trees",
      heading = _"Out of Trees",
      message = pgettext("europeans_building", "The lumberjack working at this lumberjack’s house can’t find any trees in his work area. You should consider dismantling or destroying the building or building a forester’s house."),
      productivity_threshold = 60
   },
}

pop_textdomain()
