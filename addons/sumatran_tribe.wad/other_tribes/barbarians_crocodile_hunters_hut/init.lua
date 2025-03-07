push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "barbarians_crocodile_hunters_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("barbarians_building", "Crocodile Hunter’s Hut"),
   icon = dirname .. "menu.png",
   size = "small",

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
      very_weak_ai_limit = 0,
      weak_ai_limit = 0,
      normal_ai_limit = 0,
   },

   working_positions = {
      barbarians_hunter = 2
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
         descname = _("hunting"),
         actions = {
            "call=hunt_crocodile",
            "callworker=hunt",
            "sleep=duration:35s",
            "callworker=hunt",
            "sleep=duration:35s"
         }
      },
      hunt_crocodile = {
         -- TRANSLATORS: Completed/Skipped/Did not start hunting crocodile because ...
         descname = _("hunting crocodile"),
         actions = {
            "callworker=hunt_crocodile on failure skip",
            "sleep=duration:9s",
         }
      },
   },
   out_of_resource_notification = {
      title = _("No Crocodiles"),
      -- TRANSLATORS: "Game" means animals that you can hunt
      heading = _("Out of Game"),
      -- TRANSLATORS: "game" means animals that you can hunt
      message = pgettext("barbarians_building", "The hunter working out of this hut can’t find any crocodiles in his work area."),
      productivity_threshold = 20
   },
}

pop_textdomain()
