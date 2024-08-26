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
        europeans_carrier = 1,
        shovel = 1,
        buckets = 1
    },  
    
    programs = {
        check_land = {
            "findspace=size:any radius:4",
        },
        terraform_land = {
            "findspace=size:any radius:4",
            "walk=coords",
            "animate=dig duration:4s",
            "terraform=amazons",
            "return"
        },
        check_dike = {
            "findspace=size:swim radius:4 terraform:diking",
        },
        dike = {
            "findspace=size:swim radius:4 terraform:diking",
            "walk=coords",
            "animate=dig duration:4s",
            "terraform=diking",
            "return"
        },
        check_terraform_coast = {
            "findspace=size:swim radius:8 terraform:diking",
        },
        terraform_coast = {
            "findspace=size:swim radius:8 terraform:diking",
            "walk=coords",
            "animate=dig duration:2s",
            "terraform=diking",
            "animate=dig duration:2s",
            "terraform=amazons",
            "animate=dig duration:2s",
            "return"
        },
        check_dig_space = {
            "findspace=size:any radius:8 avoid:field",
        },
        dig_pond = {
            "findspace=size:any radius:8 avoid:field",
            "walk=coords",
            "animate=dig duration:2s",
            "terraform=amazons",
            "animate=dig duration:2s",
            "plant=attrib:pond_dry",
            "return"
        },
        check_pond_dry = {
            "findobject=attrib:pond_dry radius:8",
        },
        fill_pond_dry = {
            "findobject=attrib:pond_dry radius:8",
            "walk=object",
            "animate=water duration:3s",
            "callobject=fill_pond",
            "animate=water duration:1s",
            "return"
        },
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
