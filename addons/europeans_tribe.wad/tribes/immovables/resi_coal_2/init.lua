push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
    name = "europeans_resi_coal_2",
    -- TRANSLATORS: This is a resource name used in lists of resources
    descname = pgettext("resource_indicator", "A Lot of Coal"),
    icon = dirname .. "coal_much.png",
    programs = {
        main = {
            "animate=idle duration:10m",
            "remove="
        }
    },

    animation_directory = dirname,
    spritesheets = {
        idle = {
            basename = "coal_much",
            hotspot = {10, 36},
            frames = 4,
            columns = 2,
            rows = 2
        }
    }
}

pop_textdomain()
