push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
   name = "gauls_druids_gathering",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Druid's Gathering"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      granite = 3,
      planks = 2,
      brick = 4,
      reed = 2,
      cloth = 3,
      copper =1,
      gold =1,
      bronze =1,
   },
   return_on_dismantle = {
      granite = 2,
      planks = 1,
      brick = 2,
      reed = 1,
      cloth = 1,
      gold =1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 65, 83 },
      },
      unoccupied = {
         hotspot = { 65, 83 },
      },
   },

   spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 65, 83 }
      },
      working = {
         fps = 20,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 65, 83 }
      },
   },

   aihints = {
      prohibited_till = 720,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 1,
   },

   working_positions = {
      gauls_druid = 3
   },

   inputs = {
      { name = "barbarians_bread", amount = 8 },
      { name = "smoked_fish", amount = 8 },
      { name = "smoked_meat", amount = 8 },
      { name = "elixir", amount = 8 }
   },

   programs = {
      -- Calculation of complete training of one soldier:
      -- each partial training takes additional 6 sec
      -- time total: 7 * 36 = 252 sec
      sleep = {
         -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
         descname = _("sleeping"),
         actions = {
            -- min. time: 3 * (13.2 + 5 + 6) sec = 72.6 sec
            -- max. time: 3 * (45.6 + 5 + 6) sec = 169.8 sec
            -- aver. time: 3 * (30.5 + 5 + 6) sec = 124.5 sec
            "sleep=duration:5s",
            "return=skipped",
         }
      },
      upgrade_soldier_health_0 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("gauls_building", "upgrading warrior health from level 0 to level 1"),
         actions = {
            -- time: 13.2 - 45.6 sec, average 30.5 sec + 5 + 6 sec
            "checksoldier=soldier:health level:0",
            "return=failed unless site has barbarians_bread,smoked_fish,smoked_meat",
            "return=failed unless site has elixir",
            "callworker=walk_to_tree",
            "checksoldier=soldier:health level:0",
            "consume=barbarians_bread,smoked_fish,smoked_meat elixir",
            "animate=working duration:5s",
            "train=soldier:health level:1",
            "sleep=duration:5s"
         }
      },
      upgrade_soldier_health_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("gauls_building", "upgrading warrior health from level 1 to level 2"),
         actions = {
            "checksoldier=soldier:health level:1",
            "return=failed unless site has barbarians_bread,smoked_fish,smoked_meat",
            "return=failed unless site has elixir",
            "callworker=walk_to_tree",
            "checksoldier=soldier:health level:1",
            "consume=barbarians_bread,smoked_fish,smoked_meat elixir",
            "animate=working duration:5s",
            "train=soldier:health level:2",
            "sleep=duration:5s"
         }
      },
      upgrade_soldier_health_2 = {
         -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
         descname = pgettext("gauls_building", "upgrading warrior health from level 2 to level 3"),
         actions = {
            "checksoldier=soldier:health level:2",
            "return=failed unless site has barbarians_bread,smoked_fish,smoked_meat",
            "return=failed unless site has elixir",
            "callworker=walk_to_tree",
            "checksoldier=soldier:health level:2",
            "consume=barbarians_bread,smoked_fish,smoked_meat elixir",
            "animate=working duration:5s",
            "train=soldier:health level:3",
            "sleep=duration:5s"
         }
      },
   },

   soldier_capacity = 12,
   trainer_patience = 10,

   messages = {
      -- TRANSLATORS: Gauls training site tooltip when it has no warrior assigned
      no_soldier = pgettext("gauls_building", "No warrior to train!"),
      -- TRANSLATORS: Gauls training site tooltip when none of the present warriors match the current training program
      no_soldier_for_level = pgettext("gauls_building", "No warrior found for this training level!"),
   },
}

pop_textdomain()
