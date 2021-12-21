push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_miner_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Miner"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 32,
    becomes = "europeans_miner_normal",

    animations = {
        idle = {
            hotspot = { 5, 24 }
        }
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 25 }
        },
        walkload = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 8, 26 }
        }
    }
}

pop_textdomain()
