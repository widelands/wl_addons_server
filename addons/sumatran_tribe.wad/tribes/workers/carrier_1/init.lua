push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_carrier_type {
    name = "sumatran_carrier_1",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("sumatran_worker", "Carrier (male)"),
    icon = dirname .. "menu.png",
    vision_range = 2,
        
    animation_directory = dirname,
    spritesheets = {
      idle = {
         fps = 10,
         frames = 95,
         rows = 11,
         columns = 9,
         hotspot = { 9, 22 } -- 7, 22
      },
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 7, 20 }
      },
      walkload = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 8, 21 }
      },
    },
}

pop_textdomain()
