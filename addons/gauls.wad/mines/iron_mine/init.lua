push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_iron_mine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Iron Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   enhancement = {
      name = "gauls_iron_mine_deep",
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
      prohibited_till = 960,
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
         -- TRANSLATORS: Completed/Skipped/Did not start mining iron ore because ...
         descname = _("mining iron ore"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- time total: 9 + 3 * (10 + 3.6)40.8 + 10 = 59.8 sec (iron_ore:2, granite:1) 30s/iron ore
            "return=skipped unless economy needs iron_ore",
            "sleep=duration:9s",
            "consume=meal",
            "animate=working duration:10s",
            "mine=resource_iron radius:3 yield:67% when_empty:8% experience_on_fail:10%",
            "produce=iron_ore",
            "animate=working duration:10s",
            "mine=resource_iron radius:3 yield:67% when_empty:8% experience_on_fail:10%",
            "produce=granite",
            "animate=working duration:10s",
            "mine=resource_iron radius:3 yield:67% when_empty:8% experience_on_fail:10%",
            "produce=iron_ore",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Iron Ore"),
      heading = _("Iron Vein Exhausted"),
      message =
         pgettext("gauls_building", "This iron mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
   },
}

pop_textdomain()
