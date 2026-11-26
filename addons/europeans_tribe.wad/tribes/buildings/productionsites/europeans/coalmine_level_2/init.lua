include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/coalmine_deeper/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_productionsite_type {
    name = "europeans_coalmine_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Coal Mine Level 2"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = animations,
    spritesheets = spritesheets,

    size = "mine",
    enhancement = {
        name = "europeans_coalmine_level_3",
        enhancement_cost = {
            planks = 3
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1
        }
    },

    aihints = {},

    working_positions = {
        barbarians_miner_chief = 1,
        barbarians_miner_master = 1
    },

    inputs = {
        { name = "ration", amount = 6 },
        { name = "beer_strong", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs coal",
                "return=skipped when economy needs ration and not economy needs granite and not economy needs diamond and not economy needs coal",
                "consume=ration beer_strong",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=ration beer_strong",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=ration beer_strong",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_diamond",
            }
        },
        mine_coal = {
            descname = pgettext("europeans_building", "mining coal"),
            actions = {
                "animate=working duration:20s",
                "mine=resource_coal radius:4 yield:40% when_empty:6% experience_on_fail:10%",
                "produce=granite coal",
            }
        },
        mine_diamond = {
            descname = pgettext("europeans_building", "mining diamond"),
            actions = {
                "animate=working duration:20s",
                "mine=resource_coal radius:4 yield:40% when_empty:6% experience_on_fail:10%",
                "produce=diamond",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=ration:3 beer_strong:3",
                "produce=coal:8 granite:8 diamond",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Coal",
        heading = _"Main Coal Vein Exhausted",
        message =
            pgettext("europeans_building", "This coal mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
    },
}

pop_textdomain()
