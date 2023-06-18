push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
    name = "europeans_battlearena_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Battle Arena Level 1"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 110, 75 }
      }
    },
    spritesheets = {
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 110, 75 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 110, 77 }
      },
    },
    
    size = "big",
    enhancement = {
        name = "europeans_battlearena_level_2",
        enhancement_cost = {
            brick = 3,
            marble_column = 3,
            quartz = 1,
            diamond = 1,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            granite = 3,
            marble = 3,
            quartz = 1,
            diamond = 1,
            scrap_metal_mixed = 1
        },
    },

    aihints = {
        trainingsites_max_percent = 25,
    },

    working_positions = {
        europeans_trainer_normal = 2,
        europeans_trainer_basic = 1
    },

    
    inputs = {
        { name = "coin_copper", amount = 4 },
        { name = "coin_silver", amount = 4 },
        { name = "armor_processed", amount = 2 },
        { name = "armor_chain", amount = 2 },
        { name = "spear_advanced", amount = 2 },
        { name = "ax_broad", amount = 2 },
        { name = "helmet_mask", amount = 2 },
        { name = "shield_steel", amount = 2 }, 
        { name = "boots_sturdy", amount = 2 },
        { name = "boots_swift", amount = 2 },
    },

    programs = {
        sleep = {
            -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
            descname = _"sleeping",
            actions = {
                "sleep=duration:5s",
                "return=skipped",
            }
        },
        upgrade_soldier_health_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:health level:0",
                "sleep=duration:40s",
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
                "sleep=duration:40s",
                "checksoldier=soldier:health level:1",
                "consume=coin_silver armor_chain",
                "train=soldier:health level:2",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_attack_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:attack level:0",
                "sleep=duration:40s",
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
                "sleep=duration:40s",
                "checksoldier=soldier:attack level:1",
                "consume=coin_silver ax_broad",
                "train=soldier:attack level:2",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_defense_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:defense level:0",
                "sleep=duration:40s",
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
                "sleep=duration:40s",
                "checksoldier=soldier:defense level:1",
                "consume=coin_silver shield_steel",
                "train=soldier:defense level:2",
                "produce=scrap_metal_mixed"
            }
        },
        upgrade_soldier_evade_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:evade level:0",
                "sleep=duration:40s",
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
                "sleep=duration:40s",
                "checksoldier=soldier:evade level:1",
                "consume=coin_silver boots_swift",
                "train=soldier:evade level:2",
                "produce=scrap_metal_mixed"
            }
        },
    },
    
    soldier_capacity = 12,
    trainer_patience = 16,
    
    messages = {
        -- TRANSLATORS: Empire training site tooltip when it has no soldiers assigned
        no_soldier = pgettext("europeans_building", "No soldier to train!"),
        -- TRANSLATORS: Empire training site tooltip when none of the present soldiers match the current training program
        no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
    },
}

pop_textdomain()
