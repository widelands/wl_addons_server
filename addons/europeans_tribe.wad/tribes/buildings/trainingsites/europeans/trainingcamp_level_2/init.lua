push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/trainingsites/atlanteans/dungeon/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_trainingcamp_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Training Camp Level 2"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 55, 59 },
        },
        working = {
            basename = "idle",
            hotspot = { 55, 59 },
        }
    },

    size = "medium",
    destructible = true,
    enhancement = {
        name = "europeans_trainingcamp_level_3",
        enhancement_cost = {
            granite = 3,
            planks = 3,
            marble = 2,
            marble_column = 2,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 1,
            marble = 2,
            gold = 1
        }
    },

    aihints = {
        trainingsites_max_percent = 5,
        prohibited_till = 10800,
        forced_after = 14400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        atlanteans_trainer = 2
    },

    inputs = {
        { name = "snack", amount = 10 },
        { name = "chocolate", amount = 10 },
        { name = "coin_copper", amount = 8 },
        { name = "coin_silver", amount = 8 }
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
        upgrade_soldier_attack_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:attack level:0", -- Fails when aren't any soldier of level 0 attack
                "return=failed unless site has coin_copper",
                "return=failed unless site has snack",
                "return=failed unless site has chocolate",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:0", -- Because the soldier can be expelled by the player
                "consume=coin_copper snack chocolate",
                "train=soldier:attack level:1"
            }
        },
        upgrade_soldier_attack_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:attack level:1", -- Fails when aren't any soldier of level 1 attack
                "return=failed unless site has coin_silver",
                "return=failed unless site has snack",
                "return=failed unless site has chocolate",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:1", -- Because the soldier can be expelled by the player
                "consume=coin_silver snack chocolate",
                "train=soldier:attack level:2"
            }
        },
        upgrade_soldier_attack_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 2 to level 3"),
            actions = {
                "checksoldier=soldier:attack level:2", -- Fails when aren't any soldier of level 2 attack
                "return=failed unless site has coin_silver",
                "return=failed unless site has snack",
                "return=failed unless site has chocolate",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:2", -- Because the soldier can be expelled by the player
                "consume=coin_silver snack chocolate",
                "train=soldier:attack level:3"
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
