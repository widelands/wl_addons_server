push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_zizijot_makers_hut",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("hebrews_building", "Zizijot Makers Hut"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      clay = 3,
      branch = 1,
   },
   return_on_dismantle = {
      clay = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {hotspot = {39, 46}},
      unoccupied = {hotspot = {39, 46}}
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 300,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      hebrews_carrier = 1
   },

   inputs = {
      { name = "yarn", amount = 8 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start making zizit because ...
         descname = _("making zizit"),
         actions = {
            -- time: 32.4 + 35 + 3.6 = 71 sec
            "return=skipped unless economy needs zizit",
            "consume=yarn:4",
            "sleep=duration:10s",
            -- TODO "animate=working duration:10s",
            "produce=zizit"
         },
      },

   },
}

pop_textdomain()
