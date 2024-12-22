push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_charcoal_kiln",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Charcoal Kiln"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 1,
      stone = 3,
      tropicalwood = 2,
      reed = 1,
      copper =1
   },
   return_on_dismantle = {
      stone = 2,
      tropicalwood = 1,
      copper =1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 50, 61 },
      },
   },

   spritesheets = {
      working = {
         frames = 5,
         columns = 5,
         rows = 1,
         hotspot = { 50, 61 },
      },
   },

   aihints = {
      prohibited_till = 1800,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 2,
      normal_ai_limit = 3,
   },

   working_positions = {
      sumatran_charcoal_burner = 1
   },

   inputs = {
      { name = "log", amount = 8 },
      { name = "tropicalwood", amount = 8 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
         descname = _("producing coal"),
         actions = {
            "return=skipped unless economy needs coal",
            "consume=log,tropicalwood:5",
            "animate=working duration:1m5s",
            "produce=coal",
            "sleep=duration:21s400ms"
         }
      },

   },
}

pop_textdomain()
