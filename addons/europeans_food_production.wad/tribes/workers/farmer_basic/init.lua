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
    
    buildcost = {
        europeans_carrier = 1,
        scythe = 1,
        basket = 1,
        shovel = 1,
        buckets = 1
    },

    programs = {
        check_space = {
            "findspace=size:any radius:4 space"
        },
        check_fields = {
            "findobject=attrib:field radius:4"
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
        plant_barley = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=plant duration:6s",
            "plant=attrib:seed_barley",
            "animate=plant duration:6s",
            "return"
        },
        plant_berrybush = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=plant duration:6s",
            "plant=attrib:seed_berrybush",
            "animate=plant duration:6s",
            "return"
        },
        plant_blackroot = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=plant duration:6s",
            "plant=attrib:seed_blackroot",
            "animate=plant duration:6s",
            "return"
        },
        plant_corn = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=plant duration:6s",
            "plant=attrib:seed_corn",
            "animate=plant duration:6s",
            "return"
        },
        plant_cotton = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=plant duration:6s",
            "plant=attrib:seed_cotton",
            "animate=plant duration:6s",
            "return"
        },
        plant_grape = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=plant duration:6s",
            "plant=attrib:seed_grapes",
            "animate=plant duration:6s",
            "return"
        },
        plant_reed = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=plant duration:6s",
            "plant=attrib:seed_reed",
            "animate=plant duration:6s",
            "return"
        },
        plant_rubber = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=plant duration:6s",
            "plant=attrib:rubber_tree_sapling",
            "animate=plant duration:6s",
            "return"
        },
        plant_rye = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=plant duration:6s",
            "plant=attrib:seed_rye",
            "animate=plant duration:6s",
            "return"
        },
        plant_wheat = {
            "findspace=size:any radius:4 space",
            "walk=coords",
            "animate=plant duration:6s",
            "plant=attrib:seed_wheat",
            "animate=plant duration:6s",
            "return"
        },
        harvest_barley = {
            "findobject=attrib:ripe_barley radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvest duration:6s",
            "callobject=harvest",
            "animate=gather duration:6s",
            "createware=barley",
            "return"
        },
        harvest_berrybush = {
            "findobject=attrib:ripe_bush radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvest duration:6s",
            "callobject=harvest",
            "animate=gather duration:6s",
            "createware=fruit",
            "return"
        },
        harvest_blackroot = {
            "findobject=attrib:ripe_blackroot radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvest duration:6s",
            "callobject=harvest",
            "animate=gather duration:6s",
            "createware=blackroot",
            "return"
        },
        harvest_corn = {
            "findobject=attrib:ripe_corn radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvest duration:6s",
            "callobject=harvest",
            "animate=gather duration:6s",
            "createware=corn",
            "return"
        },
        harvest_cotton = {
            "findobject=attrib:ripe_cotton radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvest duration:6s",
            "callobject=harvest",
            "animate=gather duration:6s",
            "createware=cotton",
            "return"
        },        
        harvest_grape = {
            "findobject=attrib:ripe_grapes radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvest duration:6s",
            "callobject=harvest",
            "animate=gather duration:6s",
            "createware=grape",
            "return"
        },
        harvest_reed = {
            "findobject=attrib:ripe_reed radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvest duration:6s",
            "callobject=harvest",
            "animate=gather duration:6s",
            "createware=reed",
            "return"
        },
        harvest_rubber = {
            "findobject=attrib:rubber_tree_mature radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvest duration:6s",
            "callobject=harvest",
            "animate=gather duration:6s",
            "createware=rubber",
            "return"
        },
        harvest_rye = {
            "findobject=attrib:ripe_rye radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvest duration:6s",
            "callobject=harvest",
            "animate=gather duration:6s",
            "createware=rye",
            "return"
        },
        harvest_wheat = {
            "findobject=attrib:ripe_wheat radius:4",
            "walk=object",
            "playsound=sound/farm/scythe priority:70% allow_multiple",
            "animate=harvest duration:6s",
            "callobject=harvest",
            "animate=gather duration:6s",
            "createware=wheat",
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
    }
}

pop_textdomain()
