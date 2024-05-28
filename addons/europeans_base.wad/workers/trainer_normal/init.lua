push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_trainer_normal",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Normal Trainer"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 48,
    becomes = "europeans_trainer_advanced",
    
    buildcost = {
        europeans_recruit = 1,
        armor = 1
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 11, 21 }
        },
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 14, 21 }
        },
        walkload = {
            basename = "walk",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 14, 21 }
        },
    }
}

pop_textdomain()
