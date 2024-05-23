push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_scout_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Scout"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 24,
    becomes = "europeans_scout_normal",
    
    buildcost = {
        europeans_recruit = 1,
        gold = 1
    },

    programs = {
        scout = {
            "scout=radius:12 duration:1m",
            "return"
        },
        targeted_scouting = {
            "walk=object",
            "scout=radius:12 duration:1m",
            "return"
        }
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 6, 21 },
        }
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 23 }
        }
    }
}

pop_textdomain()
