push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
    name = "gauls_resi_iron_1",
    -- TRANSLATORS: This is a resource name used in lists of resources
    descname = pgettext("resource_indicator", "Some Iron Ore"),
    icon = dirname .. "mixed_few.png",
    programs = {
        main = {
            "animate=idle duration:10m",
            "remove="
        }
    },

    animation_directory = dirname,
    spritesheets = {
        idle = {
            basename = "mixed_few",
            hotspot = {10, 36},
            frames = 4,
            columns = 2,
            rows = 2
        }
    }
}

pop_textdomain()
