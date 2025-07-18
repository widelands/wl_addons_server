push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/barracks/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_trainingscamp_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Trainingscamp"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = {51, 71}
      },
      working = {
         basename = "idle",
         hotspot = {51, 71}
      },
    },

    spritesheets = {
      build = {
         hotspot = {51, 71},
         frames = 3,
         columns = 1,
         rows = 3
      }
    },
    
    size = "big",
    destructible = true,
    
    enhancement = {
        name = "europeans_trainingscamp_big",
        enhancement_cost = {
            brick = 1,
            grout = 1,
            marble_column = 2
        },
        enhancement_return_on_dismantle = {
            granite = 1,
            marble = 2
        },
    },
    
    buildcost = {
        brick = 3,
        grout = 3,
        planks = 3,
        marble_column = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4,
        marble = 2
    },

    aihints = {
        trainingsites_max_percent = 50,
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
