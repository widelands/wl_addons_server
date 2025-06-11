push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_stone",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Mining products Market"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 58, 58 },
        },
        working = {
            basename = "idle",
            hotspot = { 58, 58 },
        },
    },
    
    size = "medium",
    destructible = true,
    
    buildcost = {
        brick = 2,
        grout = 2,
        planks = 2,
        marble_column = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2,
        marble = 2
    },
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 1,
        prohibited_till = 7200
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 1
    },

    inputs = {
        { name = "gold", amount = 6 },
        { name = "marble", amount = 10 },
        { name = "marble_column", amount = 10 },
        { name = "diamond", amount = 10 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trading_for_copper",
                "sleep=duration:30s",
                "call=trading_for_silver",
                "sleep=duration:30s",
                "call=trading_for_gold"
            }
        },
        trading_for_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for copper coins"),
            actions = {
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "sleep=duration:30s",
                "call=trade_marble_copper",
                "sleep=duration:30s",
                "call=trade_marble_column_copper",
                "sleep=duration:30s",
                "call=trade_diamond_copper"
            }
        },
        trading_for_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for silver coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "sleep=duration:30s",
                "call=trade_marble_silver",
                "sleep=duration:30s",
                "call=trade_marble_column_silver",
                "sleep=duration:30s",
                "call=trade_diamond_silver"
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for gold coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "sleep=duration:30s",
                "call=trade_marble_gold",
                "sleep=duration:30s",
                "call=trade_marble_column_gold",
                "sleep=duration:30s",
                "call=trade_diamond_gold"
            }
        },
        trade_diamond_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has diamond:4",
                "return=skipped unless site has gold",
                "consume=diamond:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_diamond_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has diamond:6",
                "return=skipped unless site has gold",
                "consume=diamond:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_diamond_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has diamond:8",
                "return=skipped unless site has gold",
                "consume=diamond:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
        trade_marble_column_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has marble_column:4",
                "return=skipped unless site has gold",
                "consume=marble_column:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_marble_column_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has marble_column:6",
                "return=skipped unless site has gold",
                "consume=marble_column:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_marble_column_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has marble_column:8",
                "return=skipped unless site has gold",
                "consume=marble_column:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
        trade_marble_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has marble:4",
                "return=skipped unless site has gold",
                "consume=marble:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_marble_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has marble:6",
                "return=skipped unless site has gold",
                "consume=marble:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_marble_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has marble:8",
                "return=skipped unless site has gold",
                "consume=marble:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        }
    },
}

pop_textdomain()
