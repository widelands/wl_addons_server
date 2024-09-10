push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
    name = "europeans_fitness_center_evade",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Fitness Center (Evade)"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = {50, 56}
      },
      working = {
         basename = "idle",
         hotspot = {50, 56}
      },
    },
    spritesheets = {
      build = {
         hotspot = {50, 56},
         frames = 3,
         columns = 1,
         rows = 3
      }
    },

    size = "medium",
    destructible = true,
    
    buildcost = {
        brick = 3,
        grout = 3,
        planks = 3,
        marble = 3,
        marble_column = 1,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4,
        marble = 3,
        quartz = 1,
        diamond = 1
    },

    aihints = {
        trainingsites_max_percent = 25,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
    },

    working_positions = {
        europeans_trainer_advanced = 2
    },

    inputs = {
        { name = "meat", amount = 8 },
        { name = "fish", amount = 8 },
        { name = "bread", amount = 8 },
        { name = "honey_bread", amount = 8 },
        { name = "biscuit", amount = 8 },
        { name = "beer", amount = 8 },
        { name = "mead", amount = 8 },
        { name = "beer_strong", amount = 4 },
        { name = "wine", amount = 4 }, 
        { name = "boots_advanced", amount = 8 },
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
                "checksoldier=soldier:evade level:0",
                "sleep=duration:15s",
                "checksoldier=soldier:evade level:0",
                "consume=boots_advanced",
                "consume=meat:2 bread:2 beer:2",
                "train=soldier:evade level:1"
            }
        },
        upgrade_soldier_evade_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:evade level:1",
                "sleep=duration:15s",
                "checksoldier=soldier:evade level:1",
                "consume=boots_advanced",
                "consume=fish:2 honey_bread:2 mead:2",
                "train=soldier:evade level:2"
            }
        },
        upgrade_soldier_evade_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 2 to level 3"),
            actions = {
                "checksoldier=soldier:evade level:2",
                "sleep=duration:15s",
                "checksoldier=soldier:evade level:2",
                "consume=boots_advanced",
                "consume=fish,meat:2 biscuit:2 wine,beer_strong:2",
                "train=soldier:evade level:3"
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
