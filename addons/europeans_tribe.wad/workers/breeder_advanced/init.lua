push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_breeder_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Breeder"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    animations = {
        idle = {
            hotspot = { 16, 29 }
        },
    },
    spritesheets = {
        walk = {
            fps = 20,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 26, 30 }
        },
        walkload = {
            basename = "walk",
            fps = 20,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 26, 30 }
        },
    }
}

pop_textdomain()
