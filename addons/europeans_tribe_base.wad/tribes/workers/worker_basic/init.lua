push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_worker_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Worker"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 24,
    becomes = "europeans_worker_normal",
    
    buildcost = {
        europeans_carrier = 1,
        coin_copper = 1,
        hammer = 1,
        fire_tongs = 1,
        saw = 1,
        needles = 1
    },    

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 6, 28 },
        }
    },
    spritesheets = {
        walk = {
            fps = 15,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 11, 24 }
        }
    }
}

pop_textdomain()
