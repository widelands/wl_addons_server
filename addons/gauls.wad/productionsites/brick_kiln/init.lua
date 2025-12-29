push_textdomain("gauls.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_brick_kiln",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("gauls_building", "Brick Kiln"),
   animation_directory = dirname,
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      granite = 2,
      planks = 2,
      brick = 2,
      reed = 1,
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1,
      brick = 1
   },

   spritesheets = {
      idle = {
         hotspot = {50, 72},
         frames = 10,
         columns = 5,
         rows = 2,
         fps = 10
      },
      working = {
         hotspot = {50, 75},
         frames = 10,
         columns = 5,
         rows = 2,
         fps = 10
      }
   },
   animations = {
      unoccupied = {
         hotspot = {50, 58}
      }
   },

   aihints = {
      prohibited_till = 180,
      forced_after = 600,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
      normal_ai_limit = 3,
   },

   working_positions = {
      gauls_brickmaker = 1
   },

   inputs = {
      { name = "granite", amount = 3 },
      { name = "clay", amount = 6 },
      { name = "coal", amount = 3 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start burning bricks because ...
         descname = _("burning bricks"),
         actions = {
            -- time total: 29.2 + 50 + 3 * 3.6 = 90 sec
            "return=skipped unless economy needs brick",
            "sleep=duration:29s200ms",
            "consume=granite clay:3 coal",
            "animate=working duration:50s",
            "produce=brick:3"
         },
      },
   },
}

pop_textdomain()
