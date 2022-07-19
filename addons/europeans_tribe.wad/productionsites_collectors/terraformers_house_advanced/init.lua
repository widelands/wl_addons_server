push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_terraformers_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Terraformer’s House"),
    icon = dirname .. "menu.png",
    size = "small",
    
    enhancement = {
        name = "europeans_foresters_house_advanced",
        enhancement_cost = {
            marble = 1
        },
        enhancement_return_on_dismantle = {
            marble = 1
        },
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 50, 53 },
            fps = 10
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 50, 53 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_terraformer_advanced = 1
    },

    inputs = {
        { name = "water", amount = 6 },
        { name = "meal", amount = 6 },
        { name = "wine", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "return=skipped unless site has meal:6",
                "return=skipped unless site has wine:6",
                "callworker=check_terraform_land",
                "call=terraforming_land",
                "callworker=check_terraform_land",
                "call=terraforming_land",
                "callworker=check_terraform_coast",
                "call=terraforming_coast",
                "callworker=check_terraform_coast",
                "call=terraforming_coast",
                "callworker=check_terraform_coast",
                "call=terraforming_coast",
                "callworker=check_terraform_pond",
                "call=terraforming_pond",
                "sleep=duration:30s",
                "return=skipped"
            }
        },
        terraforming_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming pond because ...
            descname = pgettext("europeans_building", "terraforming pond"),
            actions = {
                "consume=meal wine",
                "callworker=terraform_pond",
            }
        },
        terraforming_land = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming land because ...
            descname = pgettext("europeans_building", "terraforming land"),
            actions = {
                "return=skipped unless site has water:2",
                "consume=meal wine",
                "consume=water:2",
                "callworker=terraform_land",
            }
        },
        terraforming_coast = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming coast because ...
            descname = pgettext("europeans_building", "terraforming coast"),
            actions = {
                "consume=meal wine",
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