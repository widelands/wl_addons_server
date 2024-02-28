push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_gardener_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Advanced Gardener"),
    icon = dirname .. "menu.png",  
    vision_range = 2,
    
    programs = {
        check_dig = {
            "findspace=size:any radius:10 avoid:field",
        },
        dig = {
            "findspace=size:any radius:10 avoid:field",
            "walk=coords",
            "animate=dig duration:1s",
            "plant=attrib:pond_dry",
            "return"
        },
        check_pond_dry = {
            "findobject=attrib:pond_dry radius:10",
        },
        terraform_pond_dry = {
            "findobject=attrib:pond_dry radius:10",
            "walk=object",
            "animate=water duration:1s",
            "callobject=fill_pond",
            "animate=water duration:1s",
            "return"
        },
        check_pond_water = {
            "findobject=attrib:pond_water radius:10",
        },
        plant_cotton = {
            "findobject=attrib:pond_water radius:10",
            "walk=object",
            "animate=plant duration:1s",
            "callobject=plant_cotton_in_pond",
            "animate=plant duration:1s",
            "return"
        },
        plant_reed = {
            "findobject=attrib:pond_water radius:10",
            "walk=object",
            "animate=plant duration:1s",
            "callobject=plant_reed_in_pond",
            "animate=plant duration:1s",
            "return"
        },
        harvest_cotton = {
            "findobject=attrib:ripe_cotton radius:10",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=idle duration:1s",
            "callobject=harvest",
            "animate=idle duration:1s",
            "createware=cotton",
            "return"
        },
        harvest_reed = {
            "findobject=attrib:ripe_reed radius:10",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=idle duration:1s",
            "callobject=harvest",
            "animate=idle duration:1s",
            "createware=reed",
            "return"
        },
        check_land = {
            "findspace=size:any radius:12 terraform:amazons",
        },
        plant_terraformed_land = {
            "findspace=size:any radius:12 terraform:amazons",
            "walk=coords",
            "animate=dig duration:2s",
            "terraform=amazons",
            "animate=dig duration:2s",
            "animate=plant duration:1s",
            "plant=attrib:tree_sapling",
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
        plant = {
            basename = "planting",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 18, 23 }
        },
        water = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 18, 26 }
        },
    }
}

pop_textdomain()
