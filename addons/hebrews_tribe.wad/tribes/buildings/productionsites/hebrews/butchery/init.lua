push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_butchery",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Butchery"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      clay = 5,
      branch = 2,
   },
   return_on_dismantle = {
      clay = 2
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 59, 71 },
      },
      working = {
         hotspot = { 59, 71 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 580,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      hebrews_talmid = 1,
      hebrews_geologist = 1
   },

   inputs = {
      { name = "sheep2", amount = 4 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time total: 3 * 68 = 204 sec
            "call=butcher_sheep",
         }
      },
      butcher_sheep = {
         -- TRANSLATORS: Completed/Skipped/Did not start butchering sheep because ...
         descname = _("butchering sheep"),
         actions = {
            -- time: 30.8 + 30 + 2 * 3.6 = 68
            "return=skipped unless economy needs meat or economy needs fur",
            "consume=sheep2",
            "animate=working duration:30s800ms",
            "sleep=duration:30s",
            "produce=meat:2",
            "produce=fur",
            "produce=wool"
         }
      },
   },
}

pop_textdomain()
