push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/atlanteans/warehouse/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_cloth",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Cloth Market"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 63, 88 },
        },
        working = {
            basename = "idle",
            hotspot = { 63, 88 },
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
        { name = "rope", amount = 16 },
        { name = "leather", amount = 16 },
        { name = "fur", amount = 16 },
        { name = "cloth", amount = 12 },
        { name = "spidercloth", amount = 12 }
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
                "call=trade_cloth_copper",
                "sleep=duration:30s",
                "call=trade_spidercloth_copper",
                "sleep=duration:30s",
                "call=trade_rope_copper",
                "sleep=duration:30s",
                "call=trade_fur_copper",
                "sleep=duration:30s",
                "call=trade_leather_copper"
            }
        },
        trading_for_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for silver coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "sleep=duration:30s",
                "call=trade_cloth_silver",
                "sleep=duration:30s",
                "call=trade_spidercloth_silver",
                "sleep=duration:30s",
                "call=trade_rope_silver",
                "sleep=duration:30s",
                "call=trade_fur_silver",
                "sleep=duration:30s",
                "call=trade_leather_silver"
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for gold coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "sleep=duration:30s",
                "call=trade_cloth_gold",
                "sleep=duration:30s",
                "call=trade_spidercloth_gold",
                "sleep=duration:30s",
                "call=trade_rope_gold",
                "sleep=duration:30s",
                "call=trade_fur_gold",
                "sleep=duration:30s",
                "call=trade_leather_gold"
            }
        },
        trade_cloth_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has cloth:2",
                "return=skipped unless site has gold",
                "consume=cloth:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_cloth_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has cloth:3",
                "return=skipped unless site has gold",
                "consume=cloth:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_cloth_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has cloth:4",
                "return=skipped unless site has gold",
                "consume=cloth:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_fur_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has fur:2",
                "return=skipped unless site has gold",
                "consume=fur:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_fur_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has fur:3",
                "return=skipped unless site has gold",
                "consume=fur:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_fur_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has fur:4",
                "return=skipped unless site has gold",
                "consume=fur:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_leather_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has leather:4",
                "return=skipped unless site has gold",
                "consume=leather:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_leather_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has leather:6",
                "return=skipped unless site has gold",
                "consume=leather:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_leather_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has leather:8",
                "return=skipped unless site has gold",
                "consume=leather:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_rope_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has rope:4",
                "return=skipped unless site has gold",
                "consume=rope:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_rope_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has rope:6",
                "return=skipped unless site has gold",
                "consume=rope:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_rope_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has rope:8",
                "return=skipped unless site has gold",
                "consume=rope:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_spidercloth_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has spidercloth:2",
                "return=skipped unless site has gold",
                "consume=spidercloth:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_spidercloth_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has spidercloth:3",
                "return=skipped unless site has gold",
                "consume=spidercloth:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_spidercloth_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has spidercloth:4",
                "return=skipped unless site has gold",
                "consume=spidercloth:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        }
    },
}

pop_textdomain()
