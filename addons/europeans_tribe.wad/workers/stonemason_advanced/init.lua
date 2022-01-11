push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_stonemason_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Advanced Stonemason"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    programs = {
        check_rocks = {
            "findobject=attrib:rocks radius:12",
        },
        check_stone = {
            "findspace=size:any radius:12 resource:resource_stones",
        },
        cut_granite = {
            "findobject=attrib:rocks radius:12",
            "walk=object",
            "playsound=sound/stonecutting/stonecutter priority:70% allow_multiple",
            "animate=hacking duration:12s500ms",
            "callobject=shrink",
            "createware=granite",
            "return"
        },
        cut_marble = {
            "findobject=attrib:rocks radius:12",
            "walk=object",
            "playsound=sound/stonecutting/stonecutter priority:70% allow_multiple",
            "animate=hacking duration:12s500ms",
            "callobject=shrink",
            "createware=marble",
            "return"
        },
        mine_granite = {
            "findspace=size:any radius:12 resource:resource_stones",
            "walk=coords",
            "playsound=sound/stonecutting/stonecutter priority:70% allow_multiple",
            "animate=hacking duration:12s500ms",
            "mine=resource_stones radius:1",
            "createware=granite",
            "return"
        },
        mine_marble = {
            "findspace=size:any radius:12 resource:resource_stones",
            "walk=coords",
            "playsound=sound/stonecutting/stonecutter priority:70% allow_multiple",
            "animate=hacking duration:12s500ms",
            "mine=resource_stones radius:1",
            "createware=marble",
            "return"
        },
        mine_quartz = {
            "findspace=size:any radius:12 resource:resource_stones",
            "walk=coords",
            "playsound=sound/stonecutting/stonecutter priority:70% allow_multiple",
            "animate=hacking duration:12s500ms",
            "mine=resource_stones radius:1",
            "createware=quartz",
            "return"
        },
        mine_diamond = {
            "findspace=size:any radius:12 resource:resource_stones",
            "walk=coords",
            "playsound=sound/stonecutting/stonecutter priority:70% allow_multiple",
            "animate=hacking duration:12s500ms",
            "mine=resource_stones radius:1",
            "createware=diamond",
            "return"
        }
    },
    
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
