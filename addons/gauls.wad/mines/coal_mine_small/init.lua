push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_coal_mine_small",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Small Coal Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   buildcost = {
      log = 3,
      granite = 1,
      planks= 1,
      reed = 1
   },
   return_on_dismantle = {
      log = 2,
      granite = 1,
   },

   enhancement = {
      name = "gauls_coal_mine",
      enhancement_cost = {
         log = 2,
         brick = 2,
         planks= 1,
         reed = 1
      },
      enhancement_return_on_dismantle = {
         log = 2,
         planks = 1
      }
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
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 2,
   },

   working_positions = {
      gauls_miner = 1
   },

   inputs = {
      { name = "ration", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
         descname = _("mining coal"),
         actions = {
            -- time total: 18 + 3 * (17 + 3.6)61.8 + 10 = 89.8 sec (30 sec / item)
            "return=skipped unless economy needs coal",
            "sleep=duration:18s",
            "consume=ration",
            "animate=working duration:17s",
            "mine=resource_coal radius:2 yield:34% when_empty:5% experience_on_fail:5%",
            "produce=coal",
            "animate=working duration:17s",
            "mine=resource_coal radius:2 yield:34% when_empty:5% experience_on_fail:5%",
            "produce=coal",
            "animate=working duration:17s",
            "mine=resource_coal radius:2 yield:34% when_empty:5% experience_on_fail:5%",
            "produce=coal",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Coal"),
      heading = _("Main Coal Vein Exhausted"),
      message =
         pgettext("gauls_building", "This coal mine’s main vein is exhausted. Expect strongly diminished returns on investment. This mine can’t be enhanced any further, so you should consider dismantling or destroying it."),
   },
}

pop_textdomain()
