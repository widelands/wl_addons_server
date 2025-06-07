push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/frisians/fishers_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_fishers_house_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Fisher’s Hut Level 4"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {40, 52}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {40, 70},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },
   
    size = "small",
    enhancement = {
        name = "europeans_aqua_farm",
        enhancement_cost = {
            brick = 1,
            grout = 1,
            reed = 1
        },
        enhancement_return_on_dismantle = {
            brick = 1
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
        frisians_fisher = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _("fishing"),
            actions = {
                -- time of worker: 10.2-42.6 sec, min+max average 26.4 sec
                -- min. time total: 10.2 + 16 = 26.2 sec
                -- max. time total: 42.6 + 16 = 58.6 sec
                -- avg. time total: 26.4 + 16 = 42.4 sec
                "return=skipped unless economy needs fish",
                "callworker=fish",
                "sleep=duration:16s" -- TODO(stonerl): reduce to 3s and move 13s to the worker
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
