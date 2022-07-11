push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_trainingscamp_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Trainingscamp Level 4"),
    icon = dirname .. "menu.png",
    size = "big",
    
    enhancement = {
        name = "europeans_battlearena_level_3",
        enhancement_cost = {
            marble_column = 1,
            quartz = 1,
            diamond = 1,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            marble = 1,
            quartz = 1,
            diamond = 1,
            scrap_metal_mixed = 1
        },
    },
        
    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 56, 68 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 56, 68 },
        }
    },

    aihints = {
        very_weak_ai_limit = 0,
        weak_ai_limit = 0,
      --normal_ai_limit = 2
    },

    working_positions = {
        europeans_trainer_advanced = 1
    },

    inputs = {
        { name = "europeans_recruit", amount = 4 },
        { name = "meal", amount = 4 },
        { name = "wine", amount = 4 },
        { name = "spear_wooden", amount = 4 },
        { name = "armor", amount = 4 },
        { name = "quartz", amount = 4 },
        { name = "diamond", amount = 4 }
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=recruit_soldier",
                "call=recruit_trainer",
                "return=skipped"
            }
        },
        recruit_soldier = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting soldier"),
            actions = {
                "return=skipped unless economy needs europeans_soldier",
                "consume=armor:2 spear_wooden:2 meal:2 wine:2 europeans_recruit:2 quartz diamond",
                "animate=working duration:120s",
                "recruit=europeans_soldier:2"
            }
        },
         recruit_trainer= {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting trainer"),
            actions = {
                "return=skipped unless economy needs europeans_trainer_advanced",
                "consume=armor spear_wooden meal wine europeans_recruit quartz,diamond",
                "animate=working duration:120s",
                "recruit=europeans_trainer_advanced"
            }
        },
    },
}

pop_textdomain()
