push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_brick_kiln",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Brick Kiln"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      clay = 6,
      branch = 2,
   },
   return_on_dismantle = {
      clay = 2,
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 40, 63 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 300,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3
   },

   working_positions = {
      hebrews_talmid = 1,
   },

   inputs = {
      { name = "branch", amount = 8 },
      { name = "clay", amount = 8 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start firing bricks because ...
         descname = _("firing bricks"),
         actions = {
            "return=skipped unless economy needs granite",
            "consume=branch:4 clay:2",
            "sleep=duration:15s",
            "playsound=sound/metal/furnace priority:50% allow_multiple",
            "sleep=duration:25s",
            "produce=granite"
         }
      },
   },
}

pop_textdomain()
