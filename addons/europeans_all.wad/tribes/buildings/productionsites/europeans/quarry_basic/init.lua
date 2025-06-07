push_textdomain("tribes")

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
        name = "europeans_quarry_level_1",
        enhancement_cost = {
            ironwood = 1,
            balsa = 1,
            rope = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1
        }
    },
    buildcost = {
        reed = 2,
        log = 2
    },
    return_on_dismantle = {
        scrap_wood = 2
    },

    aihints = {
        basic_amount = 1,
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        normal_ai_limit = 8,
    },

    working_positions = {
        barbarians_stonemason = 1
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
                "call=cut_granite on failure fail",
                "call=cut_granite on failure fail",
                "sleep=duration:30s",
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
