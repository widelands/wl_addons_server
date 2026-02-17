push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
   name = "hebrews_port",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Port"),
   icon = dirname .. "menu.png",
   size = "port",
   map_check = {"seafaring"},

   buildcost = {
      clay = 6,
      granite = 10,
      gold_leaf = 2,
      branch = 4,
   },
   return_on_dismantle = {
      clay = 2,
      granite = 5,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 72, 115 },
      },
   },

   aihints = {
      prohibited_till = 1000
   },

   conquers = 5,
   heal_per_second = 170,
   max_garrison = 20,
}

pop_textdomain()
