push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_farmer_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Farmer"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    programs = {
        plant_barley = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_barley",
            "animate=planting duration:4s",
            "return"
        },
        plant_berrybush = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_berrybush",
            "animate=planting duration:4s",
            "return"
        },
        plant_blackroot = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_blackroot",
            "animate=planting duration:4s",
            "return"
        },
        plant_corn = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_corn",
            "animate=planting duration:4s",
            "return"
        },
        plant_grape = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_grapes",
            "animate=planting duration:4s",
            "return"
        },
        plant_reed = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=planting duration:2s",
            "plant=attrib:seed_reed",
            "animate=planting duration:2s",
            "return"
        },
        plant_rye = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_rye",
            "animate=planting duration:4s",
            "return"
        },
        plant_wheat = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_wheat",
            "animate=planting duration:4s",
            "return"
        },
        harvest_barley = {
            "findobject=attrib:ripe_barley radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=barley",
            "return"
        },
        harvest_berrybush = {
            "findobject=attrib:ripe_bush radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=fruit",
            "return"
        },
        harvest_blackroot = {
            "findobject=attrib:ripe_blackroot radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=blackroot",
            "return"
        },
        harvest_corn = {
            "findobject=attrib:ripe_corn radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=corn",
            "return"
        },
        harvest_grape = {
            "findobject=attrib:ripe_grapes radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=grape",
            "return"
        },
        harvest_reed = {
            "findobject=attrib:ripe_reed radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=reed",
            "return"
        },
        harvest_rye = {
            "findobject=attrib:ripe_rye radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=rye",
            "return"
        },
        harvest_wheat = {
            "findobject=attrib:ripe_wheat radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=wheat",
            "return"
        }
    },
    
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
