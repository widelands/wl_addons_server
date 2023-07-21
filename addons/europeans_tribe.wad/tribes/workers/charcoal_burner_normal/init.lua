push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_charcoal_burner_normal",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Normal Charcoal Burner"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 36,
    becomes = "europeans_charcoal_burner_advanced",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 4, 22 }
        },
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 22 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 24 }
        },
    }
}

pop_textdomain()
