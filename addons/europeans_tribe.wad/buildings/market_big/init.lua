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
             basename = "idle", -- TODO(GunChleoc): No animation yet.
             hotspot = { 86, 96 },
        },
    },

    size = "big",
    destructible = true,
    buildcost = {
        blackwood = 6,
        planks = 6,
        cloth = 4,
        reed = 4,
        brick = 4,
        grout = 4,
        marble = 4,
        quartz = 3,
        diamond = 3
    },
    return_on_dismantle = {
        scrap_wood = 8,
        granite = 6,
        marble = 3,
        quartz = 2,
        diamond = 2
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
        { name = "planks", amount = 4 },
        { name = "gold", amount = 4 },
        { name = "ration", amount = 8 },
        { name = "beer", amount = 8 },
        { name = "snack", amount = 8 },
        { name = "mead", amount = 8 },
        { name = "beer_strong", amount = 8 },
        { name = "meal", amount = 8 },
        { name = "wine", amount = 8 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trade_ration",
                "call=trade_ration_copper",
                "call=trade_ration_silver",
                "call=trade_beer",
                "call=trade_beer_copper",
                "call=trade_beer_silver",
                "call=trade_beer_gold",
                "call=trade_snack",
                "call=trade_snack_copper",
                "call=trade_snack_silver",
                "call=trade_mead",
                "call=trade_mead_copper",
                "call=trade_mead_silver",
                "call=trade_meal",
                "call=trade_meal_copper",
                "call=trade_meal_silver",
                "call=trade_meal_gold",
                "call=trade_wine",
                "call=trade_wine_copper",
                "call=trade_wine_silver",
                "call=trade_wine_gold",
            }
        },
        trade_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_wood",
                "return=skipped when economy needs ration",
                "return=skipped unless site has ration:4",
                "return=skipped unless site has planks",
                "consume=ration:4 planks",
                "animate=working duration:15s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_ration_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_copper",
                "return=skipped when economy needs ration",
                "return=skipped unless site has ration:4",
                "return=skipped unless site has gold",
                "consume=ration:4 gold",
                "animate=working duration:15s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_ration_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_silver",
                "return=skipped when economy needs ration",
                "return=skipped unless site has ration:6",
                "return=skipped unless site has gold",
                "consume=ration:6 gold",
                "animate=working duration:15s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_wood",
                "return=skipped when economy needs beer",
                "return=skipped unless site has beer:4",
                "return=skipped unless site has planks",
                "consume=beer:4 planks",
                "animate=working duration:15s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_beer_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_copper",
                "return=skipped when economy needs beer",
                "return=skipped unless site has beer:4",
                "return=skipped unless site has gold",
                "consume=beer:4 gold",
                "animate=working duration:15s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_beer_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_silver",
                "return=skipped when economy needs beer",
                "return=skipped unless site has beer:6",
                "return=skipped unless site has gold",
                "consume=beer:6 gold",
                "animate=working duration:15s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_beer_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_gold",
                "return=skipped when economy needs beer_strong",
                "return=skipped unless site has beer_strong:8",
                "return=skipped unless site has gold",
                "consume=beer_strong:8 gold",
                "animate=working duration:15s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
        trade_snack = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_wood",
                "return=skipped when economy needs snack",
                "return=skipped unless site has snack:4",
                "return=skipped unless site has planks",
                "consume=snack:4 planks",
                "animate=working duration:15s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_snack_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_copper",
                "return=skipped when economy needs snack",
                "return=skipped unless site has snack:4",
                "return=skipped unless site has gold",
                "consume=snack:4 gold",
                "animate=working duration:15s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_snack_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_silver",
                "return=skipped when economy needs snack",
                "return=skipped unless site has snack:6",
                "return=skipped unless site has gold",
                "consume=snack:6 gold",
                "animate=working duration:15s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_mead = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_wood",
                "return=skipped when economy needs mead",
                "return=skipped unless site has mead:4",
                "return=skipped unless site has planks",
                "consume=mead:4 planks",
                "animate=working duration:15s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_mead_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_copper",
                "return=skipped when economy needs mead",
                "return=skipped unless site has mead:4",
                "return=skipped unless site has gold",
                "consume=mead:4 gold",
                "animate=working duration:15s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_mead_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_silver",
                "return=skipped when economy needs mead",
                "return=skipped unless site has mead:6",
                "return=skipped unless site has gold",
                "consume=mead:6 gold",
                "animate=working duration:15s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_meal = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_wood",
                "return=skipped when economy needs meal",
                "return=skipped unless site has meal:2",
                "return=skipped unless site has planks",
                "consume=meal:2 planks",
                "animate=working duration:15s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_meal_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_copper",
                "return=skipped when economy needs meal",
                "return=skipped unless site has meal:4",
                "return=skipped unless site has gold",
                "consume=meal:4 gold",
                "animate=working duration:15s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_meal_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_silver",
                "return=skipped when economy needs meal",
                "return=skipped unless site has meal:4",
                "return=skipped unless site has gold",
                "consume=meal:4 gold",
                "animate=working duration:15s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_meal_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_gold",
                "return=skipped when economy needs meal",
                "return=skipped unless site has meal:6",
                "return=skipped unless site has gold",
                "consume=meal:6 gold",
                "animate=working duration:15s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
        trade_wine = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_wood",
                "return=skipped when economy needs wine",
                "return=skipped unless site has wine:2",
                "return=skipped unless site has planks",
                "consume=wine:2 planks",
                "animate=working duration:15s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_wine_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_copper",
                "return=skipped when economy needs wine",
                "return=skipped unless site has wine:4",
                "return=skipped unless site has gold",
                "consume=wine:4 gold",
                "animate=working duration:15s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_wine_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_silver",
                "return=skipped when economy needs wine",
                "return=skipped unless site has wine:4",
                "return=skipped unless site has gold",
                "consume=wine:4 gold",
                "animate=working duration:15s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_wine_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_gold",
                "return=skipped when economy needs wine",
                "return=skipped unless site has wine:6",
                "return=skipped unless site has gold",
                "consume=wine:6 gold",
                "animate=working duration:15s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
