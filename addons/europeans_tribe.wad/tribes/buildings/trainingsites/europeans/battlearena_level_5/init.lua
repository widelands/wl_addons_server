push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/trainingsites/frisians/training_arena/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_battlearena_level_5",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Battle Arena Level 5"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {83, 71}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {83, 90},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            hotspot = {83, 90},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "big",
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
        { name = "snack", amount = 8 },
        { name = "meal", amount = 8 },
        { name = "mead", amount = 16 },
        { name = "coin_silver", amount = 8 },
        { name = "coin_gold", amount = 8 },
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
                "return=failed unless site has coin_silver",
                "return=failed unless site has snack",
                "return=failed unless site has mead",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "checksoldier=soldier:evade level:0", -- Because the soldier can be expelled by the player
                "consume=coin_silver snack mead",
                "train=soldier:evade level:1"
            }
        },
        upgrade_soldier_evade_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:evade level:1", -- Fails when aren't any soldier of level 1 evade
                "return=failed unless site has coin_gold",
                "return=failed unless site has meal",
                "return=failed unless site has mead",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "checksoldier=soldier:evade level:1", -- Because the soldier can be expelled by the player
                "consume=coin_gold meal mead",
                "train=soldier:evade level:2"
            }
        },
        upgrade_soldier_defense_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:defense level:0", -- Fails when aren't any soldier of level 0 defense
                "return=failed unless site has coin_silver",
                "return=failed unless site has snack",
                "return=failed unless site has mead",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "checksoldier=soldier:defense level:0", -- Because the soldier can be expelled by the player
                "consume=coin_silver snack mead",
                "train=soldier:defense level:1"
            }
        },
        upgrade_soldier_defense_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:defense level:1", -- Fails when aren't any soldier of level 0 defense
                "return=failed unless site has coin_gold",
                "return=failed unless site has meal",
                "return=failed unless site has mead",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "checksoldier=soldier:defense level:1", -- Because the soldier can be expelled by the player
                "consume=coin_gold meal mead",
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
