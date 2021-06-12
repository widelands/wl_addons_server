push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
   name = "europeans_trainingscamp_level_4",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("europeans_building", "Trainingscamp Level 4"),
   icon = dirname .. "menu.png",
   size = "medium",
      
   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 56, 68 },
      },
      working = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 56, 68 },
      }
   },

   aihints = {
      very_weak_ai_limit = 0,
      weak_ai_limit = 0,
     --normal_ai_limit = 2
   },

   working_positions = {
      europeans_trainer_advanced = 1
   },

   inputs = {
      { name = "europeans_recruit", amount = 12 },
      { name = "meal", amount = 12 },
      { name = "wine", amount = 12 },
      { name = "spear_wooden", amount = 12 },
      { name = "armor", amount = 6 },
      { name = "tabard", amount = 6 }
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
            "consume=armor,tabard spear_wooden meal wine europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_soldier"
         }
      },
   },
}

pop_textdomain()
