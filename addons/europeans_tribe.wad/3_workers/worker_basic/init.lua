push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/workers/barbarians/smelter/"

wl.Descriptions():new_worker_type {
    name = "europeans_worker_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Worker"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 48,
    becomes = "europeans_worker_advanced",
    
    buildcost = {
        europeans_carrier = 1
    },    

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 5, 18 }
        }
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 15, 21 }
        },
        walkload = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 9, 21 }
        },
    }
}

pop_textdomain()
