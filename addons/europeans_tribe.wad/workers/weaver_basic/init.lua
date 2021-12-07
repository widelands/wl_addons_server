push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_weaver_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Weaver"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 24,
    becomes = "europeans_weaver_normal",

    animations = {
        idle = {
            hotspot = { 5, 21 }
        }
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 7, 22 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 11, 27 }
        }
    }
}

pop_textdomain()
