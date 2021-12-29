push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_terraformers_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Terraformer’s House"),
    icon = dirname .. "menu.png",
    size = "small",

    enhancement = {
        name = "europeans_terraformers_house_normal",
        enhancement_cost = {
            blackwood = 1,
            cloth = 1
        },
        enhancement_return_on_dismantle = {
        },
    },

    buildcost = {
        log = 2,
        reed = 2,
        granite = 2
    },
    return_on_dismantle = {
        log = 1,
        granite = 1
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 45, 92 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 45, 92 },
        },
        unoccupied = {
            pictures = path.list_files(dirname .. "unoccupied_??.png"),
            hotspot = { 45, 92 },
        },
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 3,
        prohibited_till = 7200,
        forced_after = 9000
    },

    working_positions = {
        europeans_terraformer_basic = 1
    },

    inputs = {
        { name = "water", amount = 4 },
        { name = "ration", amount = 2 },
        { name = "beer", amount = 2 }
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
                "consume=ration beer",
                "sleep=duration:15s",
                "consume=water:2",
                "callworker=terraform_land",
            }
        },
        terraforming_coast = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming coast because ...
            descname = _"terraforming coast",
            actions = {
                "consume=ration beer",
                "sleep=duration:15s",
                "callworker=terraform_coast"
            }
        }
    },
}

pop_textdomain()
