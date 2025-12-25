push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "gauls_forester",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("gauls_worker", "Forester"),
    icon = dirname .. "menu.png",
    vision_range = 2,

   buildcost = {
      gauls_carrier = 1,
      shovel = 1
   },

    programs = {
        check_space = {
            "findspace=size:any radius:6 avoid:field saplingsearches:8"
        },
        plant = {
         -- steps from building: 2-11
         -- min. worker time: 2 * 2 * 1.8 + 9 = 16.2 sec
         -- max. worker time: 2 * 11 * 1.8 + 9 = 48.6 sec
         -- avg. worker time: 24.5 + 9 = 33.5 sec
            "findspace=size:any radius:6 avoid:field saplingsearches:8",
            "walk=coords",
            "animate=dig duration:5s",
            "animate=planting duration:2s",
            "plant=attrib:tree_sapling",
            "animate=water duration:2s",
            "return"
        },
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 8, 23 },
        },
    },
    spritesheets = {
        dig = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 5, 23 }
        },
        planting = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 17, 21 }
        },
        water = {
            fps = 5,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 18, 25 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 23 }
        },
        walkload = {
            basename = "walk",
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 10, 23 }
        },
    }
}

pop_textdomain()
