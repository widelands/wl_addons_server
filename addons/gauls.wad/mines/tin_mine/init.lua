push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_tin_mine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Tin Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   buildcost = {
      log = 3,
      granite = 1,
      planks= 1,
      reed = 1,
   },
   return_on_dismantle = {
      log = 2,
      granite = 1,
   },

   enhancement = {
      name = "gauls_tin_mine_deep",
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
      prohibited_till = 360,
      basic_amount = 1,
      very_weak_ai_limit = 2,
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
         -- TRANSLATORS: Completed/Skipped/Did not start mining tin ore because ...
         descname = _("mining tin ore"),
         actions = {
            -- "return=skipped" causes 10 sec delay
            -- time total: 11 + 4 * (10 + 3.6)54.4 + 10 = 75.4 sec (tin_ore:1, granite:3) 75s/tin ore
            "return=skipped unless economy needs tin_ore or economy needs granite",
            "sleep=duration:11s",
            "consume=ration",
            "animate=working duration:10s",
            "mine=resource_stones radius:2 yield:50% when_empty:10% experience_on_fail:10%",
            "produce=granite",
            "animate=working duration:10s",
            "mine=resource_stones radius:2 yield:50% when_empty:10% experience_on_fail:10%",
            "produce=tin_ore",
            "animate=working duration:10s",
            "mine=resource_stones radius:2 yield:50% when_empty:10% experience_on_fail:10%",
            "produce=granite",
            "animate=working duration:10s",
            "mine=resource_stones radius:2 yield:50% when_empty:10% experience_on_fail:10%",
            "produce=granite",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Tin Ore"),
      heading = _("Main Tin Ore Vein Exhausted"),
      message =
         pgettext("gauls_building", "This tin mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
   },
}

pop_textdomain()
