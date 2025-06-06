push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_hunters_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Hunter’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 1,
      planks = 1,
      granite = 1
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 40, 49 },
      },
   },

   aihints = {
      prohibited_till = 420,
      forced_after = 2700,
      basic_amount = 1,
   },

   working_positions = {
      lutas_atlanteans_hunter = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("hunting"),
         actions = {
            -- time of worker: 8.7-59.1 sec, mean 38.13 sec
            -- min. time total: 8.7 + 35 = 43.7 sec
            -- max. time total: 59.1 + 35 = 94.1 sec
            -- mean time total: 38.13 + 35 = 73.13 sec
            "callworker=hunt",
            "sleep=duration:35s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of Game" for a resource
      title = _("No Game"),
      -- TRANSLATORS: "Game" means animals that you can hunt
      heading = _("Out of Game"),
      -- TRANSLATORS: "game" means animals that you can hunt
      message = pgettext("lutas_atlanteans_building", "The hunter working out of this hunter’s house can’t find any game in his work area."),
      productivity_threshold = 10
   },
}

pop_textdomain()
