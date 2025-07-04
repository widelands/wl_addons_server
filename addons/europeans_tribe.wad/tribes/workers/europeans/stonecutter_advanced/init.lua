push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/empire/stonemason/"

wl.Descriptions():new_worker_type {
    name = "europeans_stonecutter_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Stonecutter"),
    icon = dirname .. "menu.png",
    vision_range = 2,
        
    programs = {
        check_rocks = {
            "findobject=attrib:rocks radius:16",
        },
        cut_granite = {
            "findobject=attrib:rocks radius:16",
            "walk=object",
            "playsound=sound/stonecutting/stonecutter priority:50% allow_multiple",
            "animate=hacking duration:12s",
            "callobject=shrink",
            "createware=granite",
            "return"
        },
        cut_marble = {
            "findobject=attrib:rocks radius:16",
            "walk=object",
            "playsound=sound/stonecutting/stonecutter priority:50% allow_multiple",
            "animate=hacking duration:12s",
            "callobject=shrink",
            "createware=marble",
            "return"
        },
        check_stone = {
            "findspace=size:any radius:16 resource:resource_stones",
        },
        mine_granite = {
            "findspace=size:any radius:16 resource:resource_stones",
            "walk=coords",
            "playsound=sound/stonecutting/stonecutter priority:50% allow_multiple",
            "animate=hacking duration:12s",
            "mine=resource_stones radius:1",
            "createware=granite",
            "return"
        },
        mine_marble = {
            "findspace=size:any radius:16 resource:resource_stones",
            "walk=coords",
            "playsound=sound/stonecutting/stonecutter priority:50% allow_multiple",
            "animate=hacking duration:12s",
            "mine=resource_stones radius:1",
            "createware=marble",
            "return"
        }
    },

    animation_directory = dirname,
    spritesheets = {
        idle = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 9, 23 }
        },
        hacking = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 8, 23 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 9, 22 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 25 }
        },
    }
}

pop_textdomain()
