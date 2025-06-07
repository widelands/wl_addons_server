push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/trainingsites/empire/colosseum/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_battlearena_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Battle Arena Level 4"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 91, 114 }
        },
        working = {
            basename = "idle",
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 91, 114 }
        },
    },
    
    size = "big",
    destructible = true,
    enhancement = {
        name = "europeans_battlearena_level_5",
        enhancement_cost = {
            brick = 4,
            grout = 4,
            reed = 2,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            brick = 2,
            grout = 2,
            reed = 1,
            gold = 1
        }
    },

    aihints = {
        --trainingsites_max_percent = 5,
        prohibited_till = 10800,
        forced_after = 14400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        empire_trainer = 2
    },

    inputs = {
        { name = "smoked_meat", amount = 6 },
        { name = "smoked_fish", amount = 6 },
        { name = "empire_bread", amount = 8 },
        { name = "wine", amount = 8 },
        { name = "boots_sturdy", amount = 4 },
        { name = "boots_swift", amount = 4 },
        { name = "boots_hero", amount = 4 },
        { name = "shield_steel", amount = 2 },
        { name = "helmet", amount = 2 },
        { name = "helmet_mask", amount = 2 },
        { name = "shield_advanced", amount = 2 },
        { name = "helmet_golden", amount = 2 },
        { name = "helmet_warhelm", amount = 2 }
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
        upgrade_soldier_evade_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:evade level:0", -- Fails when aren't any soldier of level 0 evade
                "return=failed unless site has boots_sturdy",
                "return=failed unless site has empire_bread",
                "return=failed unless site has smoked_fish,smoked_meat",
                "return=failed unless site has wine",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "checksoldier=soldier:evade level:0", -- Because the soldier can be expelled by the player
                "consume=boots_sturdy empire_bread smoked_fish,smoked_meat wine",
                "train=soldier:evade level:1"
            }
        },
        upgrade_soldier_evade_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:evade level:1", -- Fails when aren't any soldier of level 1 evade
                "return=failed unless site has boots_swift,boots_hero",
                "return=failed unless site has empire_bread",
                "return=failed unless site has smoked_fish,smoked_meat",
                "return=failed unless site has wine",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "checksoldier=soldier:evade level:1", -- Because the soldier can be expelled by the player
                "consume=boots_swift,boots_hero empire_bread smoked_fish,smoked_meat wine",
                "train=soldier:evade level:2"
            }
        },
        upgrade_soldier_defense_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:defense level:0", -- Fails when aren't any soldier of level 0 defense
                "return=failed unless site has shield_steel,helmet,helmet_mask",
                "return=failed unless site has empire_bread",
                "return=failed unless site has smoked_fish,smoked_meat",
                "return=failed unless site has wine",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "checksoldier=soldier:defense level:0", -- Because the soldier can be expelled by the player
                "consume=shield_steel,helmet,helmet_mask empire_bread smoked_fish,smoked_meat wine",
                "train=soldier:defense level:1"
            }
        },
        upgrade_soldier_defense_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:defense level:1", -- Fails when aren't any soldier of level 0 defense
                "return=failed unless site has shield_advanced,helmet_warhelm,helmet_golden",
                "return=failed unless site has empire_bread",
                "return=failed unless site has smoked_fish,smoked_meat",
                "return=failed unless site has wine",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "checksoldier=soldier:defense level:1", -- Because the soldier can be expelled by the player
                "consume=shield_advanced,helmet_warhelm,helmet_golden empire_bread smoked_fish,smoked_meat wine",
                "train=soldier:defense level:2"
            }
        },
    },
    
    soldier_capacity = 4,
    trainer_patience = 16,
    
    messages = {
        -- TRANSLATORS: Europeans training site tooltip when it has no soldiers assigned
        no_soldier = pgettext("europeans_building", "No soldier to train!"),
        -- TRANSLATORS: Europeans training site tooltip when none of the present soldiers match the current training program
        no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
    },
}

pop_textdomain()
