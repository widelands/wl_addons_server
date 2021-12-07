push_textdomain("tribes")

dirname = path.dirname (__file__)

descriptions:new_carrier_type {
    name = "europeans_carrier_reindeer",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Reindeer"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    ware_hotspot = {0, 18},

    spritesheets = {
        walkload = {
            basename = "walk",
            fps = 20,
            frames = 20,
            columns = 5,
            rows = 4,
            directional = true,
            hotspot = {15, 31}
        },
        walk = {
            basename = "walk",
            fps = 20,
            frames = 20,
            columns = 5,
            rows = 4,
            directional = true,
            hotspot = {15, 31}
        },
        idle = {
            basename = "idle",
            fps = 20,
            frames = 20,
            columns = 5,
            rows = 4,
            hotspot = {22, 15}
        },
    }
}

pop_textdomain()
