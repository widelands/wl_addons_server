push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_farmer_normal",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Normal Farmer"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 36,
    becomes = "europeans_farmer_advanced",

    programs = {
        check_space = {
            "findspace=size:any radius:6 space"
        },
        check_fields = {
            "findobject=attrib:field radius:6"
        },
        check_flower = {
            "findobject=attrib:flowering radius:6",
        },
        bees = {
            "findobject=attrib:flowering radius:6",
            "walk=object",
            "animate=beeswarm duration:5s",
            "createware=honey",
            "return"
        },
        plant_barley = {
            "findspace=size:any radius:6 space",
            "walk=coords",
            "animate=planting duration:5s",
            "plant=attrib:seed_barley",
            "animate=planting duration:5s",
            "return"
        },
        plant_berrybush = {
            "findspace=size:any radius:6 space",
            "walk=coords",
            "animate=planting duration:5s",
            "plant=attrib:seed_berrybush",
            "animate=planting duration:5s",
            "return"
        },
        plant_blackroot = {
            "findspace=size:any radius:6 space",
            "walk=coords",
            "animate=planting duration:5s",
            "plant=attrib:seed_blackroot",
            "animate=planting duration:5s",
            "return"
        },
        plant_corn = {
            "findspace=size:any radius:6 space",
            "walk=coords",
            "animate=planting duration:5s",
            "plant=attrib:seed_corn",
            "animate=planting duration:5s",
            "return"
        },
        plant_cotton = {
            "findspace=size:any radius:6 space",
            "walk=coords",
            "animate=planting duration:5s",
            "plant=attrib:seed_cotton",
            "animate=planting duration:5s",
            "return"
        },
        plant_grape = {
            "findspace=size:any radius:6 space",
            "walk=coords",
            "animate=planting duration:5s",
            "plant=attrib:seed_grapes",
            "animate=planting duration:5s",
            "return"
        },
        plant_reed = {
            "findspace=size:any radius:6 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_reed",
            "animate=planting duration:4s",
            "return"
        },
        plant_rubber = {
            "findspace=size:any radius:6 space",
            "walk=coords",
            "animate=planting duration:5s",
            "plant=attrib:rubber_tree_sapling",
            "animate=planting duration:5s",
            "return"
        },
        plant_rye = {
            "findspace=size:any radius:6 space",
            "walk=coords",
            "animate=planting duration:5s",
            "plant=attrib:seed_rye",
            "animate=planting duration:5s",
            "return"
        },
        plant_wheat = {
            "findspace=size:any radius:6 space",
            "walk=coords",
            "animate=planting duration:5s",
            "plant=attrib:seed_wheat",
            "animate=planting duration:5s",
            "return"
        },
        harvest_barley = {
            "findobject=attrib:ripe_barley radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:5s",
            "callobject=harvest",
            "animate=gathering duration:4s",
            "createware=barley",
            "return"
        },
        harvest_berrybush = {
            "findobject=attrib:ripe_bush radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:5s",
            "callobject=harvest",
            "animate=gathering duration:4s",
            "createware=fruit",
            "return"
        },
        harvest_blackroot = {
            "findobject=attrib:ripe_blackroot radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:5s",
            "callobject=harvest",
            "animate=gathering duration:4s",
            "createware=blackroot",
            "return"
        },
        harvest_corn = {
            "findobject=attrib:ripe_corn radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:5s",
            "callobject=harvest",
            "animate=gathering duration:4s",
            "createware=corn",
            "return"
        },
        harvest_cotton = {
            "findobject=attrib:ripe_cotton radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:5s",
            "callobject=harvest",
            "animate=gathering duration:4s",
            "createware=cotton",
            "return"
        },
        harvest_grape = {
            "findobject=attrib:ripe_grapes radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:5s",
            "callobject=harvest",
            "animate=gathering duration:4s",
            "createware=grape",
            "return"
        },
        harvest_reed = {
            "findobject=attrib:ripe_reed radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:5s",
            "callobject=harvest",
            "animate=gathering duration:4s",
            "createware=reed",
            "return"
        },
        harvest_rubber = {
            "findobject=attrib:rubber_tree_mature radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:5s",
            "callobject=harvest",
            "animate=gathering duration:4s",
            "createware=rubber",
            "return"
        },
        harvest_rye = {
            "findobject=attrib:ripe_rye radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:5s",
            "callobject=harvest",
            "animate=gathering duration:4s",
            "createware=rye",
            "return"
        },
        harvest_wheat = {
            "findobject=attrib:ripe_wheat radius:6",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:5s",
            "callobject=harvest",
            "animate=gathering duration:4s",
            "createware=wheat",
            "return"
        }
    },
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 10, 23 },
        },
    },
    spritesheets = {
        planting = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 13, 32 }
        },
        harvesting = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 18, 32 }
        },
        gathering = {
            fps = 5,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 10, 34 }
        },
        beeswarm = {
            basename = "beeswarm",
            fps = 50,
            frames = 100,
            columns = 5,
            rows = 20,
            hotspot = {26, 31}
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 18, 23 }
        },
        walkload = {
            basename = "walk",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 18, 23 }
        },
    }
}

pop_textdomain()
