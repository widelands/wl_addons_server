push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_fishbreeder",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Fish Breeder"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,

    programs = {
        breed = {
            "findspace=size:any radius:7 breed resource:resource_fish",
            "walk=coords",
            "animate=freeing duration:13s500ms", -- Play a freeing animation
            "breed=resource_fish radius:1",
            "return"
        },
        fish = {
            -- steps from building to water: 2-10, min+max average 6
            -- min. worker time: 2 * 2 * 1.8 + 9.5 = 16.7 sec
            -- max. worker time: 2 * 10 * 1.8 + 9.5 = 45.5 sec
            -- avg. worker time: 2 * 6 * 1.8 + 9.5 = 31.1 sec
            "findspace=size:any radius:6 resource:resource_fish",
            "walk=coords",
            "playsound=sound/fisher/fisher_throw_net priority:50% allow_multiple",
            "mine=resource_fish radius:1",
            "animate=fishing duration:9s500ms",
            "playsound=sound/fisher/fisher_pull_net priority:50% allow_multiple",
            "createware=fish",
            "return"
        }
    },

    animations = {
        idle = {
            hotspot = { 8, 22 }
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
            hotspot = { 11, 23 }
        },
    },
}

pop_textdomain()
