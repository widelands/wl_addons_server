push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_stonemason_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Stonemason"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    buildcost = { europeans_stonecutter_basic = 1 },

    experience = 16,
    becomes = "europeans_stonemason_normal",

    animations = {
        idle = {
            hotspot = { 6, 16 },
        }
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 9, 17 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 7, 19 }
        },
        hack = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 6, 17 }
        }
    }
}

pop_textdomain()
