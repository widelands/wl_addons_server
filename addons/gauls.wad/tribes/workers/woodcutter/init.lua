push_textdomain("gauls.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "gauls_woodcutter",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("gauls_worker", "Woodcutter"),
    icon = dirname .. "menu.png",
    vision_range = 2,

   buildcost = {
      gauls_carrier = 1,
      felling_ax = 1
   },
    
    programs = {
        check = {
            "findobject=attrib:tree radius:12",
        },
        harvest = {
            "findobject=attrib:tree radius:12",
            "walk=object",
            "playsound=sound/woodcutting/fast_woodcutting priority:95% allow_multiple",
            "animate=hacking duration:9s",
            "playsound=sound/woodcutting/tree_falling priority:100%",
            "callobject=fall",
            "animate=idle duration:1s",
            "createware=log",
            "return"
        }
    },

    animation_directory = dirname,
    spritesheets = {
        idle = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 6, 24 }
        },
        hacking = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            hotspot = { 23, 23 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 9, 22 }
        },
        walkload = {
            fps = 10,
            frames = 10,
            rows = 4,
            columns = 3,
            directional = true,
            hotspot = { 9, 22 }
        },
    }
}

pop_textdomain()
