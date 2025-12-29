push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_orchard",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Orchard"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      granite = 2,
      planks = 2,
      brick = 2,
      reed = 1
   },
   return_on_dismantle = {
      granite = 2,
      planks = 1,
      brick = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 59, 65 },
      },
      unoccupied = {
         hotspot = { 59, 65 },
      },
   },

   aihints = {
      space_consumer = true,
      basic_amount = 2,
      prohibited_till = 1000000,
      very_weak_ai_limit = 3,
      weak_ai_limit = 4,
      normal_ai_limit = 6,
   },

   working_positions = {
      gauls_gardener_experienced = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- min. time: 5 * 18.2 + 3 * 19.2 + 45 = 193.6 sec (38.7 sec)
            -- max. time: 5 * 43.4 + 3 * 44.4 + 45 = 395.2 sec (79.0 sec)
            "call=plant_tree",
            "sleep=duration:15s",
            "call=harvest",
            "call=plant_juniper",
            "sleep=duration:15s",
            "call=harvest",
            "call=harvest",
            "call=plant_tree",
            "sleep=duration:15s",
            "call=harvest",
            "call=harvest"
         }
      },
      plant_tree = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting fruit tree because ...
         descname = _("planting fruit tree"),
         actions = {
            -- time of worker: 19.2-44.4 sec, average 31.8 sec
            "callworker=plant_tree"
         }
      },
      plant_juniper = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting juniper because ...
         descname = _("planting juniper"),
         actions = {
            -- time of worker: 19.2-44.4 sec, average 31.8 sec
            "callworker=plant_juniper"
         }
      },
      harvest = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting fruit because ...
         descname = _("harvesting fruit"),
         actions = {
            -- time of worker: 13.2-38.4 sec, average 25.8 sec
            -- min. time: 13.2 + 5 = 18.2 sec
            -- max. time: 38.4 + 5 = 43.4 sec
            "callworker=gather_fruit",
            "sleep=duration:5s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fruit"),
      heading = _("Out of Fruit"),
      message = pgettext("gauls_building", "The gardener working at this orchard has no cleared soil to plant."),
      productivity_threshold = 30
   },
}

pop_textdomain()
