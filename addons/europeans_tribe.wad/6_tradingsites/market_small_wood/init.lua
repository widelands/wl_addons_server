push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/inn/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_wood",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Wood products Market"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 57, 88 },
        },
    },

    spritesheets = {
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 51, 81 }
        },
        working = {
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 51, 81 }
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
        { name = "gold", amount = 6 },
        { name = "rubber", amount = 16 },
        { name = "blackwood", amount = 16 },
        { name = "planks", amount = 16 }
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
                "return=skipped when economy needs gold and not economy needs coin_copper",
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "sleep=duration:10s",
                "call=trade_rubber_copper",
                "sleep=duration:10s",
                "call=trade_blackwood_copper",
                "sleep=duration:10s",
                "call=trade_planks_copper"
            }
        },
        trading_for_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for silver coins"),
            actions = {
                "return=skipped when economy needs gold and not economy needs coin_silver",
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "sleep=duration:10s",
                "call=trade_rubber_silver",
                "sleep=duration:10s",
                "call=trade_blackwood_silver",
                "sleep=duration:10s",
                "call=trade_planks_silver"
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for gold coins"),
            actions = {
                "return=skipped when economy needs gold and not economy needs coin_gold",
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "sleep=duration:10s",
                "call=trade_rubber_gold",
                "sleep=duration:10s",
                "call=trade_blackwood_gold",
                "sleep=duration:10s",
                "call=trade_planks_gold"
            }
        },
        trade_blackwood_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has blackwood:4",
                "return=skipped unless site has gold",
                "consume=blackwood:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_blackwood_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has blackwood:6",
                "return=skipped unless site has gold",
                "consume=blackwood:6 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_blackwood_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has blackwood:8",
                "return=skipped unless site has gold",
                "consume=blackwood:8 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_planks_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has planks:4",
                "return=skipped unless site has gold",
                "consume=planks:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_planks_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has planks:6",
                "return=skipped unless site has gold",
                "consume=planks:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_planks_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has planks:8",
                "return=skipped unless site has gold",
                "consume=planks:4 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_rubber_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has rubber:4",
                "return=skipped unless site has gold",
                "consume=rubber:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_rubber_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has rubber:6",
                "return=skipped unless site has gold",
                "consume=rubber:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_rubber_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has rubber:8",
                "return=skipped unless site has gold",
                "consume=rubber:4 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        }
    },
}

pop_textdomain()
