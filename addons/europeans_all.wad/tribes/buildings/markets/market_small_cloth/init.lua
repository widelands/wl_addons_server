push_textdomain("europeans_all.wad", true)

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
        normal_ai_limit = 1,
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
        { name = "leather", amount = 16 },
        { name = "wool", amount = 16 },
        { name = "cloth", amount = 6 },
        { name = "armor", amount = 6 }
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
                "call=trade_armor_copper",
                "sleep=duration:30s",
                "call=trade_leather_copper",
                "sleep=duration:30s",
                "call=trade_wool_copper"
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
                "call=trade_armor_silver",
                "sleep=duration:30s",
                "call=trade_leather_silver",
                "sleep=duration:30s",
                "call=trade_wool_silver"
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
                "call=trade_armor_gold",
                "sleep=duration:30s",
                "call=trade_leather_gold",
                "sleep=duration:30s",
                "call=trade_wool_gold"
            }
        },
        trade_armor_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has armor:2",
                "return=skipped unless site has gold",
                "consume=armor:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_armor_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has armor:3",
                "return=skipped unless site has gold",
                "consume=armor:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_armor_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has armor:4",
                "return=skipped unless site has gold",
                "consume=armor:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
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
        trade_wool_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has wool:4",
                "return=skipped unless site has gold",
                "consume=wool:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_wool_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has wool:6",
                "return=skipped unless site has gold",
                "consume=wool:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_wool_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has wool:8",
                "return=skipped unless site has gold",
                "consume=wool:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        }
    },
}

pop_textdomain()
