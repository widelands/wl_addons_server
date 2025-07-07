push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/frisians/carrier/"

wl.Descriptions():new_worker_type {
    name = "europeans_worker_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Worker"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 36,
    becomes = "europeans_worker_advanced",
    
    buildcost = {
        europeans_carrier = 1
    },    
    
    programs = {
        fetch_water = {
            "findspace=size:swim radius:6",
            "walk=coords",
            "animate=fetch_water duration:1s",
            "createware=water",
            "return"
        }
    },

    animation_directory = dirname,
    ware_hotspot = {0, 20},
    spritesheets = {
        walk = {
            fps = 15,
            frames = 10,
            columns = 5,
            rows = 2,
            directional = true,
            hotspot = {10, 23}
        },
        walkload = {
            fps = 15,
            frames = 10,
            columns = 5,
            rows = 2,
            directional = true,
            hotspot = {10, 26}
        },
        idle = {
            fps = 10,
            frames = 124,
            columns = 14,
            rows = 9,
            hotspot = {17, 18}
        },
        fetch_water = {
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
