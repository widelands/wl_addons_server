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
          planks = 3,
          cloth = 3,
          brick = 3,
          grout = 3,
          quartz = 1
      },
      enhancement_return_on_dismantle = {
          planks = 2,
          granite = 3,
          quartz = 1
      }
   },
   
   buildcost = {
      planks = 4,
      reed = 4,
      granite = 2
   },
   return_on_dismantle = {
      planks = 3,
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
      weak_ai_limit = 1
   },
   
   working_positions = {
      europeans_trainer = 1
   },
   
   inputs = {
      { name = "europeans_recruit", amount = 24 },
      { name = "buckets", amount = 6 },
      { name = "shovel", amount = 6 },
      { name = "saw", amount = 5 },
      { name = "hammer", amount = 4 },
      { name = "pick", amount = 3 },
      { name = "basket", amount = 3 },
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
      { name = "spear_wooden", amount = 4 },
      { name = "armor", amount = 2 },
      { name = "tabard", amount = 2 }
   },

   programs = {
      main = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = _"working",
         actions = {
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
            "call=recruit_soldier"
         }
      },
      recruit_builder = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting builder"),
         actions = {
            "return=skipped unless economy needs europeans_builder",
            "sleep=duration:30s",
            "consume=hammer saw europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_builder"
         }
      },
      recruit_smith = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting smith"),
         actions = {
            "return=skipped unless economy needs europeans_smith_basic",
            "sleep=duration:30s",
            "consume=hammer fire_tongs saw europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_smith_basic"
         }
      },
      recruit_farmer = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting farmer"),
         actions = {
            "return=skipped unless economy needs europeans_farmer_basic",
            "sleep=duration:30s",
            "consume=scythe basket europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_farmer_basic"
         }
      },
      recruit_lumberjack = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting lumberjack"),
         actions = {
            "return=skipped unless economy needs europeans_lumberjack_basic",
            "sleep=duration:30s",
            "consume=felling_ax saw europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_lumberjack_basic"
         }
      },
      recruit_carpenter = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting carpenter"),
         actions = {
            "return=skipped unless economy needs europeans_carpenter_basic",
            "sleep=duration:30s",
            "consume=saw europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_carpenter_basic"
         }
      },
      recruit_stonecutter = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting stonecutter"),
         actions = {
            "return=skipped unless economy needs europeans_stonecutter_basic",
            "sleep=duration:30s",
            "consume=pick europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_stonecutter_basic"
         }
      },
      recruit_stonemason = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting stonemason"),
         actions = {
            "return=skipped unless economy needs europeans_stonemason_basic",
            "sleep=duration:30s",
            "consume=pick shovel buckets europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_stonemason_basic"
         }
      },
      recruit_charcoal_burner = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting charcoal burner"),
         actions = {
            "return=skipped unless economy needs europeans_charcoal_burner_basic",
            "sleep=duration:30s",
            "consume=shovel buckets europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_charcoal_burner_basic"
         }
      },
      recruit_breeder = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting breeder"),
         actions = {
            "return=skipped unless economy needs europeans_breeder_basic",
            "sleep=duration:30s",
            "consume=milking_tongs europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_breeder_basic"
         }
      },
      recruit_weaver = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting weaver"),
         actions = {
            "return=skipped unless economy needs europeans_weaver_basic",
            "sleep=duration:30s",
            "consume=needles europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_weaver_basic"
         }
      },
      recruit_fisher = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting fisher"),
         actions = {
            "return=skipped unless economy needs europeans_fisher_basic",
            "sleep=duration:30s",
            "consume=fishing_rod fishing_net europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_fisher_basic"
         }
      },
      recruit_hunter = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting hunter"),
         actions = {
            "return=skipped unless economy needs europeans_hunter_basic",
            "sleep=duration:30s",
            "consume=hunting_bow hunting_spear europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_hunter_basic"
         }
      },
      recruit_miller = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting miller"),
         actions = {
            "return=skipped unless economy needs europeans_miller_basic",
            "sleep=duration:30s",
            "consume=basket europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_miller_basic"
         }
      },
      recruit_baker = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting baker"),
         actions = {
            "return=skipped unless economy needs europeans_baker_basic",
            "sleep=duration:30s",
            "consume=bread_paddle europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_baker_basic"
         }
      },
      recruit_smoker = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting smoker"),
         actions = {
            "return=skipped unless economy needs europeans_smoker_basic",
            "sleep=duration:30s",
            "consume=hook_pole europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_smoker_basic"
         }
      },
      recruit_brewer = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting brewer"),
         actions = {
            "return=skipped unless economy needs europeans_brewer_basic",
            "sleep=duration:30s",
            "consume=buckets europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_brewer_basic"
         }
      },
      recruit_miner = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting miner"),
         actions = {
            "return=skipped unless economy needs europeans_miner_basic",
            "sleep=duration:30s",
            "consume=pick shovel europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_miner_basic"
         }
      },
      recruit_smelter = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting smelter"),
         actions = {
            "return=skipped unless economy needs europeans_smelter_basic",
            "sleep=duration:30s",
            "consume=fire_tongs shovel europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_smelter_basic"
         }
      },
      recruit_forester = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting forester"),
         actions = {
            "return=skipped unless economy needs europeans_forester_basic",
            "sleep=duration:30s",
            "consume=buckets shovel europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_forester_basic"
         }
      },
      recruit_fishbreeder = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting fishbreeder"),
         actions = {
            "return=skipped unless economy needs europeans_fishbreeder",
            "sleep=duration:30s",
            "consume=buckets shovel europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_fishbreeder"
         }
      },
      recruit_gamekeeper = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting gamekeeper"),
         actions = {
            "return=skipped unless economy needs europeans_gamekeeper",
            "sleep=duration:30s",
            "consume=basket europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_gamekeeper"
         }
      },
      recruit_beekeeper = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting beekeeper"),
         actions = {
            "return=skipped unless economy needs europeans_beekeeper",
            "sleep=duration:30s",
            "consume=buckets europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_beekeeper"
         }
      },
      recruit_shipwright = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting shipwright"),
         actions = {
            "return=skipped unless economy needs europeans_shipwright",
            "sleep=duration:30s",
            "consume=hammer saw europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_shipwright"
         }
      },
      recruit_geologist = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting geologist"),
         actions = {
            "return=skipped unless economy needs europeans_geologist",
            "sleep=duration:30s",
            "consume=hammer europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_geologist"
         }
      },
      recruit_scout = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting worker because ...
         descname = pgettext("europeans_building", "recruiting scout"),
         actions = {
            "return=skipped unless economy needs europeans_scout_basic",
            "sleep=duration:30s",
            "consume=europeans_recruit",
            "animate=working duration:30s",
            "recruit=europeans_scout_basic"
         }
      },
      recruit_trainer = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("europeans_building", "recruiting trainer"),
         actions = {
            "return=skipped unless economy needs europeans_trainer",
            "sleep=duration:30s",
            "consume=armor,tabard spear_wooden europeans_recruit",
            "animate=working duration:60s",
            "recruit=europeans_trainer"
         }
      },
      recruit_soldier = {
         -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
         descname = pgettext("europeans_building", "recruiting soldier"),
         actions = {
            "return=skipped unless economy needs europeans_soldier",
            "sleep=duration:30s",
            "consume=armor,tabard spear_wooden europeans_recruit",
            "animate=working duration:60s",
            "recruit=europeans_soldier"
         }
      },
   }

}

pop_textdomain()
