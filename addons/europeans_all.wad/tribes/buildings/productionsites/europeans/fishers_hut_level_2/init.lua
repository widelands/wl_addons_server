push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/atlanteans/fishers_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_fishers_house_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Fisher’s Hut Level 2"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 40, 50 },
        },
    },
   
    size = "small",
    enhancement = {
        name = "europeans_fishers_house_level_3",
        enhancement_cost = {
            brick = 1,
            grout = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            marble = 1
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
        atlanteans_fisher = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _("fishing"),
            actions = {
                -- time of worker: 16.7-45.5 sec, min+max average 31.1 sec
                -- min. time total: 16.7 + 9.5 = 26.2 sec
                -- max. time total: 45.5 + 9.5 = 55 sec
                -- avg. time total: 31.1 + 9.5 = 40.6 sec
                "return=skipped unless economy needs fish",
                "callworker=fish",
                "sleep=duration:9s500ms"
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
