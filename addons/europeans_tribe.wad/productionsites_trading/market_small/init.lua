push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_small",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Small Market"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 55, 59 },
      },
      working = {
         basename = "idle",
         hotspot = { 55, 59 },
      },
    },
    
    size = "medium",
    destructible = true,
    
    buildcost = {
        blackwood = 2,
        cloth = 2,
        grout = 2,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2,
        quartz = 1,
        diamond = 1
    },
    
    aihints = {
        basic_amount = 1,
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
        { name = "gold", amount = 4 },
        { name = "log", amount = 8 },
        { name = "blackwood", amount = 8 },
        { name = "planks", amount = 8 },
        { name = "reed", amount = 8 },
        { name = "cotton", amount = 8 },
        { name = "wool", amount = 8 },
        { name = "rubber", amount = 8 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trading_for_wood",
                "sleep=duration:30s",
                "call=trading_for_copper"
            }
        },
        trading_for_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading goods for wood coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
                "sleep=duration:10s",
                "call=trade_log",
                "sleep=duration:10s",
                "call=trade_reed",
                "sleep=duration:10s",
                "call=trade_blackwood",
                "sleep=duration:10s",
                "call=trade_cotton",
                "sleep=duration:10s",
                "call=trade_rubber",
                "sleep=duration:10s",
                "call=trade_planks",
                "sleep=duration:10s",
                "call=trade_wool"
            }
        },
        trading_for_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading goods for copper coins"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "sleep=duration:10s",
                "call=trade_log_copper",
                "sleep=duration:10s",
                "call=trade_reed_copper",
                "sleep=duration:10s",
                "call=trade_blackwood_copper",
                "sleep=duration:10s",
                "call=trade_cotton_copper",
                "sleep=duration:10s",
                "call=trade_rubber_copper",
                "sleep=duration:10s",
                "call=trade_planks_copper",
                "sleep=duration:10s",
                "call=trade_wool_copper"
            }
        },
        trade_blackwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs coin_wood",
                "return=skipped unless site has blackwood:6",
                "consume=blackwood:4",
                "animate=working duration:1m",
                "produce=coin_wood:4",
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
                "consume=blackwood:3 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cotton and not economy needs coin_wood",
                "return=skipped unless site has cotton:4",
                "return=skipped unless site has blackwood",
                "consume=cotton:3 blackwood",
                "animate=working duration:1m",
                "produce=coin_wood:4",
                "sleep=duration:1m",
            }
        },
        trade_cotton_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cotton and not economy needs coin_copper",
                "return=skipped unless site has cotton:4",
                "return=skipped unless site has gold",
                "consume=cotton:3 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs log and not economy needs coin_wood",
                "return=skipped unless site has log:4",
                "return=skipped unless site has blackwood",
                "consume=log:3 blackwood",
                "animate=working duration:1m",
                "produce=coin_wood:4",
                "sleep=duration:1m",
            }
        },
        trade_log_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs log and not economy needs coin_copper",
                "return=skipped unless site has log:4",
                "return=skipped unless site has gold",
                "consume=log:3 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_planks = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs planks and not economy needs coin_wood",
                "return=skipped unless site has planks:4",
                "return=skipped unless site has blackwood",
                "consume=planks:3 blackwood",
                "animate=working duration:1m",
                "produce=coin_wood:4",
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
                "consume=planks:3 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs reed and not economy needs coin_wood",
                "return=skipped unless site has reed:4",
                "return=skipped unless site has blackwood",
                "consume=reed:3 blackwood",
                "animate=working duration:1m",
                "produce=coin_wood:4",
                "sleep=duration:1m",
            }
        },
        trade_reed_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs reed and not economy needs coin_copper",
                "return=skipped unless site has reed:4",
                "return=skipped unless site has gold",
                "consume=reed:3 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_rubber = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs rubber and not economy needs coin_wood",
                "return=skipped unless site has rubber:4",
                "return=skipped unless site has blackwood",
                "consume=rubber:3 blackwood",
                "animate=working duration:1m",
                "produce=coin_wood:4",
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
                "consume=rubber:3 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_wool = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs wool and not economy needs coin_wood",
                "return=skipped unless site has wool:4",
                "return=skipped unless site has blackwood",
                "consume=wool:3 blackwood",
                "animate=working duration:1m",
                "produce=coin_wood:4",
                "sleep=duration:1m",
            }
        },
        trade_wool_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs wool and not economy needs coin_copper",
                "return=skipped unless site has wool:4",
                "return=skipped unless site has gold",
                "consume=wool:3 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
     },
}

pop_textdomain()
