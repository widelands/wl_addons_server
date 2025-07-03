push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/barbarians/ranger/"

wl.Descriptions():new_worker_type {
    name = "europeans_forester",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Forester"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 48,
    becomes = "europeans_gardener_advanced",
    
    buildcost = {
        europeans_carrier = 1
    },  
    
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
            "return"
        },
        plant_balsa_tree = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12",
            "walk=coords",
            "animate=dig duration:1s",
            "animate=plant duration:1s",
            "plant=attrib:balsa_tree_sapling",
            "animate=water duration:1s",
            "return"
        },
        plant_ironwood_tree = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12",
            "walk=coords",
            "animate=dig duration:1s",
            "animate=plant duration:1s",
            "plant=attrib:ironwood_tree_sapling",
            "animate=water duration:1s",
            "return"
        },
        plant_liana_tree = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12",
            "walk=coords",
            "animate=dig duration:1s",
            "animate=plant duration:1s",
            "plant=attrib:liana_tree_sapling",
            "animate=water duration:1s",
            "return"
        },
        plant_rubber_tree = {
            "findspace=size:any radius:8 avoid:field saplingsearches:12",
            "walk=coords",
            "animate=dig duration:1s",
            "animate=plant duration:1s",
            "plant=attrib:rubber_tree_sapling",
            "animate=water duration:1s",
            "return"
        },
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 8, 23 }
        },
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
