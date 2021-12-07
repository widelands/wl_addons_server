push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_miller_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Miller"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    animations = {
        idle = {
            hotspot = { 5, 23 }
        },
    },
    spritesheets ={
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 24 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 24 }
        },
    },
}

pop_textdomain()
