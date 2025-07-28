push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/trainingsites/barbarians/trainingcamp/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_trainingcamp_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Trainingcamp"),
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
        working = {
            basename = "idle",
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
    },
    
    size = "big",
    destructible = true,
    enhancement = {
        name = "europeans_trainingcamp_level_1",
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
    buildcost = {
        granite = 4,
        blackwood = 4,
        reed = 4,
        gold = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 2,
        reed = 2,
        gold = 1
    },

    aihints = {
        trainingsites_max_percent = 20,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 4,
        prohibited_till = 3600
    },

    working_positions = {
        europeans_recruit = 2
    },

    inputs = {
        { name = "coin_silver", amount = 16 }
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
                "return=skipped unless site has coin_silver:2",
                "checksoldier=soldier:health level:0",
                "sleep=duration:15s",
                "checksoldier=soldier:health level:0",
                "consume=coin_silver",
                "animate=working duration:10s",
                "consume=coin_silver",
                "animate=working duration:10s",
                "train=soldier:health level:1"
            }
        },
        upgrade_soldier_attack_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 0 to level 1"),
            actions = {
                "return=skipped unless site has coin_silver:2",
                "checksoldier=soldier:attack level:0",
                "sleep=duration:15s",
                "checksoldier=soldier:attack level:0",
                "consume=coin_silver",
                "animate=working duration:10s",
                "consume=coin_silver",
                "animate=working duration:10s",
                "train=soldier:attack level:1"
            }
        },
        upgrade_soldier_defense_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 0 to level 1"),
            actions = {
                "return=skipped unless site has coin_silver:2",
                "checksoldier=soldier:defense level:0",
                "sleep=duration:15s",
                "checksoldier=soldier:defense level:0",
                "consume=coin_silver",
                "animate=working duration:10s",
                "consume=coin_silver",
                "animate=working duration:10s",
                "train=soldier:defense level:1"
            }
        },
        upgrade_soldier_evade_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 0 to level 1"),
            actions = {
                "return=skipped unless site has coin_silver:2",
                "checksoldier=soldier:evade level:0",
                "sleep=duration:15s",
                "checksoldier=soldier:evade level:0",
                "consume=coin_silver",
                "animate=working duration:10s",
                "consume=coin_silver",
                "animate=working duration:10s",
                "train=soldier:evade level:1"
            }
        },
    },
    
    soldier_capacity = 4,
    trainer_patience = 16,
    
    messages = {
        -- TRANSLATORS: Empire training site tooltip when it has no soldiers assigned
        no_soldier = pgettext("europeans_building", "No soldier to train!"),
        -- TRANSLATORS: Empire training site tooltip when none of the present soldiers match the current training program
        no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
    },
}

pop_textdomain()

