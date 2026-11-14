push_textdomain("europeans_all.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_trading_post",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Trading Post"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 60, 59 },
        },
    },

    size = "small",

    aihints = {
        prohibited_till = 10800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        atlanteans_trader = 1
    },

    inputs = {
        { name = "gold", amount = 2 },
        { name = "iron", amount = 3 },
        { name = "coal", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trade_coal",
                "call=trade_iron",
                "call=trade_gold",
            }
        },
        trade_coal = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "callworker=find_pole",
                "return=failed unless site has coal:4",
                "return=skipped unless economy needs coin_copper",
                "consume=coal:4",
                "callworker=coal_trade",
                "sleep=duration:30s",
            }
        },
        trade_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "callworker=find_pole",
                "return=failed unless site has iron:3",
                "return=skipped unless economy needs coin_silver",
                "consume=iron:3",
                "callworker=iron_trade",
                "sleep=duration:30s",
            }
        },
        trade_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "callworker=find_pole",
                "return=failed unless site has gold:2",
                "return=skipped unless economy needs coin_gold",
                "consume=gold:2",
                "callworker=gold_trade",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
