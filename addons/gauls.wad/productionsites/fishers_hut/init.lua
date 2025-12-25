push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_fishers_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Fisher’s Hut"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 1,
      planks = 1,
      reed = 2
   },
   return_on_dismantle = {
      planks = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 39, 52 },
      },
      unoccupied = {
         hotspot = { 39, 52 },
      },
   },

   spritesheets ={
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 39, 52 }
      },
   },

   aihints = {
      needs_water = true,
      prohibited_till = 300,
   },

   working_positions = {
      gauls_fisher = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
         descname = _("fishing"),
         actions = {
            -- time of worker: 17.7-46.5 sec, average 32.2 sec
            -- min. time total: 17.7 + 20 = 37.7 sec
            -- max. time total: 46.5 + 20 = 66.5 sec
            -- avg. time total: 32.2 + 20 = 52.1 sec
            "callworker=fish",
            "sleep=duration:20s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fish"),
      heading = _("Out of Fish"),
      message = pgettext("gauls_building", "The fisher working out of this fisher’s hut can’t find any fish in his work area."),
   },
}

pop_textdomain()
