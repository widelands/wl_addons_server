push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "gauls_miner",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("gauls_worker", "Miner"),
    icon = dirname .. "menu.png",
    vision_range = 2,

   buildcost = {
      gauls_carrier = 1,
      pick = 1
   },

    experience = 13,
    becomes = "gauls_miner_master",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 3, 23 }
        },
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
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 24 }
        },
    }
}

pop_textdomain()
