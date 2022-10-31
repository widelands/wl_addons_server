push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
    name = "europeans_resi_water",
    -- TRANSLATORS: This is a resource name used in lists of resources
    descname = pgettext("resource_indicator", "Water"),
    icon = dirname .. "water.png",
    programs = {
        main = {
            "animate=idle duration:10m",
            "remove="
        }
    },
    
    animation_directory = dirname,
    spritesheets = {
        idle = {
            basename = "water",
            hotspot = {10, 36},
            frames = 4,
            columns = 2,
            rows = 2
        }
    }
}

pop_textdomain()
