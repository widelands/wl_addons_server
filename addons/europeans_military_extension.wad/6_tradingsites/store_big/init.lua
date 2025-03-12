push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/trainingsites/empire/trainingcamp/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_store_big",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Big Store"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 87, 113 }
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 87, 113 }
      }
    },
    
    size = "big",
    destructible = true,
    
    buildcost = {
        brick = 4,
        grout = 4,
        planks = 4,
        marble_column = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4,
        marble = 2
    },
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 3
    },

    inputs = {
        { name = "coin_copper", amount = 12 },
        { name = "coin_silver", amount = 8 },
        { name = "coin_gold", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trade_granite_copper",
                "sleep=duration:20s",
                "call=trade_metal_alloy_copper",
                "call=trade_metal_alloy_silver",
                "call=trade_metal_alloy_gold",
                "sleep=duration:20s",
                "call=trade_granite_copper",
                "sleep=duration:20s",
                "call=trade_metal_alloy_copper",
                "call=trade_metal_alloy_silver",
                "call=trade_metal_alloy_gold"
            }
        },
        trade_granite_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs granite",
                "return=failed unless site has coin_copper",
                "consume=coin_copper",
                "animate=working duration:4m",
                "produce=granite:2",
            }
        },
        trade_metal_alloy_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs metal_alloy",
                "return=failed unless site has coin_copper:4",
                "consume=coin_copper:4",
                "animate=working duration:4m",
                "produce=metal_alloy",
            }
        },
        trade_metal_alloy_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs metal_alloy",
                "return=failed unless site has coin_silver:2",
                "consume=coin_silver:2",
                "animate=working duration:4m",
                "produce=metal_alloy",
            }
        },
        trade_metal_alloy_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs metal_alloy",
                "return=failed unless site has coin_gold",
                "consume=coin_gold",
                "animate=working duration:4m",
                "produce=metal_alloy",
            }
        },
    },
}

pop_textdomain()
