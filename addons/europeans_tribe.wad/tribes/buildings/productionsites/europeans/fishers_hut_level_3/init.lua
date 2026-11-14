push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/fishers_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_fishers_house_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Fisher’s Hut Level 3"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 41, 59 },
        },
    },
   
    size = "small",
    enhancement = {
        name = "europeans_fishers_house_level_4",
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
        empire_fisher = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _("fishing"),
            actions = {
                -- time of worker: 17.2-46 sec, min+max average 31.6 sec
                -- min. time total: 17.2 + 10 = 27.2 sec
                -- max. time total: 46 + 10 = 56 sec
                -- avg. time total: 31.6 + 10 = 41.6 sec
                "return=skipped unless economy needs fish",
                "callworker=fish",
                "sleep=duration:10s"
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
