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
        marble = 4,
        marble_column = 2,
        cloth = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4,
        marble = 5
    },
    
    aihints = {
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        normal_ai_limit = 6,
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 1
    },

    inputs = {
        { name = "gold", amount = 8 },
        { name = "beer", amount = 10 },
        { name = "bread", amount = 10 },
        { name = "mead", amount = 10 },
        { name = "honey_bread", amount = 10 },
        { name = "beer_strong", amount = 10 },
        { name = "biscuit", amount = 10 },
        { name = "wine", amount = 10 },
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
                "call=trade_beer_copper",
                "sleep=duration:10s",
                "call=trade_bread_copper",
                "sleep=duration:10s",
                "call=trade_mead_copper",
                "sleep=duration:10s",
                "call=trade_honey_bread_copper",
                "sleep=duration:10s",
                "call=trade_beer_strong_copper",
                "sleep=duration:10s",
                "call=trade_biscuit_copper",
                "sleep=duration:10s",
                "call=trade_wine_copper"
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
                "call=trade_beer_silver",
                "sleep=duration:10s",
                "call=trade_bread_silver",
                "sleep=duration:10s",
                "call=trade_mead_silver",
                "sleep=duration:10s",
                "call=trade_honey_bread_silver",
                "sleep=duration:10s",
                "call=trade_beer_strong_silver",
                "sleep=duration:10s",
                "call=trade_biscuit_silver",
                "sleep=duration:10s",
                "call=trade_wine_silver"
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
                "call=trade_beer_gold",
                "sleep=duration:10s",
                "call=trade_bread_gold",
                "sleep=duration:10s",
                "call=trade_mead_gold",
                "sleep=duration:10s",
                "call=trade_honey_bread_gold",
                "sleep=duration:10s",
                "call=trade_beer_strong_gold",
                "sleep=duration:10s",
                "call=trade_biscuit_gold",
                "sleep=duration:10s",
                "call=trade_wine_gold"
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
        trade_beer_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has beer:2",
                "return=skipped unless site has gold",
                "consume=beer:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_beer_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has beer:3",
                "return=skipped unless site has gold",
                "consume=beer:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_beer_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has beer:4",
                "return=skipped unless site has gold",
                "consume=beer:4 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_beer_strong_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has beer_strong:2",
                "return=skipped unless site has gold",
                "consume=beer_strong:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_beer_strong_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has beer_strong:3",
                "return=skipped unless site has gold",
                "consume=beer_strong:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_beer_strong_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has beer_strong:4",
                "return=skipped unless site has gold",
                "consume=beer_strong:4 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
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
        trade_mead_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has mead:2",
                "return=skipped unless site has gold",
                "consume=mead:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_mead_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has mead:3",
                "return=skipped unless site has gold",
                "consume=mead:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_mead_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has mead:4",
                "return=skipped unless site has gold",
                "consume=mead:4 gold",
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
        trade_wine_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has wine:2",
                "return=skipped unless site has gold",
                "consume=wine:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_wine_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has wine:3",
                "return=skipped unless site has gold",
                "consume=wine:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_wine_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has wine:4",
                "return=skipped unless site has gold",
                "consume=wine:4 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
