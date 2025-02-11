push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_bread",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Bread Market"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 46, 74 },
        },
        working = {
            basename = "idle", -- TODO(GunChleoc): No animation yet.
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 46, 74 },
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
        { name = "bread", amount = 8 },
        { name = "honey_bread", amount = 8 },
        { name = "biscuit", amount = 8 }
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
                "call=pausing_production_for_gold",
                "sleep=duration:10s",
                "call=trade_biscuit_copper",
                "sleep=duration:10s",
                "call=trade_honey_bread_copper",
                "sleep=duration:10s",
                "call=trade_bread_copper"
            }
        },
        trading_for_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for silver coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "call=pausing_production_for_gold",
                "sleep=duration:10s",
                "call=trade_biscuit_silver",
                "sleep=duration:10s",
                "call=trade_honey_bread_silver",
                "sleep=duration:10s",
                "call=trade_bread_silver"
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for gold coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "call=pausing_production_for_gold",
                "sleep=duration:10s",
                "call=trade_biscuit_gold",
                "sleep=duration:10s",
                "call=trade_honey_bread_gold",
                "sleep=duration:10s",
                "call=trade_bread_gold"
            }
        },
        pausing_production_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing trading of gold"),
            actions = {
                "return=skipped when site has gold:4",
                "sleep=duration:15m",
            }
        },
        trade_bread_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has bread:2",
                "return=skipped unless site has gold",
                "consume=bread:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_bread_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has bread:3",
                "return=skipped unless site has gold",
                "consume=bread:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_bread_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has bread:4",
                "return=skipped unless site has gold",
                "consume=bread:4 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_honey_bread_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has honey_bread:2",
                "return=skipped unless site has gold",
                "consume=honey_bread:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_honey_bread_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has honey_bread:3",
                "return=skipped unless site has gold",
                "consume=honey_bread:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_honey_bread_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has honey_bread:4",
                "return=skipped unless site has gold",
                "consume=honey_bread:4 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_biscuit_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has biscuit:2",
                "return=skipped unless site has gold",
                "consume=biscuit:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_biscuit_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has biscuit:3",
                "return=skipped unless site has gold",
                "consume=biscuit:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_biscuit_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has biscuit:4",
                "return=skipped unless site has gold",
                "consume=biscuit:4 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
