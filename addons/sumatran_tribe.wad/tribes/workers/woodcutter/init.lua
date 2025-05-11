push_textdomain("sumatran_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "sumatran_woodcutter",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("sumatran_worker", "Woodcutter"),
    icon = dirname .. "menu.png",
    vision_range = 2,

   buildcost = {
      sumatrans_carrier = 1,
      felling_ax = 1
   },
    
    programs = {
        check = {
            "findobject=attrib:normal_tree radius:12",
        },
        check_tropical = {
            "findobject=attrib:tropical_tree radius:12",
        },
        harvest_tropicalwood = {
         -- steps from building to rock: 2-15, average 9.45
         -- min. worker time: 2 * 2 * 1.8 + 10 = 17.2 sec
         -- max. worker time: 2 * 15 * 1.8 + 10 = 64.0 sec
         -- avg. worker time: 2 * 9.45 * 1.8 + 10 = 34.0 sec
         -- some of trees delay woodcutting by 1-1.4 sec (aspen, balsa, ironwood, oak, rubber)
            "findobject=attrib:tropical_tree radius:12",
            "walk=object",
            "playsound=sound/woodcutting/fast_woodcutting priority:95% allow_multiple",
            "animate=hacking duration:9s",
            "callobject=fall",
            "animate=idle duration:1s",
            "createware=tropicalwood",
            "return"
        },
        harvest_palm = {
            "findobject=attrib:palm_tree radius:12",
            "walk=object",
            "playsound=sound/woodcutting/fast_woodcutting priority:95% allow_multiple",
            "animate=hacking duration:9s",
            "playsound=sound/woodcutting/tree_falling priority:100%",
            "callobject=fall",
            "plant=attrib:leaves",
            "animate=idle duration:1s",
            "createware=log",
            "return"
        },
        harvest = {
            "findobject=attrib:normal_tree radius:12",
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
