push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/workers/barbarians/carrier/"

wl.Descriptions():new_carrier_type {
    name = "europeans_carrier",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Carrier"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    animation_directory = dirname,
    spritesheets = {
        idle = {
            fps = 5,
            frames = 100,
            columns = 10,
            rows = 10,
            hotspot = { 11, 18 }
        },
        walk = {
            fps = 10,
            frames = 10,
            columns = 3,
            rows = 4,
            directional = true,
            hotspot = { 6, 16 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            columns = 3,
            rows = 4,
            directional = true,
            hotspot = { 6, 18 }
        }
    },
    
    buildcost = {}, -- This will give the worker the property "buildable"
}

pop_textdomain()
