push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_shipyard",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Shipyard"),
   icon = dirname .. "menu.png",
   size = "medium",
   map_check = {"seafaring"},

   buildcost = {
      clay = 2,
      granite = 3,
      branch = 3,
      cloth = 2
   },
   return_on_dismantle = {
      granite = 2,
      branch = 1,
      cloth = 1
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 55, 50 },
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 55, 50 },
      },
      unoccupied = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 55, 50 },
      },
      working = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 55, 50 },
      },
   },

   aihints = {
      needs_water = true,
      shipyard = true,
      prohibited_till = 1500
   },

   working_positions = {
      hebrews_shipwright = 1
   },

   inputs = {
      { name = "branch", amount = 10 },
      { name = "cloth", amount = 4 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- steps from building to ship: 2-9
            -- worker time: 5.5 sec
            -- number of wares to carry: 10 + 4 = 14
            -- (see data/tribes/immovables/shipconstruction_hebrews/init.lua)
            -- min. time total: 14 * (2 * 2 * 1.8 + 5.5 + 20 + 35) = 947.8 sec
            -- max. time total: 14 * (2 * 9 * 1.8 + 5.5 + 20 + 35) = 1300.6 sec
            "call=ship on failure fail",
            "call=ship_preparation",
         }
      },
      ship = {
         -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
         descname = _("constructing a ship"),
         actions = {
            "construct=hebrews_shipconstruction worker:buildship radius:6",
            "sleep=duration:20s",
         }
      },
      ship_preparation = {
         descname = _("working"),
         actions = {
            "animate=working duration:35s",
         }
      },
   },
}

pop_textdomain()
