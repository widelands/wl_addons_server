push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "sumatran_recruit",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("sumatran_worker", "Recruit"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    buildcost = {
        sumatrans_carrier = 1,
    },

    animation_directory = dirname,
    spritesheets = {
        idle = {
            fps = 5,
            frames = 40,
            rows = 7,
            columns = 6,
            hotspot = { 6, 21 }
        },
        walk = {
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
