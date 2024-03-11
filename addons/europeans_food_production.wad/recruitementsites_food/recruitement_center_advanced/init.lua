push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_recruitement_center_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Recruitement Center"),
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
    
    aihints = {},
    
    working_positions = {
        europeans_trainer_advanced = 1,
        europeans_trainer_basic = 1
    },
    
    inputs = {
        { name = "europeans_carrier", amount = 4 },
        { name = "basket", amount = 3 },
        { name = "buckets", amount = 2 },
        { name = "felling_ax", amount = 2 },
        { name = "scythe", amount = 2 },
        { name = "shovel", amount = 2 },
        { name = "pick", amount = 2 },
        { name = "hammer", amount = 2 },
        { name = "saw", amount = 2 },
        { name = "fire_tongs", amount = 2 },
        { name = "needles", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production_for_inputs",
                "call=recruit_recruit",
                "call=recruit_carrier_1",
                "call=recruit_carrier_2",
                "call=recruit_carrier_3",
                "sleep=duration:20s",
                "call=recruit_farmer",
                "call=recruit_gardener",
                "call=recruit_forester",
                "sleep=duration:20s",
                "call=recruit_lumberjack",
                "call=recruit_stonecutter",
                "call=recruit_miner",
                "sleep=duration:20s",
                "call=recruit_worker",
                "call=recruit_beekeeper",
                "call=recruit_terraformer",
                "sleep=duration:20s",
                "call=recruit_trainer",
                "call=recruit_scout",
                "call=recruit_geologist",
                "sleep=duration:20s",
                "call=recruit_recruit",
                "call=recruit_carrier_1",
                "call=recruit_carrier_2",
                "call=recruit_carrier_3",
                "sleep=duration:20s",
                "call=recruit_worker",
                "call=recruit_builder",
                "call=recruit_shipwright",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production for tools because ...
            descname = pgettext("europeans_building", "pausing production because lack of tools"),
            actions = {
                "return=skipped when site has basket and site has buckets and site has felling_ax and site has scythe and site has shovel and site has pick and site has hammer and site has saw and site has fire_tongs and site has needles",
                "sleep=duration:120m",
            }
        },
        recruit_carrier_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting first carrier"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_1 or workers need experience",
                "consume=europeans_carrier",
                "animate=working duration:120s",
                "recruit=europeans_carrier_1"
            }
        },
        recruit_carrier_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting second carrier"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_2 or workers need experience",
                "return=skipped when economy needs basket",
                "consume=basket europeans_carrier",
                "animate=working duration:120s",
                "recruit=europeans_carrier_2"
            }
        },
        recruit_carrier_3 = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting third carrier"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_3 or workers need experience",
                "return=skipped when economy needs basket",
                "consume=basket europeans_carrier",
                "animate=working duration:120s",
                "recruit=europeans_carrier_3"
            }
        },
        recruit_builder = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting builder"),
            actions = {
                "return=skipped when economy needs europeans_beekeeper_advanced and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_farmer_advanced and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_forester_advanced and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_gardener_advanced and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_lumberjack_advanced and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_miner_advanced and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_shipwright_advanced and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_stonecutter_advanced and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_terraformer_advanced and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_worker_advanced and not economy needs europeans_builder",
                "consume=europeans_carrier",
                "consume=hammer saw",
                "animate=working duration:15m",
                "recruit=europeans_builder"
            }
        },
        recruit_beekeeper = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting beekeeper"),
            actions = {
                "return=skipped when economy needs europeans_builder and not economy needs europeans_beekeeper_advanced",
                "return=skipped when economy needs europeans_farmer_advanced and not economy needs europeans_beekeeper_advanced",
                "return=skipped when economy needs europeans_forester_advanced and not economy needs europeans_beekeeper_advanced",
                "return=skipped when economy needs europeans_gardener_advanced and not economy needs europeans_beekeeper_advanced",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_beekeeper_advanced",
                "return=skipped when economy needs europeans_lumberjack_advanced and not economy needs europeans_beekeeper_advanced",
                "return=skipped when economy needs europeans_miner_advanced and not economy needs europeans_beekeeper_advanced",
                "return=skipped when economy needs europeans_shipwright_advanced and not economy needs europeans_beekeeper_advanced",
                "return=skipped when economy needs europeans_stonecutter_advanced and not economy needs europeans_beekeeper_advanced",
                "return=skipped when economy needs europeans_terraformer_advanced and not economy needs europeans_beekeeper_advanced",
                "return=skipped when economy needs europeans_worker_advanced and not economy needs europeans_beekeeper_advanced",
                "consume=europeans_carrier",
                "consume=buckets",
                "animate=working duration:15m",
                "recruit=europeans_beekeeper_advanced"
            }
        },
        recruit_farmer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting farmer"),
            actions = {
                "return=skipped when economy needs europeans_beekeeper_advanced and not economy needs europeans_farmer_advanced",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_farmer_advanced",
                "return=skipped when economy needs europeans_forester_advanced and not economy needs europeans_farmer_advanced",
                "return=skipped when economy needs europeans_gardener_advanced and not economy needs europeans_farmer_advanced",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_farmer_advanced",
                "return=skipped when economy needs europeans_lumberjack_advanced and not economy needs europeans_farmer_advanced",
                "return=skipped when economy needs europeans_miner_advanced and not economy needs europeans_farmer_advanced",
                "return=skipped when economy needs europeans_shipwright_advanced and not economy needs europeans_farmer_advanced",
                "return=skipped when economy needs europeans_stonecutter_advanced and not economy needs europeans_farmer_advanced",
                "return=skipped when economy needs europeans_terraformer_advanced and not economy needs europeans_farmer_advanced",
                "return=skipped when economy needs europeans_worker_advanced and not economy needs europeans_farmer_advanced",
                "consume=europeans_carrier",
                "consume=scythe basket",
                "animate=working duration:15m",
                "recruit=europeans_farmer_advanced"
            }
        },
        recruit_forester = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting forester"),
            actions = {
                "return=skipped when economy needs europeans_beekeeper_advanced and not economy needs europeans_forester_advanced",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_forester_advanced",
                "return=skipped when economy needs europeans_farmer_advanced and not economy needs europeans_forester_advanced",
                "return=skipped when economy needs europeans_gardener_advanced and not economy needs europeans_forester_advanced",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_forester_advanced",
                "return=skipped when economy needs europeans_lumberjack_advanced and not economy needs europeans_forester_advanced",
                "return=skipped when economy needs europeans_miner_advanced and not economy needs europeans_forester_advanced",
                "return=skipped when economy needs europeans_shipwright_advanced and not economy needs europeans_forester_advanced",
                "return=skipped when economy needs europeans_stonecutter_advanced and not economy needs europeans_forester_advanced",
                "return=skipped when economy needs europeans_terraformer_advanced and not economy needs europeans_forester_advanced",
                "return=skipped when economy needs europeans_worker_advanced and not economy needs europeans_forester_advanced",
                "consume=europeans_carrier",
                "consume=shovel buckets",
                "animate=working duration:15m",
                "recruit=europeans_forester_advanced"
            }
        },
        recruit_gardener = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting gardener"),
            actions = {
                "return=skipped when economy needs europeans_beekeeper_advanced and not economy needs europeans_gardener_advanced",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_gardener_advanced",
                "return=skipped when economy needs europeans_farmer_advanced and not economy needs europeans_gardener_advanced",
                "return=skipped when economy needs europeans_forester_advanced and not economy needs europeans_gardener_advanced",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_gardener_advanced",
                "return=skipped when economy needs europeans_lumberjack_advanced and not economy needs europeans_gardener_advanced",
                "return=skipped when economy needs europeans_miner_advanced and not economy needs europeans_gardener_advanced",
                "return=skipped when economy needs europeans_shipwright_advanced and not economy needs europeans_gardener_advanced",
                "return=skipped when economy needs europeans_stonecutter_advanced and not economy needs europeans_gardener_advanced",
                "return=skipped when economy needs europeans_terraformer_advanced and not economy needs europeans_gardener_advanced",
                "return=skipped when economy needs europeans_worker_advanced and not economy needs europeans_gardener_advanced",
                "consume=europeans_carrier",
                "consume=shovel buckets",
                "animate=working duration:15m",,
                "recruit=europeans_gardener_advanced"
            }
        },
        recruit_geologist = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting geologist"),
            actions = {
                "return=skipped when economy needs europeans_beekeeper_advanced and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_farmer_advanced and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_forester_advanced and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_gardener_advanced and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_lumberjack_advanced and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_miner_advanced and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_shipwright_advanced and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_stonecutter_advanced and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_terraformer_advanced and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_worker_advanced and not economy needs europeans_geologist",
                "consume=europeans_carrier",
                "consume=hammer pick",
                "animate=working duration:15m",
                "recruit=europeans_geologist"
            }
        },
        recruit_lumberjack = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting lumberjack"),
            actions = {
                "return=skipped when economy needs europeans_beekeeper_advanced and not economy needs europeans_lumberjack_advanced",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_lumberjack_advanced",
                "return=skipped when economy needs europeans_farmer_advanced and not economy needs europeans_lumberjack_advanced",
                "return=skipped when economy needs europeans_forester_advanced and not economy needs europeans_lumberjack_advanced",
                "return=skipped when economy needs europeans_gardener_advanced and not economy needs europeans_lumberjack_advanced",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_lumberjack_advanced",
                "return=skipped when economy needs europeans_miner_advanced and not economy needs europeans_lumberjack_advanced",
                "return=skipped when economy needs europeans_shipwright_advanced and not economy needs europeans_lumberjack_advanced",
                "return=skipped when economy needs europeans_stonecutter_advanced and not economy needs europeans_lumberjack_advanced",
                "return=skipped when economy needs europeans_terraformer_advanced and not economy needs europeans_lumberjack_advanced",
                "return=skipped when economy needs europeans_worker_advanced and not economy needs europeans_lumberjack_advanced",
                "consume=europeans_carrier",
                "consume=felling_ax saw",
                "animate=working duration:15m",
                "recruit=europeans_lumberjack_advanced"
            }
        },
        recruit_miner = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting miner"),
            actions = {
                "return=skipped when economy needs europeans_beekeeper_advanced and not economy needs europeans_miner_advanced",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_miner_advanced",
                "return=skipped when economy needs europeans_farmer_advanced and not economy needs europeans_miner_advanced",
                "return=skipped when economy needs europeans_forester_advanced and not economy needs europeans_miner_advanced",
                "return=skipped when economy needs europeans_gardener_advanced and not economy needs europeans_miner_advanced",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_miner_advanced",
                "return=skipped when economy needs europeans_lumberjack_advanced and not economy needs europeans_miner_advanced",
                "return=skipped when economy needs europeans_shipwright_advanced and not economy needs europeans_miner_advanced",
                "return=skipped when economy needs europeans_stonecutter_advanced and not economy needs europeans_miner_advanced",
                "return=skipped when economy needs europeans_terraformer_advanced and not economy needs europeans_miner_advanced",
                "return=skipped when economy needs europeans_worker_advanced and not economy needs europeans_miner_advanced",
                "consume=europeans_carrier",
                "consume=pick shovel buckets",
                "animate=working duration:15m",
                "recruit=europeans_miner_advanced"
            }
        },
        recruit_recruit = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting recruit because ...
            descname = pgettext("europeans_building", "recruiting recruit"),
            actions = {
                "return=skipped unless economy needs europeans_recruit",
                "consume=europeans_carrier:3",
                "animate=working duration:180s",
                "recruit=europeans_recruit:3"
            }
        },
        recruit_scout = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting scout"),
            actions = {
                "return=skipped unless economy needs europeans_scout_advanced",
                "consume=europeans_carrier",
                "animate=working duration:15m",
                "recruit=europeans_scout_advanced"
            }
        },
        recruit_shipwright = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting shipwright"),
            actions = {
                "return=skipped when economy needs europeans_beekeeper_advanced and not economy needs europeans_shipwright_advanced",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_shipwright_advanced",
                "return=skipped when economy needs europeans_farmer_advanced and not economy needs europeans_shipwright_advanced",
                "return=skipped when economy needs europeans_forester_advanced and not economy needs europeans_shipwright_advanced",
                "return=skipped when economy needs europeans_gardener_advanced and not economy needs europeans_shipwright_advanced",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_shipwright_advanced",
                "return=skipped when economy needs europeans_lumberjack_advanced and not economy needs europeans_shipwright_advanced",
                "return=skipped when economy needs europeans_miner_advanced and not economy needs europeans_shipwright_advanced",
                "return=skipped when economy needs europeans_stonecutter_advanced and not economy needs europeans_shipwright_advanced",
                "return=skipped when economy needs europeans_terraformer_advanced and not economy needs europeans_shipwright_advanced",
                "return=skipped when economy needs europeans_worker_advanced and not economy needs europeans_shipwright_advanced",
                "consume=europeans_carrier",
                "consume=hammer saw",
                "animate=working duration:15m",
                "recruit=europeans_shipwright_advanced"
            }
        },
        recruit_stonecutter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting stonecutter"),
            actions = {
                "return=skipped when economy needs europeans_beekeeper_advanced and not economy needs europeans_stonecutter_advanced",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_stonecutter_advanced",
                "return=skipped when economy needs europeans_farmer_advanced and not economy needs europeans_stonecutter_advanced",
                "return=skipped when economy needs europeans_forester_advanced and not economy needs europeans_stonecutter_advanced",
                "return=skipped when economy needs europeans_gardener_advanced and not economy needs europeans_stonecutter_advanced",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_stonecutter_advanced",
                "return=skipped when economy needs europeans_lumberjack_advanced and not economy needs europeans_stonecutter_advanced",
                "return=skipped when economy needs europeans_miner_advanced and not economy needs europeans_stonecutter_advanced",
                "return=skipped when economy needs europeans_shipwright_advanced and not economy needs europeans_stonecutter_advanced",
                "return=skipped when economy needs europeans_terraformer_advanced and not economy needs europeans_stonecutter_advanced",
                "return=skipped when economy needs europeans_worker_advanced and not economy needs europeans_stonecutter_advanced",
                "consume=europeans_carrier",
                "consume=pick buckets",
                "animate=working duration:15m",
                "recruit=europeans_stonecutter_advanced"
            }
        },
        recruit_terraformer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting terraformer"),
            actions = {
                "return=skipped when economy needs europeans_beekeeper_advanced and not economy needs europeans_terraformer_advanced",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_terraformer_advanced",
                "return=skipped when economy needs europeans_farmer_advanced and not economy needs europeans_terraformer_advanced",
                "return=skipped when economy needs europeans_forester_advanced and not economy needs europeans_terraformer_advanced",
                "return=skipped when economy needs europeans_gardener_advanced and not economy needs europeans_terraformer_advanced",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_terraformer_advanced",
                "return=skipped when economy needs europeans_lumberjack_advanced and not economy needs europeans_terraformer_advanced",
                "return=skipped when economy needs europeans_miner_advanced and not economy needs europeans_terraformer_advanced",
                "return=skipped when economy needs europeans_shipwright_advanced and not economy needs europeans_terraformer_advanced",
                "return=skipped when economy needs europeans_stonecutter_advanced and not economy needs europeans_terraformer_advanced",
                "return=skipped when economy needs europeans_worker_advanced and not economy needs europeans_terraformer_advanced",
                "consume=europeans_carrier",
                "consume=pick shovel buckets",
                "animate=working duration:15m",
                "recruit=europeans_terraformer_advanced"
            }
        },
        recruit_trainer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting trainer"),
            actions = {
                "return=skipped unless economy needs europeans_trainer_advanced",
                "consume=europeans_carrier",
                "animate=working duration:15m",
                "recruit=europeans_trainer_advanced"
            }
        },
        recruit_worker = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting general worker"),
            actions = {
                "return=skipped when economy needs europeans_beekeeper_advanced and not economy needs europeans_worker_advanced",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_worker_advanced",
                "return=skipped when economy needs europeans_farmer_advanced and not economy needs europeans_worker_advanced",
                "return=skipped when economy needs europeans_forester_advanced and not economy needs europeans_worker_advanced",
                "return=skipped when economy needs europeans_gardener_advanced and not economy needs europeans_worker_advanced",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_worker_advanced",
                "return=skipped when economy needs europeans_lumberjack_advanced and not economy needs europeans_worker_advanced",
                "return=skipped when economy needs europeans_miner_advanced and not economy needs europeans_worker_advanced",
                "return=skipped when economy needs europeans_shipwright_advanced and not economy needs europeans_worker_advanced",
                "return=skipped when economy needs europeans_stonecutter_advanced and not economy needs europeans_worker_advanced",
                "return=skipped when economy needs europeans_terraformer_advanced and not economy needs europeans_worker_advanced",
                "consume=europeans_carrier",
                "consume=hammer saw fire_tongs needles",
                "animate=working duration:15m",
                "recruit=europeans_worker_advanced"
            }
        }
    }
}

pop_textdomain()
