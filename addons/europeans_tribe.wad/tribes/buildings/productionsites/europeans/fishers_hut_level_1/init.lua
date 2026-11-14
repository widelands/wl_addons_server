push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/hunter_gatherers_hut/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_fishers_house_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Fisher’s Hut Level 1"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {hotspot = {39, 46}},
        unoccupied = {hotspot = {39, 46}}
    },
   
    size = "small",
    enhancement = {
        name = "europeans_fishers_house_level_2",
        enhancement_cost = {
            granite = 1,
            planks = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1
        }
    },
    
    aihints = {
        needs_water = true,
        prohibited_till = 4800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3
    },

    working_positions = {
        amazons_hunter_gatherer = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _("fishing"),
            actions = {
                -- time of worker: 8.2-62.2 sec, min+max average 35.2 sec
                -- min. time: 8.2 + 34 = 42.2 sec
                -- max. time: 62.2 + 34 = 96.2 sec
                -- avg. time: 35.2 + 34 = 69.2 sec
                "return=skipped unless economy needs fish",
                "callworker=fish",
                "sleep=duration:34s",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fish"),
        heading = _("Out of Fish"),
        message = pgettext("europeans_building", "The fisher working out of this fisher’s hut can’t find any fish in his work area. Remember that you can enhance the building. An advanced fishbreeder can release more fish into the waters."),
    },
}

pop_textdomain()
