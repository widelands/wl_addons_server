push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_quarry_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Quarry"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 40, 49 },
      },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_quarry_advanced",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        },
    },

    aihints = {},

    working_positions = {
        europeans_stonecutter_normal = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
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
                "sleep=duration:20s",
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
                "sleep=duration:20s",
                "return=skipped"
            }
        },
        cut_granite = {
            -- TRANSLATORS: Completed/Skipped/Did not start quarrying granite because ...
           descname = pgettext("europeans_building", "quarrying granite"),
            actions = {
                "callworker=cut_granite"
            }
        },
        cut_marble = {
            -- TRANSLATORS: Completed/Skipped/Did not start quarrying marble because ...
           descname = pgettext("europeans_building", "quarrying marble"),
            actions = {
                "callworker=cut_marble"
            }
        },
        mine_granite = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining granite because ...
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "callworker=mine_granite",
                "sleep=duration:10s"
            }
        },
        mine_marble = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining marble because ...
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "callworker=mine_marble"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Rocks",
        heading = _"Out of Rocks",
        message = pgettext("europeans_building", "The stonecutter working at this quarry can’t find any rocks in his work area."),
        productivity_threshold = 75
    },
}

pop_textdomain()
