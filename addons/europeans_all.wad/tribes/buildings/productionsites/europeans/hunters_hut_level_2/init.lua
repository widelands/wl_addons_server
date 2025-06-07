push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/atlanteans/hunters_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_hunters_house_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Hunter’s Hut Level 2"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 40, 49 },
        },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_hunters_house_level_3",
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
        prohibited_till = 4800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3
    },

    working_positions = {
        atlanteans_hunter = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
            descname = _("hunting"),
            actions = {
                -- time of worker: 8.7-59.1 sec, mean 38.13 sec
                -- min. time total: 8.7 + 35 = 43.7 sec
                -- max. time total: 59.1 + 35 = 94.1 sec
                -- mean time total: 38.13 + 35 = 73.13 sec
                "return=skipped unless economy needs meat",
                "callworker=hunt",
                "sleep=duration:35s"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of Game" for a resource
        title = _("No Game"),
        -- TRANSLATORS: "Game" means animals that you can hunt
        heading = _("Out of Game"),
        -- TRANSLATORS: "game" means animals that you can hunt
        message = pgettext("europeans_building", "The hunter working out of this hunter’s hut can’t find any game in his work area. Remember that you can enhance the building. An advanced gamekeeper can release more game into the wild."),
        productivity_threshold = 33
    },
}

pop_textdomain()
