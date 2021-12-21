push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_shipwright_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Shipwright"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    programs = {
        buildship = {
            "walk=object-or-coords",
            "plant=attrib:europeans_shipconstruction unless object",
            "playsound=sound/sawmill/sawmill priority:80% allow_multiple",
            "animate=work duration:500ms",
            "construct",
            "animate=work duration:4s",
            "return"
        },
        buildferry_1 = {
            "findspace=size:swim radius:7",
        },
        buildferry_2 = {
            "findspace=size:swim radius:7",
            "walk=coords",
            "animate=work duration:10s",
            "createbob=europeans_ferry",
            "return"
        },
    },

    animations = {
        idle = {
            hotspot = { 13, 24 },
        },
    },
    spritesheets = {
        work = {
            sound_effect = {
                path = "sound/hammering/hammering",
                priority = "50%"
            },
            fps = 10,
            frames = 92,
            rows = 11,
            columns = 9,
            hotspot = { 12, 27 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 11, 24 }
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
