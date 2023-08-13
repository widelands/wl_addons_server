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
         basename = "idle", -- TODO(GunChleoc): No animation yet.
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
            quartz = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            quartz = 1
        }
    },
    buildcost = {
        log = 4,
        reed = 4,
        granite = 4
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 2
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
        { name = "basket", amount = 4 },
        { name = "buckets", amount = 2 },
        { name = "shovel", amount = 2 },
        { name = "hammer", amount = 2 },
        { name = "saw", amount = 2 },
        { name = "pick", amount = 2 },
        { name = "felling_ax", amount = 2 },
        { name = "scythe", amount = 2 },
        { name = "fire_tongs", amount = 1 },
        { name = "needles", amount = 1 },
        { name = "bread_paddle", amount = 1 },
        { name = "hook_pole", amount = 1 },
        { name = "kitchen_tools", amount = 1 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=recruit_farmer",
                "call=recruit_lumberjack",
                "call=recruit_forester",
                "call=recruit_stonecutter",
                "call=recruit_claydigger",
                "sleep=duration:20s",
                "call=recruit_lumberjack",
                "call=recruit_weaver",
                "call=recruit_carpenter",
                "call=recruit_charcoal_burner",
                "call=recruit_stonemason",
                "call=recruit_miner",
                "sleep=duration:20s",
                "call=recruit_farmer",
                "call=recruit_breeder",
                "call=recruit_miller",
                "call=recruit_baker",
                "call=recruit_brewer",
                "call=recruit_beekeeper",
                "call=recruit_terraformer",
                "sleep=duration:20s",
                "call=recruit_farmer",
                "call=recruit_lumberjack",
                "call=recruit_smelter",
                "call=recruit_smith",
                "call=recruit_shipwright",
                "call=recruit_trainer",
                "call=recruit_geologist",
                "call=recruit_scout",
                "sleep=duration:20s",
                "call=recruit_farmer",
                "call=recruit_lumberjack",
                "call=recruit_forester",
                "call=recruit_builder",
                "call=recruit_recruit",
                "call=recruit_carrier_1",
                "sleep=duration:30s",
                "call=recruit_builder",
                "call=recruit_carrier_idle",
                "sleep=duration:60s",
                "return=skipped"
            }
        },
        recruit_carrier_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs europeans_builder or economy needs europeans_geologist or economy needs europeans_carrier_1",
                "return=skipped when economy needs europeans_farmer_advanced or economy needs europeans_lumberjack_advanced or economy needs europeans_forester_advanced or economy needs europeans_breeder_advanced",
                "return=skipped when economy needs europeans_beekeeper_advanced or economy needs europeans_brewer_advanced or economy needs europeans_miller_advanced or economy needs europeans_baker_advanced",
                "return=skipped when economy needs europeans_stonecutter_advanced or economy needs europeans_claydigger_advanced or economy needs europeans_miner_advanced or economy needs europeans_stonemason_advanced",
                "return=skipped when economy needs europeans_carpenter_advanced or economy needs europeans_weaver_advanced or economy needs europeans_charcoal_burner_advanced or economy needs europeans_smelter_advanced",
                "return=skipped when economy needs europeans_smith_advanced or economy needs europeans_shipwright_advanced or economy needs europeans_terraformer_advanced or economy needs europeans_scout_advanced",
                "sleep=duration:180s",
                "consume=europeans_carrier",
                "animate=working duration:60s",
                "recruit=europeans_carrier_1"
            }
        },
        recruit_carrier_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting first carrier"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_1 or workers need experience",
                "consume=europeans_carrier",
                "animate=working duration:60s",
                "recruit=europeans_carrier_1"
            }
        },
        recruit_builder = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting builder"),
            actions = {
                "return=skipped unless economy needs europeans_builder",
                "return=skipped when not site has hammer",
                "return=skipped when not site has saw",
                "consume=europeans_carrier",
                "consume=hammer saw",
                "animate=working duration:90s",
                "recruit=europeans_builder"
            }
        },
        recruit_baker = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting baker"),
            actions = {
                "return=skipped unless economy needs europeans_baker_basic",
                "return=skipped unless economy needs europeans_baker_normal",
                "return=skipped unless economy needs europeans_baker_advanced",
                "return=skipped when not site has bread_paddle",
                "return=skipped when not site has hook_pole",
                "return=skipped when not site has kitchen_tools",
                "consume=europeans_carrier",
                "consume=bread_paddle hook_pole kitchen_tools",
                "animate=working duration:90s",
                "recruit=europeans_baker_basic"
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
                "animate=working duration:90s",
                "recruit=europeans_beekeeper_basic"
            }
        },
        recruit_breeder = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting breeder"),
            actions = {
                "return=skipped unless economy needs europeans_breeder_basic",
                "return=skipped unless economy needs europeans_breeder_normal",
                "return=skipped unless economy needs europeans_breeder_advanced",
                "return=skipped when economy needs buckets and economy needs water",
                "return=skipped when not site has basket",
                "consume=europeans_carrier",
                "consume=basket buckets",
                "animate=working duration:90s",
                "recruit=europeans_breeder_basic"
            }
        },
        recruit_brewer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting brewer"),
            actions = {
                "return=skipped unless economy needs europeans_brewer_basic",
                "return=skipped unless economy needs europeans_brewer_normal",
                "return=skipped unless economy needs europeans_brewer_advanced",
                "return=skipped when economy needs buckets and economy needs water",
                "consume=europeans_carrier",
                "consume=buckets",
                "animate=working duration:90s",
                "recruit=europeans_brewer_basic"
            }
        },
        recruit_carpenter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting carpenter"),
            actions = {
                "return=skipped unless economy needs europeans_carpenter_basic",
                "return=skipped unless economy needs europeans_carpenter_normal",
                "return=skipped unless economy needs europeans_carpenter_advanced",
                "return=skipped when not site has saw",
                "consume=europeans_carrier",
                "consume=saw",
                "animate=working duration:90s",
                "recruit=europeans_carpenter_basic"
            }
        },
        recruit_charcoal_burner = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting charcoal burner"),
            actions = {
                "return=skipped unless economy needs europeans_charcoal_burner_basic",
                "return=skipped unless economy needs europeans_charcoal_burner_normal",
                "return=skipped unless economy needs europeans_charcoal_burner_advanced",
                "return=skipped when economy needs buckets and economy needs water",
                "return=skipped when not site has shovel",
                "consume=europeans_carrier",
                "consume=shovel buckets",
                "animate=working duration:90s",
                "recruit=europeans_charcoal_burner_basic"
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
                "return=skipped when not site has shovel",
                "consume=europeans_carrier",
                "consume=shovel buckets",
                "animate=working duration:90s",
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
                "return=skipped unless economy needs reed or economy needs barley or economy needs rye or economy needs wheat or economy needs corn or economy needs blackroot or economy needs fruit or economy needs grape",
                "return=skipped when not site has scythe",
                "return=skipped when not site has basket",
                "consume=europeans_carrier",
                "consume=scythe basket",
                "animate=working duration:90s",
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
                "return=skipped when not site has shovel",
                "return=skipped when not site has buckets",
                "consume=europeans_carrier",
                "consume=shovel buckets",
                "animate=working duration:90s",
                "recruit=europeans_forester_basic"
            }
        },
        recruit_geologist = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting geologist"),
            actions = {
                "return=skipped unless economy needs europeans_geologist",
                "return=skipped when economy needs hammer or economy needs pick",
                "return=skipped when not site has hammer",
                "return=skipped when not site has pick",
                "consume=europeans_carrier",
                "consume=hammer pick",
                "animate=working duration:90s",
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
                "return=skipped when not site has felling_ax",
                "consume=europeans_carrier",
                "consume=felling_ax",
                "animate=working duration:90s",
                "recruit=europeans_lumberjack_basic"
            }
        },
        recruit_miller = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting miller"),
            actions = {
                "return=skipped unless economy needs europeans_miller_basic",
                "return=skipped unless economy needs europeans_miller_normal",
                "return=skipped unless economy needs europeans_miller_advanced",
                "return=skipped when economy needs buckets and economy needs water",
                "return=skipped when not site has basket",
                "consume=europeans_carrier",
                "consume=basket buckets",
                "animate=working duration:90s",
                "recruit=europeans_miller_basic"
            }
        },
        recruit_miner = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting miner"),
            actions = {
                "return=skipped unless economy needs europeans_miner_basic",
                "return=skipped unless economy needs europeans_miner_normal",
                "return=skipped unless economy needs europeans_miner_advanced",
                "return=skipped when not site has pick",
                "return=skipped when not site has shovel",
                "return=skipped when not site has buckets",
                "consume=europeans_carrier",
                "consume=pick shovel buckets",
                "animate=working duration:90s",
                "recruit=europeans_miner_basic"
            }
        },
        recruit_recruit = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting recruit because ...
            descname = pgettext("europeans_building", "recruiting recruit"),
            actions = {
                "return=skipped unless economy needs europeans_recruit",
                "consume=europeans_carrier",
                "animate=working duration:90s",
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
                "animate=working duration:90s",
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
                "return=skipped when economy needs hammer or economy needs saw",
                "consume=europeans_carrier",
                "consume=hammer saw",
                "animate=working duration:90s",
                "recruit=europeans_shipwright_basic"
            }
        },
        recruit_smelter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting smelter"),
            actions = {
                "return=skipped unless economy needs europeans_smelter_basic",
                "return=skipped unless economy needs europeans_smelter_normal",
                "return=skipped unless economy needs europeans_smelter_advanced",
                "return=skipped when not site has fire_tongs",
                "return=skipped when not site has shovel",
                "return=skipped when not site has buckets",
                "consume=europeans_carrier",
                "consume=fire_tongs shovel buckets",
                "animate=working duration:90s",
                "recruit=europeans_smelter_basic"
            }
        },
        recruit_smith = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting smith"),
            actions = {
                "return=skipped unless economy needs europeans_smith_basic",
                "return=skipped unless economy needs europeans_smith_normal",
                "return=skipped unless economy needs europeans_smith_advanced",
                "return=skipped when not site has fire_tongs",
                "return=skipped when not site has hammer",
                "return=skipped when not site has saw",
                "consume=europeans_carrier",
                "consume=fire_tongs hammer saw",
                "animate=working duration:90s",
                "recruit=europeans_smith_basic"
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
                "return=skipped when not site has pick",
                "consume=europeans_carrier",
                "consume=pick buckets",
                "animate=working duration:90s",
                "recruit=europeans_stonecutter_basic"
            }
        },
        recruit_stonemason = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting stonemason"),
            actions = {
                "return=skipped unless economy needs europeans_stonemason_basic",
                "return=skipped unless economy needs europeans_stonemason_normal",
                "return=skipped unless economy needs europeans_stonemason_advanced",
                "return=skipped when economy needs buckets and economy needs water",
                "return=skipped when not site has pick",
                "return=skipped when not site has shovel",
                "consume=europeans_carrier",
                "consume=pick shovel buckets",
                "animate=working duration:90s",
                "recruit=europeans_stonemason_basic"
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
                "animate=working duration:90s",
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
                "return=skipped when not site has needles",
                "consume=europeans_carrier",
                "animate=working duration:90s",
                "recruit=europeans_trainer_basic"
            }
        },
        recruit_weaver = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting weaver"),
            actions = {
                "return=skipped unless economy needs europeans_weaver_basic",
                "return=skipped unless economy needs europeans_weaver_normal",
                "return=skipped unless economy needs europeans_weaver_advanced",
                "return=skipped when not site has needles",
                "consume=europeans_carrier",
                "consume=needles",
                "animate=working duration:90s",
                "recruit=europeans_weaver_basic"
            }
        },
    }

}

pop_textdomain()
