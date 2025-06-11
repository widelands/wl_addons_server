push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/barracks/"

wl.Descriptions():new_trainingsite_type {
    name = "europeans_barracks_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Barracks Level 4"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {45, 60}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {45, 73},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            hotspot = {45, 73},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "medium",
    destructible = true,

    aihints = {
        trainingsites_max_percent = 5,
        prohibited_till = 10800,
        forced_after = 14400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        frisians_trainer = 1
    },

    inputs = {
        { name = "armor_wooden", amount = 2 },
        { name = "helmet_wooden", amount = 2 },
        { name = "armor", amount = 2 },
        { name = "fur_garment_studded", amount = 2 },
        { name = "vest_padded", amount = 2 },
        { name = "armor_chain", amount = 2 },
        { name = "protector_padded", amount = 2 },
        { name = "tabard_golden", amount = 2 },
        { name = "warriors_coat", amount = 2 },
        { name = "armor_gilded", amount = 2 },
        { name = "fur_garment_golden", amount = 2 }
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
        upgrade_soldier_health_2 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 2 to level 3"),
            actions = {
                "checksoldier=soldier:health level:2", -- Fails when aren't any soldier of level 2 health
                "return=failed unless site has armor_chain,protector_padded",
                "sleep=duration:30s",
                "checksoldier=soldier:health level:2", -- Because the soldier can be expelled by the player
                "consume=armor_chain,protector_padded",
                "train=soldier:health level:3",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_health_3 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 3 to level 4"),
            actions = {
                "checksoldier=soldier:health level:3", -- Fails when aren't any soldier of level 3 health
                "return=failed unless site has tabard_golden,warriors_coat",
                "sleep=duration:30s",
                "checksoldier=soldier:health level:3", -- Because the soldier can be expelled by the player
                "consume=tabard_golden,warriors_coat",
                "train=soldier:health level:4",
                "produce=scrap_iron"
            }
        },
        upgrade_soldier_health_4 = {
            -- TRANSLATORS: Completed/Skipped/Did not start upgrading ... because ...
            descname = pgettext("europeans_building", "upgrading soldier health from level 4 to level 5"),
            actions = {
                "checksoldier=soldier:health level:4", -- Fails when aren't any soldier of level 4 health
                "return=failed unless site has armor_gilded,fur_garment_golden",
                "sleep=duration:30s",
                "checksoldier=soldier:health level:4", -- Because the soldier can be expelled by the player
                "consume=armor_gilded,fur_garment_golden",
                "train=soldier:health level:5",
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
