push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_granitemine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Granite Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   buildcost = {
      clay = 4,
      granite = 2,
      cloth = 1,
   },
   return_on_dismantle = {
      clay = 1,
      granite = 1,
      cloth = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 66, 77 },
      },
      empty = {
         hotspot = { 66, 77 },
      },
      working = {
         hotspot = { 66, 77 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 600,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
   },

   working_positions = {
      hebrews_miner = 1
   },

   inputs = {
      { name = "bread_hebrews", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining granite because ...
         descname = _("mining granite"),
         actions = {
            "return=skipped unless economy needs granite",
            "consume=bread_hebrews",
            "sleep=duration:10s800ms",
            "call=mine_produce",
            "call=mine_produce",
            "return=skipped"
         }
      },
      mine_produce = {
         descname = _("mining granite"),
         actions = {
            "animate=working duration:10s",
            "mine=resource_stones radius:2 yield:100% when_empty:5% experience_on_fail:2%",
            "produce=granite",
         }
      },
      encyclopedia = {
         -- just a dummy program to fix encyclopedia
         descname = "encyclopedia",
         actions = {
            "consume=bread_hebrews",
            "produce=granite:2",
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Granite"),
      heading = _("Main Granite Vein Exhausted"),
      message =
         pgettext("hebrews_building", "This granite mine's main vein is exhausted. Expect strongly diminished returns on investment. You should consider dismantling or destroying it."),
   },
}

pop_textdomain()
