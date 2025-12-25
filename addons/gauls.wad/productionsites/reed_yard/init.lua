push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_reed_yard",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Reed Yard"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      granite = 1,
      planks = 1,
      brick = 1,
      reed = 1
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 46, 44 },
      },
   },

   aihints = {
--      prohibited_till = 300,
      needs_water = true,
      basic_amount = 2,
      very_weak_ai_limit = 3,
      weak_ai_limit = 3,
      normal_ai_limit = 3,
   },

   working_positions = {
      gauls_farmer = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "call=plant",
            "call=harvest",
         }
      },
      plant = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
         descname = _("planting reed"),
         actions = {
            -- time of worker: 17.2-42.4 sec, average 29.8 sec
            -- min. time total: 17.2 + 8 = 25.2 sec
            -- max. time total: 42.4 + 8 = 50.4 sec
            -- avg. time total: 29.8 + 8 = 37.8 sec
            "callworker=plant_reed",
            "sleep=duration:8s" 
         }
      },
      harvest = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
         descname = _("harvesting reed"),
         actions = {
            -- time of worker: 21.2-46.4 sec, average 33.8 sec
            -- min. time total: 21.2 + 3 = 24.2 sec
            -- max. time total: 46.4 + 3 = 49.4 sec
            -- avg. time total: 33.8 + 3 = 36.8 sec
            "callworker=harvest_reed",
            "sleep=duration:3s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fields or No Water Nearby"),
      heading = _("Out of Fields"),
      message = pgettext("gauls_building", "The reed cutter working at this reed yard has no cleared soil to plant new plants."),
      productivity_threshold = 20
   },
}

pop_textdomain()
