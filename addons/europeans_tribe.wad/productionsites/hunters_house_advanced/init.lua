push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_hunters_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Hunter’s House"),
    icon = dirname .. "menu.png",
    size = "small",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 54, 55 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_hunter_advanced = 1
    },
    
    inputs = {
        { name = "water", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=hunting",
                "call=breeding",
                "call=hunting_idle",
                "return=skipped"
            }
        },
        breeding = {
            -- TRANSLATORS: Completed/Skipped/Did not start breeding because ...
            descname = _"breeding",
            actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water",
                "sleep=duration:10s",
                "callworker=release",
                "sleep=duration:10s"
            }
        },
        hunting = {
            -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
            descname = _"hunting",
            actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "callworker=hunt",
                "sleep=duration:20s"
            }
        },
        hunting_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs meat",
                "return=skipped when economy needs water",
                "consume=water",
                "sleep=duration:30s",
                "callworker=release",
                "sleep=duration:30s",
                "callworker=hunt",
                "sleep=duration:90s"
            }
        }
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of Game" for a resource
        title = _"No Game",
        -- TRANSLATORS: "Game" means animals that you can hunt
        heading = _"Out of Game",
        -- TRANSLATORS: "game" means animals that you can hunt
        message = pgettext("europeans_building", "The hunter working out of this hunter’s house can’t find any game in his work area. Remember that you can build a gamekeeper’s hut to release more game into the wild."),
        productivity_threshold = 0
    },
}

pop_textdomain()
