push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/workers/barbarians/lumberjack/"

wl.Descriptions():new_worker_type {
    name = "europeans_lumberjack_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Lumberjack"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 48,
    becomes = "europeans_lumberjack_advanced",
    
    buildcost = {
        europeans_worker_basic = 1
    },    

    programs = {
        check_trees = {
            "findobject=attrib:tree radius:8",
        },
        check_rubber = {
            "findobject=attrib:rubber_tree_mature radius:8",
        },
        check_fields = {
            "findobject=attrib:field radius:8"
        },
        harvest_rubber = {
            "findobject=attrib:rubber_tree_mature radius:8",
            "walk=object",
            "playsound=sound/woodcutting/fast_woodcutting priority:95% allow_multiple",
            "animate=hack duration:6s",
            "callobject=grow",
            "animate=idle duration:6s",
            "createware=rubber",
            "return"
        },
        harvest_tree = {
            "findobject=attrib:tree radius:8",
            "walk=object",
            "playsound=sound/woodcutting/woodcutting priority:100% allow_multiple",
            "animate=hack duration:6s",
            "playsound=sound/woodcutting/tree_falling priority:100%",
            "callobject=fall",
            "animate=idle duration:6s",
            "createware=log",
            "return"
        },
    },

    animation_directory = dirname,
    spritesheets = {
        idle = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 5, 21 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 20 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 19 }
        },
        hack = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 19, 15 }
        },
    }
}

pop_textdomain()
