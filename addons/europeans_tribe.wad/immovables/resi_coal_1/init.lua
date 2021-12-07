push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_immovable_type {
    name = "europeans_resi_coal_1",
    -- TRANSLATORS: This is a resource name used in lists of resources
    descname = pgettext("resource_indicator", "Some Coal"),
    animation_directory = dirname,
    icon = dirname .. "coal_few.png",
    programs = {
        main = {
            "animate=idle duration:10m",
            "remove="
        }
    },
    spritesheets = {
        idle = {
            basename = "coal_few",
            hotspot = {10, 36},
            frames = 4,
            columns = 2,
            rows = 2
        }
    }
}

pop_textdomain()
