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
            "findspace=size:any radius:12 avoid:field saplingsearches:12"
        },
        plant = {
            "findspace=size:any radius:12 avoid:field saplingsearches:12",
            "walk=coords",
            "animate=dig duration:2s500ms",
            "animate=planting duration:1s500ms",
            "plant=attrib:tree_sapling",
            "animate=water duration:1s",
            "return"
        },
        check_land = {
            "findspace=size:any radius:12 terraform:amazons",
        },
        plant_terraformed_land = {
            "findspace=size:any radius:12 terraform:amazons",
            "walk=coords",
            "animate=dig duration:2s",
            "terraform=amazons",
            "animate=dig duration:2s",
            "animate=planting duration:1s",
            "plant=attrib:tree_sapling",
            "return"
        },
        check_pond_water = {
            "findobject=attrib:pond_water radius:12",
        },
        terraform_pond_water = {
            "findobject=attrib:pond_water radius:12",
            "walk=object",
            "animate=dig duration:1s",
            "callobject=remove_pond",
            "animate=dig duration:1s",
            "terraform=amazons",
            "animate=dig duration:1s",
            "callobject=remove_pond",
            "animate=planting duration:1s",
            "plant=attrib:tree_sapling",
            "return"
        },
        check_pond_dry = {
            "findobject=attrib:pond_dry radius:12",
        },
        terraform_pond_dry = {
            "findobject=attrib:pond_dry radius:12",
            "walk=object",
            "animate=planting duration:2s",
            "callobject=remove_pond",
            "animate=dig duration:2s",
            "plant=attrib:tree_sapling",
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
