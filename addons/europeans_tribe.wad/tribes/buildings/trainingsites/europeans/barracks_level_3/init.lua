push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/barracks/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_barracks_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Barracks Level 3"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = {51, 71}
        },
        working = {
            basename = "idle",
            hotspot = {51, 71}
        }
    },
    spritesheets = {
        build = {
            hotspot = {51, 71},
            frames = 3,
            columns = 1,
            rows = 3
        }
    },


    size = "medium",
    destructible = true,
    enhancement = {
        name = "europeans_barracks_level_4",
        enhancement_cost = {
            granite = 3,
            ironwood = 3,
            rope = 2,
            rubber = 2,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 1,
            rope = 1,
            rubber = 1,
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
        empire_trainer = 1
    },

    inputs = {
        { name = "coin_copper", amount = 8 },
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
        upgrade_soldier_health_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:health level:0", -- Fails when aren't any soldier of level 0 health
                "return=failed unless site has coin_copper",
                "sleep=duration:30s",
                "checksoldier=soldier:health level:0", -- Because the soldier can be expelled by the player
                "consume=coin_copper",
                "train=soldier:health level:1"
            }
        },
        upgrade_soldier_health_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:health level:1", -- Fails when aren't any soldier of level 1 health
                "return=failed unless site has coin_silver",
                "sleep=duration:30s",
                "checksoldier=soldier:health level:1", -- Because the soldier can be expelled by the player
                "consume=coin_silver",
                "train=soldier:health level:2"
            }
        },
        upgrade_soldier_health_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 2 to level 3"),
            actions = {
                "checksoldier=soldier:health level:2", -- Fails when aren't any soldier of level 2 health
                "return=failed unless site has coin_gold",
                "sleep=duration:30s",
                "checksoldier=soldier:health level:2", -- Because the soldier can be expelled by the player
                "consume=coin_gold",
                "train=soldier:health level:3"
            }
        },
        upgrade_soldier_health_3 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 3 to level 4"),
            actions = {
                "checksoldier=soldier:health level:3", -- Fails when aren't any soldier of level 3 health
                "return=failed unless site has coin_gold",
                "sleep=duration:30s",
                "checksoldier=soldier:health level:3", -- Because the soldier can be expelled by the player
                "consume=coin_gold",
                "train=soldier:health level:4"
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
