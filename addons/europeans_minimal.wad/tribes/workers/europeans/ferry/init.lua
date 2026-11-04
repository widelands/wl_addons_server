push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/atlanteans/ferry/"

wl.Descriptions():new_ferry_type {
    name = "europeans_ferry",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Ferry"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    animation_directory = dirname,
    spritesheets = {
        idle = {
            hotspot = {22, 22},
            fps = 10,
            columns = 5,
            rows = 8,
            frames = 39,
        },
        walk = {
            basename = "sail",
            directional = true,
            hotspot = {22, 22},
            fps = 10,
            columns = 5,
            rows = 8,
            frames = 40,
        },
        walkload = {
            basename = "sail",
            directional = true,
            hotspot = {22, 22},
            fps = 10,
            columns = 5,
            rows = 8,
            frames = 40,
        }
    }
}

pop_textdomain()
