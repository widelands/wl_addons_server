push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_worker_type {
    name = "europeans_food_trader",
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
        europeans_trader = 1
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
                "createware=coin_copper",
                "walk=object",
                "createware=granite",
                "return"
          },
          purchase_marble = {
                "findobject=attrib:tradepole radius:80",
                "createware=coin_copper",
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
          sale_bread = {
                "findobject=attrib:tradepole radius:80",
                "createware=bread",
                "walk=object",
                "createware=coin_copper",
                "return"
          },
          sale_meat = {
                "findobject=attrib:tradepole radius:80",
                "createware=meat",
                "walk=object",
                "createware=coin_copper",
                "return"
          },
          sale_fish = {
                "findobject=attrib:tradepole radius:80",
                "createware=fish",
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
}

pop_textdomain()
