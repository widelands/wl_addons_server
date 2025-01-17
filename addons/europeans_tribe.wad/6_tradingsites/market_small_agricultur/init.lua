push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_agricultur",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Agricultur products market"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         rows = 1,
         columns = 1,
         hotspot = { 60, 78 }
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 60, 78 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 60, 78 }
      },
    },

    size = "medium",
    destructible = true,
    
    buildcost = {
        brick = 2,
        grout = 2,
        planks = 2,
        marble = 2,
        marble_column = 2,
        cloth = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2
    },
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 1
    },

    inputs = {
        { name = "gold", amount = 4 },
        { name = "reed", amount = 16 },
        { name = "rubber", amount = 16 },
        { name = "leather", amount = 16 },
        { name = "cotton", amount = 16 },
        { name = "wool", amount = 16 },
        { name = "meat", amount = 16 },
        { name = "fish", amount = 16 },
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
                "call=trade_rubber_copper",
                "sleep=duration:10s",
                "call=trade_leather_copper",
                "sleep=duration:10s",
                "call=trade_reed_copper",
                "sleep=duration:10s",
                "call=trade_cotton_copper",
                "sleep=duration:10s",
                "call=trade_wool_copper",
                "sleep=duration:10s",
                "call=trade_meat_copper",
                "sleep=duration:10s",
                "call=trade_fish_copper"
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
                "call=trade_rubber_silver",
                "sleep=duration:10s",
                "call=trade_leather_silver",
                "sleep=duration:10s",
                "call=trade_reed_silver",
                "sleep=duration:10s",
                "call=trade_cotton_silver",
                "sleep=duration:10s",
                "call=trade_wool_silver",
                "sleep=duration:10s",
                "call=trade_meat_silver",
                "sleep=duration:10s",
                "call=trade_fish_silver"
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
                "call=trade_rubber_gold",
                "sleep=duration:10s",
                "call=trade_leather_gold",
                "sleep=duration:10s",
                "call=trade_reed_gold",
                "sleep=duration:10s",
                "call=trade_cotton_gold",
                "sleep=duration:10s",
                "call=trade_wool_gold",
                "sleep=duration:10s",
                "call=trade_meat_gold",
                "sleep=duration:10s",
                "call=trade_fish_gold"
            }
        },
        pausing_production_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing trading of gold"),
            actions = {
                "return=skipped when site has gold:4",
                "return=skipped unless economy needs europeans_soldier",
                "sleep=duration:15m",
            }
        },
        trade_cotton_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has cotton:4",
                "return=skipped unless site has gold",
                "consume=cotton:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_cotton_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has cotton:6",
                "return=skipped unless site has gold",
                "consume=cotton:6 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_cotton_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has cotton:8",
                "return=skipped unless site has gold",
                "consume=cotton:8 gold",
                "animate=working duration:30s",
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
                "consume=leather:2 gold",
                "animate=working duration:30s",
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
                "consume=leather:3 gold",
                "animate=working duration:30s",
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
                "consume=leather:4 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_reed_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has reed:4",
                "return=skipped unless site has gold",
                "consume=reed:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_reed_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has reed:6",
                "return=skipped unless site has gold",
                "consume=reed:6 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_reed_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has reed:8",
                "return=skipped unless site has gold",
                "consume=reed:8 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_rubber_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has rubber:4",
                "return=skipped unless site has gold",
                "consume=rubber:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_rubber_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has rubber:6",
                "return=skipped unless site has gold",
                "consume=rubber:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_rubber_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has rubber:8",
                "return=skipped unless site has gold",
                "consume=rubber:4 gold",
                "animate=working duration:30s",
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
                "animate=working duration:30s",
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
                "animate=working duration:30s",
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
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_meat_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has meat:4",
                "return=skipped unless site has gold",
                "consume=meat:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_meat_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has meat:6",
                "return=skipped unless site has gold",
                "consume=meat:6 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_meat_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has meat:8",
                "return=skipped unless site has gold",
                "consume=meat:8 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_fish_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has fish:4",
                "return=skipped unless site has gold",
                "consume=fish:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_fish_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has fish:6",
                "return=skipped unless site has gold",
                "consume=fish:6 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_fish_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has fish:8",
                "return=skipped unless site has gold",
                "consume=fish:8 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
