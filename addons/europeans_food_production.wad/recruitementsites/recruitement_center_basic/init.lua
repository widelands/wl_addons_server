push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_recruitement_center_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Recruitement Center"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 64, 106 }
      },
      working = {
         basename = "idle",
         hotspot = { 64, 106 }
      },
    },
   
    size = "big",
    destructible = true,
    
    enhancement = {
        name = "europeans_recruitement_center_normal",
        enhancement_cost = {
            blackwood = 3,
            cloth = 3,
            grout = 3,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            quartz = 1,
            diamond = 1
        }
    },
    buildcost = {
        log = 4,
        reed = 4,
        granite = 4,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 2,
        quartz = 1,
        diamond = 1
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        --normal_ai_limit = 2,
    },
    
    working_positions = {
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
                "call=pausing_production",
                "sleep=duration:20s",
                "call=recruit_farmer",
                "call=recruit_lumberjack",
                "call=recruit_forester",
                "sleep=duration:20s",
                "call=recruit_stonecutter",
                "call=recruit_claydigger",
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
                "call=recruit_builder",
                "call=recruit_recruit",
                "call=recruit_carrier_1",
                "sleep=duration:30s",
                "call=recruit_worker",
                "call=recruit_builder",
                "call=recruit_shipwright",
                "return=skipped"
            }
        },
        pausing_production = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production for tools because ...
            descname = pgettext("europeans_building", "pausing production because lack of tools"),
            actions = {
                "return=skipped when site has basket and site has buckets and site has felling_ax and site has scythe and site has shovel and site has pick and site has hammer and site has saw and site has fire_tongs and site has needles",
                "sleep=duration:15m",
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
        recruit_builder = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting builder"),
            actions = {
                "return=skipped unless economy needs europeans_builder",
                "return=skipped when economy needs europeans_worker_basic",
                "return=skipped when economy needs europeans_worker_normal",
                "return=skipped when economy needs europeans_worker_advanced",
                "consume=europeans_carrier",
                "consume=hammer saw",
                "animate=working duration:180s",
                "recruit=europeans_builder"
            }
        },
        recruit_beekeeper = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting beekeeper"),
            actions = {
                "return=skipped unless economy needs europeans_beekeeper_basic",
                "return=skipped unless economy needs europeans_beekeeper_normal",
                "return=skipped unless economy needs europeans_beekeeper_advanced",
                "return=skipped when economy needs buckets and economy needs water",
                "consume=europeans_carrier",
                "consume=buckets",
                "animate=working duration:180s",
                "recruit=europeans_beekeeper_basic"
            }
        },
        recruit_claydigger = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting claydigger"),
            actions = {
                "return=skipped unless economy needs europeans_claydigger_basic",
                "return=skipped unless economy needs europeans_claydigger_normal",
                "return=skipped unless economy needs europeans_claydigger_advanced",
                "return=skipped when economy needs buckets and economy needs water",
                "consume=europeans_carrier",
                "consume=shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_claydigger_basic"
            }
        },
        recruit_farmer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting farmer"),
            actions = {
                "return=skipped unless economy needs europeans_farmer_basic",
                "return=skipped unless economy needs europeans_farmer_normal",
                "return=skipped unless economy needs europeans_farmer_advanced",
                "consume=europeans_carrier",
                "consume=scythe basket",
                "animate=working duration:180s",
                "recruit=europeans_farmer_basic"
            }
        },
        recruit_forester = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting forester"),
            actions = {
                "return=skipped unless economy needs europeans_forester_basic",
                "return=skipped unless economy needs europeans_forester_normal",
                "return=skipped unless economy needs europeans_forester_advanced",
                "consume=europeans_carrier",
                "consume=shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_forester_basic"
            }
        },
        recruit_geologist = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting geologist"),
            actions = {
                "return=skipped unless economy needs europeans_geologist",
                "return=skipped when economy needs europeans_worker_basic",
                "return=skipped when economy needs europeans_worker_normal",
                "return=skipped when economy needs europeans_worker_advanced",
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
                "return=skipped unless economy needs europeans_lumberjack_basic",
                "return=skipped unless economy needs europeans_lumberjack_normal",
                "return=skipped unless economy needs europeans_lumberjack_advanced",
                "consume=europeans_carrier",
                "consume=felling_ax",
                "animate=working duration:180s",
                "recruit=europeans_lumberjack_basic"
            }
        },
        recruit_miner = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting miner"),
            actions = {
                "return=skipped unless economy needs europeans_miner_basic",
                "return=skipped unless economy needs europeans_miner_normal",
                "return=skipped unless economy needs europeans_miner_advanced",
                "consume=europeans_carrier",
                "consume=pick shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_miner_basic"
            }
        },
        recruit_recruit = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting recruit because ...
            descname = pgettext("europeans_building", "recruiting recruit"),
            actions = {
                "return=skipped unless economy needs europeans_recruit",
                "consume=europeans_carrier",
                "animate=working duration:150s",
                "recruit=europeans_recruit"
            }
        },
        recruit_scout = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting scout"),
            actions = {
                "return=skipped unless economy needs europeans_scout_basic",
                "return=skipped unless economy needs europeans_scout_normal",
                "return=skipped unless economy needs europeans_scout_advanced",
                "consume=europeans_carrier",
                "animate=working duration:180s",
                "recruit=europeans_scout_basic"
            }
        },
        recruit_shipwright = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting shipwright"),
            actions = {
                "return=skipped unless economy needs europeans_shipwright_basic",
                "return=skipped unless economy needs europeans_shipwright_normal",
                "return=skipped unless economy needs europeans_shipwright_advanced",
                "return=skipped when economy needs europeans_worker_basic",
                "return=skipped when economy needs europeans_worker_normal",
                "return=skipped when economy needs europeans_worker_advanced",
                "consume=europeans_carrier",
                "consume=hammer saw",
                "animate=working duration:180s",
                "recruit=europeans_shipwright_basic"
            }
        },
        recruit_stonecutter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting stonecutter"),
            actions = {
                "return=skipped unless economy needs europeans_stonecutter_basic",
                "return=skipped unless economy needs europeans_stonecutter_normal",
                "return=skipped unless economy needs europeans_stonecutter_advanced",
                "return=skipped when economy needs buckets and economy needs water",
                "consume=europeans_carrier",
                "consume=pick buckets",
                "animate=working duration:180s",
                "recruit=europeans_stonecutter_basic"
            }
        },
        recruit_terraformer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting terraformer"),
            actions = {
                "return=skipped unless economy needs europeans_terraformer_basic",
                "return=skipped unless economy needs europeans_terraformer_normal",
                "return=skipped unless economy needs europeans_terraformer_advanced",
                "return=skipped when economy needs buckets or economy needs shovel or economy needs pick",
                "return=skipped when economy needs water",
                "consume=europeans_carrier",
                "consume=pick shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_terraformer_basic"
            }
        },
        recruit_trainer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting trainer"),
            actions = {
                "return=skipped unless economy needs europeans_trainer_basic",
                "return=skipped unless economy needs europeans_trainer_normal",
                "return=skipped unless economy needs europeans_trainer_advanced",
                "consume=europeans_carrier",
                "animate=working duration:180s",
                "recruit=europeans_trainer_basic"
            }
        },
        recruit_worker = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting general worker"),
            actions = {
                "return=skipped unless economy needs europeans_worker_basic",
                "return=skipped unless economy needs europeans_worker_normal",
                "return=skipped unless economy needs europeans_worker_advanced",
                "consume=europeans_carrier",
                "consume=hammer saw fire_tongs needles",
                "animate=working duration:180s",
                "recruit=europeans_worker_basic"
            }
        },
    }

}

pop_textdomain()
