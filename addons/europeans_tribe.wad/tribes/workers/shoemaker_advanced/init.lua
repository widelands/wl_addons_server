push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_shoemaker_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Shoemaker"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 8, 24 }
        },
    },
    spritesheets = {
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
    }
}

pop_textdomain()
