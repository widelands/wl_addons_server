push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_fishers_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Fisher’s House"),
    icon = dirname .. "menu.png",
    size = "small",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 42, 60 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_fisher_advanced = 1
    },
    
    inputs = {
        { name = "water", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _"fishing",
            actions = {
                "call=fishing_in_sea",
                "call=breeding_in_sea",
                "call=breeding_in_pond",
                "call=fishing_in_pond",
                "call=fishing_idle",
                "return=skipped"
            }
        },
        breeding_in_sea = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _"breeding in sea",
            actions = {
                "return=skipped unless economy needs fish or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water",
                "sleep=duration:10s",
                "callworker=breed_in_sea",
                "sleep=duration:10s",
            }
        },
        fishing_in_sea = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _"fishing in sea",
            actions = {
                "return=skipped unless economy needs fish or workers need experience",
                "callworker=fish_in_sea",
                "sleep=duration:20s",
            }
        },
        breeding_in_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _"breeding in a pond",
            actions = {
                "return=skipped unless economy needs fish or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water",
                "sleep=duration:10s",
                "callworker=breed_in_pond",
                "sleep=duration:5s",
            }
        },
        fishing_in_pond = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _"fishing in pond",
            actions = {
                "return=skipped unless economy needs fish or workers need experience",
                "callworker=fish_in_pond",
                "sleep=duration:15s",
            }
        },
        fishing_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs fish",
                "return=skipped when economy needs water",
                "consume=water",
                "sleep=duration:30s",
                "callworker=breed_in_sea",
                "sleep=duration:30s",
                "callworker=fish_in_sea",
                "sleep=duration:90s",
            }
        }
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Fish",
        heading = _"Out of Fish",
        message = pgettext("europeans_building", "The fisher working out of this fisher’s house can’t find any fish in his work area. Remember that you can increase the number of existing fish by building a fish breeder’s house."),
    },
    -- Translators: Productivity tooltip for Europeans fish breeders when all water fields are already full of fish
    resource_not_needed_message = _"The fishing grounds are full";
}

pop_textdomain()
