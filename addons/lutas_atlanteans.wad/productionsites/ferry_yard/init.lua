push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_ferry_yard",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Ferry Yard"),
   icon = dirname .. "menu.png",
   size = "medium",
   map_check = {"waterways"},

   buildcost = {
      log = 2,
      planks = 4,
      granite = 3,
      spidercloth = 2
   },
   return_on_dismantle = {
      log = 1,
      planks = 2,
      granite = 2,
      spidercloth = 1
   },

   -- TODO(Nordfriese): Make animations
   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 56, 72 },
      }
   },

   spritesheets = {
      build= {
         frames = 5,
         columns = 5,
         rows = 1,
         hotspot = { 56, 72 },
      }
   },

   aihints = {
      needs_water = true,
      prohibited_till = 3600,
   },

   working_positions = {
      lutas_atlanteans_shipwright = 1
   },

   inputs = {
      { name = "log", amount = 6 },
      { name = "spidercloth", amount = 3 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _("working"),
         actions = {
            -- time of worker: 17.2-38.8 sec
            -- min. time total: 20 + 17.2 = 37.2 sec
            -- max. time total: 20 + 38.8 = 58.8 sec
            "sleep=duration:20s",
            "return=skipped unless fleet needs ferry",
            "consume=log:2 spidercloth",
            "callworker=buildferry",
         }
      },
   },
}

pop_textdomain()
