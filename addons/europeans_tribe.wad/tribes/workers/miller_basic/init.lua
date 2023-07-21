push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_miller_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Miller"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 24,
    becomes = "europeans_miller_normal",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 4, 22 }
        },
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 22 }
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