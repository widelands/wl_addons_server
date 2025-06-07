push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/trainingsites/amazons/warriors_gathering/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_trainingcamp_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Training Camp Level 1"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {hotspot = {43, 54}},
        unoccupied = {hotspot = {43, 54}},
    },
    spritesheets = {
        working = {
            hotspot = {43, 54},
            fps = 15,
            frames = 30,
            columns = 6,
            rows = 5
        }
    },
    
    size = "medium",
    destructible = true,
    enhancement = {
        name = "europeans_trainingcamp_level_2",
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
        { name = "meat", amount = 8 },
        { name = "fish", amount = 8 },
        { name = "amazons_bread", amount = 10 },
        { name = "chocolate", amount = 10 },
        { name = "spear", amount = 2 },
        { name = "spear_stone_tipped", amount = 2 },
        { name = "ax_sharp", amount = 2 },
        { name = "sword_long", amount = 2 },
        { name = "spear_hardened", amount = 2 },
        { name = "ax_broad", amount = 2 },
        { name = "sword_broad", amount = 2 },
        { name = "trident_long", amount = 2 }
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
                "return=failed unless site has fish,meat",
                "return=failed unless site has amazons_bread",
                "return=failed unless site has chocolate",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:0", -- Because the soldier can be expelled by the player
                "consume=spear,spear_stone_tipped,ax_sharp,sword_long fish,meat amazons_bread chocolate",
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
                "return=failed unless site has fish,meat",
                "return=failed unless site has amazons_bread",
                "return=failed unless site has chocolate",
                "sleep=duration:30s",
                "checksoldier=soldier:attack level:1", -- Because the soldier can be expelled by the player
                "consume=spear_hardened,ax_broad,sword_broad,trident_long fish,meat amazons_bread chocolate",
                "train=soldier:attack level:2",
                "produce=scrap_iron"
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
