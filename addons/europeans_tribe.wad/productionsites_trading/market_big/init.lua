push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_big",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Big Market"),
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
        { name = "blackwood", amount = 12 },
        { name = "planks", amount = 12 },
        { name = "cloth", amount = 12 },
        { name = "armor", amount = 12 },
        { name = "rubber", amount = 12 },
        { name = "leather", amount = 12 }
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
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "sleep=duration:10s",
                "call=trade_armor_copper",
                "sleep=duration:10s",
                "call=trade_blackwood_copper",
                "sleep=duration:10s",
                "call=trade_planks_copper",
                "sleep=duration:10s",
                "call=trade_cloth_copper",
                "sleep=duration:10s",
                "call=trade_rubber_copper",
                "sleep=duration:10s",
                "call=trade_leather_copper"
            }
        },
        trading_for_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading goods for silver coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "return=skipped when economy needs coin_wood and not economy needs coin_silver",
                "sleep=duration:10s",
                "call=trade_armor_silver",
                "sleep=duration:10s",
                "call=trade_blackwood_silver",
                "sleep=duration:10s",
                "call=trade_planks_silver",
                "sleep=duration:10s",
                "call=trade_cloth_silver",
                "sleep=duration:10s",
                "call=trade_rubber_silver",
                "sleep=duration:10s",
                "call=trade_leather_silver"
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading goods for gold coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "return=skipped when economy needs coin_wood and not economy needs coin_gold",
                "sleep=duration:10s",
                "call=trade_armor_gold",
                "sleep=duration:10s",
                "call=trade_blackwood_gold",
                "sleep=duration:10s",
                "call=trade_planks_gold",
                "sleep=duration:10s",
                "call=trade_cloth_gold",
                "sleep=duration:10s",
                "call=trade_rubber_gold",
                "sleep=duration:10s",
                "call=trade_leather_gold"
            }
        },
        trade_armor_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor and not economy needs coin_copper",
                "return=skipped unless site has armor:4",
                "return=skipped unless site has gold",
                "consume=armor:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_armor_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor and not economy needs coin_silver",
                "return=skipped unless site has armor:6",
                "return=skipped unless site has gold",
                "consume=armor:4 gold",
                "animate=working duration:1m",
                "produce=coin_silver:4",
                "sleep=duration:1m",
            }
        },
        trade_armor_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor and not economy needs coin_gold",
                "return=skipped unless site has armor:8",
                "return=skipped unless site has gold",
                "consume=armor:6 gold",
                "animate=working duration:1m",
                "produce=coin_gold:4",
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
                "produce=coin_copper:4",
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
                "produce=coin_silver:4",
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
                "produce=coin_gold:4",
                "sleep=duration:1m",
            }
        },
        trade_cloth_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cloth and not economy needs coin_copper",
                "return=skipped unless site has cloth:4",
                "return=skipped unless site has gold",
                "consume=cloth:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_cloth_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cloth and not economy needs coin_silver",
                "return=skipped unless site has cloth:6",
                "return=skipped unless site has gold",
                "consume=cloth:4 gold",
                "animate=working duration:1m",
                "produce=coin_silver:4",
                "sleep=duration:1m",
            }
        },
        trade_cloth_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cloth and not economy needs coin_gold",
                "return=skipped unless site has cloth:8",
                "return=skipped unless site has gold",
                "consume=cloth:6 gold",
                "animate=working duration:1m",
                "produce=coin_gold:4",
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
        trade_rubber_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs rubber and not economy needs coin_copper",
                "return=skipped unless site has rubber:4",
                "return=skipped unless site has gold",
                "consume=rubber:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_rubber_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs rubber and not economy needs coin_silver",
                "return=skipped unless site has rubber:6",
                "return=skipped unless site has gold",
                "consume=rubber:4 gold",
                "animate=working duration:1m",
                "produce=coin_silver:4",
                "sleep=duration:1m",
            }
        },
        trade_rubber_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs rubber and not economy needs coin_gold",
                "return=skipped unless site has rubber:8",
                "return=skipped unless site has gold",
                "consume=rubber:6 gold",
                "animate=working duration:1m",
                "produce=coin_gold:4",
                "sleep=duration:1m",
            }
        },
        trade_leather_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs leather and not economy needs coin_copper",
                "return=skipped unless site has leather:4",
                "return=skipped unless site has gold",
                "consume=leather:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_leather_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs leather and not economy needs coin_silver",
                "return=skipped unless site has leather:6",
                "return=skipped unless site has gold",
                "consume=leather:4 gold",
                "animate=working duration:1m",
                "produce=coin_silver:4",
                "sleep=duration:1m",
            }
        },
        trade_leather_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs leather and not economy needs coin_gold",
                "return=skipped unless site has leather:8",
                "return=skipped unless site has gold",
                "consume=leather:6 gold",
                "animate=working duration:1m",
                "produce=coin_gold:4",
                "sleep=duration:1m",
            }
        }
    },
}

pop_textdomain()
