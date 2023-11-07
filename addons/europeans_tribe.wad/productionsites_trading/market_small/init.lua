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
          very_weak_ai_limit = 1,
          weak_ai_limit = 2,
          normal_ai_limit = 4,
          prohibited_till = 3600,
          forced_after = 7200
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 1
    },

    inputs = {
        { name = "blackwood", amount = 4 },
        { name = "gold", amount = 4 },
        { name = "reed", amount = 8 },
        { name = "cotton", amount = 8 },
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
            descname = pgettext("europeans_building", "trading food for wood coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
                "call=pausing_production_for_blackwood",
                "sleep=duration:20s",
                "call=trade_cotton",
                "sleep=duration:20s",
                "call=trade_reed",
                "sleep=duration:20s",
                "call=trade_rubber"
            }
        },
        trading_for_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for copper coins"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "call=pausing_production_for_gold",
                "sleep=duration:20s",
                "call=trade_cotton_copper",
                "sleep=duration:20s",
                "call=trade_reed_copper",
                "sleep=duration:20s",
                "call=trade_rubber_copper"
            }
        },
        pausing_production_for_blackwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing trading of blackwood"),
            actions = {
                "return=skipped when economy needs coin_copper and site has gold:2",
                "return=skipped when site has blackwood:2",
                "sleep=duration:15m",
            }
        },
        pausing_production_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing trading of gold"),
            actions = {
                "return=skipped when economy needs coin_wood and site has blackwood:2",
                "return=skipped when site has gold:3",
                "sleep=duration:15m",
            }
        },
        trade_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has cotton:4",
                "return=skipped unless site has blackwood",
                "consume=cotton:4 blackwood",
                "animate=working duration:30s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
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
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has reed:4",
                "return=skipped unless site has blackwood",
                "consume=reed:4 blackwood",
                "animate=working duration:30s",
                "produce=coin_wood:4",
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
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_rubber = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has rubber:4",
                "return=skipped unless site has blackwood",
                "consume=rubber:4 blackwood",
                "animate=working duration:30s",
                "produce=coin_wood:4",
                "sleep=duration:30s",
            }
        },
        trade_rubber_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has rubber:4",
                "return=skipped unless site has gold",
                "consume=rubber:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
     },
}

pop_textdomain()
