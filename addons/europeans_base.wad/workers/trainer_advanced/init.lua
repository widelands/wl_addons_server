push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_trainer_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Trainer"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    buildcost = {
        europeans_recruit = 1,
        armor = 1,
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 6, 23 }
        },
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 9, 23 }
        },
        walkload = {
            basename = "walk",
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 9, 23 }
        },
    }
}

pop_textdomain()
