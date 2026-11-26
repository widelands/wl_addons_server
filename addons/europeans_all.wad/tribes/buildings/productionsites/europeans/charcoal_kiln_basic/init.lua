include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/charcoal_kiln/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_productionsite_type {
    name = "europeans_charcoal_kiln_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Charcoal Kiln"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = animations,
    spritesheets = spritesheets,

    size = "medium",
    enhancement = {
        name = "europeans_charcoal_kiln_level_1",
        enhancement_cost = {
            granite = 2,
            ironwood = 2,
            rope = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1
        }
    },
    buildcost = {
        granite = 2,
        blackwood = 2,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2
    },

    aihints = {
        prohibited_till = 900,
        basic_amount = 1,
        very_weak_ai_limit = 2,
        weak_ai_limit = 2,
        normal_ai_limit = 4
    },

    working_positions = {
        barbarians_charcoal_burner = 1
    },

    inputs = {
        { name = "scrap_wood", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=burn_wood",
                "return=skipped"
            }
        },
        burn_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
            descname = pgettext("europeans_building", "producing coal"),
            actions = {
                "return=skipped unless site has scrap_wood:4",
                "consume=scrap_wood:4",
                "animate=working duration:5m",
                "produce=coal:2"
            }
        }
    },
}

pop_textdomain()
