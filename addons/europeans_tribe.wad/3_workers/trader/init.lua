push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_trader",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Trader"),
    icon = dirname .. "menu.png",
    vision_range = 3,
    
    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            rows = 1,
            columns = 1,
            hotspot = { 36, 44 }
        },
        walk = {
            fps = 10,
            frames = 10,
            rows = 2,
            columns = 5,
            directional = true,
            hotspot = { 36, 44 }
        },
    },
    
    buildcost = {
        europeans_recruit = 1,
        quartz = 1,
        diamond = 1,
        gold = 1
    },

    programs = {
          scout = {
                "scout=radius:18 duration:1m45s",
                "return"
          },
          targeted_scouting = {
                "walk=object",
                "scout=radius:18 duration:1m45s",
                "return"
          },
          create_pole = {
                "findspace=size:any radius:80 avoid:field",
                "walk=coords",
                "plant=attrib:tradepole",
                "return"
          },
          find_pole = {
                "findobject=attrib:tradepole radius:80",
          },
          purchase_granite_copper = {
                "findobject=attrib:tradepole radius:80",
                "createware=coin_copper",
                "walk=object",
                "createware=granite",
                "return"
          },
          purchase_granite_quartz = {
                "findobject=attrib:tradepole radius:80",
                "createware=quartz",
                "walk=object",
                "createware=granite",
                "return"
          },
          purchase_marble_copper = {
                "findobject=attrib:tradepole radius:80",
                "createware=coin_copper",
                "walk=object",
                "createware=marble",
                "return"
          },
          purchase_marble_quartz = {
                "findobject=attrib:tradepole radius:80",
                "createware=quartz",
                "walk=object",
                "createware=marble",
                "return"
          },
    },
}

pop_textdomain()
