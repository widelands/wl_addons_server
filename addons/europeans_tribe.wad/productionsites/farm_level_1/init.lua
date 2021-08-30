push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_farm_level_1",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Farm Level 1"),
   icon = dirname .. "menu.png",
   size = "big",
   
   enhancement = {
        name = "europeans_farm_level_2",
        enhancement_cost = {
          blackwood = 3,
          cloth = 3,
          quartz = 1
        },
        enhancement_return_on_dismantle = {
          blackwood = 2,
          quartz = 1
        },
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 74, 60 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 74, 60 },
      },
   },

   aihints = {
      space_consumer = true
   },

   working_positions = {
      europeans_farmer_basic = 1,
      europeans_farmer_normal = 2
   },
   
   inputs = {
      { name = "water", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=plant_corn",
            "call=plant_wheat",
            "call=harvest_corn",
            "call=plant_rye",
            "call=plant_barley",
            "call=harvest_wheat",
            "call=harvest_rye",
            "call=harvest_barley",
            "return=skipped"
         }
      },
      plant_barley = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting barley because ...
         descname = _"planting barley",
         actions = {
            "return=skipped unless economy needs barley or workers need experience",
            "return=skipped when economy needs water",
            "consume=water",
            "callworker=plant_barley",
            "animate=working duration:6s",
            "sleep=duration:3s"
         }
      },
      plant_corn = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting corn because ...
         descname = _"planting corn",
         actions = {
            "return=skipped unless economy needs corn or workers need experience",
            "return=skipped when economy needs water",
            "consume=water",
            "callworker=plant_corn",
            "animate=working duration:6s",
            "sleep=duration:3s"
         }
      },
      plant_rye = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting rye because ...
         descname = _"planting rye",
         actions = {
            "return=skipped unless economy needs rye or workers need experience",
            "return=skipped when economy needs water",
            "consume=water",
            "callworker=plant_rye",
            "animate=working duration:6s",
            "sleep=duration:3s"
         }
      },
      plant_wheat = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting wheat because ...
         descname = _"planting wheat",
         actions = {
            "return=skipped unless economy needs wheat or workers need experience",
            "return=skipped when economy needs water",
            "consume=water",
            "callworker=plant_wheat",
            "animate=working duration:6s",
            "sleep=duration:3s"
         }
      },
      harvest_barley = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting barley because ...
         descname = _"harvesting barley",
         actions = {
            "return=skipped unless economy needs barley or workers need experience",
            "sleep=duration:6s",
            "callworker=harvest_barley",
            "animate=working duration:6s",
            "sleep=duration:3s",
            "produce=barley"
         }
      },
      harvest_corn = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting corn because ...
         descname = _"harvesting corn",
         actions = {
            "return=skipped unless economy needs corn or workers need experience",
            "sleep=duration:6s",
            "callworker=harvest_corn",
            "animate=working duration:6s",
            "sleep=duration:3s",
            "produce=corn"
         }
      },
      harvest_rye = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting rye because ...
         descname = _"harvesting rye",
         actions = {
            "return=skipped unless economy needs rye or workers need experience",
            "sleep=duration:6s",
            "callworker=harvest_rye",
            "animate=working duration:6s",
            "sleep=duration:3s",
            "produce=rye"
         }
      },
      harvest_wheat = {
         -- TRANSLATORS: Completed/Skipped/Did not start harvesting wheat because ...
         descname = _"harvesting wheat",
         actions = {
            "return=skipped unless economy needs wheat or workers need experience",
            "sleep=duration:6s",
            "callworker=harvest_wheat",
            "animate=working duration:6s",
            "sleep=duration:3s",
            "produce=wheat"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _"No Fields",
      heading = _"Out of Fields",
      message = pgettext("europeans_building", "The farmer working at this farm has no cleared soil to plant his seeds."),
      productivity_threshold = 30
   },
}

pop_textdomain()
