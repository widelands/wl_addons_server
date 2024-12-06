push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_deep_copper_gold_mine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Deep Copper-Gold Mine"),
   icon = dirname .. "menu.png",
   size = "mine",


   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 21, 37 },
      },
      empty = {
         hotspot = { 21, 37 },
      },
   },

   spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 21, 37 }
      },
      working = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 21, 37 }
      },
   },

   aihints = {
      prohibited_till = 1860,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
      normal_ai_limit = 3,
   },

   working_positions = {
      sumatran_miner_master = 1,
      sumatran_miner = 1
   },

   inputs = {
      { name = "meal", amount = 6 },
      { name = "palm_wine", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining copper-gold ore because ...
         descname = _("mining copper-gold ore"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- need iron: 32 + 4 * (21 + 3.6)98.4 + 10 = 140.4 sec (gold_ore:2 copper_ore:2) 35s/item
            -- doesn't need: 32 + 5 * (23 + 3.6)133 + 10 = 175 sec (gold_ore:2 copper_ore:3) 35s/item
            "call=mine_gold",
            "call=mine_copper",
            "sleep=duration:32s",
            "return=skipped"
         }
      },
      mine_gold = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining copper-gold ore because ...
         descname = _("mining copper-gold ore"),
         actions = {
            "return=skipped unless economy needs gold_ore",
            "consume=meal palm_wine",
            "animate=working duration:21s",
            "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=gold_ore",
            "animate=working duration:21s",
            "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=copper_ore",
            "animate=working duration:21s",
            "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=gold_ore",
            "animate=working duration:21s",
            "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=copper_ore",
         }
      },
      mine_copper = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining higher share of copper ore because ...
         descname = _("mining higher share of copper ore"),
         actions = {
            "return=skipped unless economy needs copper_ore",
            "return=skipped when economy needs gold_ore",
            "consume=meal palm_wine",
            "animate=working duration:23s",
            "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=copper_ore",
            "animate=working duration:23s",
            "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=gold_ore",
            "animate=working duration:23s",
            "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=copper_ore",
            "animate=working duration:23s",
            "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=gold_ore",
            "animate=working duration:23s",
            "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=copper_ore",
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=meal palm_wine",
            "produce=copper_ore:3 gold_ore:2",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Copper-Gold Ore"),
      heading = _("Copper-Gold Vein Exhausted"),
      message =
         pgettext("sumatran_building", "This copper-gold mine’s main vein is exhausted. Expect strongly diminished returns on investment. This mine can’t be enhanced any further, so you should consider dismantling or destroying it."),
   },
}

pop_textdomain()
