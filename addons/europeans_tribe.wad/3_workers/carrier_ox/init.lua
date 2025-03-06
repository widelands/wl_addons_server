push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/workers/barbarians/ox/"

wl.Descriptions():new_carrier_type {
    name = "europeans_carrier_ox",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Ox"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    ware_hotspot = { -2, 13 },

    animation_directory = dirname,
    spritesheets = {
        idle = {
            fps = 20,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 10, 25 }
        },
        walk = {
            fps = 20,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 21, 31 }
        },
        walkload = {
            basename = "walk",
            fps = 20,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 21, 31 }
        },
    }
}

pop_textdomain()
