push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/hunters_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_hunters_house_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Hunter’s Hut Level 4"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            hotspot = {40, 69},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },
    animations = {
        unoccupied = {
            hotspot = {40, 52}
        }
    },
    
    size = "small",

    aihints = {
        prohibited_till = 4800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3
    },

    working_positions = {
        frisians_hunter = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
            descname = _("hunting"),
            actions = {
                -- time of worker: 8.2-62.2 sec, mean 39.948 sec
                -- min. time: 8.2 + 35 = 43.2 sec
                -- max. time: 62.2 + 35 = 97.2 sec
                -- mean time: 39.948 + 35 = 74.948 sec
                "return=skipped unless economy needs meat",
                "callworker=hunt",
                "sleep=duration:35s",
                "produce=fur"
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
