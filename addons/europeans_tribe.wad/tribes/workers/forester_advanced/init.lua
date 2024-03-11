push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_forester_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Forester"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    programs = {
        check_space = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12"
        },
        plant_tree = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12",
            "walk=coords",
            "animate=dig duration:1s",
            "animate=planting duration:1s",
            "plant=attrib:tree_sapling",
            "animate=water duration:1s",
            "return"
        },
        plant_tree_land = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12",
            "walk=coords",
            "animate=dig duration:1s",
            "terraform=amazons",
            "animate=planting duration:1s",
            "plant=attrib:tree_sapling",
            "animate=water duration:1s",
            "return"
        },
        plant_rubber_tree = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12",
            "walk=coords",
            "animate=dig duration:1s",
            "animate=planting duration:1s",
            "plant=attrib:rubber_tree_sapling",
            "animate=water duration:1s",
            "return"
        },
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 3, 23 }
        },
    },
    spritesheets = {
        dig = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 5, 22 }
        },
        planting = {
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
    }
}

pop_textdomain()
