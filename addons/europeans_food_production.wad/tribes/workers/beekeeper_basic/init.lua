push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_beekeeper_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Basic Beekeeper"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 24,
    becomes = "europeans_beekeeper_normal",
    
    buildcost = {
        europeans_carrier = 1,
        coin_copper = 1,
        buckets = 1
    },

    programs = {
        check_flower = {
            "findobject=attrib:flowering radius:6",
        },
        bees = {
            "findobject=attrib:flowering radius:6",
            "walk=object",
            "animate=beeswarm duration:12s",
            "createware=honey",
            "return"
        }
    },

    ware_hotspot = {0, 20},
    
    animation_directory = dirname,
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
