dirname = path.dirname(__file__)

push_textdomain("barbarians_empire_economy_upgrade.wad", true)

wl.Descriptions():new_productionsite_type {
   name = "empire_mill_small",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("frisians_building", "Small Mill"),
   icon = dirname .. "menu.png",
   size = "medium",
    enhancement = {
        name = "empire_mill",
        enhancement_cost = {
            log = 1,
            granite = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1,
            marble = 1
        },
    },
   buildcost = {
      log = 2,
      granite = 2
   },
   return_on_dismantle = {
      log = 1,
      granite = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 41, 87 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 41, 87 },
         fps = 10
      },
   },

   aihints = {
      basic_amount = 1,
   },

   working_positions = {
      empire_miller = 1
   },

   inputs = {
      { name = "wheat", amount = 3 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start grinding barley because ...
         descname = _"grinding wheat",
         actions = {
            "return=skipped unless economy needs flour",
            "consume=wheat",
            "sleep=duration:6s",
            "animate=working duration:24s",
            "produce=flour"
         }
      },
   },
}
pop_textdomain()
