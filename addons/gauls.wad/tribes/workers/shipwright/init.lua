push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "gauls_shipwright",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("gauls_worker", "Shipwright"),
    icon = dirname .. "menu.png",
    vision_range = 2,

   buildcost = {
      gauls_carrier = 1,
      hammer = 1
   },

    programs = {
        buildship = {
            "walk=object-or-coords",
            "plant=attrib:gauls_shipconstruction unless object",
            "playsound=sound/sawmill/sawmill priority:80% allow_multiple",
            "animate=idle duration:3s",
            "construct",
            "animate=idle duration:3s",
            "return"
        },
        buildferry_1 = {
            "findspace=size:swim radius:6",
        },
        buildferry_2 = {
            -- steps from building to water: 2-9
            -- min. worker time: 2 * 2 * 1.8 + 9 = 16.2 sec
            -- max. worker time: 2 * 9 * 1.8 + 9 = 41.4 sec
            "findspace=size:swim radius:6",
            "walk=coords",
            "animate=idle duration:9s",
            "createbob=gauls_ferry",
            "return"
        },
    },

    animation_directory = dirname,
    spritesheets = {
          idle = {
            sound_effect = {
                path = "sound/hammering/hammering",
                priority = "50%"
            },
            fps = 10,
            frames = 92,
            rows = 11,
            columns = 9,
            hotspot = { 11, 27 }
        },
          walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 25 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 8, 24 }
        },
    }
}

pop_textdomain()
