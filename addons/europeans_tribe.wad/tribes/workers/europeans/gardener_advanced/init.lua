push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/empire/forester/"

wl.Descriptions():new_worker_type {
    name = "europeans_gardener_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Advanced Gardener"),
    icon = dirname .. "menu.png",  
    vision_range = 2,
    
    programs = {
        check_space = {
            "findspace=size:any radius:6 avoid:field",
        },
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
        check_growable_plants = {
            "findobject=attrib:growable radius:6"
        },
        check_flower = {
            "findobject=attrib:flowering radius:6",
        },
        dig = {
            "findspace=size:any radius:6 avoid:field",
            "walk=coords",
            "animate=dig duration:1s",
            "plant=attrib:pond_dry",
            "return"
        },
        fill_pond_dry = {
            "findobject=attrib:pond_dry radius:6",
            "walk=object",
            "animate=water duration:1s",
            "callobject=fill_pond",
            "animate=water duration:1s",
            "return"
        },
        plant_berrybush = {
            "findspace=size:any radius:6 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_berrybush",
            "animate=planting duration:4s",
            "return"
        },
        plant_cotton = {
            "findobject=attrib:pond_water radius:6",
            "walk=object",
            "animate=plant duration:1s",
            "callobject=plant_cotton_in_pond",
            "animate=plant duration:1s",
            "return"
        },
        plant_grape = {
            "findspace=size:any radius:6 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_grapes",
            "animate=planting duration:4s",
            "return"
        },
        plant_reed = {
            "findobject=attrib:pond_water radius:6",
            "walk=object",
            "animate=plant duration:1s",
            "callobject=plant_reed_in_pond",
            "animate=plant duration:1s",
            "return"
        },
        watering = {
            "findobject=attrib:growable radius:6",
            "walk=object",
            "animate=water duration:2s",
            "callobject=grow",
            "return"
        },
        harvest_berrybush = {
            "findobject=attrib:ripe_bush radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=fruit",
            "return"
        },
        harvest_cotton = {
            "findobject=attrib:ripe_cotton radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:1s",
            "callobject=harvest",
            "animate=gathering duration:1s",
            "createware=cotton",
            "return"
        },
        harvest_grape = {
            "findobject=attrib:ripe_grapes radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=grape",
            "return"
        },
        harvest_reed = {
            "findobject=attrib:ripe_reed radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:1s",
            "callobject=harvest",
            "animate=gathering duration:1s",
            "createware=reed",
            "return"
        },
        check_flower = {
            "findobject=attrib:flowering radius:6",
        },
        bees = {
            "findobject=attrib:flowering radius:6",
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
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 23 }
        },
        walkload = {
            basename = "walk",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 23 }
        },
        beeswarm = {
            basename = "planting",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 18, 23 }
        },
        dig = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 5, 22 }
        },
        gathering = {
            basename = "planting",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 18, 23 }
        },
        harvesting = {
            basename = "planting",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 18, 23 }
        },
        plant = {
            basename = "planting",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 18, 23 }
        },
        planting = {
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
