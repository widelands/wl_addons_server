push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/amazons/warehouse/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_store_wood_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Wood Store"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {hotspot = {43, 62}},
        working = {basename = "idle", hotspot = {43, 62}},
        build = {hotspot = {43, 62}},
    },
     
    size = "medium",
    buildcost = {
        granite = 3,
        balsa = 3,
        ironwood = 3,
        rope = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 2
    },
    
    aihints = {
        prohibited_till = 10800,
        forced_after = 14400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        atlanteans_trader = 1,
        barbarians_scout = 1,
        amazons_scout = 1,
        atlanteans_scout = 1,
        empire_scout = 1,
        frisians_scout = 1
    },

    inputs = {
        { name = "gold", amount = 8 },
        { name = "ironwood", amount = 12 },
        { name = "balsa", amount = 12 },
        { name = "rubber", amount = 12 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skimealpped/Did not start trading because ...
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
                "sleep=duration:30s",
                "call=trade_ironwood_copper",
                "sleep=duration:30s",
                "call=trade_balsa_copper",
                "sleep=duration:30s",
                "call=trade_rubber_copper"
            }
        },
        trading_for_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for silver coins"),
            actions = {
                "return=skipped when economy needs gold and not economy needs coin_silver",
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "sleep=duration:30s",
                "call=trade_ironwood_silver",
                "sleep=duration:30s",
                "call=trade_balsa_silver",
                "sleep=duration:30s",
                "call=trade_rubber_silver"
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for gold coins"),
            actions = {
                "return=skipped when economy needs gold and not economy needs coin_gold",
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "sleep=duration:30s",
                "call=trade_ironwood_gold",
                "sleep=duration:30s",
                "call=trade_balsa_gold",
                "sleep=duration:30s",
                "call=trade_rubber_gold"
            }
        },
        trade_ironwood_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs ironwood",
                "return=skipped unless site has gold",
                "consume=ironwood:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_ironwood_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs ironwood",
                "return=skipped unless site has gold",
                "consume=ironwood:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_ironwood_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs ironwood",
                "return=skipped unless site has gold",
                "consume=ironwood:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_balsa_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs balsa",
                "return=skipped unless site has gold",
                "consume=balsa:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:3",
                "sleep=duration:30s",
            }
        },
        trade_balsa_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs balsa",
                "return=skipped unless site has gold",
                "consume=balsa:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:3",
                "sleep=duration:30s",
            }
        },
        trade_balsa_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs balsa",
                "return=skipped unless site has gold",
                "consume=balsa:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:3",
                "sleep=duration:30s",
            }
        },
        trade_rubber_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs rubber",
                "return=skipped unless site has gold",
                "consume=rubber:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_rubber_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs rubber",
                "return=skipped unless site has gold",
                "consume=rubber:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_rubber_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs rubber",
                "return=skipped unless site has gold",
                "consume=rubber:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
