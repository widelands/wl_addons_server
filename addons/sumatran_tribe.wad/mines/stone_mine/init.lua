push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_stone_mine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Stone Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   enhancement = {
      name = "sumatran_deep_stone_mine",
      enhancement_cost = {
         log = 3,
         tropicalwood = 3,
         reed = 2
      },
      enhancement_return_on_dismantle = {
         log = 1,
         tropicalwood = 1,
         reed = 1
      }
   },

   buildcost = {
      log = 3,
      tropicalwood = 3,
      reed = 2
   },
   return_on_dismantle = {
      log = 2,
      tropicalwood = 1,
      reed = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 42, 35 },
      },
      empty = {
         hotspot = { 42, 35 },
      },
   },

   spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 42, 35 }
      },
      working = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 42, 35 }
      },
   },

   aihints = {
      prohibited_till = 360,
      basic_amount = 1,
      very_weak_ai_limit = 2,
      weak_ai_limit = 2,
      normal_ai_limit = 2,
   },

   working_positions = {
      sumatran_miner = 1
   },

   inputs = {
      { name = "meal", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining stone because ...
         descname = _("mining stone"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- need diamond: 3 + 3 * (17 + 3.6)61.8 + 10 = 74.8 sec (diamond granite:2) 25s/item
            -- doesn't need: 3 + 2 * (15 + 3.6)37.2 + 10 = 50.2 sec (granite:2) 25s/item
            "call=mine_diamond",
            "call=mine_stone",
            "sleep=duration:3s",
            "return=skipped"
         }
      },
      mine_diamond = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining stone and raw diamond because ...
         descname = _("mining stone and raw diamond"),
         actions = {
            "return=skipped unless economy needs diamond_raw",
            "consume=meal",
            "animate=working duration:17s",
            "mine=resource_stones radius:2 yield:50% when_empty:10% experience_on_fail:2%",
            "produce=diamond_raw",
            "animate=working duration:17s",
            "mine=resource_stones radius:2 yield:50% when_empty:10% experience_on_fail:2%",
            "produce=granite",
            "animate=working duration:17s",
            "mine=resource_stones radius:2 yield:50% when_empty:10% experience_on_fail:2%",
            "produce=granite",
         }
      },
      mine_stone = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining stone because ...
         descname = _("mining stone"),
         actions = {
            "return=skipped unless economy needs granite",
            "return=skipped when economy needs diamond_raw",
            "consume=meal",
            "animate=working duration:15s",
            "mine=resource_stones radius:2 yield:50% when_empty:5% experience_on_fail:2%",
            "produce=granite",
            "animate=working duration:15s",
            "mine=resource_stones radius:2 yield:50% when_empty:5% experience_on_fail:2%",
            "produce=granite",
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=meal",
            "produce=granite:2",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Stone"),
      heading = _("Main Stone Vein Exhausted"),
      message =
         pgettext("sumatran_building", "This stone mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
   },
}

pop_textdomain()
