push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_farmer_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Farmer"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    programs = {
        check_space = {
            "findspace=size:any radius:7 space"
        },
        plant_berrybush = {
            "findspace=size:any radius:7 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_berrybush",
            "animate=planting duration:4s",
            "return"
        },
        plant_grape = {
            "findspace=size:any radius:7 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_grapes",
            "animate=planting duration:4s",
            "return"
        },
        plant_reed = {
            "findspace=size:any radius:7 space",
            "walk=coords",
            "animate=planting duration:2s",
            "plant=attrib:seed_reed",
            "animate=planting duration:2s",
            "return"
        },
        harvest_berrybush = {
            "findobject=attrib:ripe_bush radius:7",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=fruit",
            "return"
        },
        harvest_grape = {
            "findobject=attrib:ripe_grapes radius:7",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=grape",
            "return"
        },
        harvest_reed = {
            "findobject=attrib:ripe_reed radius:7",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:4s",
            "callobject=harvest",
            "animate=gathering duration:2s",
            "createware=reed",
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
