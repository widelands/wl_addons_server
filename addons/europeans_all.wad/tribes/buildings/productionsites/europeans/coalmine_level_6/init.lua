push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/coalmine/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_coalmine_level_6",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Coal Mine Level 6"),
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
        name = "europeans_coalmine_level_7",
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
        frisians_miner = 3
    },

    inputs = {
        { name = "meal", amount = 8 },
        { name = "mead", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs coal",
                "return=skipped when economy needs meal and not economy needs granite and not economy needs diamond and not economy needs coal",
                "consume=meal mead",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=meal mead",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_diamond",
                "sleep=duration:5s",
                "consume=meal mead",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=meal mead",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_diamond",
            }
        },
        mine_coal = {
            descname = pgettext("europeans_building", "mining coal"),
            actions = {
                "animate=working duration:30s",
                "mine=resource_coal radius:5 yield:80% when_empty:14% experience_on_fail:20%",
                "produce=granite coal",
            }
        },
        mine_diamond = {
            descname = pgettext("europeans_building", "mining diamond"),
            actions = {
                "animate=working duration:30s",
                "mine=resource_coal radius:5 yield:80% when_empty:14% experience_on_fail:20%",
                "produce=diamond",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=meal:4 mead:4",
                "produce=coal:14 granite:14 diamond:2",
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
