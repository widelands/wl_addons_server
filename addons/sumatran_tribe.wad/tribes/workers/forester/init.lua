push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "sumatran_forester",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("sumatran_worker", "Forester"),
    icon = dirname .. "menu.png",
    vision_range = 2,

   buildcost = {
      sumatrans_carrier = 1,
      shovel = 1
   },

    programs = {
        check_space = {
            "findspace=size:any radius:6 avoid:field saplingsearches:8"
        },
        plant_palm = {
         -- steps from building to rock: 2-9, average 5.5
         -- min. worker time: 2 * 2 * 1.8 + 10 = 17.2 sec
         -- max. worker time: 2 * 9 * 1.8 + 10 = 42.4 sec
         -- avg. worker time: 2 * 5.5 * 1.8 + 10 = 29.8 sec
            "findspace=size:any radius:6 avoid:field saplingsearches:8",
            "walk=coords",
            "animate=dig duration:6s",
            "animate=planting duration:2s",
            "plant=attrib:palm_sapling",
            "animate=water duration:2s",
            "return"
        },
        plant_tropical_tree = {
         -- steps from building to rock: 2-9, average 5.5
         -- min. worker time: 2 * 2 * 1.8 + 10 = 17.2 sec
         -- max. worker time: 2 * 9 * 1.8 + 10 = 42.4 sec
         -- avg. worker time: 2 * 5.5 * 1.8 + 10 = 29.8 sec
            "findspace=size:any radius:6 avoid:field saplingsearches:8",
            "walk=coords",
            "animate=dig duration:6s",
            "animate=planting duration:2s",
            "plant=attrib:tropical_sapling",
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
