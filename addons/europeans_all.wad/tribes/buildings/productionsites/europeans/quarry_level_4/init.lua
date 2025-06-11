push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/quarry/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_quarry_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Quarry Level 4"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {40, 53}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {40, 71},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "small",

    aihints = {
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        normal_ai_limit = 8,
    },

    working_positions = {
        empire_stonemason = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "sleep=duration:10s",
                "call=quarrying",
                "return=skipped"
            }
        },
        quarrying = {
            -- TRANSLATORS: Completed/Skipped/Did not start quarrying because ...
           descname = pgettext("europeans_building", "quarrying"),
            actions = {
                "call=cut_granite on failure fail",
                "call=cut_granite on failure fail",
                "call=cut_marble on failure fail", -- This will find marble 2 out of 5 times
                "call=cut_granite on failure fail",
                "call=cut_marble_quartz on failure fail", -- This will find marble 2 out of 5 times and quartz 1 out of 5 times
                "sleep=duration:10s",
                "return=skipped"
            }
        },
        cut_granite = {
            -- TRANSLATORS: Completed/Skipped/Did not start quarrying granite because ...
           descname = pgettext("europeans_building", "quarrying granite"),
            actions = {
                "return=skipped unless economy needs granite",
                "callworker=cut_granite"
            }
        },
        cut_marble = {
            -- TRANSLATORS: Completed/Skipped/Did not start quarrying marble because ...
           descname = pgettext("europeans_building", "quarrying marble"),
            actions = {
                "return=skipped unless economy needs marble",
                "callworker=cut_marble"
            }
        },
        cut_marble_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start quarrying marble because ...
           descname = pgettext("europeans_building", "quarrying marble"),
            actions = {
                "return=skipped unless economy needs marble or economy needs quartz",
                "callworker=cut_marble",
                "produce=quartz"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Rocks",
        heading = _"Out of Rocks",
        message = pgettext("europeans_building", "The stonecutter working at this quarry can’t find any stone in his work area."),
        productivity_threshold = 75
    },
}

pop_textdomain()
