push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/trainingsites/frisians/training_camp/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_trainingcamp_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Training Camp Level 4"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {50, 60}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {50, 79},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            hotspot = {50, 79},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },
    
    size = "medium",
    destructible = true,
    enhancement = {
        name = "europeans_battlearena_level_4",
        enhancement_cost = {
            brick = 4,
            grout = 4,
            reed = 2,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            brick = 2,
            grout = 2,
            reed = 1,
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
        frisians_trainer = 2
    },

    inputs = {
        { name = "smoked_meat", amount = 8 },
        { name = "smoked_fish", amount = 8 },
        { name = "bread_frisians", amount = 10 },
        { name = "mead", amount = 10 },
        { name = "spear", amount = 2 },
        { name = "spear_stone_tipped", amount = 2 },
        { name = "ax_sharp", amount = 2 },
        { name = "sword_long", amount = 2 },
        { name = "spear_hardened", amount = 2 },
        { name = "ax_broad", amount = 2 },
        { name = "sword_broad", amount = 2 },
        { name = "trident_long", amount = 2 },
        { name = "spear_advanced", amount = 2 },
        { name = "ax_bronze", amount = 2 },
        { name = "sword_double", amount = 2 },
        { name = "trident_steel", amount = 2 },
        { name = "spear_heavy", amount = 2 },
        { name = "ax_battle", amount = 2 },
        { name = "trident_double", amount = 2 },
        { name = "spear_war", amount = 2 },
        { name = "ax_warriors", amount = 2 },
        { name = "trident_heavy_double", amount = 2 }
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
        upgrade_soldier_attack_0 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 0 to level 1"),
            actions = {
                "checksoldier=soldier:attack level:0", -- Fails when aren't any soldier of level 0 attack
                "return=failed unless site has spear,spear_stone_tipped,ax_sharp,sword_long",
                "return=failed unless site has smoked_fish,smoked_meat",
                "return=failed unless site has bread_frisians",
                "return=failed unless site has mead",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:0", -- Because the soldier can be expelled by the player
                "consume=spear,spear_stone_tipped,ax_sharp,sword_long smoked_fish,smoked_meat bread_frisians mead",
                "train=soldier:attack level:1",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_attack_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:attack level:1", -- Fails when aren't any soldier of level 1 attack
                "return=failed unless site has spear_hardened,ax_broad,sword_broad,trident_long",
                "return=failed unless site has smoked_fish,smoked_meat",
                "return=failed unless site has bread_frisians",
                "return=failed unless site has mead",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:1", -- Because the soldier can be expelled by the player
                "consume=spear_hardened,ax_broad,sword_broad,trident_long smoked_fish,smoked_meat bread_frisians mead",
                "train=soldier:attack level:2",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_attack_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 2 to level 3"),
            actions = {
                "checksoldier=soldier:attack level:2", -- Fails when aren't any soldier of level 2 attack
                "return=failed unless site has spear_advanced,ax_bronze,sword_double,trident_steel",
                "return=failed unless site has smoked_fish,smoked_meat",
                "return=failed unless site has bread_frisians",
                "return=failed unless site has mead",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:2", -- Because the soldier can be expelled by the player
                "consume=spear_advanced,ax_bronze,sword_double,trident_steel smoked_fish,smoked_meat bread_frisians mead",
                "train=soldier:attack level:3",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_attack_3 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 3 to level 4"),
            actions = {
                "checksoldier=soldier:attack level:3", -- Fails when aren't any soldier of level 3 attack
                "return=failed unless site has spear_heavy,ax_battle,sword_double,trident_double",
                "return=failed unless site has smoked_fish,smoked_meat",
                "return=failed unless site has bread_frisians",
                "return=failed unless site has mead",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:3", -- Because the soldier can be expelled by the player
                "consume=spear_heavy,ax_battle,sword_double,trident_double smoked_fish,smoked_meat bread_frisians mead",
                "train=soldier:attack level:4",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_attack_4 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier attack from level 4 to level 5"),
            actions = {
                "checksoldier=soldier:attack level:4", -- Fails when aren't any soldier of level 4 attack
                "return=failed unless site has spear_war,ax_warriors,sword_double,trident_heavy_double",
                "return=failed unless site has smoked_fish,smoked_meat",
                "return=failed unless site has bread_frisians",
                "return=failed unless site has mead",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:4", -- Because the soldier can be expelled by the player
                "consume=spear_war,ax_warriors,sword_double,trident_heavy_double smoked_fish,smoked_meat bread_frisians mead",
                "train=soldier:attack level:5",
                "produce=scrap_metal_mixed"
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
