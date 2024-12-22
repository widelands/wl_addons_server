push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_shipyard",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Shipyard"),
   icon = dirname .. "menu.png",
   size = "medium",
   map_check = {"seafaring"},

   buildcost = {
      log = 1,
      stone = 2,
      tropicalwood = 2,
      palmleaves = 1,
      reed = 1,
      cloth = 2,
      diamond = 1
   },
   return_on_dismantle = {
      cloth = 1,
      stone = 1,
      tropicalwood = 2,
      diamond = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 56, 72 },
      },
      working = {
         basename = "idle", -- TODO
         hotspot = { 56, 72 },
      },
      unoccupied = {
         basename = "idle", -- TODO
         hotspot = { 56, 72 },
      }
   },

   spritesheets = {
      build = {
         frames = 5,
         columns = 5,
         rows = 1,
         hotspot = { 56, 72 },
      },
   },

   aihints = {
      prohibited_till = 1740,
      needs_water = true,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3,
      normal_ai_limit = 3,
      shipyard = true,
   },

   working_positions = {
      sumatran_shipwright = 1
   },

   inputs = {
      { name = "log", amount = 4 },
      { name = "tropicalwood", amount = 3 },
      { name = "sandedwood", amount = 4 },
      { name = "reed", amount = 3 },
      { name = "cloth", amount = 3 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=ship on failure fail",
            "call=ship_preparation",
         }
      },
      ship = {
         -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
         descname = _("constructing a ship"),
         actions = {
            "construct=sumatran_shipconstruction worker:buildship radius:6",
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
