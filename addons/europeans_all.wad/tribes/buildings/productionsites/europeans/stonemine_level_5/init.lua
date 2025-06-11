push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/rockmine/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_stonemine_level_5",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Stone Mine Level 5"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            hotspot = {27, 74},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            hotspot = {27, 74},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        empty = {
            hotspot = {27, 74},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },
    animations = {
        unoccupied = {
            hotspot = {27, 56}
        }
    },

    size = "mine",
    enhancement = {
        name = "europeans_stonemine_level_6",
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
        frisians_miner = 2
    },

    inputs = {
        { name = "snack", amount = 6 },
        { name = "mead", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining iron because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs granite or economy needs marble or economy needs quartz or economy needs diamond",
                "return=skipped when economy needs snack and not economy needs granite and not economy needs marble and not economy needs diamond and not economy needs quartz",
                "return=skipped unless site has snack:4",
                "consume=snack mead",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=snack mead",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_diamond",
                "sleep=duration:5s",
                "consume=snack mead",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=snack mead",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_diamond",
                "return=skipped"
            }
        },
        mine_granite = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:35s",
                "mine=resource_stones radius:5 yield:80% when_empty:12% experience_on_fail:20%",
                "produce=granite",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:35s",
                "mine=resource_stones radius:5 yield:80% when_empty:12% experience_on_fail:20%",
                "produce=marble",
            }
        },
        mine_diamond = {
            descname = pgettext("europeans_building", "mining diamond"),
            actions = {
                "animate=working duration:35s",
                "mine=resource_stones radius:5 yield:80% when_empty:12% experience_on_fail:20%",
                "produce=diamond",
            }
        },
        mine_quartz = {
            descname = pgettext("europeans_building", "mining quartz"),
            actions = {
                "animate=working duration:35s",
                "mine=resource_stones radius:5 yield:80% when_empty:12% experience_on_fail:20%",
                "produce=quartz",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=snack:4 mead:4",
                "produce=granite:8 marble:4 quartz:2 diamond:2",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No rare stone",
        heading = _"Main Rare Stone Vein Exhausted",
        message =
            pgettext("europeans_building", "This stone mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider dismantling or destroying it."),
    },
}

pop_textdomain()
