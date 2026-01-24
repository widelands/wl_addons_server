push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname (__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_thermal_springs",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext ("sumatran_building", "Thermal Springs"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      granite = 4,
      tropicalwood = 2,
   },
   return_on_dismantle = {
      granite = 2,
      tropicalwood = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 19, 33 },
      },
   },

   spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 19, 33 }
      },
   },

   aihints = {
      basic_amount = 3,
--      supports_production_of = { "log", "palmleaves", "palm_wine" },
      forced_after = 420,
      very_weak_ai_limit = 3,
      weak_ai_limit = 4,
      normal_ai_limit = 5,
   },

   working_positions = {
      sumatran_jungle_ghost = 1
   },

   inputs = {
      { name = "log", amount = 4 },
      { name = "granite", amount = 4 },
      { name = "water", amount = 4 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start enhancing the fertility of land because ...
         descname = _("enhancing the fertility of land"),
         actions = {
            "callworker=check_spring",
            "consume=log granite water",
            "call=terraform",
            "call=terraform",
            "call=terraform",
            "call=terraform",
            "call=terraform",
            "call=terraform",
            "call=terraform",
         }
      },
      terraform = {
         -- TRANSLATORS: Completed/Skipped/Did not start enhancing the fertility of land because ...
         descname = _("enhancing the fertility of land"),
         actions = {
            "callworker=terraform_spring",
--            "sleep=duration:1s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Enhancement"),
      heading = _("No Enhancement "),
      message = pgettext("sumatran_building", "This thermal spring does not enhance surrounding land any more. There is either no material or the process was completed."),
      productivity_threshold = 30
   },
}

pop_textdomain()
