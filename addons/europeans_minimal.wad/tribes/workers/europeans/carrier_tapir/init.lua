push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/amazons/tapir/"

wl.Descriptions():new_carrier_type {
    name = "europeans_carrier_tapir",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Tapir"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    ware_hotspot = {0, 18},

    animation_directory = dirname,
    spritesheets = {
        walkload = {
            basename = "walk",
            fps = 10,
            frames = 10,
            columns = 5,
            rows = 2,
            directional = true,
            hotspot = {20, 20}
        },
        walk = {
            fps = 10,
            frames = 10,
            columns = 5,
            rows = 2,
            directional = true,
            hotspot = {20, 20}
        },
        idle = {
            fps = 10,
            frames = 10,
            columns = 5,
            rows = 2,
            hotspot = {14, 22}
        },
    },
}

pop_textdomain()
