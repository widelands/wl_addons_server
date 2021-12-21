push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_hunters_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Hunter’s Hut"),
    icon = dirname .. "menu.png",
    size = "small",

    enhancement = {
        name = "europeans_hunters_house_normal",
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
            hotspot = { 44, 44 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 44, 44 },
        },
        unoccupied = {
            pictures = path.list_files(dirname .. "unoccupied_??.png"),
            hotspot = { 44, 44 },
        },
    },

    aihints = {
        basic_amount = 1,
        prohibited_till = 300,
        forced_after = 1800
    },

    working_positions = {
        europeans_hunter_basic = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=hunting",
                "call=hunting_idle",
                "return=skipped"
            }
        },
        hunting = {
            -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
            descname = _"hunting",
            actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "callworker=hunt",
                "sleep=duration:50s"
            }
        },
        hunting_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs meat",
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
        message = pgettext("europeans_building", "The hunter working out of this hunter’s hut can’t find any game in his work area. You should consider enhancing it to increase its working area. Remember that you can build a gamekeeper’s hut to release more game into the wild."),
        productivity_threshold = 33
    },
}

pop_textdomain()
