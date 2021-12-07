push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_geologist",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Geologist"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    programs = {
        -- Expedition is the main program
        -- The specialized geologist command walks the geologist around his starting
        -- location, executing the search program from time to time.
        expedition = {
            "repeatsearch=search repetitions:16 radius:6"
        },
        -- Search program, executed when we have found a place to hack on
        search = {
            "animate=hacking duration:5s",
            "animate=idle duration:2s",
            "playsound=sound/hammering/geologist_hammer priority:50% allow_multiple",
            "animate=hacking duration:3s",
            "findresources"
        }
    },

    spritesheets = {
        idle = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 9, 21 }
        },
        hacking = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 11, 18 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 9, 21 }
        },
        walkload = {
            basename = "walk",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 9, 21 }
        },
    }
}

pop_textdomain()
