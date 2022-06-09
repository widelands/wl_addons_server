push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_goldmine_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Gold Mine Level 1"),
    icon = dirname .. "menu.png",
    size = "mine",

    enhancement = {
        name = "europeans_goldmine_level_2",
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
            hotspot = { 21, 37 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 21, 37 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 21, 37 },
        },
        empty = {
            pictures = path.list_files(dirname .. "empty_??.png"),
            hotspot = { 21, 37 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_miner_basic = 2
    },

    inputs = {
        { name = "ration", amount = 5 },
        { name = "beer", amount = 5 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining gold because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs ore or economy needs granite or economy needs marble or workers need experience",
                "return=skipped when economy needs coal and not economy needs ore",
                "return=skipped unless site has ration:3",
                "return=skipped unless site has beer:3",
                "consume=ration beer",
                "sleep=duration:5s",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=ration beer",
                "sleep=duration:5s",
                "call=mine_stone",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=ration beer",
                "sleep=duration:5s",
                "call=mine_stone",
                "call=mine_ore",
                "call=mine_marble",
            }
        },
        mine_ore = {
            descname = pgettext("europeans_building", "mining ore"),
            actions = {
                "animate=working duration:15s",
                "mine=resource_gold radius:4 yield:40% when_empty:5% experience_on_fail:10%",
                "produce=ore",
            }
        },
        mine_stone = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:15s",
                "mine=resource_gold radius:4 yield:40% when_empty:5% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_gold radius:4 yield:40% when_empty:5% experience_on_fail:10%",
                "produce=marble",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=ration:3 beer:3",
                "produce=ore:4 granite:3 marble",
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
