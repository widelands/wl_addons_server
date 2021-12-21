push_textdomain("tribes")

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_shipwright_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Shipwright"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 24,
    becomes = "europeans_shipwright_normal",

    programs = {
        buildship = {
            "walk=object-or-coords",
            "plant=attrib:europeans_shipconstruction unless object",
            "playsound=sound/sawmill/sawmill priority:80% allow_multiple",
            "animate=work duration:500ms",
            "construct",
            "animate=work duration:8s",
            "return"
        },
        buildferry_1 = {
            "findspace=size:swim radius:5",
        },
        buildferry_2 = {
            "findspace=size:swim radius:5",
            "walk=coords",
            "animate=work duration:20s",
            "createbob=europeans_ferry",
            "return"
        },
    },

    animations = {
        idle = {
            hotspot = { 4, 18 }
        },
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 6, 18 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 20 }
        },
        work = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 12, 22 },
            sound_effect = {
                path = "sound/hammering/hammering",
                priority = "50%"
            }
        },
    }
}

pop_textdomain()
