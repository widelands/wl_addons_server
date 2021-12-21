push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_worker_type {
    name = "europeans_fisher_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Fisher"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 24,
    becomes = "europeans_fisher_normal",

    programs = {
        check_sea = {
            "findspace=size:any radius:6 breed resource:resource_fish",
        },
        breed_in_sea = {
            "findspace=size:any radius:6 breed resource:resource_fish",
            "walk=coords",
            "animate=freeing duration:8s",
            "breed=resource_fish radius:1",
            "return"
        },
        fish_in_sea = {
            "findspace=size:any radius:6 resource:resource_fish",
            "walk=coords",
            "playsound=sound/fisher/fisher_throw_net priority:50% allow_multiple",
            "mine=resource_fish radius:1",
            "animate=fish duration:12s",
            "playsound=sound/fisher/fisher_pull_net priority:50% allow_multiple",
            "createware=fish",
            "return"
        },
        check_pond = {
            "findobject=attrib:pond_mature radius:6",
        },
        breed_in_pond = {
            "findobject=attrib:pond_dry radius:6",
            "walk=object",
            "animate=freeing duration:8s",
            "callobject=with_fish",
            "return"
        },
        fish_in_pond = {
            "findobject=attrib:pond_mature radius:6",
            "walk=object",
            "animate=fish duration:12s",
            "callobject=fall_dry",
            "createware=fish",
            "return"
        }
    },

    animations = {
        idle = {
            hotspot = { 7, 33 },
        },
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 32 }
        },
        freeing = {
            fps = 10,
            frames = 30,
            rows = 6,
            columns = 5,
            hotspot = { 10, 19 }
        },
        -- TODO(GunChleoc): Needs walkload animation, or some ware hotspot/sizing magic.
        fish = {
            fps = 10,
            frames = 30,
            rows = 6,
            columns = 5,
            hotspot = { 7, 33 }
        }
    }
}

pop_textdomain()
