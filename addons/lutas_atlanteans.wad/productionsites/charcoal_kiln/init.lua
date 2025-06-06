push_textdomain("lutas_atlanteans.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "lutas_atlanteans_charcoal_kiln",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("lutas_atlanteans_building", "Charcoal Kiln"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 2,
      granite = 3,
      planks = 1
   },
   return_on_dismantle = {
      log = 2,
      granite = 2
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 50, 61 },
      },
   },

   spritesheets = {
      working = {
         frames = 5,
         columns = 5,
         rows = 1,
         hotspot = { 50, 61 },
      },
   },

   aihints = {
      prohibited_till = 1800
   },

   working_positions = {
      lutas_atlanteans_charcoal_burner = 1
   },

   inputs = {
      { name = "log", amount = 8 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
         descname = _("producing coal"),
         actions = {
            -- time total: 30.4 + 90 + 3.6 = 124 sec
            "return=skipped unless economy needs coal",
            "sleep=duration:30s400ms",
            "consume=log:6",
            "animate=working duration:1m30s", -- Charcoal fires will burn for some days in real life
            "produce=coal"
         }
      },

   },
}

pop_textdomain()
