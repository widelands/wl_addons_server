push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_gardener_normal",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Normal Gardener"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 36,
    becomes = "europeans_gardener_advanced",

    programs = {
        check_dig_space = {
            "findspace=size:any radius:6 avoid:field",
        },
        check_pond_dry = {
            "findobject=attrib:pond_dry radius:6",
        },
        check_pond_water = {
            "findobject=attrib:pond_water radius:6",
        },
        check_fields = {
            "findobject=attrib:field radius:6"
        },
        dig = {
            "findspace=size:any radius:6 avoid:field",
            "walk=coords",
            "animate=dig duration:2s",
            "plant=attrib:pond_dry",
            "return"
        },
        fill_pond_dry = {
            "findobject=attrib:pond_dry radius:6",
            "walk=object",
            "animate=water duration:2s",
            "callobject=fill_pond",
            "animate=water duration:1s",
            "return"
        },
        plant_cotton = {
            "findobject=attrib:pond_water radius:6",
            "walk=object",
            "animate=plant duration:2s",
            "callobject=plant_cotton_in_pond",
            "animate=water duration:1s",
            "return"
        },
        plant_reed = {
            "findobject=attrib:pond_water radius:6",
            "walk=object",
            "animate=plant duration:2s",
            "callobject=plant_reed_in_pond",
            "animate=water duration:1s",
            "return"
        },
        harvest_cotton = {
            "findobject=attrib:ripe_cotton radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=idle duration:2s",
            "callobject=harvest",
            "animate=idle duration:1s",
            "createware=cotton",
            "return"
        },
        harvest_reed = {
            "findobject=attrib:ripe_reed radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=idle duration:2s",
            "callobject=harvest",
            "animate=idle duration:1s",
            "createware=reed",
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
            hotspot = { 17, 21 }
        },
        water = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 18, 25 }
        },
    }
}

pop_textdomain()
