push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname (__file__)

descriptions:new_worker_type {
    name = "europeans_fisher_advanced",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext ("europeans_worker", "Advanced Fisher"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    programs = {
        check_sea = {
            "findspace=size:any radius:10 breed resource:resource_fish",
        },
        breed_in_sea = {
            "findspace=size:any radius:10 breed resource:resource_fish",
            "walk=coords",
            "animate=freeing duration:4s",
            "breed=resource_fish radius:1",
            "return"
        },
        fish_in_sea = {
            "findspace=size:any radius:10 resource:resource_fish",
            "walk=coords",
            "mine=resource_fish radius:1",
            "animate=fishing duration:4s",
            "createware=fish",
            "return"
        },
        check_pond = {
            "findobject=attrib:pond_mature radius:10",
        },
        breed_in_pond = {
            "findobject=attrib:pond_dry radius:10",
            "walk=object",
            "animate=freeing duration:4s",
            "callobject=with_fish",
            "return"
        },
        fish_in_pond = {
            "findobject=attrib:pond_mature radius:10",
            "walk=object",
            "animate=fishing duration:4s",
            "callobject=fall_dry",
            "createware=fish",
            "return"
        }
    },

    ware_hotspot = {0, 20},

    animations = {
        idle = {
            basename = "idle",
            hotspot = {8, 25}
        },
    },
    spritesheets = {
        walk = {
            basename = "walk",
            fps = 15,
            frames = 10,
            columns = 5,
            rows = 2,
            directional = true,
            hotspot = {13, 25}
        },
        walkload = {
            basename = "walkload",
            fps = 15,
            frames = 10,
            columns = 5,
            rows = 2,
            directional = true,
            hotspot = {13, 26}
        },
        fishing = {
            basename = "fishing",
            fps = 10,
            frames = 30,
            columns = 5,
            rows = 6,
            hotspot = {9, 23}
        },
        freeing = {
            basename = "freeing",
            fps = 10,
            frames = 30,
            rows = 6,
            columns = 5,
            hotspot = { 10, 19 }
        },
    },
}

pop_textdomain()
