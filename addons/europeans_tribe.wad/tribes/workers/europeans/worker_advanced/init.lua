push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/empire/smelter/"

wl.Descriptions():new_worker_type {
    name = "europeans_worker_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Worker"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 4, 23 }
        },
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 18, 25 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 22 }
        },
    }
}

pop_textdomain()
