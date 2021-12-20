push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_lumberjack_normal",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Normal Lumberjack / Woodcutter"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 36,
    becomes = "europeans_lumberjack_advanced",

    programs = {
        harvest = {
            "findobject=attrib:tree radius:14",
            "walk=object",
            "playsound=sound/atlanteans/saw/sawing priority:80% allow_multiple",
            "animate=sawing duration:8s",
            "playsound=sound/woodcutting/tree_falling priority:100%",
            "callobject=fall",
            "animate=idle duration:2s",
            "createware=log",
            "return"
        }
    },
    
    animations = {
        idle = {
            hotspot = { 8, 22 }
        },
    },
    spritesheets = {
        sawing = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 22, 19 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 16, 31 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 13, 29 }
        }
    }
}

pop_textdomain()
