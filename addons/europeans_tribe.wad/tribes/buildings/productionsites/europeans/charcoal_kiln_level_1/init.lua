include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/charcoal_kiln/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_productionsite_type {
    name = "europeans_charcoal_kiln_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Charcoal Kiln Level 1"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = animations,
    spritesheets = spritesheets,

    size = "medium",
    enhancement = {
        name = "europeans_charcoal_kiln_level_2",
        enhancement_cost = {
            granite = 2,
            planks = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1
        }
    },

    aihints = {
        prohibited_till = 900,
        very_weak_ai_limit = 2,
        weak_ai_limit = 2,
        normal_ai_limit = 4
    },

    working_positions = {
        amazons_charcoal_burner = 1
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
                "animate=working duration:4m30s",
                "produce=coal:2"
            }
        }
    },
}

pop_textdomain()
