push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/workers/empire/forester/"

wl.Descriptions():new_worker_type {
    name = "europeans_terraformer",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Terraformer"),
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
            "animate=plant duration:1s",
            "plant=attrib:tree_sapling",
            "animate=water duration:1s",
            "terraform=amazons",
            "return"
        },
        plant_balsa_tree = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12",
            "walk=coords",
            "animate=dig duration:1s",
            "animate=plant duration:1s",
            "plant=attrib:balsa_tree_sapling",
            "animate=water duration:1s",
            "terraform=amazons",
            "return"
        },
        plant_ironwood_tree = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12",
            "walk=coords",
            "animate=dig duration:1s",
            "animate=plant duration:1s",
            "plant=attrib:ironwood_tree_sapling",
            "animate=water duration:1s",
            "terraform=amazons",
            "return"
        },
        plant_rubber_tree = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12",
            "walk=coords",
            "animate=dig duration:1s",
            "animate=plant duration:1s",
            "plant=attrib:rubber_tree_sapling",
            "animate=water duration:1s",
            "terraform=amazons",
            "return"
        },
        check_fields = {
            "findobject=attrib:field radius:8"
        },
        check_growable_trees = {
            "findobject=attrib:growable radius:8"
        },
        watering = {
            "findobject=attrib:growable radius:8",
            "walk=object",
            "animate=water duration:2s",
            "terraform=amazons",
            "callobject=grow",
            "return"
        },
        check_dike = {
            "findspace=size:swim radius:8",
        },
        dike = {
            "findspace=size:swim radius:8",
            "walk=coords",
            "animate=dig duration:4s",
            "terraform=diking",
            "return"
        }
    },

    ware_hotspot = {0, 20},
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = {8, 23}
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
        plant = {
            basename = "planting",
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
