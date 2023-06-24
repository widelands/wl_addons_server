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
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 87, 113 }
      }
    },

    size = "big",
    destructible = true,
    
    enhancement = {
        name = "europeans_battlearena_level_2",
        enhancement_cost = {
            marble_column = 1,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            marble = 1,
            quartz = 1,
            diamond = 1
        },
    },
    
    aihints = {},
    
    working_positions = {
        europeans_trainer_advanced = 1,
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
                "call=recruit_builder",
                "call=recruit_weaver",
                "call=recruit_carpenter",
                "call=recruit_charcoal_burner",
                "call=recruit_stonemason",
                "call=recruit_miner",
                "sleep=duration:20s",
                "call=recruit_breeder",
                "call=recruit_miller",
                "call=recruit_baker",
                "call=recruit_brewer",
                "call=recruit_beekeeper",
                "call=recruit_terraformer",
                "sleep=duration:20s",
                "call=recruit_smelter",
                "call=recruit_smith",
                "call=recruit_shipwright",
                "call=recruit_trainer",
                "call=recruit_geologist",
                "call=recruit_scout",
                "sleep=duration:20s",
                "call=recruit_recruit",
                "call=recruit_carrier_1",
                "call=recruit_carrier_2",
                "call=recruit_carrier_3",
                "sleep=duration:30s",
                "call=recruit_carrier_idle",
                "sleep=duration:30s",
                "return=skipped"
            }
        },
        recruit_carrier_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs europeans_builder or economy needs europeans_geologist or economy needs europeans_carrier_1 or economy needs europeans_carrier_2 or economy needs europeans_carrier_3",
                "return=skipped when economy needs europeans_farmer_advanced or economy needs europeans_lumberjack_advanced or economy needs europeans_forester_advanced or economy needs europeans_breeder_advanced",
                "return=skipped when economy needs europeans_beekeeper_advanced or economy needs europeans_brewer_advanced or economy needs europeans_miller_advanced or economy needs europeans_baker_advanced",
                "return=skipped when economy needs europeans_stonecutter_advanced or economy needs europeans_claydigger_advanced or economy needs europeans_miner_advanced or economy needs europeans_stonemason_advanced",
                "return=skipped when economy needs europeans_carpenter_advanced or economy needs europeans_weaver_advanced or economy needs europeans_charcoal_burner_advanced or economy needs europeans_smelter_advanced",
                "return=skipped when economy needs europeans_smith_advanced or economy needs europeans_shipwright_advanced or economy needs europeans_terraformer_advanced or economy needs europeans_scout_advanced",
                "return=skipped when economy needs basket",
                "return=skipped when economy needs iron",
                "return=skipped when economy needs gold",
                "sleep=duration:180s",
                "consume=europeans_carrier",
                "animate=working duration:180s",
                "recruit=europeans_carrier_1",
                "sleep=duration:15s",
                "consume=europeans_carrier basket",
                "animate=working duration:180s",
                "recruit=europeans_carrier_2",
                "sleep=duration:15s",
                "consume=europeans_carrier basket",
                "animate=working duration:180s",
                "recruit=europeans_carrier_3"
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
        recruit_carrier_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting second carrier"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_2 or workers need experience",
                "return=skipped when economy needs basket",
                "consume=basket europeans_carrier",
                "animate=working duration:60s",
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
                "animate=working duration:60s",
                "recruit=europeans_carrier_3"
            }
        },
        recruit_builder = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting builder"),
            actions = {
                "return=skipped unless economy needs europeans_builder",
                "return=skipped when economy needs hammer and economy needs saw",
                "consume=europeans_carrier",
                "consume=hammer saw",
                "animate=working duration:180s",
                "recruit=europeans_builder"
            }
        },
        recruit_baker = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting baker"),
            actions = {
                "return=skipped unless economy needs europeans_baker_advanced",
                "return=skipped when economy needs bread_paddle or economy needs hook_pole or economy needs kitchen_tools",
                "consume=europeans_carrier",
                "consume=bread_paddle hook_pole kitchen_tools",
                "animate=working duration:180s",
                "recruit=europeans_baker_advanced"
            }
        },
        recruit_beekeeper = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting beekeeper"),
            actions = {
                "return=skipped unless economy needs europeans_beekeeper_advanced",
                "return=skipped when economy needs buckets",
                "consume=europeans_carrier",
                "consume=buckets",
                "animate=working duration:180s",
                "recruit=europeans_beekeeper_advanced"
            }
        },
        recruit_breeder = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting breeder"),
            actions = {
                "return=skipped unless economy needs europeans_breeder_advanced",
                "return=skipped when economy needs buckets or economy needs basket",
                "consume=europeans_carrier",
                "consume=basket buckets",
                "animate=working duration:180s",
                "recruit=europeans_breeder_advanced"
            }
        },
        recruit_brewer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting brewer"),
            actions = {
                "return=skipped unless economy needs europeans_brewer_advanced",
                "return=skipped when economy needs buckets",
                "consume=europeans_carrier",
                "consume=buckets",
                "animate=working duration:180s",
                "recruit=europeans_brewer_advanced"
            }
        },
        recruit_carpenter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting carpenter"),
            actions = {
                "return=skipped unless economy needs europeans_carpenter_advanced",
                "return=skipped when economy needs saw",
                "consume=europeans_carrier",
                "consume=saw",
                "animate=working duration:180s",
                "recruit=europeans_carpenter_advanced"
            }
        },
        recruit_charcoal_burner = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting charcoal burner"),
            actions = {
                "return=skipped unless economy needs europeans_charcoal_burner_advanced",
                "return=skipped when economy needs buckets or economy needs shovel",
                "consume=europeans_carrier",
                "consume=shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_charcoal_burner_advanced"
            }
        },
        recruit_claydigger = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting claydigger"),
            actions = {
                "return=skipped unless economy needs europeans_claydigger_advanced",
                "return=skipped when economy needs buckets or economy needs shovel",
                "consume=europeans_carrier",
                "consume=shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_claydigger_advanced"
            }
        },
        recruit_farmer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting farmer"),
            actions = {
                "return=skipped unless economy needs europeans_farmer_advanced",
                "return=skipped unless economy needs reed or economy needs barley or economy needs rye or economy needs wheat or economy needs corn or economy needs blackroot or economy needs fruit or economy needs grape",
                "return=skipped when economy needs basket or economy needs scythe",
                "consume=europeans_carrier",
                "consume=scythe basket",
                "animate=working duration:180s",
                "recruit=europeans_farmer_advanced"
            }
        },
        recruit_forester = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting forester"),
            actions = {
                "return=skipped unless economy needs europeans_forester_advanced",
                "return=skipped when economy needs buckets or economy needs shovel",
                "consume=europeans_carrier",
                "consume=shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_forester_advanced"
            }
        },
        recruit_geologist = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting geologist"),
            actions = {
                "return=skipped unless economy needs europeans_geologist",
                "return=skipped when economy needs hammer or economy needs pick",
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
                "return=skipped unless economy needs europeans_lumberjack_advanced",
                "return=skipped when economy needs felling_ax or economy needs saw",
                "consume=europeans_carrier",
                "consume=felling_ax saw",
                "animate=working duration:180s",
                "recruit=europeans_lumberjack_advanced"
            }
        },
        recruit_miller = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting miller"),
            actions = {
                "return=skipped unless economy needs europeans_miller_advanced",
                "return=skipped when economy needs buckets or economy needs basket",
                "consume=europeans_carrier",
                "consume=basket buckets",
                "animate=working duration:180s",
                "recruit=europeans_miller_advanced"
            }
        },
        recruit_miner = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting miner"),
            actions = {
                "return=skipped unless economy needs europeans_miner_advanced",
                "return=skipped when economy needs buckets or economy needs shovel or economy needs pick",
                "consume=europeans_carrier",
                "consume=pick shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_miner_advanced"
            }
        },
        recruit_recruit = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting recruit because ...
            descname = pgettext("europeans_building", "recruiting recruit"),
            actions = {
                "return=skipped unless economy needs europeans_recruit",
                "consume=europeans_carrier",
                "animate=working duration:60s",
                "recruit=europeans_recruit"
            }
        },
        recruit_scout = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting scout"),
            actions = {
                "return=skipped unless economy needs europeans_scout_advanced",
                "consume=europeans_carrier",
                "animate=working duration:180s",
                "recruit=europeans_scout_advanced"
            }
        },
        recruit_shipwright = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting shipwright"),
            actions = {
                "return=skipped unless economy needs europeans_shipwright_advanced",
                "return=skipped when economy needs hammer or economy needs saw",
                "consume=europeans_carrier",
                "consume=hammer saw",
                "animate=working duration:180s",
                "recruit=europeans_shipwright_advanced"
            }
        },
        recruit_smelter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting smelter"),
            actions = {
                "return=skipped unless economy needs europeans_smelter_advanced",
                "return=skipped when economy needs buckets or economy needs shovel or economy needs fire_tongs",
                "consume=europeans_carrier",
                "consume=fire_tongs shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_smelter_advanced"
            }
        },
        recruit_smith = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting smith"),
            actions = {
                "return=skipped unless economy needs europeans_smith_advanced",
                "return=skipped when economy needs hammer or economy needs saw or economy needs fire_tongs",
                "consume=europeans_carrier",
                "consume=fire_tongs hammer saw",
                "animate=working duration:180s",
                "recruit=europeans_smith_advanced"
            }
        },
        recruit_stonecutter = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting stonecutter"),
            actions = {
                "return=skipped unless economy needs europeans_stonecutter_advanced",
                "return=skipped when economy needs buckets or economy needs pick",
                "consume=europeans_carrier",
                "consume=pick buckets",
                "animate=working duration:180s",
                "recruit=europeans_stonecutter_advanced"
            }
        },
        recruit_stonemason = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting stonemason"),
            actions = {
                "return=skipped unless economy needs europeans_stonemason_advanced",
                "return=skipped when economy needs buckets or economy needs shovel or economy needs pick",
                "consume=europeans_carrier",
                "consume=pick shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_stonemason_advanced"
            }
        },
        recruit_terraformer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting terraformer"),
            actions = {
                "return=skipped unless economy needs europeans_terraformer_advanced",
                "return=skipped when economy needs buckets or economy needs shovel or economy needs pick",
                "return=skipped when economy needs water",
                "consume=europeans_carrier",
                "consume=pick shovel buckets",
                "animate=working duration:180s",
                "recruit=europeans_terraformer_advanced"
            }
        },
        recruit_trainer = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting trainer"),
            actions = {
                "return=skipped unless economy needs europeans_trainer_advanced",
                "consume=europeans_carrier",
                "animate=working duration:180s",
                "recruit=europeans_trainer_advanced"
            }
        },
        recruit_weaver = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
            descname = pgettext("europeans_building", "recruiting weaver"),
            actions = {
                "return=skipped unless economy needs europeans_weaver_advanced",
                "return=skipped when economy needs needles",
                "consume=europeans_carrier",
                "consume=needles",
                "animate=working duration:180s",
                "recruit=europeans_weaver_advanced"
            }
        }
    }
}

pop_textdomain()
