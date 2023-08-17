push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_tailor_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Tailor"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 24,
    becomes = "europeans_tailor_normal",
    
    animation_directory = dirname,
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
