push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/workers/empire/farmer/"

wl.Descriptions():new_worker_type {
    name = "europeans_farmer_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Farmer"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    buildcost = {
        europeans_gardener_advanced = 1
    },  
    
    programs = {
        check_space = {
            "findspace=size:any radius:8 space"
        },
        check_fields = {
            "findobject=attrib:field radius:8"
        },
        check_flower = {
            "findobject=attrib:flowering radius:8",
        },
        check_growable_plants = {
            "findobject=attrib:growable radius:8"
        },
        bees = {
            "findobject=attrib:flowering radius:8",
            "walk=object",
            "animate=beeswarm duration:4s",
            "createware=honey",
            "return"
        },
        watering = {
            "findobject=attrib:growable radius:8",
            "walk=object",
            "animate=water duration:2s",
            "callobject=grow",
            "return"
        },
        plant_barley = {
            "findspace=size:any radius:8 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_barley",
            "animate=planting duration:4s",
            "return"
        },
        plant_berrybush = {
            "findspace=size:any radius:8 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_berrybush",
            "animate=planting duration:4s",
            "return"
        },
        plant_corn = {
            "findspace=size:any radius:8 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_corn",
            "animate=planting duration:4s",
            "return"
        },
        plant_cotton = {
            "findspace=size:any radius:8 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_cotton",
            "animate=planting duration:4s",
            "return"
        },
        plant_grape = {
            "findspace=size:any radius:8 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_grapes",
            "animate=planting duration:4s",
            "return"
        },
        plant_oat = {
            "findspace=size:any radius:8 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_oat",
            "animate=planting duration:4s",
            "return"
        },
        plant_reed = {
            "findspace=size:any radius:8 space",
            "walk=coords",
            "animate=planting duration:2s",
            "plant=attrib:seed_reed",
            "animate=planting duration:2s",
            "return"
        },
        plant_rye = {
            "findspace=size:any radius:8 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_rye",
            "animate=planting duration:4s",
            "return"
        },
        plant_wheat = {
            "findspace=size:any radius:8 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_wheat",
            "animate=planting duration:4s",
            "return"
        },
        harvest_barley = {
            "findobject=attrib:ripe_barley radius:8",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=barley",
            "return"
        },
        harvest_berrybush = {
            "findobject=attrib:ripe_bush radius:8",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=fruit",
            "return"
        },
        harvest_corn = {
            "findobject=attrib:ripe_corn radius:8",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=corn",
            "return"
        },
        harvest_cotton = {
            "findobject=attrib:ripe_cotton radius:8",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=cotton",
            "return"
        },
        harvest_grape = {
            "findobject=attrib:ripe_grapes radius:8",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=grape",
            "return"
        },
        harvest_oat = {
            "findobject=attrib:ripe_oat radius:8",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=oat",
            "return"
        },
        harvest_reed = {
            "findobject=attrib:ripe_reed radius:8",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=reed",
            "return"
        },
        harvest_rye = {
            "findobject=attrib:ripe_rye radius:8",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=rye",
            "return"
        },
        harvest_wheat = {
            "findobject=attrib:ripe_wheat radius:8",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=wheat",
            "return"
        }
    },
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 10, 23 }
        },
    },
    spritesheets = {
        planting = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 14, 25 }
        },
        harvesting = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 19, 24 }
        },
        gathering = {
            fps = 5,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 10, 23 }
        },
        beeswarm = {
            basename = "gathering",
            fps = 5,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 10, 23 }
        },
        water = {
            basename = "planting",
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 14, 25 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 18, 24 }
        },
        walkload = {
            basename = "walk",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 18, 24 }
        },
    },
}

pop_textdomain()
