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
        marble_column = 1,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 3,
        marble = 3,
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
        { name = "planks", amount = 2 },
        { name = "gold", amount = 2 },
        { name = "bread", amount = 8 },
        { name = "meat", amount = 8 },
        { name = "beer", amount = 8 },
        { name = "honey", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=pausing_production",
                "sleep=duration:15s",
                "call=trade_bread",
                "call=trade_bread_copper",
                "sleep=duration:15s",
                "call=trade_meat",
                "call=trade_meat_copper",
                "sleep=duration:15s",
                "call=trade_beer",
                "call=trade_beer_copper",
                "sleep=duration:15s",
                "call=trade_honey",
                "call=trade_honey_copper",
            }
        },
        pausing_production = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for planks and gold"),
            actions = {
                "return=skipped when not economy needs planks and not economy needs gold",
                "sleep=duration:5m",
            }
        },
        trade_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
                "return=skipped unless economy needs coin_wood",
                "return=skipped unless site has beer:4",
                "return=failed unless site has planks",
                "consume=beer:4 planks",
                "animate=working duration:30s",
                "produce=coin_wood:3",
                "sleep=duration:30s",
            }
        },
        trade_beer_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "return=skipped unless site has gold",
                "return=skipped unless site has beer:4",
                "return=failed unless site has planks",
                "consume=beer:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_bread = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
                "return=skipped unless site has bread:4",
                "return=failed unless site has planks",
                "consume=bread:4 planks",
                "animate=working duration:30s",
                "produce=coin_wood:3",
                "sleep=duration:30s",
            }
        },
        trade_bread_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "return=skipped unless site has gold",
                "return=skipped unless site has bread:4",
                "return=failed unless site has planks",
                "consume=bread:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_honey = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
                "return=skipped unless site has honey:4",
                "return=failed unless site has planks",
                "consume=honey:4 planks",
                "animate=working duration:30s",
                "produce=coin_wood:3",
                "sleep=duration:30s",
            }
        },
        trade_honey_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_wood and not economy needs coin_copper",
                "return=skipped unless site has gold",
                "return=skipped unless site has honey:4",
                "return=failed unless site has planks",
                "consume=honey:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_meat = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_wood",
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
                "return=skipped unless site has meat:4",
                "return=skipped unless site has gold",
                "consume=meat:4 gold",
                "animate=working duration:30s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
     },
}

pop_textdomain()
