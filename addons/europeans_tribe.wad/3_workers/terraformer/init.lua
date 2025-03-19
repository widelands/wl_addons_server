push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_terraformer",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Terraformer"),
    icon = dirname .. "menu.png",  
    vision_range = 2,
    
    buildcost = {
        europeans_worker_advanced = 1
    },  
    
    programs = {
        check_space = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12"
        },
        plant_tree = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12",
            "walk=coords",
            "animate=dig duration:1s",
            "animate=plant duration:1s",
            "plant=attrib:tree_sapling",
            "animate=water duration:1s",
            "terraform=amazons",
            "return"
        },
        plant_rubber_tree = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12",
            "walk=coords",
            "animate=dig duration:1s",
            "animate=plant duration:1s",
            "plant=attrib:rubber_tree_sapling",
            "animate=water duration:1s",
            "terraform=amazons",
            "return"
        },
        check_fields = {
            "findobject=attrib:field radius:8"
        },
        check_growable_trees = {
            "findobject=attrib:growable radius:8"
        },
        watering = {
            "findobject=attrib:growable radius:8",
            "walk=object",
            "animate=water duration:2s",
            "terraform=amazons",
            "callobject=grow",
            "return"
        },
        check_dike = {
            "findspace=size:swim radius:8",
        },
        dike = {
            "findspace=size:swim radius:8",
            "walk=coords",
            "animate=dig duration:4s",
            "terraform=diking",
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
        dig = {
            fps = 20,
            frames = 10,
            columns = 5,
            rows = 2,
            hotspot = {15, 20}
        },
        plant = {
            fps = 10,
            frames = 10,
            columns = 5,
            rows = 2,
            hotspot = {15, 18}
        },
        water = {
            fps = 10,
            frames = 10,
            columns = 5,
            rows = 2,
            hotspot = {14, 20}
        },
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
    }
}

pop_textdomain()
