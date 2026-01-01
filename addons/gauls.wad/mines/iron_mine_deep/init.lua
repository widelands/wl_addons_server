push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_iron_mine_deep",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Deep Iron Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 60, 37 },
      },
      empty = {
         hotspot = { 60, 37 },
      },
   },

   spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 60, 37 }
      },
      working = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 60, 37 }
      },
   },

   aihints = {
      prohibited_till = 1800,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
      normal_ai_limit = 3,
   },

   working_positions = {
      gauls_miner_master = 2,
   },

   inputs = {
      { name = "meal", amount = 6 },
      { name = "potion", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining iron ore because ...
         descname = _("mining iron ore"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- time total: 10 + 7 * (15 + 3.6)130.2 + 10 = 150.2 sec (iron_ore:5, granite:2) 30s/iron
            "return=skipped unless economy needs iron_ore",
            "sleep=duration:10s",
            "consume=meal potion",
            "animate=working duration:15s",
            "mine=resource_iron radius:3 yield:100% when_empty:12% experience_on_fail:12%",
            "produce=iron_ore",
            "animate=working duration:15s",
            "mine=resource_iron radius:3 yield:100% when_empty:12% experience_on_fail:12%",
            "produce=granite",
            "animate=working duration:15s",
            "mine=resource_iron radius:3 yield:100% when_empty:12% experience_on_fail:12%",
            "produce=iron_ore",
            "animate=working duration:15s",
            "mine=resource_iron radius:3 yield:100% when_empty:12% experience_on_fail:12%",
            "produce=iron_ore",
            "animate=working duration:15s",
            "mine=resource_iron radius:3 yield:100% when_empty:12% experience_on_fail:12%",
            "produce=granite",
            "animate=working duration:15s",
            "mine=resource_iron radius:3 yield:100% when_empty:12% experience_on_fail:12%",
            "produce=iron_ore",
            "animate=working duration:15s",
            "mine=resource_iron radius:3 yield:100% when_empty:12% experience_on_fail:12%",
            "produce=iron_ore",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Iron"),
      heading = _("Main Iron Vein Exhausted"),
      message =
         pgettext("gauls_building", "This iron mine’s main vein is exhausted. Expect strongly diminished returns on investment. This mine can’t be enhanced any further, so you should consider dismantling or destroying it."),
   },
}

pop_textdomain()
