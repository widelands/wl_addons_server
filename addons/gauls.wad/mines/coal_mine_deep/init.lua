push_textdomain("gauls.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "gauls_coal_mine_deep",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("gauls_building", "Deep Coal Mine"),
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
      prohibited_till = 2040,
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
         -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
         descname = _("mining coal"),
         actions = {
            -- time total: 17 + 8 * (13 + 3.6)132.8 + 10 = 159.8 sec (20 sec / item)
            "return=skipped unless economy needs coal",
            "sleep=duration:17s",
            "consume=meal potion",
            "animate=working duration:13s",
            "mine=resource_coal radius:3 yield:100% when_empty:5% experience_on_fail:12%",
            "produce=coal",
            "animate=working duration:13s",
            "mine=resource_coal radius:3 yield:100% when_empty:5% experience_on_fail:12%",
            "produce=coal",
            "animate=working duration:13s",
            "mine=resource_coal radius:3 yield:100% when_empty:5% experience_on_fail:12%",
            "produce=coal",
            "animate=working duration:13s",
            "mine=resource_coal radius:3 yield:100% when_empty:5% experience_on_fail:12%",
            "produce=coal",
            "animate=working duration:13s",
            "mine=resource_coal radius:3 yield:100% when_empty:5% experience_on_fail:12%",
            "produce=coal",
            "animate=working duration:13s",
            "mine=resource_coal radius:3 yield:100% when_empty:5% experience_on_fail:12%",
            "produce=coal",
            "animate=working duration:13s",
            "mine=resource_coal radius:3 yield:100% when_empty:5% experience_on_fail:12%",
            "produce=coal",
            "animate=working duration:13s",
            "mine=resource_coal radius:3 yield:100% when_empty:5% experience_on_fail:12%",
            "produce=coal",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Coal"),
      heading = _("Main Coal Vein Exhausted"),
      message =
         pgettext("gauls_building", "This coal mine’s main vein is exhausted. Expect strongly diminished returns on investment. This mine can’t be enhanced any further, so you should consider dismantling or destroying it."),
   },
}

pop_textdomain()
