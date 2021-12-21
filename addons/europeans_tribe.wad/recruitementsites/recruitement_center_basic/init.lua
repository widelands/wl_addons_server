push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_recruitement_center_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Recruitement Center"),
    icon = dirname .. "menu.png",
    size = "big",
    
    enhancement = {
        name = "europeans_recruitement_center_normal",
        enhancement_cost = {
            blackwood = 3,
            cloth = 3
        },
        enhancement_return_on_dismantle = {
            blackwood = 2,
            cloth = 1
        }
    },
    
    buildcost = {
        log = 4,
        reed = 4,
        granite = 4
    },
    return_on_dismantle = {
        log = 2,
        granite = 2
    },

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

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 1,
        basic_amount = 1,
        prohibited_till = 3600,
        forced_after = 4500
    },
    
    working_positions = {
        europeans_trainer_basic = 1
    },
    
    inputs = {
        { name = "europeans_carrier", amount = 4 },
        { name = "basket", amount = 2 },
        { name = "buckets", amount = 2 },
        { name = "shovel", amount = 2 },
        { name = "hammer", amount = 2 },
        { name = "saw", amount = 2 },
        { name = "pick", amount = 2 },
        { name = "felling_ax", amount = 1 },
        { name = "fire_tongs", amount = 1 },
        { name = "needles", amount = 1 },
        { name = "scythe", amount = 1 },
        { name = "milking_tongs", amount = 1 },
        { name = "fishing_rod", amount = 1 },
        { name = "hunting_spear", amount = 1 },
        { name = "bread_paddle", amount = 1 },
        { name = "hook_pole", amount = 1 },
        { name = "kitchen_tools", amount = 1 },
        { name = "spear_wooden", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=recruit_builder",
                "call=recruit_lumberjack",
                "call=recruit_farmer",
                "call=recruit_stonecutter",
                "call=recruit_fisher",
                "call=recruit_hunter",
                "call=recruit_forester",
                "call=recruit_claydigger",
                "call=recruit_miner",
                "call=recruit_carpenter",
                "call=recruit_stonemason",
                "call=recruit_charcoal_burner",
                "call=recruit_brewer",
                "call=recruit_miller",
                "call=recruit_baker",
                "call=recruit_smelter",
                "call=recruit_smith",
                "call=recruit_breeder",
                "call=recruit_weaver",
                "call=recruit_beekeeper",
                "call=recruit_shipwright",
                "call=recruit_geologist",
                "call=recruit_terraformer",
                "call=recruit_scout",
                "call=recruit_trainer",
                "call=recruit_carrier_1",
                "call=recruit_carrier_2",
                "call=recruit_carrier_3",
                "return=skipped"
            }
        },
        recruit_carrier_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting first carrier"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_1",
                "sleep=duration:10s",
                "consume=europeans_carrier",
                "animate=working duration:30s",
                "recruit=europeans_carrier_1"
            }
        },
        recruit_carrier_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting second carrier"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_2",
                "return=skipped when economy needs europeans_farmer_basic",
                "return=skipped when economy needs europeans_miller_basic",
                "sleep=duration:10s",
                "consume=basket europeans_carrier",
                "animate=working duration:30s",
                "recruit=europeans_carrier_2"
            }
        },
        recruit_carrier_3 = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting third carrier"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_3",
                "return=skipped when economy needs europeans_farmer_basic",
                "return=skipped when economy needs europeans_miller_basic",
                "sleep=duration:10s",
                "consume=basket europeans_carrier",
                "animate=working duration:30s",
                "recruit=europeans_carrier_3"
            }
        },
        recruit_baker = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting baker"),
            actions = {
                "return=skipped unless economy needs europeans_baker_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=bread_paddle hook_pole kitchen_tools",
                "animate=working duration:15s",
                "recruit=europeans_baker_basic"
            }
        },
        recruit_beekeeper = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting beekeeper"),
            actions = {
                "return=skipped unless economy needs europeans_beekeeper_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=buckets",
                "animate=working duration:15s",
                "recruit=europeans_beekeeper_basic"
            }
        },
        recruit_breeder = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting breeder"),
            actions = {
                "return=skipped unless economy needs europeans_breeder_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=milking_tongs buckets",
                "animate=working duration:15s",
                "recruit=europeans_breeder_basic"
            }
        },
        recruit_brewer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting brewer"),
            actions = {
                "return=skipped unless economy needs europeans_brewer_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=buckets",
                "animate=working duration:15s",
                "recruit=europeans_brewer_basic"
            }
        },
        recruit_builder = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting builder"),
            actions = {
                "return=skipped unless economy needs europeans_builder",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=hammer saw",
                "animate=working duration:15s",
                "recruit=europeans_builder"
            }
        },
        recruit_carpenter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting carpenter"),
            actions = {
                "return=skipped unless economy needs europeans_carpenter_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=saw",
                "animate=working duration:15s",
                "recruit=europeans_carpenter_basic"
            }
        },
        recruit_charcoal_burner = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting charcoal burner"),
            actions = {
                "return=skipped unless economy needs europeans_charcoal_burner_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=shovel buckets",
                "animate=working duration:15s",
                "recruit=europeans_charcoal_burner_basic"
            }
        },
        recruit_claydigger = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting claydigger"),
            actions = {
                "return=skipped unless economy needs europeans_claydigger_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=shovel buckets",
                "animate=working duration:15s",
                "recruit=europeans_claydigger_basic"
            }
        },
        recruit_farmer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting farmer"),
            actions = {
                "return=skipped unless economy needs europeans_farmer_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=scythe basket",
                "animate=working duration:15s",
                "recruit=europeans_farmer_basic"
            }
        },
        recruit_fisher = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting fisher"),
            actions = {
                "return=skipped unless economy needs europeans_fisher_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=fishing_rod",
                "animate=working duration:15s",
                "recruit=europeans_fisher_basic"
            }
        },
        recruit_forester = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting forester"),
            actions = {
                "return=skipped unless economy needs europeans_forester_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=shovel buckets",
                "animate=working duration:15s",
                "recruit=europeans_forester_basic"
            }
        },
        recruit_geologist = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting geologist"),
            actions = {
                "return=skipped unless economy needs europeans_geologist",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=hammer pick",
                "animate=working duration:15s",
                "recruit=europeans_geologist"
            }
        },
        recruit_hunter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting hunter"),
            actions = {
                "return=skipped unless economy needs europeans_hunter_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=hunting_spear",
                "animate=working duration:15s",
                "recruit=europeans_hunter_basic"
            }
        },
        recruit_lumberjack = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting lumberjack"),
            actions = {
                "return=skipped unless economy needs europeans_lumberjack_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=felling_ax",
                "animate=working duration:15s",
                "recruit=europeans_lumberjack_basic"
            }
        },
        recruit_miller = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting miller"),
            actions = {
                "return=skipped unless economy needs europeans_miller_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=basket buckets",
                "animate=working duration:15s",
                "recruit=europeans_miller_basic"
            }
        },
        recruit_miner = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting miner"),
            actions = {
                "return=skipped unless economy needs europeans_miner_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=pick buckets",
                "animate=working duration:15s",
                "recruit=europeans_miner_basic"
            }
        },
        recruit_scout = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting scout"),
            actions = {
                "return=skipped unless economy needs europeans_scout_basic",
                "sleep=duration:10s",
                "consume=europeans_carrier",
                "animate=working duration:15s",
                "recruit=europeans_scout_basic"
            }
        },
        recruit_shipwright = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting shipwright"),
            actions = {
                "return=skipped unless economy needs europeans_shipwright_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=hammer saw",
                "animate=working duration:15s",
                "recruit=europeans_shipwright_basic"
            }
        },
        recruit_smelter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting smelter"),
            actions = {
                "return=skipped unless economy needs europeans_smelter_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=fire_tongs shovel buckets",
                "animate=working duration:15s",
                "recruit=europeans_smelter_basic"
            }
        },
        recruit_smith = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting smith"),
            actions = {
                "return=skipped unless economy needs europeans_smith_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=fire_tongs hammer saw",
                "animate=working duration:15s",
                "recruit=europeans_smith_basic"
            }
        },
        recruit_stonecutter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting stonecutter"),
            actions = {
                "return=skipped unless economy needs europeans_stonecutter_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=pick buckets",
                "animate=working duration:15s",
                "recruit=europeans_stonecutter_basic"
            }
        },
        recruit_stonemason = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting stonemason"),
            actions = {
                "return=skipped unless economy needs europeans_stonemason_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=pick shovel buckets",
                "animate=working duration:15s",
                "recruit=europeans_stonemason_basic"
            }
        },
        recruit_terraformer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting terraformer"),
            actions = {
                "return=skipped unless economy needs europeans_terraformer_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=pick shovel buckets",
                "animate=working duration:15s",
                "recruit=europeans_terraformer_basic"
            }
        },
        recruit_trainer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting trainer"),
            actions = {
                "return=skipped unless economy needs europeans_trainer_basic",
                "sleep=duration:10s",
                "consume=spear_wooden europeans_carrier",
                "animate=working duration:15s",
                "recruit=europeans_trainer_basic"
            }
        },
        recruit_weaver = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting weaver"),
            actions = {
                "return=skipped unless economy needs europeans_weaver_basic",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=needles",
                "animate=working duration:15s",
                "recruit=europeans_weaver_basic"
            }
        },
        dummy_program = {
            -- TRANSLATORS: Completed/Skipped/Did not start dummy program because ...
            descname = pgettext("europeans_building", "dummy program"),
            actions = {
                "sleep=duration:10s",
                "animate=working duration:15s",
                "produce=quartz"
            }
        },
    }

}

pop_textdomain()
