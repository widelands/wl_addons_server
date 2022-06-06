push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
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
                "call=recruit_breeder",
                "call=recruit_stonecutter",
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
                "call=recruit_weaver",
                "call=recruit_beekeeper",
                "call=recruit_shipwright",
                "call=recruit_geologist",
                "call=recruit_terraformer",
                "call=recruit_scout",
                "call=recruit_trainer",
                "call=recruit_carrier_1",
                "call=recruit_carrier_2",
                "call=recruit_carrier_idle",
                "return=skipped"
            }
        },
        recruit_carrier_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs europeans_builder or economy needs europeans_geologist or economy needs europeans_carrier_1 or economy needs europeans_carrier_2",
                "return=skipped when economy needs europeans_farmer_normal or economy needs europeans_lumberjack_normal or economy needs europeans_forester_normal or economy needs europeans_breeder_normal",
                "return=skipped when economy needs europeans_beekeeper_normal or economy needs europeans_brewer_normal or economy needs europeans_miller_normal or economy needs europeans_baker_normal",
                "return=skipped when economy needs europeans_stonecutter_normal or economy needs europeans_claydigger_normal or economy needs europeans_miner_normal or economy needs europeans_stonemason_normal",
                "return=skipped when economy needs europeans_carpenter_normal or economy needs europeans_weaver_normal or economy needs europeans_charcoal_burner_normal or economy needs europeans_smelter_normal",
                "return=skipped when economy needs europeans_smith_normal or economy needs europeans_shipwright_normal or economy needs europeans_terraformer_normal or economy needs europeans_scout_normal",
                "return=skipped when economy needs basket",
                "sleep=duration:180s",
                "consume=europeans_carrier:2 basket",
                "animate=working duration:60s",
                "recruit=europeans_carrier_1",
                "animate=working duration:60s",
                "recruit=europeans_carrier_2"
            }
        },
        recruit_carrier_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting first carrier"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_1 or workers need experience",
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
                "return=skipped unless economy needs europeans_carrier_2 or workers need experience",
                "return=skipped when economy needs basket",
                "sleep=duration:10s",
                "consume=basket europeans_carrier",
                "animate=working duration:30s",
                "recruit=europeans_carrier_2"
            }
        },
        recruit_builder = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting builder"),
            actions = {
                "return=skipped unless economy needs europeans_builder",
                "return=skipped when economy needs hammer and economy needs saw",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=hammer saw",
                "animate=working duration:15s",
                "recruit=europeans_builder"
            }
        },
        recruit_baker = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting baker"),
            actions = {
                "return=skipped unless economy needs europeans_baker_normal or economy needs ration or economy needs snack or economy needs meal",
                "return=skipped when economy needs bread_paddle or economy needs hook_pole or economy needs kitchen_tools",
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
                "return=skipped unless economy needs europeans_beekeeper_normal or economy needs honey",
                "return=skipped when economy needs buckets",
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
                "return=skipped unless economy needs europeans_breeder_normal or economy needs meat or economy needs fish",
                "return=skipped when economy needs buckets or economy needs basket",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=basket buckets",
                "animate=working duration:15s",
                "recruit=europeans_breeder_normal"
            }
        },
        recruit_brewer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting brewer"),
            actions = {
                "return=skipped unless economy needs europeans_brewer_normal or economy needs beer or economy needs beer_strong or economy needs mead or economy needs wine",
                "return=skipped when economy needs buckets",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=buckets",
                "animate=working duration:15s",
                "recruit=europeans_brewer_normal"
            }
        },
        recruit_carpenter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting carpenter"),
            actions = {
                "return=skipped unless economy needs europeans_carpenter_normal or economy needs blackwood or economy needs planks",
                "return=skipped when economy needs saw",
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
                "return=skipped unless economy needs europeans_charcoal_burner_normal or economy needs coal",
                "return=skipped when economy needs buckets or economy needs shovel",
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
                "return=skipped unless economy needs europeans_claydigger_normal or economy needs clay",
                "return=skipped when economy needs buckets or economy needs shovel",
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
                "return=skipped unless economy needs reed or economy needs barley or economy needs rye or economy needs wheat or economy needs corn or economy needs blackroot or economy needs fruit or economy needs grape",
                "return=skipped when economy needs basket or economy needs scythe",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=scythe basket",
                "animate=working duration:15s",
                "recruit=europeans_farmer_normal"
            }
        },
        recruit_forester = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting forester"),
            actions = {
                "return=skipped unless economy needs europeans_forester_normal or economy needs log",
                "return=skipped when economy needs buckets or economy needs shovel",
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
                "return=skipped when economy needs hammer or economy needs pick",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=hammer pick",
                "animate=working duration:15s",
                "recruit=europeans_geologist"
            }
        },
        recruit_lumberjack = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting lumberjack"),
            actions = {
                "return=skipped unless economy needs europeans_lumberjack_normal or economy needs log",
                "return=skipped when economy needs felling_ax or economy needs saw",
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
                "return=skipped unless economy needs europeans_miller_normal or economy needs flour",
                "return=skipped when economy needs buckets or economy needs basket",
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
                "return=skipped unless economy needs europeans_miner_normal or economy needs quartz or economy needs diamond or economy needs coal or economy needs ore",
                "return=skipped when economy needs buckets or economy needs shovel or economy needs pick",
                "sleep=duration:5s",
                "consume=europeans_carrier",
                "sleep=duration:5s",
                "consume=pick shovel buckets",
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
                "return=skipped when economy needs hammer or economy needs saw",
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
                "return=skipped unless economy needs europeans_smelter_normal or economy needs iron or economy needs gold",
                "return=skipped when economy needs buckets or economy needs shovel or economy needs fire_tongs",
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
                "return=skipped when economy needs hammer or economy needs saw or economy needs fire_tongs",
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
                "return=skipped unless economy needs europeans_stonecutter_normal or economy needs granite or economy needs marble",
                "return=skipped when economy needs buckets or economy needs pick",
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
                "return=skipped unless economy needs europeans_stonemason_normal or economy needs grout or economy needs brick or economy needs marble_column",
                "return=skipped when economy needs buckets or economy needs shovel or economy needs pick",
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
                "return=skipped when economy needs buckets or economy needs shovel or economy needs pick",
                "return=skipped when economy needs water",
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
                "return=skipped unless economy needs europeans_weaver_normal or economy needs cloth or economy needs armor or economy needs tabard",
                "return=skipped when economy needs needles",
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
            descname = _"dummy program",
            actions = {
                "sleep=duration:10s",
                "animate=working duration:15s",
                "recruit=europeans_carrier_donkey"
            }
        },
    }
}

pop_textdomain()
