push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_sheep_farm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Sheep Farm"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      granite = 2,
      planks = 2,
      brick = 2,
      reed = 2
   },
   return_on_dismantle = {
      granite = 1,
      planks = 1,
      brick = 1
   },

   animation_directory = dirname,
   spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 89, 82 },
      },
      unoccupied = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 89, 82 },
      },
      working = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 89, 82 },
      },
   },

   aihints = {
      prohibited_till = 780,
      basic_amount = 1,
      very_weak_ai_limit = 2,
      weak_ai_limit = 2
   },

   working_positions = {
      gauls_breeder = 1
   },

   inputs = {
      { name = "water", amount = 7 },
      { name = "wheat", amount = 7 },
      { name = "straw", amount = 7 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start breeding sheep because ...
         descname = _("breeding sheep"),
         actions = {
            -- time total: 25.4 + 30 + 3.6 = 59 sec
            "return=skipped unless economy needs wool",
            "sleep=duration:25s400ms",
            "consume=water wheat straw",
            "playsound=sound/farm/sheep priority:50% allow_multiple",
            "animate=working duration:30s",
            "produce=wool"
         }
      },
   },
}

pop_textdomain()
