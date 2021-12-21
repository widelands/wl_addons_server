push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_fisher_normal",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Normal Fisher"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 36,
    becomes = "europeans_fisher_advanced",

    programs = {
        check_sea = {
            "findspace=size:any radius:8 breed resource:resource_fish",
        },
        breed_in_sea = {
            "findspace=size:any radius:8 breed resource:resource_fish",
            "walk=coords",
            "animate=freeing duration:6s",
            "breed=resource_fish radius:1",
            "return"
        },
        fish_in_sea = {
            "findspace=size:any radius:8 resource:resource_fish",
            "walk=coords",
            "playsound=sound/fisher/fisher_throw_net priority:50% allow_multiple",
            "mine=resource_fish radius:1",
            "animate=fishing duration:8s",
            "playsound=sound/fisher/fisher_pull_net priority:50% allow_multiple",
            "createware=fish",
            "return"
        },
        check_pond = {
            "findobject=attrib:pond_mature radius:8",
        },
        breed_in_pond = {
            "findobject=attrib:pond_dry radius:8",
            "walk=object",
            "animate=freeing duration:6s",
            "callobject=with_fish",
            "return"
        },
        fish_in_pond = {
            "findobject=attrib:pond_mature radius:8",
            "walk=object",
            "animate=fishing duration:8s",
            "callobject=fall_dry",
            "createware=fish",
            "return"
        }
    },

    animations = {
        idle = {
            hotspot = { 2, 20 },
        },
    },
    spritesheets = {
        fishing = {
            fps = 10,
            frames = 30,
            rows = 6,
            columns = 5,
            hotspot = { 10, 21 }
        },
        freeing = {
            fps = 10,
            frames = 30,
            rows = 6,
            columns = 5,
            hotspot = { 10, 19 }
        },
        walk = {
            fps = 20,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 8, 21 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 20 }
        },
    }
}

pop_textdomain()
