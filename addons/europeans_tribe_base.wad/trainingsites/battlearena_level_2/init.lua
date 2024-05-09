push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
    name = "europeans_battlearena_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Battle Arena"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 91, 89 }
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 91, 89 }
      },
    },
    
    size = "big",
    destructible = true,
        
    enhancement = {
        name = "europeans_battlearena_level_3",
        enhancement_cost = {
            planks = 3,
            brick = 3,
            marble = 3,
            marble_column = 3,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 3,
            marble = 6,
            quartz = 1,
            diamond = 1
        },
    },

    size = "big",

    aihints = {
        trainingsites_max_percent = 25,
    },

    working_positions = {
        europeans_trainer_advanced = 1,
        europeans_trainer_normal = 2
    },

    inputs = {
        { name = "coin_copper", amount = 6 },
        { name = "coin_silver", amount = 6 },
        { name = "coin_gold", amount = 6 },
        { name = "armor_processed", amount = 2 },
        { name = "armor_compressed", amount = 2 },
        { name = "armor_advanced", amount =  2 },
        { name = "spear_advanced", amount = 2 },
        { name = "ax_broad", amount = 2 },
        { name = "sword_broad", amount = 2 },
        { name = "helmet_mask", amount = 2 },
        { name = "shield_steel", amount = 2 },
        { name = "shield_advanced", amount = 2 }, 
        { name = "boots_sturdy", amount = 2 },
        { name = "boots_swift", amount = 2 },
        { name = "boots_advanced", amount =  2 }
    },

    programs = {
        sleep = {
            -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
            descname = _"sleeping",
            actions = {
                "call=pausing_training_for_coins",
                "call=pausing_training_for_weapons",
                "sleep=duration:5s",
                "return=skipped",
            }
        },
        pausing_training_for_coins = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing training because ...
            descname = pgettext("europeans_building", "pausing training because lack of coins"),
            actions = {
                "return=skipped when site has coin_copper:4 and site has coin_silver:4 and site has coin_gold:4",
                "sleep=duration:10m",
            }
        },
        pausing_training_for_weapons = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing training because ...
            descname = pgettext("europeans_building", "pausing training because lack of weapons, armor and boots"),
            actions = {
                "return=skipped when site has armor_processed and site has spear_advanced and site has helmet_mask and site has boots_sturdy",
                "return=skipped when site has armor_compressed and site has ax_broad and site has shield_steel and site has boots_swift",
                "return=skipped when site has armor_advanced and site has sword_broad and site has shield_advanced and site has boots_advanced",
                "sleep=duration:5m",
            }
        },
        upgrade_soldier_health_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:health level:0",
                "sleep=duration:20s",
                "checksoldier=soldier:health level:0",
                "consume=coin_copper armor_processed",
                "train=soldier:health level:1",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_health_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:health level:1",
                "sleep=duration:20s",
                "checksoldier=soldier:health level:1",
                "consume=coin_silver armor_compressed",
                "train=soldier:health level:2",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_health_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 2 to level 3"),
            actions = {
                "checksoldier=soldier:health level:2",
                "sleep=duration:20s",
                "checksoldier=soldier:health level:2",
                "consume=coin_gold armor_advanced",
                "train=soldier:health level:3",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_attack_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:attack level:0",
                "sleep=duration:20s",
                "checksoldier=soldier:attack level:0",
                "consume=coin_copper spear_advanced",
                "train=soldier:attack level:1",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_attack_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:attack level:1",
                "sleep=duration:20s",
                "checksoldier=soldier:attack level:1",
                "consume=coin_silver ax_broad",
                "train=soldier:attack level:2",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_attack_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 2 to level 3"),
            actions = {
                "checksoldier=soldier:attack level:2",
                "sleep=duration:20s",
                "checksoldier=soldier:attack level:2",
                "consume=coin_gold sword_broad",
                "train=soldier:attack level:3",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_defense_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:defense level:0",
                "sleep=duration:20s",
                "checksoldier=soldier:defense level:0",
                "consume=coin_copper helmet_mask",
                "train=soldier:defense level:1",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_defense_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:defense level:1",
                "sleep=duration:20s",
                "checksoldier=soldier:defense level:1",
                "consume=coin_silver shield_steel",
                "train=soldier:defense level:2",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_defense_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 2 to level 3"),
            actions = {
                "checksoldier=soldier:defense level:2",
                "sleep=duration:20s",
                "checksoldier=soldier:defense level:2",
                "consume=coin_gold shield_advanced",
                "train=soldier:defense level:3",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_evade_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:evade level:0",
                "sleep=duration:20s",
                "checksoldier=soldier:evade level:0",
                "consume=coin_copper boots_sturdy",
                "train=soldier:evade level:1",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_evade_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:evade level:1",
                "sleep=duration:20s",
                "checksoldier=soldier:evade level:1",
                "consume=coin_silver boots_swift",
                "train=soldier:evade level:2",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_evade_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 2 to level 3"),
            actions = {
                "checksoldier=soldier:evade level:2",
                "sleep=duration:20s",
                "checksoldier=soldier:evade level:2",
                "consume=coin_gold boots_advanced",
                "train=soldier:evade level:3",
                "produce=scrap_metal_mixed"
            }
        },
    },
    
    soldier_capacity = 12,
    trainer_patience = 28,
    
    messages = {
        -- TRANSLATORS: Empire training site tooltip when it has no soldiers assigned
        no_soldier = pgettext("europeans_building", "No soldier to train!"),
        -- TRANSLATORS: Empire training site tooltip when none of the present soldiers match the current training program
        no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
    },
}

pop_textdomain()
