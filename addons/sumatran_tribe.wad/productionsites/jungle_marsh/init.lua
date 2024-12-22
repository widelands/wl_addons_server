push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_jungle_marsh",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Jungle Marsh"),
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      stone = 4,
      tropicalwood = 4,
      reed = 2
   },
   return_on_dismantle = {
      stone = 2,
      tropicalwood = 1
   },

   animation_directory = dirname,
   animations = {
      build = {hotspot = {120, 67}},
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         fps = 14,
         hotspot = { 120, 67 },
      },
   },

   aihints = {
      prohibited_till = 2040,
      forced_after = 2700,
      space_consumer = true,
      supports_production_of = { "crocodile_skin", "meat" },
      basic_amount = 1,
      very_weak_ai_limit = 2,
      weak_ai_limit = 2,
      normal_ai_limit = 3,
   },

   working_positions = {
      sumatran_jungle_ghost = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            "callworker=release",
            "sleep=duration:43s",
            "callworker=release_crocodile",
            "sleep=duration:43s",
            "callworker=release",
            "sleep=duration:43s",
            "callworker=release",
            "sleep=duration:43s"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Space"),
      heading = _("Animals do not leave this march"),
      message = pgettext ("sumatran_building", "There is not enough space around this march for animals to leave."),
      productivity_threshold = 10
   },
}

pop_textdomain()
