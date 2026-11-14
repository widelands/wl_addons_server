push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/empire/warehouse/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_store_food",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Food Store"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 58, 58 }
        },
        working = {
            basename = "idle",
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 58, 58 }
        }
    },

    size = "medium",
    buildcost = {
        brick = 3,
        grout = 3,
        planks = 3,
        marble_column = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        brick = 2,
        grout = 2,
        marble_column = 1
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
        { name = "blackroot", amount = 18 },
        { name = "cassavaroot", amount = 18 },
        { name = "cocoa_beans", amount = 18 },
        { name = "fruit", amount = 18 },
        { name = "grape", amount = 18 }
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
                "call=trade_blackroot_copper",
                "sleep=duration:30s",
                "call=trade_cassavaroot_copper",
                "sleep=duration:30s",
                "call=trade_cocoa_beans_copper",
                "sleep=duration:30s",
                "call=trade_fruit_copper",
                "sleep=duration:30s",
                "call=trade_grape_copper"
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
                "call=trade_blackroot_silver",
                "sleep=duration:30s",
                "call=trade_cassavaroot_silver",
                "sleep=duration:30s",
                "call=trade_cocoa_beans_silver",
                "sleep=duration:30s",
                "call=trade_fruit_silver",
                "sleep=duration:30s",
                "call=trade_grape_silver"
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
                "call=trade_blackroot_gold",
                "sleep=duration:30s",
                "call=trade_cassavaroot_gold",
                "sleep=duration:30s",
                "call=trade_cocoa_beans_gold",
                "sleep=duration:30s",
                "call=trade_fruit_gold",
                "sleep=duration:30s",
                "call=trade_grape_gold"
            }
        },
        trade_blackroot_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs blackroot",
                "return=skipped unless site has gold",
                "consume=blackroot:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_blackroot_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs blackroot",
                "return=skipped unless site has gold",
                "consume=blackroot:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_blackroot_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs blackroot",
                "return=skipped unless site has gold",
                "consume=blackroot:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_cassavaroot_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cassavaroot",
                "return=skipped unless site has gold",
                "consume=cassavaroot:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_cassavaroot_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cassavaroot",
                "return=skipped unless site has gold",
                "consume=cassavaroot:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_cassavaroot_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cassavaroot",
                "return=skipped unless site has gold",
                "consume=cassavaroot:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_cocoa_beans_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cocoa_beans",
                "return=skipped unless site has gold",
                "consume=cocoa_beans:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_cocoa_beans_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cocoa_beans",
                "return=skipped unless site has gold",
                "consume=cocoa_beans:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_cocoa_beans_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cocoa_beans",
                "return=skipped unless site has gold",
                "consume=cocoa_beans:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_fruit_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs fruit",
                "return=skipped unless site has gold",
                "consume=fruit:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_fruit_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs fruit",
                "return=skipped unless site has gold",
                "consume=fruit:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_fruit_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs fruit",
                "return=skipped unless site has gold",
                "consume=fruit:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_grape_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs grape",
                "return=skipped unless site has gold",
                "consume=grape:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_grape_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs grape",
                "return=skipped unless site has gold",
                "consume=grape:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_grape_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs grape",
                "return=skipped unless site has gold",
                "consume=grape:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
