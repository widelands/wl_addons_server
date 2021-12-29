push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_trainingsite_type {
    name = "europeans_battlearena_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Battle Arena"),
    icon = dirname .. "menu.png",
    size = "big",
    
    enhancement = {
        name = "europeans_battlearena_level_1",
        enhancement_cost = {
            planks = 3,
            cloth = 3,
            granite = 2,
            quartz = 1,
            diamond = 1,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            planks = 2,
            granite = 1,
            quartz = 1,
            diamond = 1,
            scrap_metal_mixed = 1
        },
    },

    buildcost = {
        blackwood = 2,
        planks = 2,
        reed = 2,
        cloth = 2,
        granite = 2,
        quartz = 1,
        diamond = 1,
        gold = 1
    },
    return_on_dismantle = {
        blackwood = 1,
        planks = 1,
        granite = 1,
        quartz = 1,
        diamond = 1,
        scrap_metal_mixed = 1
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 110, 72 },
            fps = 10
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 110, 72 },
        },
        unoccupied = {
            pictures = path.list_files(dirname .. "unoccupied_??.png"),
            hotspot = { 110, 72 }
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 110, 72 },
            fps = 1
        }
    },

    aihints = {
        trainingsites_max_percent = 20,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
        prohibited_till = 7200
    },

    working_positions = {
        europeans_trainer_basic = 1
    },

    inputs = {
        { name = "ration", amount = 6 },
        { name = "beer", amount = 6 },
        { name = "helmet_mask", amount = 2 },
        { name = "spear_advanced", amount = 2 },
        { name = "tabard", amount = 2 }
    },

    ["soldier health"] = {
        food = {
          {"ration"},
          {"beer"}
        },
        weapons = {"armor", "tabard"}
    },

    ["soldier evade"] = {
        food = {
          {"ration"},
          {"beer"}
        }
    },
        
    ["soldier defense"] = {
        food = {
          {"ration"},
          {"beer"}
        },
        weapons = {"helmet_mask"}
    },

    ["soldier attack"] = {
        food = {
          {"ration"},
          {"beer"}
        },
        weapons = {"spear_advanced"}
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
                "return=skipped when economy needs tabard",
                "checksoldier=soldier:health level:0",
                "sleep=duration:40s",
                "checksoldier=soldier:health level:0",
                "consume=ration beer tabard",
                "train=soldier:health level:1"
            }
        },
        upgrade_soldier_evade_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier evade from level 0 to level 1"),
            actions = {
                "return=skipped when economy needs beer",
                "checksoldier=soldier:evade level:0",
                "sleep=duration:40s",
                "checksoldier=soldier:evade level:0",
                "consume=ration:2 beer:2",
                "train=soldier:evade level:1"
            }
        },
        upgrade_soldier_defense_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier defense from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:defense level:0",
                "sleep=duration:40s",
                "checksoldier=soldier:defense level:0",
                "consume=ration beer helmet_mask",
                "train=soldier:defense level:1",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_attack_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:attack level:0",
                "sleep=duration:40s",
                "checksoldier=soldier:attack level:0",
                "consume=ration beer spear_advanced",
                "train=soldier:attack level:1",
                "produce=scrap_iron"
            }
        },
    },
    
    soldier_capacity = 12,
    trainer_patience = 12,
    
    messages = {
        -- TRANSLATORS: Empire training site tooltip when it has no soldiers assigned
        no_soldier = pgettext("europeans_building", "No soldier to train!"),
        -- TRANSLATORS: Empire training site tooltip when none of the present soldiers match the current training program
        no_soldier_for_level = pgettext("europeans_building", "No soldier found for this training level!"),
    },
}

pop_textdomain()
