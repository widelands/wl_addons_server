push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_recruitement_center_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Recruitement Center"),
    icon = dirname .. "menu.png",
    size = "big",
    
    enhancement = {
        name = "europeans_recruitement_center_advanced",
        enhancement_cost = {
            planks = 3,
            brick = 3,
            grout = 3,
            marble_column = 3
        },
        enhancement_return_on_dismantle = {
            granite = 3,
            marble = 3,
            planks = 2
        }
    },
    
    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 80, 88 }
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 80, 88 }
        },
    },

    aihints = {},
    
    working_positions = {
        europeans_trainer_normal = 1
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
        { name = "hunting_bow", amount = 1 },
        { name = "bread_paddle", amount = 1 },
        { name = "hook_pole", amount = 1 },
        { name = "kitchen_tools", amount = 1 },
        { name = "spear_wooden", amount = 2 },
        { name = "tabard", amount = 2 }
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
                "return=skipped when economy needs europeans_farmer_normal",
                "return=skipped when economy needs europeans_miller_normal",
                "return=skipped when economy needs europeans_hunter_normal",
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
                "return=skipped when economy needs europeans_farmer_normal",
                "return=skipped when economy needs europeans_miller_normal",
                "return=skipped when economy needs europeans_hunter_normal",
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
                "return=skipped unless economy needs europeans_baker_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=bread_paddle hook_pole kitchen_tools",
                "animate=working duration:15s",
                "recruit=europeans_baker_normal"
            }
        },
        recruit_beekeeper = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting beekeeper"),
            actions = {
                "return=skipped unless economy needs europeans_beekeeper_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=buckets",
                "animate=working duration:15s",
                "recruit=europeans_beekeeper_normal"
            }
        },
        recruit_breeder = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting breeder"),
            actions = {
                "return=skipped unless economy needs europeans_breeder_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=milking_tongs buckets",
                "animate=working duration:15s",
                "recruit=europeans_breeder_normal"
            }
        },
        recruit_brewer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting brewer"),
            actions = {
                "return=skipped unless economy needs europeans_brewer_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=buckets",
                "animate=working duration:15s",
                "recruit=europeans_brewer_normal"
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
                "return=skipped unless economy needs europeans_carpenter_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=saw",
                "animate=working duration:15s",
                "recruit=europeans_carpenter_normal"
            }
        },
        recruit_charcoal_burner = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting charcoal burner"),
            actions = {
                "return=skipped unless economy needs europeans_charcoal_burner_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=shovel buckets",
                "animate=working duration:15s",
                "recruit=europeans_charcoal_burner_normal"
            }
        },
        recruit_claydigger = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting claydigger"),
            actions = {
                "return=skipped unless economy needs europeans_claydigger_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=shovel buckets",
                "animate=working duration:15s",
                "recruit=europeans_claydigger_normal"
            }
        },
        recruit_farmer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting farmer"),
            actions = {
                "return=skipped unless economy needs europeans_farmer_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=scythe basket",
                "animate=working duration:15s",
                "recruit=europeans_farmer_normal"
            }
        },
        recruit_fisher = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting fisher"),
            actions = {
                "return=skipped unless economy needs europeans_fisher_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=fishing_rod buckets",
                "animate=working duration:15s",
                "recruit=europeans_fisher_normal"
            }
        },
        recruit_forester = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting forester"),
            actions = {
                "return=skipped unless economy needs europeans_forester_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=shovel buckets",
                "animate=working duration:15s",
                "recruit=europeans_forester_normal"
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
                "return=skipped unless economy needs europeans_hunter_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=hunting_bow basket",
                "animate=working duration:15s",
                "recruit=europeans_hunter_normal"
            }
        },
        recruit_lumberjack = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting lumberjack"),
            actions = {
                "return=skipped unless economy needs europeans_lumberjack_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=felling_ax saw",
                "animate=working duration:15s",
                "recruit=europeans_lumberjack_normal"
            }
        },
        recruit_miller = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting miller"),
            actions = {
                "return=skipped unless economy needs europeans_miller_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=basket buckets",
                "animate=working duration:15s",
                "recruit=europeans_miller_normal"
            }
        },
        recruit_miner = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting miner"),
            actions = {
                "return=skipped unless economy needs europeans_miner_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=pick buckets",
                "animate=working duration:15s",
                "recruit=europeans_miner_normal"
            }
        },
        recruit_scout = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting scout"),
            actions = {
                "return=skipped unless economy needs europeans_scout_normal",
                "sleep=duration:10s",
                "consume=europeans_carrier",
                "animate=working duration:15s",
                "recruit=europeans_scout_normal"
            }
        },
        recruit_shipwright = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting shipwright"),
            actions = {
                "return=skipped unless economy needs europeans_shipwright_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=hammer saw",
                "animate=working duration:15s",
                "recruit=europeans_shipwright_normal"
            }
        },
        recruit_smelter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting smelter"),
            actions = {
                "return=skipped unless economy needs europeans_smelter_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=fire_tongs shovel buckets",
                "animate=working duration:15s",
                "recruit=europeans_smelter_normal"
            }
        },
        recruit_smith = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting smith"),
            actions = {
                "return=skipped unless economy needs europeans_smith_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=fire_tongs hammer saw",
                "animate=working duration:15s",
                "recruit=europeans_smith_normal"
            }
        },
        recruit_stonecutter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting stonecutter"),
            actions = {
                "return=skipped unless economy needs europeans_stonecutter_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=pick buckets",
                "animate=working duration:15s",
                "recruit=europeans_stonecutter_normal"
            }
        },
        recruit_stonemason = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting stonemason"),
            actions = {
                "return=skipped unless economy needs europeans_stonemason_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=pick shovel buckets",
                "animate=working duration:15s",
                "recruit=europeans_stonemason_normal"
            }
        },
        recruit_terraformer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting terraformer"),
            actions = {
                "return=skipped unless economy needs europeans_terraformer_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=pick shovel buckets",
                "animate=working duration:15s",
                "recruit=europeans_terraformer_normal"
            }
        },
        recruit_trainer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting trainer"),
            actions = {
                "return=skipped unless economy needs europeans_trainer_normal",
                "sleep=duration:10s",
                "consume=tabard spear_wooden europeans_carrier",
                "animate=working duration:15s",
                "recruit=europeans_trainer_normal"
            }
        },
        recruit_weaver = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting weaver"),
            actions = {
                "return=skipped unless economy needs europeans_weaver_normal",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=needles",
                "animate=working duration:15s",
                "recruit=europeans_weaver_normal"
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
