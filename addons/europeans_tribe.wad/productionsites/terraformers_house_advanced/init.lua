push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_terraformers_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Terraformer’s House"),
    icon = dirname .. "menu.png",
    size = "small",

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
        { name = "water", amount = 4 },
        { name = "meal", amount = 2 },
        { name = "wine", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_terraform_land",
                "call=terraforming_land",
                "callworker=check_terraform_coast",
                "call=terraforming_coast",
                "return=skipped"
            }
        },
        terraforming_land = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming land because ...
            descname = _"terraforming land",
            actions = {
                "return=skipped unless site has water:2",
                "consume=meal wine",
                "sleep=duration:15s",
                "consume=water:2",
                "callworker=terraform_land",
            }
        },
        terraforming_coast = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming coast because ...
            descname = _"terraforming coast",
            actions = {
                "consume=meal wine",
                "sleep=duration:15s",
                "callworker=terraform_coast"
            }
        }
    },
}

pop_textdomain()
