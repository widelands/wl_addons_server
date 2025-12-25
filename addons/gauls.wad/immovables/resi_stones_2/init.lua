push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_immovable_type {
    name = "gauls_resi_stones_2",
    -- TRANSLATORS: This is a resource name used in lists of resources
    descname = pgettext("resource_indicator", "A Lot of Tin Ore"),
    icon = dirname .. "stone_much.png",
    programs = {
        main = {
            "animate=idle duration:10m",
            "remove="
        }
    },
    
    animation_directory = dirname,
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
