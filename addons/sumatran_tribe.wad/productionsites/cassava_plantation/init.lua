push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_cassava_plantation",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("sumatran_building", "Cassava Plantation"),
   icon = dirname .. "menu.png",
   size = "big",

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {55, 73}},
   },

   aihints = {
      prohibited_till = 1260,
      space_consumer = true,
      supports_production_of = { "cassavaleaves" },
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3,
      normal_ai_limit = 4,
   },

   working_positions = {
      sumatran_farmer_experienced = 1
   },

   inputs = {
      { name = "water", amount = 6 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "sleep=duration:25s",
            "call=plant_cassava",
            "sleep=duration:25s",
            "call=harvest_cassava",
         }
      },
      plant_cassava = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting cassava because ...
         descname = _("planting cassava"),
         actions = {
            "return=failed unless site has water",
            "callworker=check",
            "consume=water",
            "callworker=plant",
            "sleep=duration:24s",
            "callworker=plant",
         }
      },
      harvest_cassava = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting cassava because ...
         descname = _("harvesting cassava"),
         actions = {
            "callworker=harvest",
            "produce=cassavaroot",
            "sleep=duration:24s",
            "callworker=harvest",
            "produce=cassavaroot",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fields or Water"),
      heading = _("Out of Fields or Water"),
      message = pgettext ("sumatran_building", "The farmer working at this cassava plantation has no cleared soil to plant or doesn’t have any water for watering fields."),
      productivity_threshold = 30
   },
}

pop_textdomain()
