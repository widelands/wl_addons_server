push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_stonemason_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Stonemason"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    buildcost = { europeans_stonecutter_advanced = 1, shovel = 1 },
        
    spritesheets = {
        idle = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 9, 23 }
        },
        hacking = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 8, 23 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 9, 22 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 25 }
        },
    }
}

pop_textdomain()
