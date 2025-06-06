push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_scouts_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Scout’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 2,
      granite = 1
   },
   return_on_dismantle = {
      log = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 44, 49 },
      },
   },

   spritesheets = {
      build = {
         frames = 3,
         columns = 3,
         rows = 1,
         hotspot = { 44, 49 },
      },
   },

   aihints = {
      prohibited_till = 3600,
   },

   working_positions = {
      lutas_atlanteans_scout = 1
   },

   inputs = {
      { name = "smoked_fish", amount = 2 },
      { name = "atlanteans_bread", amount = 2 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
         descname = _("scouting"),
         actions = {
            -- time of worker: 82.2-214.8 sec
            -- min. time of one scouting: 30 + 82.2 = 112.2 sec
            -- max. time of one scouting: 30 + 214.8 = 244.8 sec
            -- avg. time of one scouting: (112.2 + 244.8) / 2 = 178.5 sec
            "sleep=duration:30s",
            "consume=smoked_fish",
            "callworker=scout",
            "sleep=duration:30s",
            "consume=atlanteans_bread",
            "callworker=scout"
         }
      },
      targeted_scouting = {
         descname = _("scouting"),
         actions = {
            "consume=smoked_fish,atlanteans_bread",
            "callworker=targeted_scouting"
         }
      },
   },
}

pop_textdomain()
