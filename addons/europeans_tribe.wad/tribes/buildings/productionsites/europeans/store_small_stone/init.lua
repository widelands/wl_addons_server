push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/empire/warehouse/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_store_stone",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Stone Store"),
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
        brick = 2,
        grout = 2,
        planks = 2,
        marble_column = 2
    },
    return_on_dismantle = {
        scrap_wood = 2
    },
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        prohibited_till = 7200
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 1
    },

    inputs = {
        { name = "gold", amount = 8 },
        { name = "marble", amount = 12 },
        { name = "quartz", amount = 12 },
        { name = "diamond", amount = 12 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skidiamondpped/Did not start trading because ...
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
                "call=trade_ration_copper",
                "sleep=duration:30s",
                "call=trade_quartz_copper",
                "sleep=duration:30s",
                "call=trade_diamond_copper"
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
                "call=trade_ration_silver",
                "sleep=duration:30s",
                "call=trade_quartz_silver",
                "sleep=duration:30s",
                "call=trade_diamond_silver"
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
                "call=trade_ration_gold",
                "sleep=duration:30s",
                "call=trade_quartz_gold",
                "sleep=duration:30s",
                "call=trade_diamond_gold"
            }
        },
        trade_ration_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs marble",
                "return=skipped unless site has gold",
                "consume=marble:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_ration_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs marble",
                "return=skipped unless site has gold",
                "consume=marble:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_ration_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs marble",
                "return=skipped unless site has gold",
                "consume=marble:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_quartz_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs quartz",
                "return=skipped unless site has gold",
                "consume=quartz:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:3",
                "sleep=duration:30s",
            }
        },
        trade_quartz_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs quartz",
                "return=skipped unless site has gold",
                "consume=quartz:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:3",
                "sleep=duration:30s",
            }
        },
        trade_quartz_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs quartz",
                "return=skipped unless site has gold",
                "consume=quartz:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:3",
                "sleep=duration:30s",
            }
        },
        trade_diamond_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs diamond",
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
                "return=skipped when economy needs diamond",
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
                "return=skipped when economy needs diamond",
                "return=skipped unless site has gold",
                "consume=diamond:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
