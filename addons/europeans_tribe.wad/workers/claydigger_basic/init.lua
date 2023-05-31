push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_claydigger_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Basic Clay Digger"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 24,
    becomes = "europeans_claydigger_normal",

    programs = {
        check_dike = {
            "findspace=size:swim radius:6 terraform:diking",
        },
        dike = {
            "findspace=size:swim radius:6 terraform:diking",
            "walk=coords",
            "animate=dig duration:4s",
            "terraform=diking",
            "return"
        },
        check_dig = {
            "findspace=size:any radius:6 avoid:field terraform:amazons",
        },
        dig = {
            "findspace=size:any radius:6 avoid:field terraform:amazons",
            "walk=coords",
            "animate=dig duration:4s",
            "plant=attrib:pond_water",
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
        dig = {
            basename = "dig",
            fps = 20,
            frames = 10,
            columns = 5,
            rows = 2,
            hotspot = {15, 20}
        },
    }
}

pop_textdomain()
