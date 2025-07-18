push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/workers/barbarians/miner/"

wl.Descriptions():new_worker_type {
    name = "europeans_miner_basic",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Basic Miner"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    experience = 48,
    becomes = "europeans_miner_advanced",
    
    buildcost = {
        europeans_carrier = 1
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 4, 24 }
        }
    },
    spritesheets = {
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 24 }
        },
        walkload = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 10, 27 }
        }
    }
}

pop_textdomain()
