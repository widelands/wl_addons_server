push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_carrier_type {
    name = "sumatrans_carrier",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("sumatran_worker", "Carrier (female)"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    buildcost = { },
    
    animation_directory = dirname,    
    spritesheets = {
      idle = {
         fps = 10,
         frames = 50,
         rows = 8,
         columns = 7,
         hotspot = { 11, 24 } -- 13, 24
      },
      walk = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 8, 25 }
      },
      walkload = {
         fps = 10,
         frames = 10,
         rows = 4,
         columns = 3,
         directional = true,
         hotspot = { 8, 25 }
      },
    },
}

pop_textdomain()
