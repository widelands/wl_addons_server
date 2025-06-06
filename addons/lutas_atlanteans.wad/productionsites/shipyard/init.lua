push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_shipyard",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Shipyard"),
   icon = dirname .. "menu.png",
   size = "medium",
   map_check = {"seafaring"},

   buildcost = {
      log = 1,
      planks = 4,
      granite = 3,
      spidercloth = 2
   },
   return_on_dismantle = {
      log = 1,
      planks = 2,
      granite = 2,
      spidercloth = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 56, 72 },
      },
      working = {
         basename = "idle",
         hotspot = { 56, 72 },
      },
      unoccupied = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
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
      needs_water = true,
      shipyard = true,
      prohibited_till = 1200
   },

   working_positions = {
      lutas_atlanteans_shipwright = 1
   },

   inputs = {
      { name = "log", amount = 2 },
      { name = "planks", amount = 10 },
      { name = "spidercloth", amount = 4 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- steps from building to ship: 2-9
            -- worker time: 5.5 sec
            -- number of wares to carry: 10 + 2 + 4 = 16
            -- (see data/tribes/immovables/shipconstruction_atlanteans/init.lua)
            -- min. time total: 16 * (2 * 2 * 1.8 + 5.5 + 20 + 35) = 1083.2 sec
            -- max. time total: 16 * (2 * 9 * 1.8 + 5.5 + 20 + 35) = 1486.4 sec
            "call=ship on failure fail",
            "call=ship_preparation",
         }
      },
      ship = {
         -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
         descname = _("constructing a ship"),
         actions = {
            "construct=lutas_atlanteans_shipconstruction worker:buildship radius:6",
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
