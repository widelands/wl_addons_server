push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname (__file__)

descriptions:new_worker_type {
    name = "europeans_beekeeper_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Advanced Beekeeper"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    programs = {
        bees = {
            "findobject=attrib:flowering radius:10",
            "walk=object",
            "animate=beeswarm duration:12s",
            "createware=honey",
            "return"
        }
    },

    ware_hotspot = {0, 20},
    
    animations = {
        idle = {
            basename = "idle",
            hotspot = {8, 23}
        },
    },
    spritesheets = {
        walk = {
            basename = "walk",
            fps = 15,
            frames = 10,
            columns = 5,
            rows = 2,
            directional = true,
            hotspot = {11, 24}
        },
        walkload = {
            basename = "walkload",
            fps = 15,
            frames = 10,
            columns = 5,
            rows = 2,
            directional = true,
            hotspot = {10, 26}
        },
        beeswarm = {
            basename = "beeswarm",
            fps = 50,
            frames = 100,
            columns = 5,
            rows = 20,
            hotspot = {26, 31}
        },
    }
}

pop_textdomain()
