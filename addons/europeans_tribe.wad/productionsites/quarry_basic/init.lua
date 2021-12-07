push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_quarry_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Quarry"),
    icon = dirname .. "menu.png",
    size = "small",

    enhancement = {
        name = "europeans_quarry_normal",
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
        granite = 2,
        log = 1
    },


    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 45, 48 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 45, 48 },
        },
        unoccupied = {
            pictures = path.list_files(dirname .. "unoccupied_??.png"),
            hotspot = { 45, 48 },
        },
    },

    aihints = {
    },

    working_positions = {
        europeans_stonecutter_basic = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_rocks",
                "call=cut_granite on failure fail",
                "return=skipped"
            }
        },
        cut_granite = {
            -- TRANSLATORS: Completed/Skipped/Did not start quarrying granite because ...
            descname = _"quarrying granite",
            actions = {
                "callworker=cut_granite",
                "sleep=duration:17s500ms"
            }
        }
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Rocks",
        heading = _"Out of Rocks",
        message = pgettext("europeans_building", "The stonecutter working at this quarry can’t find any rocks in his work area. You should consider enhancing it to increase its working area."),
        productivity_threshold = 75
    },
}

pop_textdomain()
