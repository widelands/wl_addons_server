push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_hunter_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Hunter"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    programs = {
        hunt = {
            "findobject=type:bob radius:14 attrib:eatable",
            "walk=object",
            "animate=idle duration:1s",
            "removeobject",
            "createware=meat",
            "return"
        },
        release = {
            "findspace=size:any radius:14",
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
            hotspot = { 10, 21 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 9, 32 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 9, 32 }
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
        }
    }
}

pop_textdomain()
