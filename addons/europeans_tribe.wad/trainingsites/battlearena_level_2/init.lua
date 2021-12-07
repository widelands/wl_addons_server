push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_trainingsite_type {
    name = "europeans_battlearena_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Battle Arena Level 2"),
    icon = dirname .. "menu.png",
    size = "big",

    enhancement = {
        name = "europeans_battlearena_level_3",
        enhancement_cost = {
            brick = 3,
            grout = 3,
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

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 80, 88 },
        }
    },

    aihints = {
        trainingsites_max_percent = 20,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
      --normal_ai_limit = 4
    },

    working_positions = {
        europeans_trainer_normal = 1
    },
    
    inputs = {
        { name = "ration", amount = 8 },
        { name = "snack", amount = 8 },
        { name = "beer", amount = 8 },
        { name = "mead", amount = 8 },
        { name = "helmet_mask", amount = 2 },
        { name = "shield_steel", amount = 2 }, 
        { name = "spear_advanced", amount = 2 },
        { name = "ax_broad", amount = 2 },
        { name = "armor", amount = 2 },
        { name = "armor_chain", amount = 2 }
    },

    ["soldier health"] = {
        food = {
          {"ration", "snack"},
          {"beer", "mead"}
        },
        weapons = {"armor", "tabard", "armor_chain"}
    },

    ["soldier evade"] = {
        food = {
          {"ration", "snack"},
          {"beer", "mead"}
        }
    },
        
    ["soldier defense"] = {
        food = {
          {"ration", "snack"},
          {"beer", "mead"}
        },
        weapons = {"helmet_mask", "shield_steel"}
    },

    ["soldier attack"] = {
        food = {
          {"ration", "snack"},
          {"beer", "mead"}
        },
        weapons = {"spear_advanced", "ax_broad"}
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
                "return=skipped when economy needs armor",
                "checksoldier=soldier:health level:0",
                "sleep=duration:30s",
                "checksoldier=soldier:health level:0",
                "consume=ration beer armor",
                "train=soldier:health level:1"
            }
        },
        upgrade_soldier_health_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:health level:1",
                "sleep=duration:30s",
                "checksoldier=soldier:health level:1",
                "consume=snack mead armor_chain",
                "train=soldier:health level:2",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_evade_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 0 to level 1"),
            actions = {
                "return=skipped when economy needs beer",
                "checksoldier=soldier:evade level:0",
                "sleep=duration:30s",
                "checksoldier=soldier:evade level:0",
                "consume=ration:2 beer:2",
                "train=soldier:evade level:1"
            }
        },
        upgrade_soldier_evade_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 1 to level 2"),
            actions = {
                "return=skipped when economy needs beer_strong and economy needs mead",
                "checksoldier=soldier:evade level:1",
                "sleep=duration:30s",
                "checksoldier=soldier:evade level:1",
                "consume=snack:2 mead:2",
                "train=soldier:evade level:2"
            }
        },
        upgrade_soldier_defense_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:defense level:0",
                "sleep=duration:30s",
                "checksoldier=soldier:defense level:0",
                "consume=ration beer helmet_mask",
                "train=soldier:defense level:1",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_defense_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:defense level:1",
                "sleep=duration:30s",
                "checksoldier=soldier:defense level:1",
                "consume=snack mead shield_steel",
                "train=soldier:defense level:2",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_attack_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:attack level:0",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:0",
                "consume=ration beer spear_advanced",
                "train=soldier:attack level:1",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_attack_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:attack level:1",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:1",
                "consume=snack mead ax_broad",
                "train=soldier:attack level:2",
                "produce=scrap_iron"
            }
        },
    },
    
    soldier_capacity = 12,
    trainer_patience = 18,
    
    messages = {
        -- TRANSLATORS: Empire training site tooltip when it has no soldiers assigned
        no_soldier = pgettext("europeans_building", "No soldier to train!"),
        -- TRANSLATORS: Empire training site tooltip when none of the present soldiers match the current training program
        no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
    },
}

pop_textdomain()
