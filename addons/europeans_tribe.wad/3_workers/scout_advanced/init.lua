push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_scout_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Scout"),
    icon = dirname .. "menu.png",
    vision_range = 4,
    
    experience = 36,
    becomes = "europeans_trader",
    
    programs = {
        scout = {
            "scout=radius:18 duration:1m45s",
            "return"
        },
        targeted_scouting = {
            "walk=object",
            "scout=radius:18 duration:1m45s",
            "return"
        }
    },

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
            hotspot = { 9, 24 }
        },
        walkload = {
            basename = "walk",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 9, 24 }
        },
    }
}

pop_textdomain()
