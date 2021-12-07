push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_immovable_type {
    name = "europeans_shipconstruction",
    -- TRANSLATORS: This is an immovable name used in lists of immovables
    descname = pgettext("immovable", "Ship Under Construction"),
    icon = dirname .. "menu.png",
    size = "small",
    programs = {
        main = {
            "construct=idle duration:5s decay_after:3m30s",
            "transform=bob:europeans_ship",
        }
    },
    buildcost = {
        planks = 10,
        blackwood = 2,
        spidercloth = 4,
        quartz = 1,
        diamond = 1
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 118, 94 },
            fps = 1,
            representative_frame = 5
        },
    }
}

pop_textdomain()
