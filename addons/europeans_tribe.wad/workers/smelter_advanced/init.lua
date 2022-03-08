push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_smelter_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Smelter"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    buildcost = { europeans_geologist = 1, fire_tongs = 1, buckets = 1, shovel = 1 },
    
    animations = {
        idle = {
            hotspot = { 4, 23 }
        },
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 18, 25 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 22 }
        },
    }
}

pop_textdomain()
