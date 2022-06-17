push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_trainingscamp_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Trainingscamp Level 3"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_trainingscamp_level_4",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            marble_column = 2,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            granite = 2,
            marble = 2,
            scrap_metal_mixed = 1
        },
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 47, 47 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 47, 47 },
        }
    },

    aihints = {
        very_weak_ai_limit = 0,
        weak_ai_limit = 0,
      --normal_ai_limit = 2
    },

    working_positions = {
        europeans_trainer_normal = 1
    },

    inputs = {
        { name = "europeans_recruit", amount = 4 },
        { name = "snack", amount = 4 },
        { name = "mead", amount = 4 },
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
                "consume=armor:2 spear_wooden:2 snack:2 mead:2 europeans_recruit:2 quartz diamond",
                "animate=working duration:140s",
                "recruit=europeans_soldier:2"
            }
        },
         recruit_trainer= {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting trainer"),
            actions = {
                "return=skipped unless economy needs europeans_trainer_normal",
                "consume=armor spear_wooden snack mead europeans_recruit quartz,diamond",
                "animate=working duration:140s",
                "recruit=europeans_trainer_normal"
            }
        },
    },
}

pop_textdomain()
