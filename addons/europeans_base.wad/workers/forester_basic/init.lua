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
        shovel = 1,
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
