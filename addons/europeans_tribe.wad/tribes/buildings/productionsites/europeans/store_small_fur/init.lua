push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/frisians/warehouse/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_store_fur",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Fur Store"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        build = {
            hotspot = {50, 69}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {50, 69},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            basename = "idle",
            hotspot = {50, 69},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },
    
    size = "medium",
    buildcost = {
        brick = 2,
        grout = 2,
        planks = 2,
        reed = 2
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
        { name = "fur", amount = 12 },
        { name = "leather", amount = 12 },
        { name = "spider_silk", amount = 12 },
        { name = "wool", amount = 12 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skiwoolpped/Did not start trading because ...
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
                "call=trade_fur_copper",
                "sleep=duration:30s",
                "call=trade_leather_copper",
                "sleep=duration:30s",
                "call=trade_spider_silk_copper",
                "sleep=duration:30s",
                "call=trade_wool_copper"
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
                "call=trade_fur_silver",
                "sleep=duration:30s",
                "call=trade_leather_silver",
                "sleep=duration:30s",
                "call=trade_spider_silk_silver",
                "sleep=duration:30s",
                "call=trade_wool_silver"
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
                "call=trade_fur_gold",
                "sleep=duration:30s",
                "call=trade_leather_gold",
                "sleep=duration:30s",
                "call=trade_spider_silk_gold",
                "sleep=duration:30s",
                "call=trade_wool_gold"
            }
        },
        trade_fur_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs fur",
                "return=skipped unless site has gold",
                "consume=fur:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_fur_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs fur",
                "return=skipped unless site has gold",
                "consume=fur:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_fur_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs fur",
                "return=skipped unless site has gold",
                "consume=fur:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_leather_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs leather",
                "return=skipped unless site has gold",
                "consume=leather:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:3",
                "sleep=duration:30s",
            }
        },
        trade_leather_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs leather",
                "return=skipped unless site has gold",
                "consume=leather:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:3",
                "sleep=duration:30s",
            }
        },
        trade_leather_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs leather",
                "return=skipped unless site has gold",
                "consume=leather:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:3",
                "sleep=duration:30s",
            }
        },
        trade_spider_silk_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs spider_silk",
                "return=skipped unless site has gold",
                "consume=spider_silk:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_spider_silk_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs spider_silk",
                "return=skipped unless site has gold",
                "consume=spider_silk:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_spider_silk_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs spider_silk",
                "return=skipped unless site has gold",
                "consume=spider_silk:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
        trade_wool_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs wool",
                "return=skipped unless site has gold",
                "consume=wool:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_wool_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs wool",
                "return=skipped unless site has gold",
                "consume=wool:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_wool_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs wool",
                "return=skipped unless site has gold",
                "consume=wool:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
