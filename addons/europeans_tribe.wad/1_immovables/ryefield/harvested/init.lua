push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
    name = "ryefield_harvested",
    -- TRANSLATORS: This is an immovable name used in lists of immovables
    descname = pgettext("immovable", "Rye Field (harvested)"),
    icon = dirname .. "menu.png",
    programs = {
        main = {
            "animate=idle duration:7m30s",
            "remove=",
        }
    },

    animation_directory = dirname,
    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 33, 22 },
        },
    }
}

pop_textdomain()
