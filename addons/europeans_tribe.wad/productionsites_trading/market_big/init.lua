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
          prohibited_till = 7200,
          forced_after = 9600
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 3
    },

    inputs = {
        { name = "planks", amount = 8 },
        { name = "gold", amount = 8 },
        { name = "fruit", amount = 12 },
        { name = "grape", amount = 12 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trading_for_wood",
                "sleep=duration:15s",
                "call=trading_for_copper",
                "sleep=duration:15s",
                "call=trading_for_wood",
                "sleep=duration:15s",
                "call=trading_for_silver",
                "sleep=duration:15s",
                "call=trading_for_wood",
                "sleep=duration:15s",
                "call=trading_for_gold"
            }
        },
        trading_for_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing trading because ...
            descname = pgettext("europeans_building", "trading food for wood coins"),
            actions = {
                "return=skipped unless economy needs coin_wood",
                "call=pausing_production_for_planks",
                "sleep=duration:15s",
                "call=trade_fruit",
                "sleep=duration:15s",
                "call=trade_grape"
            }
        },
        trading_for_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing trading because ...
            descname = pgettext("europeans_building", "trading food for copper coins"),
            actions = {
                "return=skipped unless economy needs coin_copper",
                "call=pausing_production_for_gold",
                "sleep=duration:10s",
                "call=trade_fruit_copper",
                "sleep=duration:10s",
                "call=trade_grape_copper"
            }
        },
        trading_for_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing trading because ...
            descname = pgettext("europeans_building", "trading food for silver coins"),
            actions = {
                "return=skipped unless economy needs coin_silver",
                "call=pausing_production_for_gold",
                "sleep=duration:10s",
                "call=trade_fruit_silver",
                "sleep=duration:10s",
                "call=trade_grape_silver"
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing trading because ...
            descname = pgettext("europeans_building", "trading food for gold coins"),
            actions = {
                "return=skipped unless economy needs coin_gold",
                "call=pausing_production_for_gold",
                "sleep=duration:10s",
                "call=trade_fruit_gold",
                "sleep=duration:10s",
                "call=trade_grape_gold"
            }
        },
        pausing_production_for_planks = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing trading of planks"),
            actions = {
                "return=skipped when site has planks:4",
                "sleep=duration:5m",
            }
        },
        pausing_production_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing trading of gold"),
            actions = {
                "return=skipped when site has gold:4",
                "sleep=duration:5m",
            }
        },
        trade_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
                "return=skipped when economy needs coin_silver and not economy needs coin_wood",
                "return=skipped when economy needs coin_gold and not economy needs coin_wood",
                "return=skipped unless site has grape:2",
                "return=skipped unless site has planks",
                "consume=grape:2 planks",
                "animate=working duration:30s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_grape_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "return=skipped unless site has grape:4",
                "return=skipped unless site has gold",
                "consume=grape:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_grape_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_silver",
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "return=skipped unless site has grape:6",
                "return=skipped unless site has gold",
                "consume=grape:4 gold",
                "animate=working duration:30s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_grape_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_gold",
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "return=skipped unless site has grape:8",
                "return=skipped unless site has gold",
                "consume=grape:6 gold",
                "animate=working duration:30s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
        trade_fruit = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
                "return=skipped when economy needs coin_silver and not economy needs coin_wood",
                "return=skipped unless site has fruit:2",
                "return=skipped unless site has planks",
                "consume=fruit:4 planks",
                "animate=working duration:30s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_fruit_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "return=skipped unless site has fruit:4",
                "return=skipped unless site has gold",
                "consume=fruit:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_fruit_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_silver",
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "return=skipped unless site has fruit:6",
                "return=skipped unless site has gold",
                "consume=fruit:6 gold",
                "animate=working duration:30s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_fruit_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_gold",
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "return=skipped unless site has fruit:8",
                "return=skipped unless site has gold",
                "consume=fruit:8 gold",
                "animate=working duration:30s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
