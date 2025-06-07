push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/amazons/initiation_site/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_barracks_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Barracks Level 1"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {hotspot = {43, 44}},
        unoccupied = {hotspot = {43, 44}},
    },
    spritesheets = {
        working = {
            hotspot = {43, 44},
            fps = 15,
            frames = 30,
            columns = 6,
            rows = 5
        }
    },

    
    size = "medium",
    destructible = true,
    enhancement = {
        name = "europeans_barracks_level_2",
        enhancement_cost = {
            granite = 2,
            planks = 2,
            spidercloth = 2,
            diamond = 2,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
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
        amazons_trainer = 1
    },

    inputs = {
        { name = "armor_wooden", amount = 2 },
        { name = "helmet_wooden", amount = 2 },
        { name = "armor", amount = 2 },
        { name = "fur_garment_studded", amount = 2 },
        { name = "vest_padded", amount = 2 },
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
                "checksoldier=soldier:health level:0", -- Fails when aren't any soldier of level 0 health
                "return=failed unless site has armor_wooden,helmet_wooden",
                "sleep=duration:30s",
                "checksoldier=soldier:health level:0", -- Because the soldier can be expelled by the player
                "consume=armor_wooden,helmet_wooden",
                "train=soldier:health level:1",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_health_1 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 1 to level 2"),
            actions = {
                "checksoldier=soldier:health level:1", -- Fails when aren't any soldier of level 1 health
                "return=failed unless site has armor,fur_garment_studded,vest_padded",
                "sleep=duration:30s",
                "checksoldier=soldier:health level:1", -- Because the soldier can be expelled by the player
                "consume=armor,fur_garment_studded,vest_padded",
                "train=soldier:health level:2",
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
