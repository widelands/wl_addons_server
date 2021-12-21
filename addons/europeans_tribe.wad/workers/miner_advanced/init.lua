push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_miner_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Miner"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    animations = {
        idle = {
            hotspot = { 7, 22 }
        },
    },
    spritesheets ={
        walk = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 11, 22 }
        },
        walkload = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 10, 22 }
        },
    },
}

pop_textdomain()
