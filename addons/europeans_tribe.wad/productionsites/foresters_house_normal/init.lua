push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_foresters_house_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Forester’s House"),
    icon = dirname .. "menu.png",
    size = "small",

    enhancement = {
        name = "europeans_foresters_house_advanced",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            grout = 1,
            marble_column = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1,
            marble = 1
        },
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 37, 44 },
        }
    },

    aihints = {},

    working_positions = {
        europeans_forester_normal = 1
    },

    inputs = {
        { name = "water", amount = 4 },
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting trees because ...
            descname = _"planting trees",
            actions = {
                "return=skipped when economy needs water and not economy needs log",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=plant",
                "sleep=duration:15s"
            }
        },
    },
}

pop_textdomain()
