push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_baker_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Baker"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    animations = {
        idle = {
            hotspot = { 5, 26 }
        },
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 14, 26 }
        },
        walkload = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 8, 26 }
        },
    }
}

pop_textdomain()
