push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_deep_iron_mine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Deep Iron Mine"),
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
      prohibited_till = 1620,
      basic_amount = 2,
      very_weak_ai_limit = 2,
      weak_ai_limit = 3,
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
         -- TRANSLATORS: Completed/Skipped/Did not start mining iron ore because ...
         descname = _("mining iron ore"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- time total: 45 + 3 * (23 + 3.6)79.8 + 10 = 134.8 sec (iron_ore:3) 45s/item
            "return=skipped unless economy needs iron_ore",
            "consume=meal palm_wine",
            "animate=working duration:23s",
            "mine=resource_iron radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=iron_ore",
            "animate=working duration:23s",
            "mine=resource_iron radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=iron_ore",
            "animate=working duration:23s",
            "mine=resource_iron radius:2 yield:100% when_empty:10% experience_on_fail:10%",
            "produce=iron_ore",
            "sleep=duration:45s",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Iron Ore"),
      heading = _("Iron Vein Exhausted"),
      message =
         pgettext("sumatran_building", "This deep iron mine’s main vein is exhausted. Expect strongly diminished returns on investment. This mine can’t be enhanced any further, so you should consider dismantling or destroying it."),
   },
}

pop_textdomain()
