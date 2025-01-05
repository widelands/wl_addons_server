push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_store_small",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Small Store"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 63, 68 }
        },
        working = {
            basename = "idle",
            hotspot = { 63, 68 },
        },
    },
    
    size = "medium",
    destructible = true,
    
    buildcost = {
        brick = 2,
        grout = 2,
        planks = 2,
        marble = 2,
        marble_column = 2,
        cloth = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2
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
        europeans_trader = 1
    },

    inputs = {
        { name = "coin_copper", amount = 10 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trade_granite_copper",
                "sleep=duration:10s",
                "call=trade_marble_copper",
                "sleep=duration:10s",
                "call=trade_metal_alloy_copper",
                "sleep=duration:10s",
                "call=trade_granite_copper",
                "sleep=duration:10s",
                "call=trade_marble_copper",
                "sleep=duration:10s",
                "call=trade_metal_alloy_copper"
            }
        },
        trade_granite_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs granite",
                "return=failed unless site has coin_copper",
                "consume=coin_copper",
                "animate=working duration:3m",
                "produce=granite:2",
            }
        },
        trade_marble_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs marble",
                "return=failed unless site has coin_copper:2",
                "consume=coin_copper:2",
                "animate=working duration:3m",
                "produce=marble:2",
            }
        },
        trade_metal_alloy_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs metal_alloy",
                "return=failed unless site has coin_copper:4",
                "consume=coin_copper:4",
                "animate=working duration:3m",
                "produce=metal_alloy",
            }
        },
    },
}

pop_textdomain()
