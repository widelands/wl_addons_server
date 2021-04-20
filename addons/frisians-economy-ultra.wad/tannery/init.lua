dirname = path.dirname(__file__)

push_textdomain("frisians-economy-ultra.wad", true)

descriptions:new_productionsite_type {
   name = "frisians_tannery",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("frisians_building", "Tannery"),
   icon = dirname .. "menu.png",
   size = "medium",

   buildcost = {
      log = 3,
      brick = 3,
      granite = 3,
      reed = 2
   },
   return_on_dismantle = {
      log = 1,
      brick = 2,
      reed = 1,
      granite = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 47, 57 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 47, 60 },
      },
   },

   aihints = {
      prohibited_till = 540
   },
   working_positions = {
      frisians_tanner = 1
   },
   inputs = {{ name = "fur", amount = 5 }},

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start tanning fur because ...
         descname = _"tanning fur",
         actions = {
            "return=skipped unless economy needs leather",
            "consume=fur",
            "sleep=duration:15s",
            "animate=working duration:40s",
            "produce=leather"
         }
      },
   },
}
pop_textdomain()
