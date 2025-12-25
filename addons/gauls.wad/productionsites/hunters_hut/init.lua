push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_hunters_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Hunter’s Hut"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 1,
      granite = 1,
      planks = 1,
      reed = 1,
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1,
   },

   animation_directory = dirname,
   animations = {
      unoccupied = {
         hotspot = { 44, 44 },
      },
   },

   spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 43, 44 }
      },
      idle = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 43, 44 }
      },
   },

   aihints = {
--      prohibited_till = 120,
--      forced_after = 60,
--      supports_production_of = { "meat" },
--      requires_supporters = true,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3,
      normal_ai_limit = 3,
   },

   working_positions = {
      gauls_hunter = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("hunting"),
         actions = {
            -- avg. time total: 35.5 + 35 = 70.5 sec
            "call=hunt", 
            "sleep=duration:35s",
         }
      },
      hunt = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("hunting"),
         actions = {
            -- area: 12 + 1.5 sec, time of worker: 8.7-55.5 sec, average 35.5 sec
            -- min. time total:  8.7 sec
            -- max. time total: 55.5 sec
            -- avg. time total: 35.5 sec
            "callworker=hunt",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of Game" for missing animals
      title = _("No Game"),
      -- TRANSLATORS: "Game" means animals that you can hunt
      heading = _("Out of Game"),
      -- TRANSLATORS: "Game" means animals that you can hunt
      message = pgettext("gauls_building", "The hunter working at this hunter’s hut can’t find any game in his work area."),
      productivity_threshold = 30
   },
}

pop_textdomain()
