push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "sumatran_geologist",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("sumatran_worker", "Geologist"),
    icon = dirname .. "menu.png",
    vision_range = 4,
    
    buildcost = {
        sumatrans_carrier = 1,
        hammer = 1
    },

    programs = {
        expedition = {
            "repeatsearch=search repetitions:15 radius:6"
        },
        search = {
            "animate=hacking duration:5s",
            "animate=idle duration:2s",
            "playsound=sound/hammering/geologist_hammer priority:50% allow_multiple",
            "animate=hacking duration:3s",
            "findresources"
        }
    },

    animation_directory = dirname,
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
