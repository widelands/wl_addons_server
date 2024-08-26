push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_hunters_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Hunter’s Hut"),
    icon = dirname .. "menu.png",
    size = "small",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = { 44, 44 },
        },
    },

    spritesheets = {
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 43, 44 }
        },
        idle = {
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 43, 44 }
        },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_hunters_house_advanced",
        enhancement_cost = {
            brick = 1,
            grout = 1,
            planks = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        }
    },
    buildcost = {
        granite = 2,
        log = 2,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3
    },

    working_positions = {
        europeans_hunter_basic = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start hunting because ...
            descname = _("hunting"),
            actions = {
                -- time of worker: 8.2-58.6 sec, min+max average 33.4 sec
                -- min. time total: 8.2 + 35 = 43.2 sec
                -- max. time total: 58.6 + 35 = 93.6 sec
                -- avg. time total: 33.4 + 35 = 68.4 sec
                "callworker=hunt",
                "sleep=duration:35s",
                "produce=leather"
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
