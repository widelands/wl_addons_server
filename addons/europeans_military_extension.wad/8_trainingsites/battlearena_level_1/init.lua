push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/trainingsites/barbarians/trainingcamp/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_battlearena_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Battle Arena"),
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
      working = {
         basename = "idle",
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 110, 75 }
      },
    },
    
    size = "big",
    destructible = true,
    
    enhancement = {
        name = "europeans_battlearena_level_2",
        enhancement_cost = {
            brick = 3,
            grout = 3,
            planks = 3,
            marble = 3,
            marble_column = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 3,
            marble = 4
        },
    },

    aihints = {
        trainingsites_max_percent = 33,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 1,
    },

    working_positions = {
        europeans_trainer_advanced = 1,
        europeans_trainer_basic = 2
    },

    
    inputs = {
        { name = "armor_processed", amount = 4 },
        { name = "armor_compressed", amount = 4 },
        { name = "spear_advanced", amount = 4 },
        { name = "ax_broad", amount = 4 },
        { name = "helmet_mask", amount = 4 },
        { name = "shield_steel", amount = 4 }, 
        { name = "boots_sturdy", amount = 4 },
        { name = "boots_swift", amount = 4 },
    },

    programs = {
        sleep = {
            -- TRANSLATORS: Completed/Skipped/Did not start sleeping because ...
            descname = _"sleeping",
            actions = {
                "call=pausing_training_for_weapons",
                "sleep=duration:5s",
                "return=skipped",
            }
        },
        pausing_training_for_weapons = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing training because ...
            descname = pgettext("europeans_building", "pausing training because lack of weapons, armor and boots"),
            actions = {
                "return=skipped when site has armor_processed and site has spear_advanced and site has helmet_mask and site has boots_sturdy",
                "return=skipped when site has armor_compressed and site has ax_broad and site has shield_steel and site has boots_swift",
                "sleep=duration:5m",
            }
        },
        upgrade_soldier_health_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:health level:0",
                "sleep=duration:25s",
                "checksoldier=soldier:health level:0",
                "consume=armor_processed",
                "train=soldier:health level:1"
            }
        },
        upgrade_soldier_health_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:health level:1",
                "sleep=duration:25s",
                "checksoldier=soldier:health level:1",
                "consume=armor_compressed",
                "train=soldier:health level:2",
                "produce=scrap_metal"
            }
        },
        upgrade_soldier_attack_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:attack level:0",
                "sleep=duration:25s",
                "checksoldier=soldier:attack level:0",
                "consume=spear_advanced",
                "train=soldier:attack level:1"
            }
        },
        upgrade_soldier_attack_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:attack level:1",
                "sleep=duration:25s",
                "checksoldier=soldier:attack level:1",
                "consume=ax_broad",
                "train=soldier:attack level:2",
                "produce=scrap_metal"
            }
        },
        upgrade_soldier_defense_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:defense level:0",
                "sleep=duration:25s",
                "checksoldier=soldier:defense level:0",
                "consume=helmet_mask",
                "train=soldier:defense level:1"
            }
        },
        upgrade_soldier_defense_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:defense level:1",
                "sleep=duration:25s",
                "checksoldier=soldier:defense level:1",
                "consume=shield_steel",
                "train=soldier:defense level:2",
                "produce=scrap_metal"
            }
        },
        upgrade_soldier_evade_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:evade level:0",
                "sleep=duration:25s",
                "checksoldier=soldier:evade level:0",
                "consume=boots_sturdy",
                "train=soldier:evade level:1"
            }
        },
        upgrade_soldier_evade_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:evade level:1",
                "sleep=duration:25s",
                "checksoldier=soldier:evade level:1",
                "consume=boots_swift",
                "train=soldier:evade level:2",
                "produce=scrap_metal"
            }
        },
    },
    
    soldier_capacity = 6,
    trainer_patience = 24,
    
    messages = {
        -- TRANSLATORS: Empire training site tooltip when it has no soldiers assigned
        no_soldier = pgettext("europeans_building", "No soldier to train!"),
        -- TRANSLATORS: Empire training site tooltip when none of the present soldiers match the current training program
        no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
    },
}

pop_textdomain()
