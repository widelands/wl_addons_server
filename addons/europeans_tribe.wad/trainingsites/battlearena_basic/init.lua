push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_trainingsite_type {
    name = "europeans_battlearena_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Battle Arena"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 110, 72 }
      },
    },
    spritesheets = {
      idle = {
         fps = 10,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 110, 72 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 110, 72 }
      },
      working = {
         fps = 1,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 110, 72 }
      },
    },
    
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
            scrap_wood = 2,
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
        scrap_wood = 3,
        granite = 1,
        quartz = 1,
        diamond = 1,
        scrap_metal_mixed = 1
    },

    aihints = {
        trainingsites_max_percent = 20,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
        prohibited_till = 5400,
        forced_after = 7200
    },

    working_positions = {
        europeans_trainer_basic = 1
    },

    inputs = {
        { name = "coin_copper", amount = 6 },
        { name = "helmet_mask", amount = 2 },
        { name = "spear_advanced", amount = 2 },
        { name = "tabard", amount = 2 }
    },

    ["soldier health"] = {
        food = {{"coin_copper"}},
        weapons = {"armor", "tabard"}
    },

    ["soldier evade"] = {
        food = {{"coin_copper"}},
    },
        
    ["soldier defense"] = {
        food = {{"coin_copper"}},
        weapons = {"helmet_mask"}
    },

    ["soldier attack"] = {
        food = {{"coin_copper"}},
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
                "consume=coin_copper tabard",
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
                "consume=coin_copper:2",
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
                "consume=coin_copper helmet_mask",
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
                "consume=coin_copper spear_advanced",
                "train=soldier:attack level:1",
                "produce=scrap_iron"
            }
        }
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
