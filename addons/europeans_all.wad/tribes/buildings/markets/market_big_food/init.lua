push_textdomain("tribes")

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_food",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Food Market"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 64, 106 }
      },
      working = {
         basename = "idle",
         hotspot = { 64, 106 }
      },
    },
    
    size = "big",
    destructible = true,
    
    buildcost = {
        brick = 4,
        grout = 4,
        planks = 4,
        marble_column = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4,
        marble = 2
    },
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
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
        { name = "ration", amount = 12 },
        { name = "snack", amount = 12 },
        { name = "meal", amount = 12 },
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
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "sleep=duration:30s",
                "call=trade_ration_copper",
                "sleep=duration:30s",
                "call=trade_snack_copper",
                "sleep=duration:30s",
                "call=trade_meal_copper"
            }
        },
        trading_for_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for silver coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "sleep=duration:30s",
                "call=trade_ration_silver",
                "sleep=duration:30s",
                "call=trade_snack_silver",
                "sleep=duration:30s",
                "call=trade_meal_silver"
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for gold coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "sleep=duration:30s",
                "call=trade_ration_gold",
                "sleep=duration:30s",
                "call=trade_snack_gold",
                "sleep=duration:30s",
                "call=trade_meal_gold"
            }
        },
        trade_ration_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has ration:2",
                "return=skipped unless site has gold",
                "consume=ration:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_ration_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has ration:3",
                "return=skipped unless site has gold",
                "consume=ration:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_ration_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has ration:4",
                "return=skipped unless site has gold",
                "consume=ration:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_snack_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has snack:2",
                "return=skipped unless site has gold",
                "consume=snack:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:3",
                "sleep=duration:30s",
            }
        },
        trade_snack_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has snack:3",
                "return=skipped unless site has gold",
                "consume=snack:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:3",
                "sleep=duration:30s",
            }
        },
        trade_snack_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has snack:4",
                "return=skipped unless site has gold",
                "consume=snack:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:3",
                "sleep=duration:30s",
            }
        },
        trade_meal_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has meal:2",
                "return=skipped unless site has gold",
                "consume=meal:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_meal_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has meal:3",
                "return=skipped unless site has gold",
                "consume=meal:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_meal_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has meal:4",
                "return=skipped unless site has gold",
                "consume=meal:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
