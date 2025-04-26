push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_foresters_house",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Forester’s House"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      log = 1,
      planks = 1,
      granite = 1
   },
   return_on_dismantle = {
      granite = 1,
      log = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 39, 47 },
      }
   },

   aihints = {
      space_consumer = true,
--      supports_production_of = { "log" },
      basic_amount = 3,
      very_weak_ai_limit = 3,
      weak_ai_limit = 6
   },

   working_positions = {
      lutas_atlanteans_forester = 1
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
         descname = _("planting trees"),
         actions = {
            -- time of worker: 15.2-36.8 sec, mean 25.784 sec
            -- min. time total: 15.2 + 8 = 23.2 sec
            -- max. time total: 36.8 + 8 = 44.8 sec
            -- mean time total: 25.784 + 8 = 33.784 sec
            "callworker=plant",
            "sleep=duration:8s"
         }
      },
   },
}

pop_textdomain()
