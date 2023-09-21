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
            "findspace=size:any radius:5 space"
        },
        plant_cotton = {
            "findspace=size:any radius:5 space",
            "walk=coords",
            "animate=planting duration:5s",
            "plant=attrib:seed_cotton",
            "animate=planting duration:5s",
            "return"
        },
        plant_rubber = {
            "findspace=size:any radius:5 space",
            "walk=coords",
            "animate=planting duration:5s",
            "plant=attrib:tree_rubber_sapling",
            "animate=planting duration:5s",
            "return"
        },
        plant_reed = {
            "findspace=size:any radius:5 space",
            "walk=coords",
            "animate=planting duration:4s",
            "plant=attrib:seed_reed",
            "animate=planting duration:4s",
            "return"
        },
        harvest_cotton = {
            "findobject=attrib:ripe_cotton radius:5",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:5s",
            "callobject=harvest",
            "animate=gathering duration:4s",
            "createware=cotton",
            "return"
        },
        harvest_rubber = {
            "findobject=attrib:tree_rubber_mature radius:5",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:5s",
            "callobject=harvest",
            "animate=gathering duration:4s",
            "createware=rubber",
            "return"
        },
        harvest_reed = {
            "findobject=attrib:ripe_reed radius:5",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvesting duration:5s",
            "callobject=harvest",
            "animate=gathering duration:4s",
            "createware=reed",
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
