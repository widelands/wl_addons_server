push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/workers/frisians/reindeer/"

wl.Descriptions():new_carrier_type {
    name = "europeans_carrier_reindeer",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Reindeer"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    ware_hotspot = {0, 18},

    animation_directory = dirname,
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
