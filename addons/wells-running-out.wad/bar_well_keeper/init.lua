dirname = path.dirname (__file__)
push_textdomain("wells-running-out.wad", true)

descriptions:new_carrier_type {
   name = "barbarians_well_keeper",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext ("barbarians_worker", "Well Keeper"),
   icon = dirname .. "menu.png",
   vision_range = 2,

   ware_hotspot = {0, 20},

   spritesheets = {
      walk = {
         directory = dirname,
         basename = "walk",
         fps = 15,
         frames = 10,
         columns = 5,
         rows = 2,
         directional = true,
         hotspot = {10, 23}
      },
      walkload = {
         directory = dirname,
         basename = "walkload",
         fps = 15,
         frames = 10,
         columns = 5,
         rows = 2,
         directional = true,
         hotspot = {10, 26}
      },
      idle = {
         directory = dirname,
         basename = "idle",
         fps = 10,
         frames = 124,
         columns = 14,
         rows = 9,
         hotspot = {17, 18}
      },
   },
}
pop_textdomain()
