push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_honey",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Honey Market"),
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
        weak_ai_limit = 1,
        normal_ai_limit = 2,
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_food_trader = 1
    },

    inputs = {
        { name = "blackwood", amount = 4 },
        { name = "gold", amount = 4 },
        { name = "honey", amount = 12 }
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
                "sleep=duration:15s",
                "call=trade_honey"
            }
        },
        trading_for_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for copper coins"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "call=pausing_production_for_gold",
                "sleep=duration:15s",
                "call=trade_honey_copper"
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
        trade_honey = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has honey:4",
                "return=failed unless site has blackwood",
                "consume=honey:4 blackwood",
                "animate=working duration:30s",
                "produce=coin_wood:3",
                "sleep=duration:30s",
            }
        },
        trade_honey_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has gold",
                "return=skipped unless site has honey:4",
                "return=failed unless site has blackwood",
                "consume=honey:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
     },
}

pop_textdomain()
