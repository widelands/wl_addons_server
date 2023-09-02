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
        blackwood = 4,
        planks = 4,
        cloth = 4,
        brick = 4,
        grout = 4,
        marble = 4,
        marble_column = 1,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 8,
        granite = 6,
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
        { name = "planks", amount = 4 },
        { name = "gold", amount = 4 },
        { name = "bread", amount = 12 },
        { name = "meat", amount = 12 },
        { name = "fish", amount = 12 },
        { name = "beer", amount = 12 },
        { name = "mead", amount = 12 },
        { name = "beer_strong", amount = 12 },
        { name = "wine", amount = 12 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trade_bread",
                "call=trade_bread_copper",
                "call=trade_bread_silver",
                "call=trade_beer",
                "call=trade_beer_copper",
                "call=trade_beer_silver",
                "call=trade_beer_gold",
                "call=trade_meat",
                "call=trade_meat_copper",
                "call=trade_meat_silver",
                "call=trade_mead",
                "call=trade_mead_copper",
                "call=trade_mead_silver",
                "call=trade_fish",
                "call=trade_fish_copper",
                "call=trade_fish_silver",
                "call=trade_fish_gold",
                "call=trade_wine",
                "call=trade_wine_copper",
                "call=trade_wine_silver",
                "call=trade_wine_gold",
            }
        },
        trade_bread = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
                "return=skipped when economy needs coin_silver and not economy needs coin_wood",
                "return=skipped unless site has bread:4",
                "return=skipped unless site has planks",
                "consume=bread:4 planks",
                "animate=working duration:30s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_bread_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "return=skipped unless site has bread:4",
                "return=skipped unless site has gold",
                "consume=bread:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_bread_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_silver",
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "return=skipped unless site has bread:6",
                "return=skipped unless site has gold",
                "consume=bread:6 gold",
                "animate=working duration:30s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
                "return=skipped when economy needs coin_silver and not economy needs coin_wood",
                "return=skipped unless site has beer:4",
                "return=skipped unless site has planks",
                "consume=beer:4 planks",
                "animate=working duration:30s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_beer_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "return=skipped unless site has beer:4",
                "return=skipped unless site has gold",
                "consume=beer:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_beer_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_silver",
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "return=skipped unless site has beer:6",
                "return=skipped unless site has gold",
                "consume=beer:6 gold",
                "animate=working duration:30s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_beer_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_gold",
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "return=skipped unless site has beer_strong:8",
                "return=skipped unless site has gold",
                "consume=beer_strong:8 gold",
                "animate=working duration:30s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
        trade_meat = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
                "return=skipped when economy needs coin_silver and not economy needs coin_wood",
                "return=skipped unless site has meat:4",
                "return=skipped unless site has planks",
                "consume=meat:4 planks",
                "animate=working duration:30s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_meat_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "return=skipped unless site has meat:4",
                "return=skipped unless site has gold",
                "consume=meat:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_meat_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_silver",
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "return=skipped unless site has meat:6",
                "return=skipped unless site has gold",
                "consume=meat:6 gold",
                "animate=working duration:30s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_mead = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
                "return=skipped when economy needs coin_silver and not economy needs coin_wood",
                "return=skipped unless site has mead:4",
                "return=skipped unless site has planks",
                "consume=mead:4 planks",
                "animate=working duration:30s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_mead_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "return=skipped unless site has mead:4",
                "return=skipped unless site has gold",
                "consume=mead:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_mead_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_silver",
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "return=skipped unless site has mead:6",
                "return=skipped unless site has gold",
                "consume=mead:6 gold",
                "animate=working duration:30s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_fish = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
                "return=skipped when economy needs coin_silver and not economy needs coin_wood",
                "return=skipped when economy needs coin_gold and not economy needs coin_wood",
                "return=skipped unless site has fish:2",
                "return=skipped unless site has planks",
                "consume=fish:2 planks",
                "animate=working duration:30s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_fish_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "return=skipped unless site has fish:4",
                "return=skipped unless site has gold",
                "consume=fish:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_fish_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_silver",
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "return=skipped unless site has fish:4",
                "return=skipped unless site has gold",
                "consume=fish:4 gold",
                "animate=working duration:30s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_fish_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_gold",
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "return=skipped unless site has fish:6",
                "return=skipped unless site has gold",
                "consume=fish:6 gold",
                "animate=working duration:30s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
        trade_wine = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
                "return=skipped when economy needs coin_silver and not economy needs coin_wood",
                "return=skipped when economy needs coin_gold and not economy needs coin_wood",
                "return=skipped unless site has wine:2",
                "return=skipped unless site has planks",
                "consume=wine:2 planks",
                "animate=working duration:30s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_wine_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "return=skipped unless site has wine:4",
                "return=skipped unless site has gold",
                "consume=wine:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_wine_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_silver",
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "return=skipped unless site has wine:4",
                "return=skipped unless site has gold",
                "consume=wine:4 gold",
                "animate=working duration:30s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_wine_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_gold",
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "return=skipped unless site has wine:6",
                "return=skipped unless site has gold",
                "consume=wine:6 gold",
                "animate=working duration:30s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
