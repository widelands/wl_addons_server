push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Market"),
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
        marble_column = 4,
        quartz = 3,
        diamond = 3
    },
    return_on_dismantle = {
        scrap_wood = 8,
        granite = 4,
        marble = 2,
        quartz = 2,
        diamond = 2
    },
    
    aihints = {
          very_weak_ai_limit = 1,
          weak_ai_limit = 1,
          normal_ai_limit = 1,
          prohibited_till = 9000,
          forced_after = 9600
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 3
    },

    inputs = {
        { name = "ration", amount = 8 },
        { name = "snack", amount = 8 },
        { name = "meal", amount = 8 },
        { name = "beer", amount = 8 },
        { name = "beer_strong", amount = 8 },
        { name = "mead", amount = 8 },
        { name = "wine", amount = 8 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trade_ration",
                "call=trade_snack",
                "call=trade_meal",
                "call=trade_beer",
                "call=trade_mead",
                "call=trade_wine",
            }
        },
        trade_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_wood",
                "return=skipped when economy needs ration",
                "return=failed unless site has ration:4",
                "consume=ration:4",
                "animate=working duration:15s",
                "produce=coin_wood:2",
                "sleep=duration:30s",
            }
        },
        trade_snack = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_wood",
                "return=skipped when economy needs snack",
                "return=failed unless site has snack:4",
                "consume=snack:4",
                "animate=working duration:15s",
                "produce=coin_wood:3",
                "sleep=duration:30s",
            }
        },
        trade_meal = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_copper",
                "return=skipped when economy needs meal",
                "return=failed unless site has meal:4",
                "consume=meal:4",
                "animate=working duration:15s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_copper",
                "return=skipped when economy needs beer",
                "return=failed unless site has beer:4",
                "return=failed unless site has beer_strong:4",
                "consume=beer:4 beer_strong:4",
                "animate=working duration:15s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_mead = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_silver",
                "return=skipped when economy needs mead",
                "return=failed unless site has mead:4",
                "consume=mead:4",
                "animate=working duration:15s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_wine = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_gold",
                "return=skipped when economy needs wine",
                "return=failed unless site has wine:4",
                "consume=wine:4",
                "animate=working duration:15s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
