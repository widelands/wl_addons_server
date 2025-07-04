push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/quarry/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_quarry_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Quarry"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 40, 57 },
      },
    },

    size = "small",

    aihints = {
        very_weak_ai_limit = 2,
        weak_ai_limit = 4
    },

    working_positions = {
        europeans_stonecutter_advanced = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "sleep=duration:10s",
                "call=quarrying",
                "sleep=duration:10s",
                "call=mining",
                "return=skipped"
            }
        },
        quarrying = {
            -- TRANSLATORS: Completed/Skipped/Did not start quarrying because ...
           descname = pgettext("europeans_building", "quarrying"),
            actions = {
                "callworker=check_rocks",
                "call=cut_granite on failure fail",
                "call=cut_granite on failure fail",
                "call=cut_marble on failure fail", -- This will find marble 2 out of 6 times
                "call=cut_granite on failure fail",
                "call=cut_granite on failure fail",
                "call=cut_marble on failure fail", -- This will find marble 2 out of 6 times
                "sleep=duration:10s",
                "return=skipped"
            }
        },
        mining = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "callworker=check_stone",
                "call=mine_granite on failure fail",
                "call=mine_granite on failure fail",
                "call=mine_marble on failure fail", -- This will find marble 2 out of 6 times
                "call=mine_granite on failure fail",
                "call=mine_granite on failure fail",
                "call=mine_marble on failure fail", -- This will find marble 2 out of 6 times
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
        mine_granite = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining granite because ...
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "return=skipped unless economy needs granite",
                "callworker=mine_granite"
            }
        },
        mine_marble = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining marble because ...
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "return=skipped unless economy needs marble",
                "callworker=mine_marble"
            }
        }
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
