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
        blackwood = 2,
        cloth = 2,
        grout = 2,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2,
        quartz = 1,
        diamond = 1
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
        { name = "coin_wood", amount = 8 },
        { name = "coin_copper", amount = 8 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trade_granite",
                "call=trade_marble",
                "sleep=duration:10s",
                "call=trade_quartz",
                "call=trade_quartz_copper",
                "sleep=duration:10s",
                "call=trade_diamond",
                "call=trade_diamond_copper",
                "sleep=duration:10s",
                "call=trade_iron",
                "call=trade_iron_copper"
            }
        },
        trade_granite = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs granite",
                "return=failed unless site has coin_wood:4",
                "consume=coin_wood:4",
                "animate=working duration:3m",
                "produce=granite:2",
            }
        },
        trade_marble = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs marble",
                "return=failed unless site has coin_wood:6",
                "consume=coin_wood:6",
                "animate=working duration:3m",
                "produce=marble:2",
            }
        },
        trade_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs quartz",
                "return=failed unless site has coin_wood:6",
                "consume=coin_wood:6",
                "animate=working duration:3m",
                "produce=quartz",
            }
        },
        trade_quartz_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs quartz",
                "return=failed unless site has coin_copper:4",
                "consume=coin_copper:4",
                "animate=working duration:3m",
                "produce=quartz",
            }
        },
        trade_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs diamond",
                "return=failed unless site has coin_wood:8",
                "consume=coin_wood:8",
                "animate=working duration:3m",
                "produce=diamond",
            }
        },
        trade_diamond_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs diamond",
                "return=failed unless site has coin_copper:4",
                "consume=coin_copper:4",
                "animate=working duration:3m",
                "produce=diamond",
            }
        },
        trade_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs iron",
                "return=failed unless site has coin_wood:8",
                "consume=coin_wood:8",
                "animate=working duration:3m",
                "produce=iron",
            }
        },
        trade_iron_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs iron",
                "return=failed unless site has coin_copper:4",
                "consume=coin_copper:4",
                "animate=working duration:3m",
                "produce=iron",
            }
        },
    },
}

pop_textdomain()
