push_textdomain("tribes")

dirname = path.dirname (__file__)

descriptions:new_worker_type {
    name = "europeans_terraformer_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Basic Terraformer"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",  
    vision_range = 2,
    
    experience = 64,
    becomes = "europeans_terraformer_normal",
    
    programs = {
        check_terraform_coast = {
            "findspace=size:swim radius:8 terraform:diking",
        },
        terraform_coast = {
            "findspace=size:swim radius:8 terraform:diking",
            "walk=coords",
            "animate=dig duration:2s",
            "terraform=diking",
            "animate=dig duration:2s",
            "return"
        },
        check_terraform_land = {
            "findspace=size:any radius:8 terraform:amazons",
        },
        terraform_land = {
            "findspace=size:any radius:8 terraform:amazons",
            "walk=coords",
            "animate=dig duration:2s",
            "terraform=amazons",
            "animate=dig duration:2s",
            "return"
        },
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
