push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_deep_stone_mine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Deep Stone Mine"),
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
      prohibited_till = 1920,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 1,
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
         -- TRANSLATORS: Completed/Skipped/Did not start mining stone because ...
         descname = _("mining stone"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- need diamond: 24 + 4 * (23 + 3.6)106.4 + 10 = 140.4 sec (diamond stone:4) 35s/item
            -- doesn't need: 24 + 3 * (20 + 3.6)70.8 + 10 = 104.8 sec (stone:4) 35s/item
            "call=mine_diamond",
            "call=mine_stone",
            "sleep=duration:24s",
            "return=skipped"
         }
      },
      mine_diamond = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining stone and raw diamond because ...
         descname = _("mining stone and raw diamond"),
         actions = {
            "return=skipped unless economy needs diamond_raw",
            "consume=meal palm_wine",
            "animate=working duration:23s",
            "mine=resource_stones radius:2 yield:100% when_empty:15% experience_on_fail:10%",
            "produce=stone",
            "animate=working duration:23s",
            "mine=resource_stones radius:2 yield:100% when_empty:15% experience_on_fail:10%",
            "produce=stone",
            "animate=working duration:23s",
            "mine=resource_stones radius:2 yield:100% when_empty:15% experience_on_fail:10%",
            "produce=stone",
            "animate=working duration:23s",
            "mine=resource_stones radius:2 yield:100% when_empty:15% experience_on_fail:10%",
            "produce=diamond_raw",
         }
      },
      mine_stone = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining stone because ...
         descname = _("mining stone"),
         actions = {
            "return=skipped unless economy needs stone",
            "return=skipped when economy needs diamond_raw",
            "consume=meal palm_wine",
            "animate=working duration:20s",
            "mine=resource_stones radius:2 yield:100% when_empty:15% experience_on_fail:10%",
            "produce=stone",
            "animate=working duration:20s",
            "mine=resource_stones radius:2 yield:100% when_empty:15% experience_on_fail:10%",
            "produce=stone",
            "animate=working duration:20s",
            "mine=resource_stones radius:2 yield:100% when_empty:15% experience_on_fail:10%",
            "produce=stone",
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=meal palm_wine",
            "produce=stone:3",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Stone"),
      heading = _("Stone Vein Exhausted"),
      message =
         pgettext("sumatran_building", "This deep stone mine’s main vein is exhausted. Expect strongly diminished returns on investment. This mine can’t be enhanced any further, so you should consider dismantling or destroying it."),
   },
}

pop_textdomain()
