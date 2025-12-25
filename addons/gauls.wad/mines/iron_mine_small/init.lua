push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_iron_mine_small",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Small Iron Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   buildcost = {
      log = 3,
      granite = 1,
      planks= 1,
      reed = 1
   },
   return_on_dismantle = {
      log = 2,
      granite = 1,
   },

   enhancement = {
      name = "gauls_iron_mine",
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
      gauls_miner = 1
   },

   inputs = {
      { name = "ration", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining iron ore because ...
         descname = _("mining iron ore"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- time total: 9 + 2 * (7 + 3.6) + 10 = 40.2 sec (iron_ore:1, granite:1)
            "return=skipped unless economy needs iron_ore",
            "sleep=duration:9s",
            "consume=ration",
            "animate=working duration:7s",
            "mine=resource_iron radius:2 yield:34% when_empty:5% experience_on_fail:2%",
            "produce=iron_ore",
            "animate=working duration:7s",
            "mine=resource_iron radius:2 yield:34% when_empty:5% experience_on_fail:2%",
            "produce=granite",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Iron Ore"),
      heading = _("Main Iron Vein Exhausted"),
      message =
         pgettext("gauls_building", "This iron mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
   },
}

pop_textdomain()
