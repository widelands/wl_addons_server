push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/empire/donkey/"

wl.Descriptions():new_carrier_type {
    name = "europeans_carrier_donkey",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Donkey"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    ware_hotspot = { -2, 8 },

    animation_directory = dirname,
    spritesheets = {
        idle = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 14, 20 }
        },
        walk = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 14, 25 }
        },
        walkload = {
            basename = "walk",
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 14, 25 }
        },
    }
}

pop_textdomain()
