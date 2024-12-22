push_textdomain("sumatran_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "sumatran_iron_mine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("sumatran_building", "Iron Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   enhancement = {
      name = "sumatran_deep_iron_mine",
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
      prohibited_till = 600,
      basic_amount = 1,
      very_weak_ai_limit = 1,
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
         -- TRANSLATORS: Completed/Skipped/Did not start mining iron ore because ...
         descname = _("mining iron ore"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- time total: 23 + 2 * (15 + 3.6) + 10 = 70.2 sec (iron_ore:2)
            "return=skipped unless economy needs iron_ore",
            "consume=meal",
            "animate=working duration:15s",
            "mine=resource_iron radius:2 yield:50% when_empty:5% experience_on_fail:2%",
            "produce=iron_ore",
            "animate=working duration:15s",
            "mine=resource_iron radius:2 yield:50% when_empty:5% experience_on_fail:2%",
            "produce=iron_ore",
            "sleep=duration:23s",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Iron Ore"),
      heading = _("Main Iron Vein Exhausted"),
      message =
         pgettext("sumatran_building", "This iron mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
   },
}

pop_textdomain()
