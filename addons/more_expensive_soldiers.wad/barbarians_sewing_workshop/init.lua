push_textdomain("more_expensive_soldiers.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
   name = "barbarians_sewing_workshop",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("barbarians_building", "Sewing Workshop"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      granite = 1,
      blackwood = 2,
      grout = 2,
      reed = 2
   },
   return_on_dismantle = {
      granite = 1,
      blackwood = 1,
      grout = 1
   },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 32, 64 },
      },
      build = {
         hotspot = { 32, 64 },
      },
      working = {
         hotspot = { 32, 64 },
      },
   },

   aihints = {
      prohibited_till = 900,
      basic_amount = 1,
   },

   working_positions = {
      barbarians_dressmaker = 1
   },

   inputs = {
      { name = "cloth", amount = 6 },
      { name = "fur", amount = 6 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start sewing fur garment because ...
         descname = _("sewing fur garment"),
         actions = {
            -- time: 18.4 + 40 + 3.6 = 62 sec
            "sleep=duration:18s400ms",
            "return=skipped unless economy needs fur_garment",
            "consume=cloth fur",
            "playsound=sound/barbarians/weaver priority:90%",
            "animate=working duration:40s",
            "produce=fur_garment"
         }
      },
   },
}

pop_textdomain()
