push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_warehouse_type {
   name = "hebrews_warehouse",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Warehouse"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      clay = 3,
      granite = 3,
      branch = 2,
   },
   return_on_dismantle = {
      clay = 1,
      granite = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 59, 74 },
      },
   },

   aihints = {},

   heal_per_second = 170,
}

pop_textdomain()
