push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_stonecutter_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Stonecutter"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 48,
    becomes = "europeans_stonecutter_advanced",
    
    buildcost = {
        europeans_carrier = 1,
        pick = 1,
        shovel = 1,
        buckets = 1
    },
    
    programs = {
        check_rocks = {
            "findobject=attrib:rocks radius:8",
        },
        check_stone = {
            "findspace=size:any radius:8 resource:resource_stones",
        },
        cut_granite = {
            "findobject=attrib:rocks radius:8",
            "walk=object",
            "playsound=sound/stonecutting/stonecutter priority:50% allow_multiple",
            "animate=hack duration:16s",
            "callobject=shrink",
            "createware=granite",
            "return"
        },
        cut_marble = {
            "findobject=attrib:rocks radius:8",
            "walk=object",
            "playsound=sound/stonecutting/stonecutter priority:50% allow_multiple",
            "animate=hack duration:16s",
            "callobject=shrink",
            "createware=marble",
            "return"
        },
        mine_granite = {
            "findspace=size:any radius:8 resource:resource_stones",
            "walk=coords",
            "playsound=sound/stonecutting/stonecutter priority:50% allow_multiple",
            "animate=hack duration:16s",
            "mine=resource_stones radius:1",
            "createware=granite",
            "return"
        },
        mine_marble = {
            "findspace=size:any radius:8 resource:resource_stones",
            "walk=coords",
            "playsound=sound/stonecutting/stonecutter priority:50% allow_multiple",
            "animate=hack duration:16s",
            "mine=resource_stones radius:1",
            "createware=marble",
            "return"
        }
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 6, 16 },
        }
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 9, 17 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 7, 19 }
        },
        hack = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 6, 17 }
        }
    }
}

pop_textdomain()
