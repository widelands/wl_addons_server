push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/workers/atlanteans/fisher/"

wl.Descriptions():new_worker_type {
    name = "europeans_fisher_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Fisher"),
    icon = dirname .. "menu.png",
    vision_range = 2,

    experience = 24,
    becomes = "europeans_fishbreeder",
    
    buildcost = {
        europeans_carrier = 1
    },

    programs = {
        fish = {
            -- steps from building to water: 2-10, min+max average 6
            -- min. worker time: 2 * 2 * 1.8 + 10.5 = 17.7 sec
            -- max. worker time: 2 * 10 * 1.8 + 10.5 = 46.5 sec
            -- avg. worker time: 2 * 6 * 1.8 + 10.5 = 32.1 sec
            "findspace=size:any radius:5 resource:resource_fish",
            "walk=coords",
            "playsound=sound/fisher/fisher_throw_net priority:50% allow_multiple",
            "mine=resource_fish radius:1",
            "animate=fishing duration:10s500ms",
            "playsound=sound/fisher/fisher_pull_net priority:50% allow_multiple",
            "createware=fish",
            "return"
        }
    },

    animation_directory = dirname,
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
    },
}

pop_textdomain()
