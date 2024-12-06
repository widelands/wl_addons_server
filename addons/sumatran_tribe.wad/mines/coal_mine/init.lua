push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_coal_mine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Coal Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   buildcost = {
      log = 3,
      tropicalwood = 3,
      reed = 3
   },
   return_on_dismantle = {
      log = 2,
      tropicalwood = 1,
      reed = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 21, 36 },
      },
      empty = {
         hotspot = { 21, 36 },
      },
   },

   spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 21, 36 }
      },
      working = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 21, 36 }
      },
   },

   aihints = {
      prohibited_till = 840,
      very_weak_ai_limit = 2,
      weak_ai_limit = 2,
      normal_ai_limit = 4,
   },

   working_positions = {
      sumatran_miner = 1
   },

   inputs = {
      { name = "meal", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
         descname = _("mining coal"),
         actions = {
            -- time total: 33 + 2 * (10 + 3.6) + 10 = 70.2 sec
            "return=skipped unless economy needs coal",
            "consume=meal",
            "animate=working duration:10s",
            "mine=resource_coal radius:3 yield:100% when_empty:5% experience_on_fail:5%",
            "produce=coal",
            "animate=working duration:10s",
            "mine=resource_coal radius:3 yield:100% when_empty:5% experience_on_fail:5%",
            "produce=coal",
            "sleep=duration:33s",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Coal"),
      heading = _("Main Coal Vein Exhausted"),
      message =
         pgettext("sumatran_building", "This coal mine’s main vein is exhausted. Expect strongly diminished returns on investment. This mine can’t be enhanced any further, so you should consider dismantling or destroying it."),
   },
}

pop_textdomain()
