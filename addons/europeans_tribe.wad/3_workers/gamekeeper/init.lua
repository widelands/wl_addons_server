push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_gamekeeper",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Gamekeeper"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    programs = {
        release = {
            "findspace=size:any radius:3",
            "walk=coords",
            "animate=releasein duration:2s",
            "createbob=bunny chamois deer moose reindeer sheep stag wildboar wisent",
            "animate=releaseout duration:2s",
            "return"
        },
        hunt = {
            -- steps from building to animal: 2-16, min+max average 9
            -- min. worker time: 2 * 2 * 1.8 + 1 = 8.2 sec
            -- max. worker time: 2 * 16 * 1.8 + 1 = 58.6 sec
            -- avg. worker time: 2 * 9 * 1.8 + 1 = 33.4 sec
            -- chasing of the game also changes time, average should remain the same
            "findobject=type:bob radius:13 attrib:eatable",
            "walk=object",
            "animate=hunting duration:1s",
            "removeobject",
            "createware=meat",
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
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 15, 22 }
        },
        hunting = {
            basename = "idle",
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
        }
    }
}

pop_textdomain()
