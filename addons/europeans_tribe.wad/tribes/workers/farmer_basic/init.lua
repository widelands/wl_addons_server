push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_farmer_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Farmer"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 24,
    becomes = "europeans_farmer_normal",

    programs = {
        check_space = {
            "findspace=size:any radius:3 space"
        },
        plant_berrybush = {
            "findspace=size:any radius:3 space",
            "walk=coords",
            "animate=plant duration:6s",
            "plant=attrib:seed_berrybush",
            "animate=plant duration:6s",
            "return"
        },
        plant_grape = {
            "findspace=size:any radius:3 space",
            "walk=coords",
            "animate=plant duration:6s",
            "plant=attrib:seed_grapes",
            "animate=plant duration:6s",
            "return"
        },
        plant_reed = {
            "findspace=size:any radius:3 space",
            "walk=coords",
            "animate=plant duration:6s",
            "plant=attrib:seed_reed",
            "animate=plant duration:6s",
            "return"
        },
        harvest_berrybush = {
            "findobject=attrib:ripe_bush radius:3",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvest duration:6s",
            "callobject=harvest",
            "animate=gather duration:6s",
            "createware=fruit",
            "return"
        },
        harvest_grape = {
            "findobject=attrib:ripe_grapes radius:3",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvest duration:6s",
            "callobject=harvest",
            "animate=gather duration:6s",
            "createware=grape",
            "return"
        },
        harvest_reed = {
            "findobject=attrib:ripe_reed radius:3",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvest duration:6s",
            "callobject=harvest",
            "animate=gather duration:6s",
            "createware=reed",
            "return"
        }
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 8, 17 },
        },
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 14, 18 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 12, 19 }
        },
        plant = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 14, 19 }
        },
        harvest = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 17, 21 }
        },
        gather = {
            fps = 5,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 8, 19 }
        }
    }
}

pop_textdomain()
