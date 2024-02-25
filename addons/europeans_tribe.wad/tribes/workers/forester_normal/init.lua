push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_forester_normal",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Normal Forester"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 36,
    becomes = "europeans_forester_advanced",

    programs = {
        check_space = {
            "findspace=size:any radius:8 avoid:field saplingsearches:8"
        },
        plant_cotton = {
            "findspace=size:any radius:8 avoid:field saplingsearches:8",
            "walk=coords",
            "animate=dig duration:3s",
            "animate=planting duration:2s",
            "plant=attrib:seed_cotton",
            "animate=water duration:2s",
            "return"
        },
        plant_reed = {
            "findspace=size:any radius:8 avoid:field saplingsearches:8",
            "walk=coords",
            "animate=dig duration:3s",
            "animate=planting duration:2s",
            "plant=attrib:seed_reed",
            "animate=water duration:2s",
            "return"
        },
        plant_rubber = {
            "findspace=size:any radius:8 avoid:field saplingsearches:8",
            "walk=coords",
            "animate=dig duration:3s",
            "animate=planting duration:2s",
            "plant=attrib:tree_rubber_sapling",
            "animate=water duration:2s",
            "return"
        },
        plant_tree = {
            "findspace=size:any radius:8 avoid:field saplingsearches:8",
            "walk=coords",
            "animate=dig duration:3s",
            "animate=planting duration:2s",
            "plant=attrib:tree_sapling",
            "animate=water duration:2s",
            "return"
        },
        check_pond_water = {
            "findobject=attrib:pond_water radius:8",
        },
        terraform_pond_water = {
            "findobject=attrib:pond_water radius:8",
            "walk=object",
            "animate=dig duration:2s",
            "callobject=remove_pond",
            "animate=dig duration:2s",
            "terraform=amazons",
            "animate=dig duration:1s",
            "callobject=remove_pond",
            "animate=planting duration:2s",
            "plant=attrib:tree_sapling",
            "return"
        },
        check_pond_dry = {
            "findobject=attrib:pond_dry radius:8",
        },
        terraform_pond_dry = {
            "findobject=attrib:pond_dry radius:8",
            "walk=object",
            "animate=planting duration:3s",
            "callobject=remove_pond",
            "animate=dig duration:3s",
            "plant=attrib:tree_sapling",
            "return"
        },
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 8, 23 },
        },
    },
    spritesheets = {
        dig = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 5, 23 }
        },
        planting = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 17, 21 }
        },
        water = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 18, 25 }
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
