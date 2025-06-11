push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/trainingsites/amazons/training_glade/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_battlearena_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Battle Arena Level 1"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {hotspot = {92, 92}},
        unoccupied = {hotspot = {92, 92}}
    },
    spritesheets = { working = {
        hotspot = {92, 92},
        fps = 15,
        frames = 30,
        columns = 6,
        rows = 5
    }},
    
    size = "big",
    destructible = true,
    enhancement = {
        name = "europeans_battlearena_level_2",
        enhancement_cost = {
            granite = 3,
            planks = 3,
            spidercloth = 2,
            diamond = 2,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 1,
            spidercloth = 1,
            diamond = 1,
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
        amazons_trainer = 2
    },

    inputs = {
        { name = "meat", amount = 6 },
        { name = "fish", amount = 6 },
        { name = "amazons_bread", amount = 8 },
        { name = "chocolate", amount = 8 },
        { name = "boots_sturdy", amount = 4 },
        { name = "shield_steel", amount = 2 },
        { name = "helmet", amount = 2 },
        { name = "helmet_mask", amount = 2 }
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
                "return=failed unless site has amazons_bread",
                "return=failed unless site has fish,meat",
                "return=failed unless site has chocolate",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "checksoldier=soldier:evade level:0", -- Because the soldier can be expelled by the player
                "consume=boots_sturdy amazons_bread fish,meat chocolate",
                "train=soldier:evade level:1"
            }
        },
        upgrade_soldier_defense_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:defense level:0", -- Fails when aren't any soldier of level 0 defense
                "return=failed unless site has shield_steel,helmet,helmet_mask",
                "return=failed unless site has amazons_bread",
                "return=failed unless site has fish,meat",
                "return=failed unless site has chocolate",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "checksoldier=soldier:defense level:0", -- Because the soldier can be expelled by the player
                "consume=shield_steel,helmet,helmet_mask amazons_bread fish,meat chocolate",
                "train=soldier:defense level:1"
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
