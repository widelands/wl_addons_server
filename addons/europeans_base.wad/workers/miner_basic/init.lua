push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_miner_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Miner"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 32,
    becomes = "europeans_miner_normal",
    
    buildcost = {
        europeans_carrier = 1,
        pick = 1,
        shovel = 1,
        buckets = 1
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 5, 24 }
        }
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 25 }
        },
        walkload = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 8, 26 }
        }
    }
}

pop_textdomain()
