push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/quarry/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_quarry_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Quarry"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 45, 48 },
      },
      unoccupied = {
         hotspot = { 45, 48 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 45, 48 }
      },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_quarry_advanced",
        enhancement_cost = {
            brick = 1,
            grout = 1,
            marble = 1,
            planks = 1,
            cloth = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        },
    },
    buildcost = {
        granite = 2,
        log = 2,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2,
        reed = 1
    },

    aihints = {
        basic_amount = 1,
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        normal_ai_limit = 8,
    },

    working_positions = {
        europeans_stonecutter_basic = 1
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
                "call=cut_granite on failure fail",
                "call=cut_granite on failure fail",
                "call=cut_marble on failure fail", -- This will find marble 1 out of 5 times
                "sleep=duration:30s",
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
                "call=mine_granite on failure fail",
                "call=mine_granite on failure fail",
                "call=mine_marble on failure fail", -- This will find marble 1 out of 5 times
                "sleep=duration:30s",
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
                "callworker=mine_granite"
            }
        },
        mine_marble = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining marble because ...
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "callworker=mine_marble"
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
