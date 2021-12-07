push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_trainingscamp_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Trainingscamp Level 1"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_trainingscamp_level_2",
        enhancement_cost = {
            planks = 1,
            cloth = 1,
            granite = 1,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            planks = 1,
            granite = 1,
            scrap_metal_mixed = 1
        },
    },
    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 58, 72 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 58, 72 },
        }
    },

    aihints = {
        very_weak_ai_limit = 0,
        weak_ai_limit = 1,
      --normal_ai_limit = 2
    },

    working_positions = {
        europeans_trainer_basic = 1
    },

    inputs = {
        { name = "europeans_recruit", amount = 3 },
        { name = "ration", amount = 3 },
        { name = "beer", amount = 3 },
        { name = "spear_wooden", amount = 3 },
        { name = "tabard", amount = 3 },
        { name = "quartz", amount = 3 },
        { name = "diamond", amount = 3 }
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=recruit_soldier",
                "return=skipped"
            }
        },
        recruit_soldier = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting soldier"),
            actions = {
                "return=skipped unless economy needs europeans_soldier",
                "sleep=duration:10s",
                "consume=tabard:2 spear_wooden:2 ration:2 beer:2 europeans_recruit:2 quartz:2 diamond:2",
                "animate=working duration:90s",
                "recruit=europeans_soldier:2"
            }
        },
    },
}

pop_textdomain()
