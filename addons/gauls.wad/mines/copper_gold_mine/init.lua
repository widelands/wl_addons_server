push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_copper_gold_mine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Copper-Gold Mine"),
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
      gauls_miner_master = 1,
      gauls_miner = 1
   },

   inputs = {
      { name = "meal", amount = 6 },
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining copper-gold ore because ...
         descname = _("mining copper-gold ore"),
         actions = {
            -- time total: 8 + 4 * (7 + 3.6)42.4 + 10 = 60.4 sec 
            "return=skipped unless economy needs gold_ore or economy needs copper_ore",
            "sleep=duration:8s",
            "consume=meal",
            "animate=working duration:7s",
            "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=gold_ore",
            "animate=working duration:7s",
            "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=copper_ore",
            "animate=working duration:7s",
            "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=gold_ore",
            "animate=working duration:7s",
            "mine=resource_gold radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=copper_ore",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Copper-Gold Ore"),
      heading = _("Copper-Gold Vein Exhausted"),
      message =
         pgettext("gauls_building", "This copper-gold mine’s main vein is exhausted. Expect strongly diminished returns on investment. This mine can’t be enhanced any further, so you should consider dismantling or destroying it."),
   },
}

pop_textdomain()
