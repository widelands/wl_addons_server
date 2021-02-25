push_textdomain("new_tribe.wad", true)

dirname = path.dirname (__file__)

descriptions:new_warehouse_type {
   name = "newtribe_port",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("newtribe_building", "Port"),
   icon = dirname .. "menu.png",
   size = "port",
   map_check = {"seafaring"},

   buildcost = {
      granite = 8,
      log = 8,
      reed = 6
   },
   return_on_dismantle = {
      granite = 4,
      log = 4,
      reed = 3
   },

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {90, 84}},
      build = {hotspot = {90, 84}},
   },

   aihints = {
      prohibited_till = 1000
   },

   conquers = 5,
   heal_per_second = 170,
}

pop_textdomain()
