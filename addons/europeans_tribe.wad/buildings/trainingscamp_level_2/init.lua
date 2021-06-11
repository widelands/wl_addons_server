push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_trainingscamp_level_2",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Trainingscamp Level 2"),
   icon = dirname .. "menu.png",
   size = "medium",
   
   enhancement = {
        name = "europeans_trainingscamp_level_3",
        enhancement_cost = {
          planks = 1,
          cloth = 1,
          granite = 1,
          quartz = 1,
          diamond = 1,
          gold = 1
        },
        enhancement_return_on_dismantle = {
          planks = 1,
          granite = 1,
          quartz = 1,
          diamond = 1,
          scrap_metal_mixed = 1
        },
   },
   
   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 44, 65 },
      },
      working = { -- TODO(GunChleoc): make animations
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 44, 65 },
      }
   },

   aihints = {
      very_weak_ai_limit = 0,
      weak_ai_limit = 1,
     --normal_ai_limit = 2
   },

   working_positions = {
      europeans_trainer_normal = 1
   },

   inputs = {
      { name = "europeans_recruit", amount = 8 },
      { name = "snack", amount = 8 },
      { name = "mead", amount = 8 },
      { name = "spear_wooden", amount = 8 },
      { name = "armor", amount = 4 },
      { name = "tabard", amount = 4 }
   },
   
   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=recruit_soldier",
            "return=skipped"
         }
      },
      recruit_soldier = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("europeans_building", "recruiting soldier"),
         actions = {
            "return=skipped unless economy needs europeans_soldier",
            "sleep=duration:30s",
            "consume=armor,tabard spear_wooden snack mead europeans_recruit",
            "animate=working duration:60s",
            "recruit=europeans_soldier"
         }
      },
   },
}

pop_textdomain()

