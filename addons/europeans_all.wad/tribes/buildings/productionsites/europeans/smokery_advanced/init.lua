push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/frisians/smokery/"

wl.Descriptions():new_productionsite_type {
   name = "europeans_smokery_advanced",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("europeans_building", "Advanced Smokery"),
   icon = dirname .. "menu.png",

   animation_directory = dirname,
   animations = {
      unoccupied = {
         hotspot = {50, 58}
      }
   },
   spritesheets = {
      idle = {
         hotspot = {50, 71},
         frames = 10,
         columns = 5,
         rows = 2,
         fps = 10
      },
      working = {
         hotspot = {50, 71},
         frames = 10,
         columns = 5,
         rows = 2,
         fps = 10
      }
   },

   size = "medium",

   aihints = {
      prohibited_till = 4200,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      frisians_smoker = 1
   },

   inputs = {
      { name = "meat", amount = 6 },
      { name = "fish", amount = 6 },
      { name = "log", amount = 6 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: typically 54 sec (either-or logic)
            "call=smoke_meat",
            "call=smoke_fish",
         },
      },
      smoke_fish = {
         -- TRANSLATORS: Completed/Skipped/Did not start smoking fish because ...
         descname = _("smoking fish"),
         actions = {
            -- time: 16.8 + 30 + 2 * 3.6 = 54 sec
            "return=skipped unless economy needs smoked_fish",
            "consume=fish:2 log",
            "sleep=duration:16s800ms",
            "animate=working duration:30s",
            "produce=smoked_fish:2"
         },
      },
      smoke_meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start smoking meat because ...
         descname = _("smoking meat"),
         actions = {
            -- time: 16.8 + 30 + 2 * 3.6 = 54 sec
            "return=skipped when site has fish:2 and economy needs smoked_fish",
            "return=skipped unless economy needs smoked_meat",
            "consume=meat:2 log",
            "sleep=duration:16s800ms",
            "animate=working duration:30s",
            "produce=smoked_meat:2"
         },
      },
   },
}

pop_textdomain()
