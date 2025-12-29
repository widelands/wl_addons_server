push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_copper_mine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Copper Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   buildcost = {
      log = 3,
      granite = 1,
      planks= 1,
      reed = 1,
      cloth = 1
   },
   return_on_dismantle = {
      log = 2,
      granite = 1,
   },

   enhancement = {
      name = "gauls_copper_gold_mine",
      enhancement_cost = {
         log = 2,
         brick = 2,
         planks= 1,
         reed = 1,
         cloth = 1,
      },
      enhancement_return_on_dismantle = {
         log = 1,
         brick = 1,
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
      prohibited_till = 1380,
      forced_after = 3300,
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
         -- TRANSLATORS: Completed/Skipped/Did not start mining copper ore because ...
         descname = _("mining copper ore"),
         actions = {
            -- time total: 12 + 3 * (13 + 3.6)49.8 + 10 = 71.8 sec (24 sec/ore)
            "return=skipped unless economy needs gold_ore or economy needs copper_ore",
            "sleep=duration:12s",
            "consume=ration",
            "animate=working duration:13s",
            "mine=resource_gold radius:2 yield:50% when_empty:10% experience_on_fail:10%",
            "produce=copper_ore",
            "animate=working duration:13s",
            "mine=resource_gold radius:2 yield:50% when_empty:10% experience_on_fail:10%",
            "produce=gold_ore",
            "animate=working duration:13s",
            "mine=resource_gold radius:2 yield:50% when_empty:10% experience_on_fail:10%",
            "produce=copper_ore",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Copper Ore"),
      heading = _("Main Copper Vein Exhausted"),
      message =
         pgettext("gauls_building", "This copper mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
   },
}


pop_textdomain()
