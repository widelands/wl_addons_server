push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/empire/shipwright/"

wl.Descriptions():new_worker_type {
    name = "europeans_shipwright_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Shipwright"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    programs = {
        check_space = {
            "findspace=size:swim radius:6"
        },
        buildship = {
            "walk=object-or-coords",
            "plant=attrib:europeans_shipconstruction unless object",
            "playsound=sound/sawmill/sawmill priority:80% allow_multiple",
            "animate=work duration:2s",
            "construct",
            "animate=work duration:2s",
            "return"
        },
        buildferry_1 = {
            "findspace=size:swim radius:6",
        },
        buildferry_2 = {
            "findspace=size:swim radius:6",
            "walk=coords",
            "animate=work duration:30s",
            "createbob=europeans_ferry",
            "return"
        },
    },

    animation_directory = dirname,
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
