push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_coal_mine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Coal Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   enhancement = {
      name = "gauls_coal_mine_deep",
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
      prohibited_till = 840,
      very_weak_ai_limit = 1,
      weak_ai_limit = 1,
      normal_ai_limit = 2,
   },

   working_positions = {
      gauls_miner = 1,
      gauls_miner_master = 1,
   },

   inputs = {
      { name = "meal", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
         descname = _("mining coal"),
         actions = {
            -- time total: 12 + 5 * (12 + 3.6)78 + 10 = 100 sec (20 sec/coal)
            "return=skipped unless economy needs coal",
            "sleep=duration:12s",
            "consume=meal",
            "animate=working duration:12s",
            "mine=resource_coal radius:2 yield:67% when_empty:5% experience_on_fail:8%",
            "produce=coal",
            "animate=working duration:12s",
            "mine=resource_coal radius:2 yield:67% when_empty:5% experience_on_fail:8%",
            "produce=coal",
            "animate=working duration:12s",
            "mine=resource_coal radius:2 yield:67% when_empty:5% experience_on_fail:8%",
            "produce=coal",
            "animate=working duration:12s",
            "mine=resource_coal radius:2 yield:67% when_empty:5% experience_on_fail:8%",
            "produce=coal",
            "animate=working duration:12s",
            "mine=resource_coal radius:2 yield:67% when_empty:5% experience_on_fail:8%",
            "produce=coal",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Coal"),
      heading = _("Main Coal Vein Exhausted"),
      message =
         pgettext("gauls_building", "This coal mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
   },
}

pop_textdomain()
