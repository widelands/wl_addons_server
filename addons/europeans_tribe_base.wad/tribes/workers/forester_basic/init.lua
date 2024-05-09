push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_forester_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Forester / Ranger"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 24,
    becomes = "europeans_forester_normal",
    
    buildcost = {
        europeans_carrier = 1,
        coin_copper = 1,
        shovel = 1,
        scythe = 1,
        buckets = 1
    },
    
    programs = {
        check_space = {
            "findspace=size:any radius:4 avoid:field saplingsearches:5"
        },
        check_fields = {
            "findobject=attrib:field radius:4"
        },
        check_trees = {
            "findobject=attrib:tree radius:4",
        },
        plant_tree = {
            "findspace=size:any radius:4 avoid:field saplingsearches:5",
            "walk=coords",
            "animate=dig duration:3s",
            "animate=plant duration:2s",
            "plant=attrib:tree_sapling",
            "animate=water duration:2s",
            "return"
        },
        plant_rubber_tree = {
            "findspace=size:any radius:4 avoid:field saplingsearches:5",
            "walk=coords",
            "animate=dig duration:3s",
            "animate=plant duration:2s",
            "plant=attrib:rubber_tree_sapling",
            "animate=water duration:2s",
            "return"
        },
        harvest_rubber = {
            "findobject=attrib:rubber_tree_mature radius:4",
            "walk=object",
            "playsound=sound/woodcutting/fast_woodcutting priority:95% allow_multiple",
            "animate=hack duration:2s",
            "animate=idle duration:2s",
            "createware=rubber",
            "return"
        },
        harvest_tree = {
            "findobject=attrib:tree radius:4",
            "walk=object",
            "playsound=sound/woodcutting/woodcutting priority:100% allow_multiple",
            "animate=hack duration:3s",
            "playsound=sound/woodcutting/tree_falling priority:100%",
            "callobject=fall",
            "animate=idle duration:3s",
            "createware=log",
            "return"
        }
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 11, 20 }
        }
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 11, 20 }
        },
        dig = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 12, 22 }
        },
        hack = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 19, 15 }
        },
        plant = {
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
