push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_goldmine_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Gold Mine Level 3"),
    icon = dirname .. "menu.png",
    size = "mine",

    enhancement = {
        name = "europeans_goldmine_level_4",
        enhancement_cost = {
            log = 2,
            blackwood = 1,
            planks = 1,
            reed = 1
        },
        enhancement_return_on_dismantle = {
            blackwood = 1
        }
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 49, 49 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 49, 49 },
            fps = 10
        },
        empty = {
            pictures = path.list_files(dirname .. "empty_??.png"),
            hotspot = { 49, 49 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_miner_normal = 3
    },

    inputs = {
        { name = "snack", amount = 6 },
        { name = "mead", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining gold because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs ore or economy needs granite or economy needs marble or workers need experience",
                "return=skipped when economy needs coal and not economy needs ore",
                "return=skipped unless site has snack:4",
                "return=skipped unless site has mead:4",
                "consume=snack mead",
                "sleep=duration:5s",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=snack mead",
                "sleep=duration:5s",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_marble",
                "sleep=duration:5s",
                "consume=snack mead",
                "sleep=duration:5s",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=snack mead",
                "sleep=duration:5s",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_marble",
            }
        },
        mine_ore = {
            descname = pgettext("europeans_building", "mining ore"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_gold radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=ore",
            }
        },
        mine_stone = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_gold radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_gold radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=marble",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=snack:4 mead:4",
                "produce=ore:8 granite:4 marble:2",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Gold",
        heading = _"Main Gold Vein Exhausted",
        message =
            pgettext("europeans_building", "This gold mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
    },
}

pop_textdomain()
