push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/trainingsites/empire/trainingcamp/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_trainingcamp_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Training Camp Level 3"),
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
            basename = "idle",
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 87, 113 }
        }
    },

    size = "medium",
    destructible = true,
    enhancement = {
        name = "europeans_trainingcamp_level_4",
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
        trainingsites_max_percent = 5,
        prohibited_till = 10800,
        forced_after = 14400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        empire_trainer = 2
    },

    inputs = {
        { name = "snack", amount = 12 },
        { name = "meal", amount = 4 },
        { name = "wine", amount = 16 },
        { name = "coin_copper", amount = 8 },
        { name = "coin_silver", amount = 8 },
        { name = "coin_gold", amount = 8 }
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
                "return=failed unless site has wine",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:0", -- Because the soldier can be expelled by the player
                "consume=coin_copper snack wine",
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
                "return=failed unless site has wine",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:1", -- Because the soldier can be expelled by the player
                "consume=coin_silver snack wine",
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
                "return=failed unless site has wine",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:2", -- Because the soldier can be expelled by the player
                "consume=coin_silver snack wine",
                "train=soldier:attack level:3"
            }
        },
        upgrade_soldier_attack_3 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 3 to level 4"),
            actions = {
                "checksoldier=soldier:attack level:3", -- Fails when aren't any soldier of level 3 attack
                "return=failed unless site has coin_gold",
                "return=failed unless site has meal",
                "return=failed unless site has wine",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:3", -- Because the soldier can be expelled by the player
                "consume=coin_gold meal wine",
                "train=soldier:attack level:4"
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
