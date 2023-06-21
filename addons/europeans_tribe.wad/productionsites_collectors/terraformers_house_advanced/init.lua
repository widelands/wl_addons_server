push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_terraformers_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Terraformer’s House"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 60, 59 },
        },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_foresters_house_advanced",
        enhancement_cost = {
            planks = 1
        },
        enhancement_return_on_dismantle = {
        },
    },

    aihints = {},

    working_positions = {
        europeans_terraformer_advanced = 1
    },

    inputs = {
        { name = "water", amount = 6 },
        { name = "coin_wood", amount = 12 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "return=skipped unless site has coin_wood:10",
                "callworker=check_terraform_coast",
                "call=terraforming_coast",
                "callworker=check_terraform_coast",
                "call=terraforming_coast",
                "callworker=check_terraform_land",
                "call=terraforming_land",
                "callworker=check_terraform_pond",
                "call=terraforming_pond",
                "callworker=check_terraform_land",
                "call=terraforming_land",
                "callworker=check_terraform_pond",
                "call=terraforming_pond",
                "callworker=check_terraform_land",
                "call=terraforming_land",
                "callworker=check_terraform_pond",
                "call=terraforming_pond",
                "callworker=check_terraform_coast",
                "call=terraforming_coast",
                "callworker=check_terraform_coast",
                "call=terraforming_coast",
                "sleep=duration:30s",
                "return=skipped"
            }
        },
        terraforming_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming pond because ...
            descname = pgettext("europeans_building", "terraforming pond"),
            actions = {
                "consume=coin_wood",
                "callworker=terraform_pond",
                "callworker=terraform_pond"
            }
        },
        terraforming_land = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming land because ...
            descname = pgettext("europeans_building", "terraforming land"),
            actions = {
                "return=skipped unless site has water:2",
                "consume=coin_wood",
                "consume=water:2",
                "callworker=terraform_land",
            }
        },
        terraforming_coast = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming coast because ...
            descname = pgettext("europeans_building", "terraforming coast"),
            actions = {
                "consume=coin_wood",
                "callworker=terraform_coast",
                "callworker=terraform_coast"
            }
        },
        dummy_program = {
            -- TRANSLATORS: Completed/Skipped/Did not start dummy program because ...
            descname = _"dummy program",
            actions = {
                "callworker=check_water_fish",
                "sleep=duration:1s",
                "callworker=check_water_breed_fish",
                "sleep=duration:10s",
                "recruit=europeans_carrier_3",
                "sleep=duration:10s",
                "recruit=europeans_carrier_horse"
            }
        }
    },
}

pop_textdomain()
