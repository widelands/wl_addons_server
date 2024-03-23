push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_store_big",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Big Store"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 87, 113 }
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 87, 113 }
      }
    },
    
    size = "big",
    destructible = true,
    
    buildcost = {
        planks = 4,
        brick = 4,
        marble = 4,
        marble_column = 2,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4,
        marble = 5,
        quartz = 1,
        diamond = 1
    },
    
    aihints = {
        very_weak_ai_limit = 0,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 3
    },

    inputs = {
        { name = "coin_wood", amount = 12 },
        { name = "coin_copper", amount = 12 },
        { name = "coin_silver", amount = 8 },
        { name = "coin_gold", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trade_granite",
                "call=trade_marble",
                "sleep=duration:5s",
                "call=trade_quartz",
                "call=trade_quartz_copper",
                "call=trade_quartz_silver",
                "call=trade_quartz_gold",
                "sleep=duration:10s",
                "call=trade_diamond",
                "call=trade_diamond_copper",
                "call=trade_diamond_silver",
                "call=trade_diamond_gold",
                "sleep=duration:10s",
                "call=trade_iron",
                "call=trade_iron_copper",
                "call=trade_iron_silver",
                "call=trade_iron_gold"
            }
        },
        trade_granite = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs granite",
                "return=failed unless site has coin_wood:4",
                "consume=coin_wood:4",
                "animate=working duration:4m",
                "produce=granite:2",
            }
        },
        trade_marble = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs marble",
                "return=failed unless site has coin_wood:6",
                "consume=coin_wood:6",
                "animate=working duration:4m",
                "produce=marble:2",
            }
        },
        trade_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs quartz",
                "return=failed unless site has coin_wood:6",
                "consume=coin_wood:6",
                "animate=working duration:4m",
                "produce=quartz",
            }
        },
        trade_quartz_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs quartz",
                "return=failed unless site has coin_copper:4",
                "consume=coin_copper:4",
                "animate=working duration:4m",
                "produce=quartz",
            }
        },
        trade_quartz_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs quartz",
                "return=failed unless site has coin_silver:2",
                "consume=coin_silver:2",
                "animate=working duration:4m",
                "produce=quartz",
            }
        },
        trade_quartz_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs quartz",
                "return=failed unless site has coin_gold",
                "consume=coin_gold",
                "animate=working duration:4m",
                "produce=quartz",
            }
        },
        trade_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs diamond",
                "return=failed unless site has coin_wood:8",
                "consume=coin_wood:8",
                "animate=working duration:4m",
                "produce=diamond",
            }
        },
        trade_diamond_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs diamond",
                "return=failed unless site has coin_copper:4",
                "consume=coin_copper:4",
                "animate=working duration:4m",
                "produce=diamond",
            }
        },
        trade_diamond_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs diamond",
                "return=failed unless site has coin_silver:2",
                "consume=coin_silver:2",
                "animate=working duration:4m",
                "produce=diamond",
            }
        },
        trade_diamond_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs diamond",
                "return=failed unless site has coin_gold",
                "consume=coin_gold",
                "animate=working duration:4m",
                "produce=diamond",
            }
        },
        trade_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs iron",
                "return=failed unless site has coin_wood:8",
                "consume=coin_wood:8",
                "animate=working duration:4m",
                "produce=iron",
            }
        },
        trade_iron_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs iron",
                "return=failed unless site has coin_copper:4",
                "consume=coin_copper:4",
                "animate=working duration:4m",
                "produce=iron",
            }
        },
        trade_iron_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs iron",
                "return=failed unless site has coin_silver:2",
                "consume=coin_silver:2",
                "animate=working duration:4m",
                "produce=iron",
            }
        },
        trade_iron_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs iron",
                "return=failed unless site has coin_gold",
                "consume=coin_gold",
                "animate=working duration:4m",
                "produce=iron",
            }
        },
    },
}

pop_textdomain()
