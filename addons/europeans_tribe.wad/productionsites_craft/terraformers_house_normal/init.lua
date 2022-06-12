push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_terraformers_house_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Terraformer’s House"),
    icon = dirname .. "menu.png",
    size = "small",

    enhancement = {
        name = "europeans_terraformers_house_advanced",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            grout = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1,
            marble = 1
        }
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 41, 44 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 41, 44 },
        }
    },

    aihints = {},

    working_positions = {
        europeans_terraformer_normal = 1
    },

    inputs = {
        { name = "water", amount = 4 },
        { name = "snack", amount = 2 },
        { name = "mead", amount = 2 }
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
                "sleep=duration:20s",
                "return=skipped"
            }
        },
        terraforming_land = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming land because ...
            descname = pgettext("europeans_building", "terraforming land"),
            actions = {
                "return=skipped unless site has water:2",
                "consume=snack mead",
                "consume=water:2",
                "callworker=terraform_land",
            }
        },
        terraforming_coast = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming coast because ...
            descname = pgettext("europeans_building", "terraforming coast"),
            actions = {
                "consume=snack mead",
                "callworker=terraform_coast"
            }
        },
        dummy_program = {
            -- TRANSLATORS: Completed/Skipped/Did not start dummy program because ...
            descname = _"dummy program",
            actions = {
                "sleep=duration:10s",
                "produce=coal"
            }
        }
    },
}

pop_textdomain()
