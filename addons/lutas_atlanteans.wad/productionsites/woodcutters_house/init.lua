push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_woodcutters_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Woodcutter’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 2,
      planks = 1
   },
   return_on_dismantle = {
      log = 1,
      planks = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 42, 48 },
      },
   },

   aihints = {
      basic_amount = 5,
   },

   working_positions = {
      lutas_atlanteans_woodcutter = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
         descname = _("felling trees"),
         actions = {
            -- time of worker: 29.2-68.8 sec, 
            -- min. time total: 29.2 + 15 = 44.2 sec
            -- max. time total: 68.8 + 15 = 83.8 sec
            -- avg. time total: 50.8 + 15 = 65.8 sec
            "callworker=harvest",
            "sleep=duration:15s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Trees"),
      heading = _("Out of Trees"),
      message = pgettext("lutas_atlanteans_building", "The woodcutter working at this woodcutter’s house can’t find any trees in his work area. You should consider dismantling or destroying the building or building a forester’s house."),
      productivity_threshold = 50
   },
}

pop_textdomain()
