push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/empire/carrier/"

wl.Descriptions():new_carrier_type {
    name = "europeans_carrier_3",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Carrier 3"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    buildcost = {
        europeans_carrier = 1
    },
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         fps = 10,
         frames = 95,
         rows = 11,
         columns = 9,
         hotspot = { 7, 22 }
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
