push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/workers/empire/lumberjack/"

wl.Descriptions():new_worker_type {
    name = "europeans_lumberjack_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Lumberjack"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    buildcost = {
        europeans_worker_advanced = 1
    },  
    
    programs = {
        check_trees = {
            "findobject=attrib:tree radius:16",
        },
        harvest_tree = {
            "findobject=attrib:tree radius:16",
            "walk=object",
            "playsound=sound/woodcutting/fast_woodcutting priority:95% allow_multiple",
            "animate=hacking duration:2s",
            "playsound=sound/woodcutting/tree_falling priority:100%",
            "callobject=fall",
            "animate=idle duration:2s",
            "createware=log",
            "return"
        },
        check_balsa = {
            "findobject=attrib:tree_balsa radius:16",
        },
        harvest_balsa = {
            "findobject=attrib:tree_balsa radius:16",
            "walk=object",
            "playsound=sound/woodcutting/fast_woodcutting priority:95% allow_multiple",
            "animate=hacking duration:2s",
            "callobject=fall",
            "animate=idle duration:2s",
            "createware=balsa",
            "return"
        },
        check_ironwood = {
            "findobject=attrib:tree_ironwood radius:16",
        },
        harvest_ironwood = {
            "findobject=attrib:tree_ironwood radius:16",
            "walk=object",
            "playsound=sound/woodcutting/fast_woodcutting priority:95% allow_multiple",
            "animate=hacking duration:2s",
            "callobject=fall",
            "animate=idle duration:2s",
            "createware=ironwood",
            "return"
        },
        check_rubber = {
            "findobject=attrib:rubber_tree_mature radius:16",
        },
        harvest_rubber = {
            "findobject=attrib:rubber_tree_mature radius:16",
            "walk=object",
            "playsound=sound/woodcutting/fast_woodcutting priority:95% allow_multiple",
            "animate=hacking duration:2s",
            "callobject=grow",
            "animate=idle duration:2s",
            "createware=rubber",
            "return"
        }
    },

    animation_directory = dirname,
    spritesheets = {
        idle = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 6, 24 }
        },
        hacking = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 23, 23 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 9, 22 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 9, 22 }
        },
    }
}

pop_textdomain()
