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
          brick = 3,
          grout = 3,
          marble_column = 3,
          diamond = 1
      },
      enhancement_return_on_dismantle = {
          granite = 3,
          marble = 3,
          diamond = 1
      }
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

   aihints = {},
   
   working_positions = {
      europeans_trainer_normal = 1
   },
   
   inputs = {
      { name = "europeans_carrier", amount = 24 },
      { name = "basket", amount = 12 },
      { name = "buckets", amount = 6 },
      { name = "shovel", amount = 6 },
      { name = "saw", amount = 5 },
      { name = "hammer", amount = 4 },
      { name = "pick", amount = 3 },
      { name = "felling_ax", amount = 2 },
      { name = "fire_tongs", amount = 2 },
      { name = "scythe", amount = 2 },
      { name = "milking_tongs", amount = 2 },
      { name = "needles", amount = 2 },
      { name = "fishing_rod", amount = 2 },
      { name = "fishing_net", amount = 2 },
      { name = "hunting_bow", amount = 2 },
      { name = "hunting_spear", amount = 2 },
      { name = "bread_paddle", amount = 2 },
      { name = "hook_pole", amount = 2 },
      { name = "spear_wooden", amount = 2 },
      { name = "armor", amount = 2 },
      { name = "tabard", amount = 2 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
            "call=recruit_carrier_1",
            "call=recruit_carrier_2",
            "call=recruit_builder",
            "call=recruit_smith",
            "call=recruit_farmer",
            "call=recruit_lumberjack",
            "call=recruit_carpenter",
            "call=recruit_stonecutter",
            "call=recruit_stonemason",
            "call=recruit_charcoal_burner",
            "call=recruit_breeder",
            "call=recruit_weaver",
            "call=recruit_fisher",
            "call=recruit_hunter",
            "call=recruit_miller",
            "call=recruit_baker",
            "call=recruit_smoker",
            "call=recruit_brewer",
            "call=recruit_miner",
            "call=recruit_smelter",
            "call=recruit_forester",
            "call=recruit_fishbreeder",
            "call=recruit_gamekeeper",
            "call=recruit_beekeeper",
            "call=recruit_shipwright",
            "call=recruit_geologist",
            "call=recruit_scout",
            "call=recruit_trainer",
            "return=skipped"
         }
      },
      recruit_carrier_1 = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting first carrier"),
         actions = {
            "return=skipped unless economy needs europeans_carrier_1",
            "sleep=duration:20s",
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
            "sleep=duration:20s",
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
            "sleep=duration:20s",
            "consume=hammer saw europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_builder"
         }
      },
      recruit_smith = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting smith"),
         actions = {
            "return=skipped unless economy needs europeans_smith_normal",
            "sleep=duration:20s",
            "consume=hammer fire_tongs saw europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_smith_normal"
         }
      },
      recruit_farmer = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting farmer"),
         actions = {
            "return=skipped unless economy needs europeans_farmer_normal",
            "sleep=duration:20s",
            "consume=scythe basket europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_farmer_normal"
         }
      },
      recruit_lumberjack = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting lumberjack"),
         actions = {
            "return=skipped unless economy needs europeans_lumberjack_normal",
            "sleep=duration:20s",
            "consume=felling_ax saw europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_lumberjack_normal"
         }
      },
      recruit_carpenter = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting carpenter"),
         actions = {
            "return=skipped unless economy needs europeans_carpenter_normal",
            "sleep=duration:20s",
            "consume=saw europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_carpenter_normal"
         }
      },
      recruit_stonecutter = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting stonecutter"),
         actions = {
            "return=skipped unless economy needs europeans_stonecutter_normal",
            "sleep=duration:20s",
            "consume=pick europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_stonecutter_normal"
         }
      },
      recruit_stonemason = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting stonemason"),
         actions = {
            "return=skipped unless economy needs europeans_stonemason_normal",
            "sleep=duration:20s",
            "consume=pick shovel buckets europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_stonemason_normal"
         }
      },
      recruit_charcoal_burner = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting charcoal burner"),
         actions = {
            "return=skipped unless economy needs europeans_charcoal_burner_normal",
            "sleep=duration:20s",
            "consume=shovel buckets europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_charcoal_burner_normal"
         }
      },
      recruit_breeder = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting breeder"),
         actions = {
            "return=skipped unless economy needs europeans_breeder_normal",
            "sleep=duration:20s",
            "consume=milking_tongs europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_breeder_normal"
         }
      },
      recruit_weaver = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting weaver"),
         actions = {
            "return=skipped unless economy needs europeans_weaver_normal",
            "sleep=duration:20s",
            "consume=needles europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_weaver_normal"
         }
      },
      recruit_fisher = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting fisher"),
         actions = {
            "return=skipped unless economy needs europeans_fisher_normal",
            "sleep=duration:20s",
            "consume=fishing_rod fishing_net europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_fisher_normal"
         }
      },
      recruit_hunter = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting hunter"),
         actions = {
            "return=skipped unless economy needs europeans_hunter_normal",
            "sleep=duration:20s",
            "consume=hunting_bow hunting_spear europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_hunter_normal"
         }
      },
      recruit_miller = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting miller"),
         actions = {
            "return=skipped unless economy needs europeans_miller_normal",
            "sleep=duration:20s",
            "consume=basket europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_miller_normal"
         }
      },
      recruit_baker = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting baker"),
         actions = {
            "return=skipped unless economy needs europeans_baker_normal",
            "sleep=duration:20s",
            "consume=bread_paddle europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_baker_normal"
         }
      },
      recruit_smoker = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting smoker"),
         actions = {
            "return=skipped unless economy needs europeans_smoker_normal",
            "sleep=duration:20s",
            "consume=hook_pole europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_smoker_normal"
         }
      },
      recruit_brewer = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting brewer"),
         actions = {
            "return=skipped unless economy needs europeans_brewer_normal",
            "sleep=duration:20s",
            "consume=buckets europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_brewer_normal"
         }
      },
      recruit_miner = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting miner"),
         actions = {
            "return=skipped unless economy needs europeans_miner_normal",
            "sleep=duration:20s",
            "consume=pick shovel europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_miner_normal"
         }
      },
      recruit_smelter = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting smelter"),
         actions = {
            "return=skipped unless economy needs europeans_smelter_normal",
            "sleep=duration:20s",
            "consume=fire_tongs shovel europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_smelter_normal"
         }
      },
      recruit_forester = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting forester"),
         actions = {
            "return=skipped unless economy needs europeans_forester_normal",
            "sleep=duration:20s",
            "consume=buckets shovel europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_forester_normal"
         }
      },
      recruit_fishbreeder = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting fishbreeder"),
         actions = {
            "return=skipped unless economy needs europeans_fishbreeder_normal",
            "sleep=duration:20s",
            "consume=buckets shovel europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_fishbreeder_normal"
         }
      },
      recruit_gamekeeper = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting gamekeeper"),
         actions = {
            "return=skipped unless economy needs europeans_gamekeeper_normal",
            "sleep=duration:20s",
            "consume=basket europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_gamekeeper_normal"
         }
      },
      recruit_beekeeper = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting beekeeper"),
         actions = {
            "return=skipped unless economy needs europeans_beekeeper_normal",
            "sleep=duration:20s",
            "consume=buckets europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_beekeeper_normal"
         }
      },
      recruit_shipwright = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting shipwright"),
         actions = {
            "return=skipped unless economy needs europeans_shipwright_normal",
            "sleep=duration:20s",
            "consume=hammer saw europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_shipwright_normal"
         }
      },
      recruit_geologist = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting geologist"),
         actions = {
            "return=skipped unless economy needs europeans_geologist",
            "sleep=duration:20s",
            "consume=hammer europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_geologist"
         }
      },
      recruit_scout = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting scout"),
         actions = {
            "return=skipped unless economy needs europeans_scout_normal",
            "sleep=duration:20s",
            "consume=europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_scout_normal"
         }
      },
      recruit_trainer = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("europeans_building", "recruiting trainer"),
         actions = {
            "return=skipped unless economy needs europeans_trainer_normal",
            "sleep=duration:20s",
            "consume=armor,tabard spear_wooden europeans_carrier",
            "animate=working duration:30s",
            "recruit=europeans_trainer_normal"
         }
      },
   }
}

pop_textdomain()
