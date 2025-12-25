push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_garden",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Garden"),
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
         hotspot = { 59, 65 },
      },
      unoccupied = {
         hotspot = { 59, 65 },
      },
   },

   aihints = {
      space_consumer = true,
      basic_amount = 2,
      prohibited_till = 490,
      very_weak_ai_limit = 1,
      weak_ai_limit = 3

   },

   working_positions = {
      gauls_gardener = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- unexperienced: 4 * (24.2 + 4 + 17.2) = 181.6 sec (45.4)
            -- experienced: 4 * (19.2 + 4 + 17.2) = 161.6 sec (40.4)
            "call=plant_vegetable",
            "call=plant_herbs",
            "call=plant_vegetable",
            "call=plant_herbs",
            "call=harvest_vegetable",
            "call=harvest_herbs",
            "call=harvest_vegetable",
            "call=harvest_herbs",
         }
      },
      plant_herbs = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting grapevines because ...
         descname = _("planting grapevines"),
         actions = {
            -- average time of unexperienced worker: 24.2 sec
            -- average time of experienced worker: 19.2 sec
            -- unexperienced: 24.2 + 4 = 28.2 sec
            -- experienced: 19.2 + 4 = 23.2 sec
            "return=skipped unless economy needs herbs",
            "callworker=plant_herbs",
            "sleep=duration:4s"
         }
      },
      harvest_herbs = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting grapevines because ...
         descname = _("harvesting grapes"),
         actions = {
            -- average time of worker: 17.2 sec
            "callworker=harvest_herbs"
         }
      },
      plant_vegetable = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting grapevines because ...
         descname = _("planting grapevines"),
         actions = {
            -- average time of unexperienced worker: 24.2 sec
            -- average time of experienced worker: 19.2 sec
            -- unexperienced: 24.2 + 4 = 28.2 sec
            -- experienced: 19.2 + 4 = 23.2 sec
            "return=skipped unless economy needs vegetable",
            "callworker=plant_vegetable",
            "sleep=duration:4s"
         }
      },
      harvest_vegetable = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting grapevines because ...
         descname = _("harvesting grapes"),
         actions = {
            -- average time of worker: 17.2 sec
            "callworker=harvest_vegetable"
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "produce=herbs",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Fields"),
      heading = _("Out of Fields"),
      message = pgettext("gauls_building", "The gardener working at this garden has no plants to harvest."),
      productivity_threshold = 20
   },
}

pop_textdomain()
