push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_trader",
    -- TRANSLATORS: This is a worker name used in lists of workers
    descname = pgettext("europeans_worker", "Trader"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    vision_range = 3,
    
    buildcost = {
        europeans_scout_advanced = 1,
        europeans_carrier_horse = 1,
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
          purchase_granite = {
                "findobject=attrib:tradepole radius:80",
                "createware=coin_wood",
                "walk=object",
                "createware=granite",
                "return"
          },
          purchase_marble = {
                "findobject=attrib:tradepole radius:80",
                "createware=coin_wood",
                "walk=object",
                "createware=marble",
                "return"
          },
          purchase_quartz = {
                "findobject=attrib:tradepole radius:80",
                "createware=coin_copper",
                "walk=object",
                "createware=quartz",
                "return"
          },
          purchase_diamond = {
                "findobject=attrib:tradepole radius:80",
                "createware=coin_copper",
                "walk=object",
                "createware=diamond",
                "return"
          },
          purchase_iron = {
                "findobject=attrib:tradepole radius:80",
                "createware=coin_silver",
                "walk=object",
                "createware=iron",
                "return"
          },
          purchase_gold = {
                "findobject=attrib:tradepole radius:80",
                "createware=coin_gold",
                "walk=object",
                "createware=gold",
                "return"
          },
          sale_ration = {
                "findobject=attrib:tradepole radius:80",
                "createware=ration",
                "walk=object",
                "createware=coin_wood",
                "return"
          },
          sale_snack = {
                "findobject=attrib:tradepole radius:80",
                "createware=snack",
                "walk=object",
                "createware=coin_wood",
                "return"
          },
          sale_meal = {
                "findobject=attrib:tradepole radius:80",
                "createware=meal",
                "walk=object",
                "createware=coin_copper",
                "return"
          },
          sale_beer= {
                "findobject=attrib:tradepole radius:80",
                "createware=beer_strong",
                "walk=object",
                "createware=coin_copper",
                "return"
          },
          sale_mead = {
                "findobject=attrib:tradepole radius:80",
                "createware=mead",
                "walk=object",
                "createware=coin_silver",
                "return"
          },
          sale_wine = {
                "findobject=attrib:tradepole radius:80",
                "createware=wine",
                "walk=object",
                "createware=coin_gold",
                "return"
          },
    },

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
    }
}

pop_textdomain()
