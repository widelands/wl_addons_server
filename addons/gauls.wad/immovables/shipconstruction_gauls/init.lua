push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
    name = "gauls_shipconstruction",
    -- TRANSLATORS: This is an immovable name used in lists of immovables
    descname = pgettext("immovable", "Ship Under Construction"),
    icon = dirname .. "menu.png",
    size = "small",
    programs = {
        main = {
            "construct=idle duration:5s decay_after:3m30s",
            "transform=bob:gauls_ship",
        }
    },
    buildcost = {
        log = 4,
        planks = 7,
        cloth = 3,
        reed = 3
    },

    animation_directory = dirname,
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
