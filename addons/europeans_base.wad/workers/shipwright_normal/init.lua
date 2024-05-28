push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_shipwright_normal",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Normal Shipwright"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 36,
    becomes = "europeans_shipwright_advanced",

    programs = {
        check_space = {
            "findspace=size:swim radius:4"
        },
        buildship = {
            "walk=object-or-coords",
            "plant=attrib:europeans_shipconstruction unless object",
            "playsound=sound/sawmill/sawmill priority:80% allow_multiple",
            "animate=idle duration:3s",
            "construct",
            "animate=idle duration:3s",
            "return"
        },
        buildferry_1 = {
            "findspace=size:swim radius:4",
        },
        buildferry_2 = {
            "findspace=size:swim radius:4",
            "walk=coords",
            "animate=idle duration:40s",
            "createbob=europeans_ferry",
            "return"
        },
    },

    animation_directory = dirname,
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
