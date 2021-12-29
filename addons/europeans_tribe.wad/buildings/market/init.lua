push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_market",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Market"),
    icon = dirname .. "menu.png",
    size = "big",
    
    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 64, 106 }
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 64, 106 }
        },
    },
    
    --buildcost = {
        --blackwood = 6,
        --planks = 6,
        --cloth = 4,
        --reed = 4,
        --brick = 4,
        --grout = 4,
        --marble_column = 4,
        --quartz = 3,
        --diamond = 3
    --},
    --return_on_dismantle = {
        --blackwood = 3,
        --planks = 3,
        --granite = 4,
        --marble = 2,
        --quartz = 2,
        --diamond = 2
    --},

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
        prohibited_till = 9000
    },
    
    working_positions = {
        europeans_carrier = 3
    },
    
    inputs = {
        { name = "quartz", amount = 4 },
        { name = "diamond", amount = 4 },
        { name = "gold", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=buy_clay_for_quartz",
                "call=buy_clay_for_diamond",
                "call=buy_clay_for_gold",
                "call=buy_granite_for_quartz",
                "call=buy_granite_for_diamond",
                "call=buy_granite_for_gold",
                "call=buy_marble_for_quartz",
                "call=buy_marble_for_diamond",
                "call=buy_marble_for_gold",
                "call=buy_log_for_quartz",
                "call=buy_log_for_diamond",
                "call=buy_log_for_gold",
                "call=buy_blackwood_for_quartz",
                "call=buy_blackwood_for_diamond",
                "call=buy_blackwood_for_gold",
                "call=buy_planks_for_quartz",
                "call=buy_planks_for_diamond",
                "call=buy_planks_for_gold",
                "call=buy_reed_for_quartz",
                "call=buy_reed_for_diamond",
                "call=buy_reed_for_gold",
                "call=buy_cloth_for_quartz",
                "call=buy_cloth_for_diamond",
                "call=buy_cloth_for_gold",
                "call=buy_spidercloth_for_quartz",
                "call=buy_spidercloth_for_diamond",
                "call=buy_spidercloth_for_gold",
                "call=buy_coal_for_quartz",
                "call=buy_coal_for_diamond",
                "call=buy_coal_for_gold",
                "call=buy_iron_for_quartz",
                "call=buy_iron_for_diamond",
                "call=buy_iron_for_gold",
                "return=skipped"
            }
        },
        buy_clay_for_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging quartz and clay"),
            actions = {
                "return=skipped unless economy needs clay",
                "return=skipped when economy needs quartz",
                "sleep=duration:10s",
                "consume=quartz",
                "animate=working duration:30s",
                "produce=clay:16"
            }
        },
        buy_clay_for_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging diamond and clay"),
            actions = {
                "return=skipped unless economy needs clay",
                "return=skipped when economy needs diamond",
                "sleep=duration:10s",
                "consume=diamond",
                "animate=working duration:30s",
                "produce=clay:32"
            }
        },
        buy_clay_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging gold and clay"),
            actions = {
                "return=skipped unless economy needs clay",
                "return=skipped when economy needs gold",
                "sleep=duration:10s",
                "consume=gold",
                "animate=working duration:30s",
                "produce=clay:32"
            }
        },
        buy_granite_for_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging granite and quartz"),
            actions = {
                "return=skipped unless economy needs granite",
                "return=skipped when economy needs quartz",
                "sleep=duration:10s",
                "consume=quartz",
                "animate=working duration:30s",
                "produce=granite:8"
            }
        },
        buy_granite_for_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging granite and diamond"),
            actions = {
                "return=skipped unless economy needs granite",
                "return=skipped when economy needs diamond",
                "sleep=duration:10s",
                "consume=diamond",
                "animate=working duration:30s",
                "produce=granite:16"
            }
        },
        buy_granite_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging granite and gold"),
            actions = {
                "return=skipped unless economy needs granite",
                "return=skipped when economy needs gold",
                "sleep=duration:10s",
                "consume=gold",
                "animate=working duration:30s",
                "produce=granite:16"
            }
        },
        buy_marble_for_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging marble and quartz"),
            actions = {
                "return=skipped unless economy needs marble",
                "return=skipped when economy needs quartz",
                "sleep=duration:10s",
                "consume=quartz",
                "animate=working duration:30s",
                "produce=marble:4"
            }
        },
        buy_marble_for_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging marble and diamond"),
            actions = {
                "return=skipped unless economy needs marble",
                "return=skipped when economy needs diamond",
                "sleep=duration:10s",
                "consume=diamond",
                "animate=working duration:30s",
                "produce=marble:8"
            }
        },
        buy_marble_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging marble and gold"),
            actions = {
                "return=skipped unless economy needs marble",
                "return=skipped when economy needs gold",
                "sleep=duration:10s",
                "consume=gold",
                "animate=working duration:30s",
                "produce=marble:8"
            }
        },
        buy_log_for_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging log and quartz"),
            actions = {
                "return=skipped unless economy needs log",
                "return=skipped when economy needs quartz",
                "sleep=duration:10s",
                "consume=quartz",
                "animate=working duration:30s",
                "produce=log:16"
            }
        },
        buy_log_for_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging log and diamond"),
            actions = {
                "return=skipped unless economy needs log",
                "return=skipped when economy needs diamond",
                "sleep=duration:10s",
                "consume=diamond",
                "animate=working duration:30s",
                "produce=log:32"
            }
        },
        buy_log_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging log and gold"),
            actions = {
                "return=skipped unless economy needs log",
                "return=skipped when economy needs gold",
                "sleep=duration:10s",
                "consume=gold",
                "animate=working duration:30s",
                "produce=log:32"
            }
        },
        buy_blackwood_for_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging blackwood and quartz"),
            actions = {
                "return=skipped unless economy needs blackwood",
                "return=skipped when economy needs quartz",
                "sleep=duration:10s",
                "consume=quartz",
                "animate=working duration:30s",
                "produce=blackwood:8"
            }
        },
        buy_blackwood_for_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging blackwood and diamond"),
            actions = {
                "return=skipped unless economy needs blackwood",
                "return=skipped when economy needs diamond",
                "sleep=duration:10s",
                "consume=diamond",
                "animate=working duration:30s",
                "produce=blackwood:16"
            }
        },
        buy_blackwood_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging blackwood and gold"),
            actions = {
                "return=skipped unless economy needs blackwood",
                "return=skipped when economy needs gold",
                "sleep=duration:10s",
                "consume=gold",
                "animate=working duration:30s",
                "produce=blackwood:16"
            }
        },
        buy_planks_for_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging planks and quartz"),
            actions = {
                "return=skipped unless economy needs planks",
                "return=skipped when economy needs quartz",
                "sleep=duration:10s",
                "consume=quartz",
                "animate=working duration:30s",
                "produce=planks:6"
            }
        },
        buy_planks_for_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging planks and diamond"),
            actions = {
                "return=skipped unless economy needs planks",
                "return=skipped when economy needs diamond",
                "sleep=duration:10s",
                "consume=diamond",
                "animate=working duration:30s",
                "produce=planks:12"
            }
        },
        buy_planks_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging planks and gold"),
            actions = {
                "return=skipped unless economy needs planks",
                "return=skipped when economy needs gold",
                "sleep=duration:10s",
                "consume=gold",
                "animate=working duration:30s",
                "produce=planks:12"
            }
        },
        buy_reed_for_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging reed and quartz"),
            actions = {
                "return=skipped unless economy needs reed",
                "return=skipped when economy needs quartz",
                "sleep=duration:10s",
                "consume=quartz",
                "animate=working duration:30s",
                "produce=reed:16"
            }
        },
        buy_reed_for_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging reed and diamond"),
            actions = {
                "return=skipped unless economy needs reed",
                "return=skipped when economy needs diamond",
                "sleep=duration:10s",
                "consume=diamond",
                "animate=working duration:30s",
                "produce=reed:32"
            }
        },
        buy_reed_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging reed and gold"),
            actions = {
                "return=skipped unless economy needs reed",
                "return=skipped when economy needs gold",
                "sleep=duration:10s",
                "consume=gold",
                "animate=working duration:30s",
                "produce=reed:32"
            }
        },
        buy_cloth_for_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging cloth and quartz"),
            actions = {
                "return=skipped unless economy needs cloth",
                "return=skipped when economy needs quartz",
                "sleep=duration:10s",
                "consume=quartz",
                "animate=working duration:30s",
                "produce=cloth:8"
            }
        },
        buy_cloth_for_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging cloth and diamond"),
            actions = {
                "return=skipped unless economy needs cloth",
                "return=skipped when economy needs diamond",
                "sleep=duration:10s",
                "consume=diamond",
                "animate=working duration:30s",
                "produce=cloth:16"
            }
        },
        buy_cloth_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging cloth and gold"),
            actions = {
                "return=skipped unless economy needs cloth",
                "return=skipped when economy needs gold",
                "sleep=duration:10s",
                "consume=gold",
                "animate=working duration:30s",
                "produce=cloth:16"
            }
        },
        buy_spidercloth_for_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging spidercloth and quartz"),
            actions = {
                "return=skipped unless economy needs spidercloth",
                "return=skipped when economy needs quartz",
                "sleep=duration:10s",
                "consume=quartz",
                "animate=working duration:30s",
                "produce=spidercloth:6"
            }
        },
        buy_spidercloth_for_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging spidercloth and diamond"),
            actions = {
                "return=skipped unless economy needs spidercloth",
                "return=skipped when economy needs diamond",
                "sleep=duration:10s",
                "consume=diamond",
                "animate=working duration:30s",
                "produce=spidercloth:12"
            }
        },
        buy_spidercloth_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging spidercloth and gold"),
            actions = {
                "return=skipped unless economy needs spidercloth",
                "return=skipped when economy needs gold",
                "sleep=duration:10s",
                "consume=gold",
                "animate=working duration:30s",
                "produce=spidercloth:12"
            }
        },
        buy_coal_for_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging coal and quartz"),
            actions = {
                "return=skipped unless economy needs coal",
                "return=skipped when economy needs quartz",
                "sleep=duration:10s",
                "consume=quartz",
                "animate=working duration:30s",
                "produce=coal:6"
            }
        },
        buy_coal_for_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging coal and diamond"),
            actions = {
                "return=skipped unless economy needs coal",
                "return=skipped when economy needs diamond",
                "sleep=duration:10s",
                "consume=diamond",
                "animate=working duration:30s",
                "produce=coal:12"
            }
        },
        buy_coal_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging coal and gold"),
            actions = {
                "return=skipped unless economy needs coal",
                "return=skipped when economy needs gold",
                "sleep=duration:10s",
                "consume=gold",
                "animate=working duration:30s",
                "produce=coal:12"
            }
        },
        buy_iron_for_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging iron and quartz"),
            actions = {
                "return=skipped unless economy needs iron",
                "return=skipped when economy needs quartz",
                "sleep=duration:10s",
                "consume=quartz",
                "animate=working duration:30s",
                "produce=iron:2"
            }
        },
        buy_iron_for_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging iron and diamond"),
            actions = {
                "return=skipped unless economy needs iron",
                "return=skipped when economy needs diamond",
                "sleep=duration:10s",
                "consume=diamond",
                "animate=working duration:30s",
                "produce=iron:4"
            }
        },
        buy_iron_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start exhanging wares because ...
            descname = pgettext("europeans_building", "exchanging iron and gold"),
            actions = {
                "return=skipped unless economy needs iron",
                "return=skipped when economy needs gold",
                "sleep=duration:10s",
                "consume=gold",
                "animate=working duration:30s",
                "produce=iron:4"
            }
        },
    }
}

pop_textdomain()
