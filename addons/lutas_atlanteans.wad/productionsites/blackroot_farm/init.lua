push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_blackroot_farm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Blackroot Farm"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      planks = 3,
      granite = 2,
      log = 4
   },
   return_on_dismantle = {
      planks = 1,
      granite = 2,
      log = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 86, 78 },
      },
   },

   aihints = {
      prohibited_till = 600,
      basic_amount = 1,
      space_consumer = true,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      lutas_atlanteans_blackroot_farmer = 1
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
         -- TRANSLATORS: Completed/Skipped/Did not start planting blackroot because ...
         descname = _("planting blackroot"),
         actions = {
            "callworker=plant",
            "sleep=duration:10s"
         }
      },
      harvest = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting blackroot because ...
         descname = _("harvesting blackroot"),
         actions = {
            "callworker=harvest",
            "sleep=duration:3s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fields"),
      heading = _("Out of Fields"),
      message = pgettext("lutas_atlanteans_building", "The blackroot farmer working at this blackroot farm has no cleared soil to plant his seeds."),
      productivity_threshold = 30
   },
}

pop_textdomain()
