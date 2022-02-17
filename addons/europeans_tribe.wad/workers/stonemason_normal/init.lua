push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_stonemason_normal",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Normal Stonemason"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    buildcost = { europeans_stonecutter_normal = 1 },

    experience = 24,
    becomes = "europeans_stonemason_advanced",
    
    animations = {
        idle = {
            hotspot = { 7, 20 }
        },
    },
    spritesheets = {
        hacking = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 10, 19 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 21 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 23 }
        },
    }
}

pop_textdomain()
