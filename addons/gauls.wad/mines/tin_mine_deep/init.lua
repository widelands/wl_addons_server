push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_tin_mine_deep",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Deep Tin Mine"),
   icon = dirname .. "menu.png",
   size = "mine",


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
      prohibited_till = 1260,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
      normal_ai_limit = 2,
   },

   working_positions = {
      gauls_miner_master = 1,
      gauls_miner = 1
   },

   inputs = {
      { name = "meal", amount = 6 },
      { name = "potion", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining tin ore because ...
         descname = _("mining tin ore"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- time total: 12 + 5 * (10 + 3.6)68 + 10 = 90 sec (tin_ore:3, granite:2) 30 sec / tin ore
            "return=skipped unless economy needs tin_ore or economy needs granite",
            "sleep=duration:12s",
            "consume=meal potion",
            "animate=working duration:10s",
            "mine=resource_stones radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=tin_ore",
            "animate=working duration:10s",
            "mine=resource_stones radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=granite",
            "animate=working duration:10s",
            "mine=resource_stones radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=tin_ore",
            "animate=working duration:10s",
            "mine=resource_stones radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=tin_ore",
            "animate=working duration:10s",
            "mine=resource_stones radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=granite",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Tin Ore"),
      heading = _("Tin Vein Exhausted"),
      message =
         pgettext("gauls_building", "This deep tin mine’s main vein is exhausted. Expect strongly diminished returns on investment. This mine can’t be enhanced any further, so you should consider dismantling or destroying it."),
   },
}

pop_textdomain()
