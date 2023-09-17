push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
    name = "ryefield_medium",
    -- TRANSLATORS: This is an immovable name used in lists of immovables
    descname = pgettext("immovable", "Rye Field (medium)"),
    icon = dirname .. "menu.png",
    size = "small",
    programs = {
        main = {
            "animate=idle duration:40s",
            "transform=ryefield_ripe",
        }
    },

    animation_directory = dirname,
    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 31, 23 },
        },
    }
}

pop_textdomain()
