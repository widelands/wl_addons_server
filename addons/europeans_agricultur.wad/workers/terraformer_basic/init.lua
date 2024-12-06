push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_terraformer_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Basic Terraformer"),
    icon = dirname .. "menu.png",  
    vision_range = 2,
    
    experience = 72,
    becomes = "europeans_terraformer_advanced",
    
    buildcost = {
        europeans_gardener_basic = 1
    },  
    
    programs = {
        check_dike = {
            "findspace=size:swim radius:4",
        },
        dike = {
            "findspace=size:swim radius:4",
            "walk=coords",
            "animate=dig duration:4s",
            "terraform=diking",
            "return"
        },
        check_dig_space = {
            "findspace=size:any radius:4 avoid:field avoid:tree space",
        },
        dig_pond = {
            "findspace=size:any radius:4 avoid:field avoid:tree space",
            "walk=coords",
            "animate=dig duration:3s",
            "plant=attrib:pond_dry",
            "return"
        },
        check_pond_dry = {
            "findobject=attrib:pond_dry radius:4",
        },
        fill_pond_dry = {
            "findobject=attrib:pond_dry radius:4",
            "walk=object",
            "animate=water duration:2s",
            "callobject=fill_pond",
            "animate=water duration:2s",
            "terraform=amazons",
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
        water = {
            basename = "water",
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 18, 23 }
        },
    }
}

pop_textdomain()
