push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_warehouse_type {
   name = "europeans_port",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Port"),
   icon = dirname .. "menu.png",
   size = "port",
   map_check = {"seafaring"},

   buildcost = {
      planks = 6,
      reed = 2,
      cloth = 2,
      brick = 3,
      grout = 3,
      quartz = 3,
      diamond = 3
   },
   return_on_dismantle = {
      planks = 3,
      reed = 2,
      granite = 2,
      quartz = 2,
      diamond = 2
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 74, 70 },
         fps = 10
      },
      build = {
         pictures = path.list_files(dirname .. "build_??.png"),
         hotspot = { 74, 70 },
      }
   },

   aihints = {
   },

   conquers = 6,
   heal_per_second = 170,
}

pop_textdomain()
