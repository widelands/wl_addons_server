push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_coppermine",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Copper Mine"),
   icon = dirname .. "menu.png",
   size = "mine",

   buildcost = {
      clay = 5,
      granite = 3,
      cloth = 1,
      branch = 1,
   },
   return_on_dismantle = {
      clay = 2,
      granite = 1,
      cloth = 1,
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 66, 84 },
      },
      empty = {
         hotspot = { 66, 84 },
      },
      working = {
         hotspot = { 66, 84 },
      },
   },

   aihints = {
      basic_amount = 1,
      prohibited_till = 1000,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2,
   },

   working_positions = {
      hebrews_miner = 1
   },

   inputs = {
      { name = "bread_hebrews", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start mining copper because ...
         descname = _("mining copper"),
         actions = {
            "return=skipped unless economy needs copper_ore",
            "consume=bread_hebrews",
            "sleep=duration:45s400ms",
            "animate=working duration:20s",
            "mine=resource_iron radius:2 yield:33.33% when_empty:5% experience_on_fail:17%",
            "produce=copper_ore"
         }
      },
   },
   out_of_resource_notification = {
      -- Translators: Short for "Out of ..." for a resource
      title = _("No Copper"),
      heading = _("Main Copper Vein Exhausted"),
      message =
         pgettext("hebrews_building", "This copper mine's main vein is exhausted. Expect strongly diminished returns on investment. You should consider dismantling or destroying it."),
   },
}

pop_textdomain()
