push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_shipyard",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Shipyard"),
   icon = dirname .. "menu.png",
   size = "medium",
   map_check = {"seafaring"},

   buildcost = {
      granite = 2,
      planks = 2,
      brick = 2,
      reed = 1,
      cloth = 2
   },
   return_on_dismantle = {
      brick = 1,
      granite = 1,
      planks = 1,
      cloth = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 62, 48 },
      },
      unoccupied = {
         hotspot = { 62, 48 },
      },
      working = {
         hotspot = { 61, 47 },
      },
   },

   spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 61, 47 }
      },
   },

   aihints = {
      prohibited_till = 1740,
      needs_water = true,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
      normal_ai_limit = 2,
      shipyard = true,
   },

   working_positions = {
      gauls_shipwright = 1
   },

   inputs = {
      { name = "log", amount = 4 },
      { name = "planks", amount = 7 },
      { name = "reed", amount = 3 },
      { name = "cloth", amount = 3 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- steps from building to ship: 2-9
            -- worker time: 6 sec
            -- number of wares to carry: 4 + 7 + 3 + 3 = 17
            -- min. time total: 17 * (2 * 2 * 1.8 + 6 + 20 + 30) = 1074.4 sec
            -- max. time total: 17 * (2 * 9 * 1.8 + 6 + 20 + 30) = 1502.8 sec
            "call=ship on failure fail",
            "call=ship_preparation",
         }
      },
      ship = {
         -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
         descname = _("constructing a ship"),
         actions = {
            "construct=gauls_shipconstruction worker:buildship radius:6",
            "sleep=duration:20s",
         }
      },
      ship_preparation = {
         descname = _("working"),
         actions = {
            "animate=working duration:30s",
         }
      },
   },
}

pop_textdomain()
