push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_gardener_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Basic Gardener"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 48,
    becomes = "europeans_gardener_advanced",
    
    buildcost = {
        europeans_carrier = 1
    },

    programs = {
        check_space = {
            "findspace=size:any radius:3 avoid:field",
        },
        check_dig_space = {
            "findspace=size:any radius:3 avoid:field",
        },
        check_pond_dry = {
            "findobject=attrib:pond_dry radius:3",
        },
        check_pond_water = {
            "findobject=attrib:pond_water radius:3",
        },
        check_fields = {
            "findobject=attrib:field radius:3"
        },
        dig = {
            "findspace=size:any radius:3 avoid:field",
            "walk=coords",
            "animate=dig duration:3s",
            "plant=attrib:pond_dry",
            "return"
        },
        fill_pond_dry = {
            "findobject=attrib:pond_dry radius:3",
            "walk=object",
            "animate=water duration:3s",
            "callobject=fill_pond",
            "animate=water duration:1s",
            "return"
        },
        plant_cotton = {
            "findobject=attrib:pond_water radius:3",
            "walk=object",
            "animate=plant duration:3s",
            "callobject=plant_cotton_in_pond",
            "animate=water duration:1s",
            "return"
        },
        plant_reed = {
            "findobject=attrib:pond_water radius:3",
            "walk=object",
            "animate=plant duration:3s",
            "callobject=plant_reed_in_pond",
            "animate=water duration:1s",
            "return"
        },
        harvest_reed = {
            "findobject=attrib:ripe_reed radius:3",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:3s",
            "callobject=harvest",
            "animate=gathering duration:1s",
            "createware=reed",
            "return"
        },
        harvest_cotton = {
            "findobject=attrib:ripe_cotton radius:3",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:3s",
            "callobject=harvest",
            "animate=gathering duration:1s",
            "createware=cotton",
            "return"
        },
        check_flower = {
            "findobject=attrib:flowering radius:4",
        },
        bees = {
            "findobject=attrib:flowering radius:4",
            "walk=object",
            "animate=beeswarm duration:6s",
            "createware=honey",
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
        beeswarm = {
            basename = "plant",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 16, 20 }
        },
        dig = {
            basename = "dig",
            fps = 20,
            frames = 10,
            columns = 5,
            rows = 2,
            hotspot = {15, 20}
        },
        gathering = {
            basename = "plant",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 16, 20 }
        },
        harvesting = {
            basename = "plant",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 16, 20 }
        },
        plant = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 16, 20 }
        },
        planting = {
            basename = "plant",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 16, 20 }
        },
        water = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 18, 23 }
        },
    }
}

pop_textdomain()
