push_textdomain("hebrews_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "hebrews_clay_furnace",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("hebrews_building", "Clay Furnace"),
   icon = dirname .. "menu.png",
   size = "small",

   buildcost = {
      clay = 3,
      granite = 2
   },
   return_on_dismantle = {
      clay = 1,
      granite = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 44, 58 },
      },
      working = {
         basename = "idle", -- TODO: No animation yet.
         hotspot = { 44, 58 },
      },
   },

   aihints = {
      prohibited_till = 800,
      basic_amount = 1,
      very_weak_ai_limit = 1,
      weak_ai_limit = 2
   },

   working_positions = {
      hebrews_talmid = 1
   },

   inputs = {
      { name = "copper_ore", amount = 8 },
      { name = "branch", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start smelting copper because ...
         descname = _("smelting copper"),
         actions = {
            "return=skipped unless economy needs copper",
            "consume=copper_ore branch",
            "sleep=duration:12s",
            "playsound=sound/metal/furnace priority:50% allow_multiple",
            "animate=working duration:20s",
            "playsound=sound/metal/ironping priority:60%",
            "produce=copper"
         }
      },
   },
}

pop_textdomain()
