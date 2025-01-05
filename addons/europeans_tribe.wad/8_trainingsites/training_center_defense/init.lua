push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
    name = "europeans_training_center_defense",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Training Center (Defense)"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 86, 96 },
        },
        working = {
            basename = "idle",
            hotspot = { 86, 96 },
        }
    },

    size = "big",
    destructible = true,
    
    buildcost = {
        brick = 4,
        grout = 4,
        planks = 4,
        marble = 4,
        marble_column = 2,
        cloth = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4,
        marble = 5
    },

    aihints = {
        trainingsites_max_percent = 25,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
    },

    working_positions = {
        europeans_worker_advanced = 2
    },

    inputs = {
        { name = "meat", amount = 8 },
        { name = "fish", amount = 8 },
        { name = "biscuit", amount = 8 },
        { name = "wine", amount = 8 }
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
        upgrade_soldier_defense_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:defense level:0",
                "sleep=duration:15s",
                "checksoldier=soldier:defense level:0",
                "consume=fish,meat biscuit wine",
                "animate=working duration:10s",
                "consume=fish,meat biscuit wine",
                "animate=working duration:10s",
                "train=soldier:defense level:1"
            }
        },
    },
    
    soldier_capacity = 4,
    trainer_patience = 60,
    
    messages = {
        -- TRANSLATORS: Empire training site tooltip when it has no soldiers assigned
        no_soldier = pgettext("europeans_building", "No soldier to train!"),
        -- TRANSLATORS: Empire training site tooltip when none of the present soldiers match the current training program
        no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
    },
}

pop_textdomain()
