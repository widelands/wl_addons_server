push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_immovable_type {
    name = "europeans_resi_stones_2",
    -- TRANSLATORS: This is a resource name used in lists of resources
    descname = pgettext("resource_indicator", "A Lot of Crystals"),
    animation_directory = dirname,
    icon = dirname .. "stone_much.png",
    programs = {
        main = {
            "animate=idle duration:10m",
            "remove="
        }
    },
    spritesheets = {
        idle = {
            basename = "stone_much",
            hotspot = {10, 36},
            frames = 4,
            columns = 2,
            rows = 2
        }
    }
}

pop_textdomain()
