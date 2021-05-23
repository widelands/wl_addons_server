push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_warehouse_type {
   name = "europeans_warehouse_basic",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Basic Warehouse"),
   icon = dirname .. "menu.png",
   size = "medium",
   
   enhancement = {
        name = "europeans_warehouse_normal",
        enhancement_cost = {
          cloth = 2,
          quartz = 1,
          diamond = 1
        },
        enhancement_return_on_dismantle = {
          quartz = 1,
          diamond = 1
        },
   },

   buildcost = {
      planks = 6,
      reed = 2,
      brick = 4,
      grout = 4,
      quartz = 1,
      diamond = 1
   },
   return_on_dismantle = {
      log = 3,
      reed = 1,
      granite = 2,
      quartz = 1,
      diamond = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 60, 78 },
      },
      build = {
         hotspot = { 60, 78 },
      }
   },

   aihints = {},

   heal_per_second = 140,
}

pop_textdomain()
