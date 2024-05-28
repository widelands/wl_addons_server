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
            "findspace=size:any radius:6 avoid:field saplingsearches:8"
        },
        check_fields = {
            "findobject=attrib:field radius:6"
        },
        check_growable_trees = {
            "findobject=attrib:growable radius:6"
        },
        check_trees = {
            "findobject=attrib:tree radius:6",
        },
        plant_tree = {
            "findspace=size:any radius:6 avoid:field saplingsearches:8",
            "walk=coords",
            "animate=dig duration:2s",
            "animate=planting duration:2s",
            "plant=attrib:tree_sapling",
            "animate=water duration:2s",
            "return"
        },
        plant_rubber_tree = {
            "findspace=size:any radius:6 avoid:field saplingsearches:8",
            "walk=coords",
            "animate=dig duration:2s",
            "animate=planting duration:2s",
            "plant=attrib:rubber_tree_sapling",
            "animate=water duration:2s",
            "return"
        },
        watering = {
            "findobject=attrib:growable radius:6",
            "walk=object",
            "animate=water duration:2s",
            "callobject=grow",
            "return"
        },
        harvest_rubber = {
            "findobject=attrib:rubber_tree_mature radius:6",
            "walk=object",
            "playsound=sound/woodcutting/fast_woodcutting priority:95% allow_multiple",
            "animate=sawing duration:2s",
            "animate=idle duration:2s",
            "createware=rubber",
            "return"
        },
        harvest_tree = {
            "findobject=attrib:tree radius:6",
            "walk=object",
            "playsound=sound/atlanteans/saw/sawing priority:80% allow_multiple",
            "animate=sawing duration:2s",
            "playsound=sound/woodcutting/tree_falling priority:100%",
            "callobject=fall",
            "animate=idle duration:2s",
            "createware=log",
            "return"
        }
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
        sawing = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 22, 19 }
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
