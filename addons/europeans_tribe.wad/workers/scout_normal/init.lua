push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_scout_normal",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Normal Scout"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 3,

    experience = 36,
    becomes = "europeans_scout_advanced",

    programs = {
        find_pole = {
            "findobject=attrib:tradepole radius:80",
        },
        scout = {
            "scout=radius:15 duration:1m15s",
            "return"
        },
        targeted_scouting = {
            "walk=object",
            "scout=radius:15 duration:1m15s",
            "return"
        }
    },

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
            hotspot = { 9, 25 }
        },
    },
}

pop_textdomain()
