push_textdomain("tribes")

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_shipwright_normal",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Normal Shipwright"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 36,
    becomes = "europeans_shipwright_advanced",

    programs = {
        buildship = {
            "walk=object-or-coords",
            "plant=attrib:europeans_shipconstruction unless object",
            "playsound=sound/sawmill/sawmill priority:80% allow_multiple",
            "animate=idle duration:500ms",
            "construct",
            "animate=idle duration:6s",
            "return"
        },
        buildferry_1 = {
            "findspace=size:swim radius:6",
        },
        buildferry_2 = {
            "findspace=size:swim radius:6",
            "walk=coords",
            "animate=idle duration:15s",
            "createbob=europeans_ferry",
            "return"
        },
    },

    spritesheets = {
          idle = {
            sound_effect = {
                path = "sound/hammering/hammering",
                priority = "50%"
            },
            fps = 10,
            frames = 92,
            rows = 11,
            columns = 9,
            hotspot = { 11, 27 }
        },
          walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 25 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 24 }
        },
    }
}

pop_textdomain()
