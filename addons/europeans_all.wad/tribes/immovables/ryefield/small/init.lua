push_textdomain("tribes")

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
    name = "ryefield_small",
    -- TRANSLATORS: This is an immovable name used in lists of immovables
    descname = pgettext("immovable", "Rye Field (small)"),
    icon = dirname .. "menu.png",
    size = "small",
    programs = {
        main = {
            "animate=idle duration:60s",
            "transform=ryefield_medium",
        },
        grow = {
            "animate=idle duration:30s",
            "transform=ryefield_medium",
        }
    },

    animation_directory = dirname,
    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 31, 24 },
        },
    }
}

pop_textdomain()
