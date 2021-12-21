push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_hunter_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Hunter"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 24,
    becomes = "europeans_hunter_normal",

    programs = {
        hunt = {
            "findobject=type:bob radius:6 attrib:eatable",
            "walk=object",
            "animate=idle duration:2s",
            "removeobject",
            "createware=meat",
            "return"
        },
        release = {
            "findspace=size:any radius:6",
            "walk=coords",
            "animate=releasein duration:4s",
            "createbob=bunny chamois deer moose reindeer sheep stag wildboar wisent",
            "animate=releaseout duration:4s",
            "return"
        }
    },

    spritesheets = {
        idle = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 10, 20 }
        },
        releasein = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 15, 22 }
        },
        releaseout = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 15, 22 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 6, 26 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 6, 26 }
        }
    }
}

pop_textdomain()
