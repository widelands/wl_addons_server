push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/amazons/carrier/"

wl.Descriptions():new_worker_type {
    name = "europeans_worker_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Worker"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    programs = {
        fetch_water = {
            "findspace=size:swim radius:8",
            "walk=coords",
            "animate=fetch_water duration:1s",
            "createware=water",
            "return"
        }
    },
    
    animation_directory = dirname,
    ware_hotspot = {0, 29},
    spritesheets = {
        idle = {
            hotspot = {11, 29},
            fps = 10,
            frames = 80,
            columns = 10,
            rows = 8
        },
        fetch_water = {
            hotspot = {10, 22},
            fps = 10,
            frames = 10,
            columns = 5,
            rows = 2
        },
        walk = {
            directional = true,
            hotspot = {17, 28},
            fps = 15,
            frames = 30,
            columns = 6,
            rows = 5
        },
        walkload = {
            directional = true,
            hotspot = {17, 31},
            fps = 15,
            frames = 30,
            columns = 6,
            rows = 5
        },
    },
}

pop_textdomain()
