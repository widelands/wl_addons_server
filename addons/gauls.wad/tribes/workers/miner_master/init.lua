push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "gauls_miner_master",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("gauls_worker", "Master Miner"),
    icon = dirname .. "menu.png",
    vision_range = 2,
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 7, 22 }
        },
    },
    spritesheets ={
        walk = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 11, 22 }
        },
        walkload = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            directional = true,
            hotspot = { 10, 22 }
        },
    },
}

pop_textdomain()
