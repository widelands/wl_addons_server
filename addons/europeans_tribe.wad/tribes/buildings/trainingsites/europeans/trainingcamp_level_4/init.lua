push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/trainingsites/frisians/training_camp/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_trainingcamp_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Training Camp Level 4"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {50, 60}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {50, 79},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            hotspot = {50, 79},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "medium",
    destructible = true,

    aihints = {
        trainingsites_max_percent = 5,
        prohibited_till = 10800,
        forced_after = 14400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        frisians_trainer = 2
    },

    inputs = {
        { name = "snack", amount = 12 },
        { name = "meal", amount = 8 },
        { name = "mead", amount = 20 },
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
                "return=failed unless site has mead",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:0", -- Because the soldier can be expelled by the player
                "consume=coin_copper snack mead",
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
                "return=failed unless site has mead",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:1", -- Because the soldier can be expelled by the player
                "consume=coin_silver snack mead",
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
                "return=failed unless site has mead",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:2", -- Because the soldier can be expelled by the player
                "consume=coin_silver snack mead",
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
                "return=failed unless site has mead",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:3", -- Because the soldier can be expelled by the player
                "consume=coin_gold meal mead",
                "train=soldier:attack level:4"
            }
        },
        upgrade_soldier_attack_4 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 4 to level 5"),
            actions = {
                "checksoldier=soldier:attack level:4", -- Fails when aren't any soldier of level 4 attack
                "return=failed unless site has coin_gold",
                "return=failed unless site has meal",
                "return=failed unless site has mead",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:4", -- Because the soldier can be expelled by the player
                "consume=coin_gold meal mead",
                "train=soldier:attack level:5"
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
