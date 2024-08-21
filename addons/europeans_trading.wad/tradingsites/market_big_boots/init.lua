push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_boots",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Boots Market"),
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
        brick = 4,
        grout = 4,
        planks = 4,
        marble = 4,
        marble_column = 2,
        cloth = 2,
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
        { name = "gold", amount = 4 },
        { name = "boots_sturdy", amount = 8 },
        { name = "boots_swift", amount = 8 },
        { name = "boots_advanced", amount = 8 }
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
                "call=trade_boots_sturdy_copper",
                "sleep=duration:10s",
                "call=trade_boots_swift_copper",
                "sleep=duration:10s",
                "call=trade_boots_advanced_copper",
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
                "call=trade_boots_sturdy_silver",
                "sleep=duration:10s",
                "call=trade_boots_swift_silver",
                "sleep=duration:10s",
                "call=trade_boots_advanced_silver",
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading goods for gold coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "sleep=duration:10s",
                "call=trade_boots_sturdy_gold",
                "sleep=duration:10s",
                "call=trade_boots_swift_gold",
                "sleep=duration:10s",
                "call=trade_boots_advanced_gold",
            }
        },
        trade_boots_sturdy_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs boots_sturdy and not economy needs coin_copper",
                "return=skipped unless site has boots_sturdy:2",
                "return=skipped unless site has gold",
                "consume=boots_sturdy:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:2",
                "sleep=duration:1m",
            }
        },
        trade_boots_sturdy_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs boots_sturdy and not economy needs coin_silver",
                "return=skipped unless site has boots_sturdy:3",
                "return=skipped unless site has gold",
                "consume=boots_sturdy:3 gold",
                "animate=working duration:1m",
                "produce=coin_silver:2",
                "sleep=duration:1m",
            }
        },
        trade_boots_sturdy_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs boots_sturdy and not economy needs coin_gold",
                "return=skipped unless site has boots_sturdy:4",
                "return=skipped unless site has gold",
                "consume=boots_sturdy:4 gold",
                "animate=working duration:1m",
                "produce=coin_gold:2",
                "sleep=duration:1m",
            }
        },
        trade_boots_swift_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs boots_swift and not economy needs coin_copper",
                "return=skipped unless site has boots_swift:2",
                "return=skipped unless site has gold",
                "consume=boots_swift:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_boots_swift_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs boots_swift and not economy needs coin_silver",
                "return=skipped unless site has boots_swift:3",
                "return=skipped unless site has gold",
                "consume=boots_swift:3 gold",
                "animate=working duration:1m",
                "produce=coin_silver:4",
                "sleep=duration:1m",
            }
        },
        trade_boots_swift_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs boots_swift and not economy needs coin_gold",
                "return=skipped unless site has boots_swift:4",
                "return=skipped unless site has gold",
                "consume=boots_swift:4 gold",
                "animate=working duration:1m",
                "produce=coin_gold:2",
                "sleep=duration:1m",
            }
        },
        trade_boots_advanced_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs boots_advanced and not economy needs coin_copper",
                "return=skipped unless site has boots_advanced:2",
                "return=skipped unless site has gold",
                "consume=boots_advanced:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_boots_advanced_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs boots_advanced and not economy needs coin_silver",
                "return=skipped unless site has boots_advanced:3",
                "return=skipped unless site has gold",
                "consume=boots_advanced:3 gold",
                "animate=working duration:1m",
                "produce=coin_silver:4",
                "sleep=duration:1m",
            }
        },
        trade_boots_advanced_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs boots_advanced and not economy needs coin_gold",
                "return=skipped unless site has boots_advanced:4",
                "return=skipped unless site has gold",
                "consume=boots_advanced:4 gold",
                "animate=working duration:1m",
                "produce=coin_gold:3",
                "sleep=duration:1m",
            }
        },
    },
}

pop_textdomain()
