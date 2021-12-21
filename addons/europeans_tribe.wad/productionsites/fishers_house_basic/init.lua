push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_fishers_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Fisher’s Hut"),
    icon = dirname .. "menu.png",
    size = "small",

    enhancement = {
        name = "europeans_fishers_house_normal",
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
            hotspot = { 39, 52 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 39, 52 },
        },
        unoccupied = {
            pictures = path.list_files(dirname .. "unoccupied_??.png"),
            hotspot = { 39, 52 },
        },
    },

    aihints = {
        needs_water = true,
        basic_amount = 1,
        prohibited_till = 300,
        forced_after = 1800
    },

    working_positions = {
        europeans_fisher_basic = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _"fishing",
            actions = {
                "call=fishing_in_sea",
                "call=fishing_idle",
                "return=skipped"
            }
        },
        fishing_in_sea = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _"fishing in sea",
            actions = {
                "return=skipped unless economy needs fish or workers need experience",
                "callworker=fish_in_sea",
                "sleep=duration:50s",
            }
        },
        fishing_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs fish",
                "callworker=fish_in_sea",
                "sleep=duration:90s",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Fish",
        heading = _"Out of Fish",
        message = pgettext("europeans_building", "The fisher working out of this fisher’s hut can’t find any fish in his work area. You should consider enhancing it to increase its working area. Remember that you can increase the number of existing fish by building a fish breeder’s house."),
    },
    -- Translators: Productivity tooltip for Europeans fish breeders when all water fields are already full of fish
    resource_not_needed_message = _"The fishing grounds are full";
}

pop_textdomain()
