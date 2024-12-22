push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_copper_gold_mine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Copper-Gold Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   enhancement = {
      name = "sumatran_deep_copper_gold_mine",
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
      prohibited_till = 1380,
      forced_after = 3300,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 1,
   },

   working_positions = {
      sumatran_miner = 1
   },

   inputs = {
      { name = "meal", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining copper ore and gold ore because ...
         descname = _("mining copper ore and gold ore"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- need gold: 3 + 2 * (15 + 3.6)37.2 + 10 = 50.2 sec (gold_ore copper_ore) 25s/item
            -- doesn't need: 3 + 3 * (17 + 3.6)61.8 + 10 = 74.8 sec (gold_ore copper_ore:2) 25s/item
            "call=mine_gold",
            "call=mine_copper",
            "sleep=duration:3s",
            "return=skipped"
         }
      },
      mine_gold = {
         descname = _("mining copper ore and gold ore"),
         actions = {
            "return=skipped unless economy needs gold_ore",
            "consume=meal",
            "animate=working duration:15s",
            "mine=resource_gold radius:2 yield:50% when_empty:5% experience_on_fail:2%",
            "produce=copper_ore",
            "animate=working duration:15s",
            "mine=resource_gold radius:2 yield:50% when_empty:5% experience_on_fail:2%",
            "produce=gold_ore",
         }
      },
      mine_copper = {
         descname = _("mining higher share of copper ore"),
         actions = {
            "return=skipped unless economy needs copper_ore",
            "return=skipped when economy needs gold_ore",
            "consume=meal",
            "animate=working duration:17s",
            "mine=resource_gold radius:2 yield:50% when_empty:5% experience_on_fail:2%",
            "produce=copper_ore",
            "animate=working duration:17s",
            "mine=resource_gold radius:2 yield:50% when_empty:5% experience_on_fail:2%",
            "produce=gold_ore",
            "animate=working duration:17s",
            "mine=resource_gold radius:2 yield:50% when_empty:5% experience_on_fail:2%",
            "produce=copper_ore",
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=meal",
            "produce=copper_ore:2 gold_ore",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Copper-Gold Ore"),
      heading = _("Main Copper-Gold Vein Exhausted"),
      message =
         pgettext("sumatran_building", "This copper-gold mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
   },
}


pop_textdomain()
