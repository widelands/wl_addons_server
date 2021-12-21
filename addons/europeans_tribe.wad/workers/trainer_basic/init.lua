push_textdomain("tribes")

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_trainer_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Trainer"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 32,
    becomes = "europeans_trainer_normal",

    animations = {
        idle = {
            hotspot = { 4, 23 }
        }
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 8, 23 }
        }
    }
}

pop_textdomain()
