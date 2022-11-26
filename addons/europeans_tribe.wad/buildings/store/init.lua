push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_store",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Store"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",

    animations = {
        idle = {
         hotspot = { 84, 117 },
        },
        working = {
             basename = "idle", -- TODO(GunChleoc): No animation yet.
             hotspot = { 84, 117 },
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
        granite = 6,
        marble = 3,
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
        { name = "coin_wood", amount = 10 },
        { name = "coin_copper", amount = 8 },
        { name = "coin_silver", amount = 6 },
        { name = "coin_gold", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trade_granite",
                "call=trade_marble",
                "call=trade_quartz",
                "call=trade_diamond",
                "call=trade_iron",
                "call=trade_gold",
            }
        },
        trade_granite = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs granite",
                "return=failed unless site has coin_wood:5",
                "consume=coin_wood:5",
                "animate=working duration:15s",
                "produce=granite:2",
                "sleep=duration:30s",
            }
        },
        trade_marble = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs marble",
                "return=failed unless site has coin_wood:8",
                "consume=coin_wood:8",
                "animate=working duration:15s",
                "produce=marble:2",
                "sleep=duration:30s",
            }
        },
        trade_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs quartz",
                "return=failed unless site has coin_copper:4",
                "consume=coin_copper:4",
                "animate=working duration:15s",
                "produce=quartz",
                "sleep=duration:30s",
            }
        },
        trade_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs diamond",
                "return=failed unless site has coin_copper:8",
                "consume=coin_copper:8",
                "animate=working duration:15s",
                "produce=diamond",
                "sleep=duration:30s",
            }
        },
        trade_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs iron",
                "return=failed unless site has coin_silver:6",
                "consume=coin_silver:6",
                "animate=working duration:15s",
                "produce=iron",
                "sleep=duration:30s",
            }
        },
        trade_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs gold",
                "return=failed unless site has coin_gold:4",
                "consume=coin_gold:4",
                "animate=working duration:15s",
                "produce=gold",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
