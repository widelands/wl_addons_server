push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_recruitement_center_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Recruitement Center"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 86, 91 },
      },
      working = {
         basename = "idle",
         hotspot = { 86, 91 },
      }
    },

    size = "big",
    destructible = true,
    
    enhancement = {
        name = "europeans_recruitement_center_advanced",
        enhancement_cost = {
            planks = 3,
            brick = 3,
            marble = 3,
            marble_column = 2,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 3,
            marble = 4,
            quartz = 1,
            diamond = 1,
            scrap_iron = 1
        }
    },
    
    aihints = {},
    
    working_positions = {
        europeans_trainer_normal = 1,
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
                "sleep=duration:20s",
                "call=recruit_gardener",
                "call=recruit_forester",
                "sleep=duration:20s",
                "call=recruit_lumberjack",
                "call=recruit_stonecutter",
                "call=recruit_miner",
                "sleep=duration:20s",
                "call=recruit_worker",
                "call=recruit_builder",
                "call=recruit_terraformer",
                "sleep=duration:20s",
                "call=recruit_trainer",
                "call=recruit_scout",
                "call=recruit_geologist",
                "sleep=duration:20s",
                "call=recruit_recruit",
                "call=recruit_carrier_1",
                "call=recruit_carrier_2",
                "sleep=duration:30s",
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
                "sleep=duration:60m",
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
        recruit_builder = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting builder"),
            actions = {
                "return=skipped unless economy needs europeans_builder or workers need experience",
                "return=skipped when economy needs europeans_gardener_normal and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_forester_normal and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_lumberjack_normal and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_miner_normal and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_shipwright_normal and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_stonecutter_normal and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_terraformer_normal and not economy needs europeans_builder",
                "return=skipped when economy needs europeans_worker_normal and not economy needs europeans_builder",
                "consume=europeans_carrier",
                "consume=hammer saw",
                "animate=working duration:180s",
                "recruit=europeans_builder"
            }
        },
        recruit_forester = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting forester"),
            actions = {
                "return=skipped unless economy needs europeans_forester_normal or workers need experience",
                "return=skipped unless economy needs europeans_forester_advanced or workers need experience",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_forester_normal",
                "return=skipped when economy needs europeans_gardener_normal and not economy needs europeans_forester_normal",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_forester_normal",
                "return=skipped when economy needs europeans_lumberjack_normal and not economy needs europeans_forester_normal",
                "return=skipped when economy needs europeans_miner_normal and not economy needs europeans_forester_normal",
                "return=skipped when economy needs europeans_shipwright_normal and not economy needs europeans_forester_normal",
                "return=skipped when economy needs europeans_stonecutter_normal and not economy needs europeans_forester_normal",
                "return=skipped when economy needs europeans_terraformer_normal and not economy needs europeans_forester_normal",
                "return=skipped when economy needs europeans_worker_normal and not economy needs europeans_forester_normal",
                "consume=europeans_carrier",
                "consume=shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_forester_normal"
            }
        },
        recruit_gardener = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting gardener"),
            actions = {
                "return=skipped unless economy needs europeans_gardener_normal or workers need experience",
                "return=skipped unless economy needs europeans_gardener_advanced or workers need experience",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_gardener_normal",
                "return=skipped when economy needs europeans_forester_normal and not economy needs europeans_gardener_normal",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_gardener_normal",
                "return=skipped when economy needs europeans_lumberjack_normal and not economy needs europeans_gardener_normal",
                "return=skipped when economy needs europeans_miner_normal and not economy needs europeans_gardener_normal",
                "return=skipped when economy needs europeans_shipwright_normal and not economy needs europeans_gardener_normal",
                "return=skipped when economy needs europeans_stonecutter_normal and not economy needs europeans_gardener_normal",
                "return=skipped when economy needs europeans_terraformer_normal and not economy needs europeans_gardener_normal",
                "return=skipped when economy needs europeans_worker_normal and not economy needs europeans_gardener_normal",
                "consume=europeans_carrier",
                "consume=shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_gardener_normal"
            }
        },
        recruit_geologist = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting geologist"),
            actions = {
                "return=skipped unless economy needs europeans_geologist or workers need experience",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_gardener_normal and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_forester_normal and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_lumberjack_normal and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_miner_normal and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_shipwright_normal and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_stonecutter_normal and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_terraformer_normal and not economy needs europeans_geologist",
                "return=skipped when economy needs europeans_worker_normal and not economy needs europeans_geologist",
                "consume=europeans_carrier",
                "consume=hammer pick",
                "animate=working duration:180s",
                "recruit=europeans_geologist"
            }
        },
        recruit_lumberjack = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting lumberjack"),
            actions = {
                "return=skipped unless economy needs europeans_lumberjack_normal or workers need experience",
                "return=skipped unless economy needs europeans_lumberjack_advanced or workers need experience",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_lumberjack_normal",
                "return=skipped when economy needs europeans_gardener_normal and not economy needs europeans_lumberjack_normal",
                "return=skipped when economy needs europeans_forester_normal and not economy needs europeans_lumberjack_normal",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_lumberjack_normal",
                "return=skipped when economy needs europeans_miner_normal and not economy needs europeans_lumberjack_normal",
                "return=skipped when economy needs europeans_shipwright_normal and not economy needs europeans_lumberjack_normal",
                "return=skipped when economy needs europeans_stonecutter_normal and not economy needs europeans_lumberjack_normal",
                "return=skipped when economy needs europeans_terraformer_normal and not economy needs europeans_lumberjack_normal",
                "return=skipped when economy needs europeans_worker_normal and not economy needs europeans_lumberjack_normal",
                "consume=europeans_carrier",
                "consume=felling_ax saw scythe",
                "animate=working duration:180s",
                "recruit=europeans_lumberjack_normal"
            }
        },
        recruit_miner = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting miner"),
            actions = {
                "return=skipped unless economy needs europeans_miner_normal or workers need experience",
                "return=skipped unless economy needs europeans_miner_advanced or workers need experience",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_miner_normal",
                "return=skipped when economy needs europeans_gardener_normal and not economy needs europeans_miner_normal",
                "return=skipped when economy needs europeans_forester_normal and not economy needs europeans_miner_normal",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_miner_normal",
                "return=skipped when economy needs europeans_lumberjack_normal and not economy needs europeans_miner_normal",
                "return=skipped when economy needs europeans_shipwright_normal and not economy needs europeans_miner_normal",
                "return=skipped when economy needs europeans_stonecutter_normal and not economy needs europeans_miner_normal",
                "return=skipped when economy needs europeans_terraformer_normal and not economy needs europeans_miner_normal",
                "return=skipped when economy needs europeans_worker_normal and not economy needs europeans_miner_normal",
                "consume=europeans_carrier",
                "consume=pick shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_miner_normal"
            }
        },
        recruit_recruit = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting recruit because ...
            descname = pgettext("europeans_building", "recruiting recruit"),
            actions = {
                "return=skipped unless economy needs europeans_recruit or workers need experience",
                "consume=europeans_carrier",
                "animate=working duration:120s",
                "recruit=europeans_recruit"
            }
        },
        recruit_scout = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting scout"),
            actions = {
                "return=skipped unless economy needs europeans_scout_normal or workers need experience",
                "return=skipped unless economy needs europeans_scout_advanced or workers need experience",
                "consume=europeans_carrier",
                "animate=working duration:180s",
                "recruit=europeans_scout_normal"
            }
        },
        recruit_shipwright = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting shipwright"),
            actions = {
                "return=skipped unless economy needs europeans_shipwright_normal or workers need experience",
                "return=skipped unless economy needs europeans_shipwright_advanced or workers need experience",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_shipwright_normal",
                "return=skipped when economy needs europeans_gardener_normal and not economy needs europeans_shipwright_normal",
                "return=skipped when economy needs europeans_forester_normal and not economy needs europeans_shipwright_normal",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_shipwright_normal",
                "return=skipped when economy needs europeans_lumberjack_normal and not economy needs europeans_shipwright_normal",
                "return=skipped when economy needs europeans_miner_normal and not economy needs europeans_shipwright_normal",
                "return=skipped when economy needs europeans_stonecutter_normal and not economy needs europeans_shipwright_normal",
                "return=skipped when economy needs europeans_terraformer_normal and not economy needs europeans_shipwright_normal",
                "return=skipped when economy needs europeans_worker_normal and not economy needs europeans_shipwright_normal",
                "consume=europeans_carrier",
                "consume=hammer saw",
                "animate=working duration:180s",
                "recruit=europeans_shipwright_normal"
            }
        },
        recruit_stonecutter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting stonecutter"),
            actions = {
                "return=skipped unless economy needs europeans_stonecutter_normal or workers need experience",
                "return=skipped unless economy needs europeans_stonecutter_advanced or workers need experience",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_stonecutter_normal",
                "return=skipped when economy needs europeans_gardener_normal and not economy needs europeans_stonecutter_normal",
                "return=skipped when economy needs europeans_forester_normal and not economy needs europeans_stonecutter_normal",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_stonecutter_normal",
                "return=skipped when economy needs europeans_lumberjack_normal and not economy needs europeans_stonecutter_normal",
                "return=skipped when economy needs europeans_miner_normal and not economy needs europeans_stonecutter_normal",
                "return=skipped when economy needs europeans_shipwright_normal and not economy needs europeans_stonecutter_normal",
                "return=skipped when economy needs europeans_terraformer_normal and not economy needs europeans_stonecutter_normal",
                "return=skipped when economy needs europeans_worker_normal and not economy needs europeans_stonecutter_normal",
                "consume=europeans_carrier",
                "consume=pick buckets",
                "animate=working duration:180s",
                "recruit=europeans_stonecutter_normal"
            }
        },
        recruit_terraformer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting terraformer"),
            actions = {
                "return=skipped unless economy needs europeans_terraformer_normal or workers need experience",
                "return=skipped unless economy needs europeans_terraformer_advanced or workers need experience",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_terraformer_normal",
                "return=skipped when economy needs europeans_gardener_normal and not economy needs europeans_terraformer_normal",
                "return=skipped when economy needs europeans_forester_normal and not economy needs europeans_terraformer_normal",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_terraformer_normal",
                "return=skipped when economy needs europeans_lumberjack_normal and not economy needs europeans_terraformer_normal",
                "return=skipped when economy needs europeans_miner_normal and not economy needs europeans_terraformer_normal",
                "return=skipped when economy needs europeans_shipwright_normal and not economy needs europeans_terraformer_normal",
                "return=skipped when economy needs europeans_stonecutter_normal and not economy needs europeans_terraformer_normal",
                "return=skipped when economy needs europeans_worker_normal and not economy needs europeans_terraformer_normal",
                "consume=europeans_carrier",
                "consume=pick shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_terraformer_normal"
            }
        },
        recruit_trainer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting trainer"),
            actions = {
                "return=skipped unless economy needs europeans_trainer_normal or workers need experience",
                "return=skipped unless economy needs europeans_trainer_advanced or workers need experience",
                "consume=europeans_carrier",
                "animate=working duration:180s",
                "recruit=europeans_trainer_normal"
            }
        },
        recruit_worker = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting general worker"),
            actions = {
                "return=skipped unless economy needs europeans_worker_normal or workers need experience",
                "return=skipped unless economy needs europeans_worker_advanced or workers need experience",
                "return=skipped when economy needs europeans_builder and not economy needs europeans_worker_normal",
                "return=skipped when economy needs europeans_gardener_normal and not economy needs europeans_worker_normal",
                "return=skipped when economy needs europeans_forester_normal and not economy needs europeans_worker_normal",
                "return=skipped when economy needs europeans_geologist and not economy needs europeans_worker_normal",
                "return=skipped when economy needs europeans_lumberjack_normal and not economy needs europeans_worker_normal",
                "return=skipped when economy needs europeans_miner_normal and not economy needs europeans_worker_normal",
                "return=skipped when economy needs europeans_shipwright_normal and not economy needs europeans_worker_normal",
                "return=skipped when economy needs europeans_stonecutter_normal and not economy needs europeans_worker_normal",
                "return=skipped when economy needs europeans_terraformer_normal and not economy needs europeans_worker_normal",
                "consume=europeans_carrier",
                "consume=hammer saw fire_tongs needles",
                "animate=working duration:180s",
                "recruit=europeans_worker_normal"
            }
        }
    }
}

pop_textdomain()
