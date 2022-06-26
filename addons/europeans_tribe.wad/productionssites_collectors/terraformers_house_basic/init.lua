push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
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
            hotspot = { 41, 44 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 41, 44 },
        }
    },

    aihints = {
        -- space_consumer = true,
        needs_water = true,
        -- shipyard = true,
        requires_supporters = true,
        prohibited_till = 7200,
        forced_after = 7800
    },

    working_positions = {
        europeans_terraformer_basic = 1
    },

    inputs = {
        { name = "ration", amount = 4 },
        { name = "beer", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
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
                "consume=ration beer",
                "callworker=terraform_pond",
            }
        },
        terraforming_coast = {
            -- TRANSLATORS: Completed/Skipped/Did not start terraforming coast because ...
            descname = pgettext("europeans_building", "terraforming coast"),
            actions = {
                "consume=ration beer",
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
                "recruit=europeans_carrier_1",
                "sleep=duration:10s",
                "recruit=europeans_carrier_ox"
            }
        }
    },
}

pop_textdomain()
