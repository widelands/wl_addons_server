include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/ferry_yard/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_productionsite_type {
    name = "europeans_ferry_yard_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Ferry Yard Level 4"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = animations,
    spritesheets = spritesheets,

    map_check = {"waterways"},
    size = "medium",

    aihints = {
        needs_water = true,
        prohibited_till = 7200,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        frisians_shipwright = 1
    },

    inputs = {
        { name = "log", amount = 6 },
        { name = "cloth", amount = 3 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                -- time of worker: 17.2-38.8 sec
                -- min. time total: 20 + 17.2 = 37.2 sec
                -- max. time total: 20 + 38.8 = 58.8 sec
                "sleep=duration:20s",
                "return=skipped unless fleet needs ferry",
                "consume=log:2 cloth",
                "callworker=buildferry"
            }
        },
    },
}

pop_textdomain()
