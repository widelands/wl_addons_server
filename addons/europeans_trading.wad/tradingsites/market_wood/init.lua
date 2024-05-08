push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_wood",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Wood Market"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 86, 96 },
        },
        working = {
             basename = "idle",
             hotspot = { 86, 96 },
        },
    },

    size = "big",
    destructible = true,
    
    buildcost = {
        planks = 4,
        brick = 4,
        marble = 4,
        marble_column = 2,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4,
        marble = 5,
        quartz = 1,
        diamond = 1
    },
    
    aihints = {
          very_weak_ai_limit = 1,
          weak_ai_limit = 2,
          normal_ai_limit = 4,
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 3
    },

    inputs = {
        { name = "gold", amount = 8 },
        { name = "log", amount = 12 },
        { name = "blackwood", amount = 12 },
        { name = "planks", amount = 12 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trading_for_copper",
                "sleep=duration:15s",
                "call=trading_for_silver",
                "sleep=duration:15s",
                "call=trading_for_gold"
            }
        },
        trading_for_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading goods for copper coins"),
            actions = {
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "sleep=duration:10s",
                "call=trade_log_copper",
                "sleep=duration:10s",
                "call=trade_blackwood_copper",
                "sleep=duration:10s",
                "call=trade_planks_copper",
                "sleep=duration:10s",
            }
        },
        trading_for_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading goods for silver coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "sleep=duration:10s",
                "call=trade_log_silver",
                "sleep=duration:10s",
                "call=trade_blackwood_silver",
                "sleep=duration:10s",
                "call=trade_planks_silver",
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading goods for gold coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "sleep=duration:10s",
                "call=trade_log_gold",
                "sleep=duration:10s",
                "call=trade_blackwood_gold",
                "sleep=duration:10s",
                "call=trade_planks_gold",
            }
        },
        trade_log_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs log and not economy needs coin_copper",
                "return=skipped unless site has log:4",
                "return=skipped unless site has gold",
                "consume=log:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:2",
                "sleep=duration:1m",
            }
        },
        trade_log_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs log and not economy needs coin_silver",
                "return=skipped unless site has log:6",
                "return=skipped unless site has gold",
                "consume=log:4 gold",
                "animate=working duration:1m",
                "produce=coin_silver:2",
                "sleep=duration:1m",
            }
        },
        trade_log_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs log and not economy needs coin_gold",
                "return=skipped unless site has log:8",
                "return=skipped unless site has gold",
                "consume=log:6 gold",
                "animate=working duration:1m",
                "produce=coin_gold:2",
                "sleep=duration:1m",
            }
        },
        trade_blackwood_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs coin_copper",
                "return=skipped unless site has blackwood:4",
                "return=skipped unless site has gold",
                "consume=blackwood:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:3",
                "sleep=duration:1m",
            }
        },
        trade_blackwood_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs coin_silver",
                "return=skipped unless site has blackwood:6",
                "return=skipped unless site has gold",
                "consume=blackwood:4 gold",
                "animate=working duration:1m",
                "produce=coin_silver:3",
                "sleep=duration:1m",
            }
        },
        trade_blackwood_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs coin_gold",
                "return=skipped unless site has blackwood:8",
                "return=skipped unless site has gold",
                "consume=blackwood:6 gold",
                "animate=working duration:1m",
                "produce=coin_gold:3",
                "sleep=duration:1m",
            }
        },
        trade_planks_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs planks and not economy needs coin_copper",
                "return=skipped unless site has planks:4",
                "return=skipped unless site has gold",
                "consume=planks:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_planks_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs planks and not economy needs coin_silver",
                "return=skipped unless site has planks:6",
                "return=skipped unless site has gold",
                "consume=planks:4 gold",
                "animate=working duration:1m",
                "produce=coin_silver:4",
                "sleep=duration:1m",
            }
        },
        trade_planks_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs planks and not economy needs coin_gold",
                "return=skipped unless site has planks:8",
                "return=skipped unless site has gold",
                "consume=planks:6 gold",
                "animate=working duration:1m",
                "produce=coin_gold:4",
                "sleep=duration:1m",
            }
        },
    },
}

pop_textdomain()
