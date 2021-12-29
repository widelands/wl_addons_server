push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_goldmine_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Gold Mine"),
    icon = dirname .. "menu.png",
    size = "mine",

    enhancement = {
        name = "europeans_goldmine_level_1",
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

    buildcost = {
        log = 2,
        blackwood = 2,
        planks = 2,
        reed = 2
    },
    return_on_dismantle = {
        blackwood = 2
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 21, 36 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 21, 36 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 21, 36 },
        },
        empty = {
            pictures = path.list_files(dirname .. "empty_??.png"),
            hotspot = { 21, 36 },
        },
    },

    aihints = {
    },

    working_positions = {
        europeans_miner_basic = 1
    },

    inputs = {
        { name = "ration", amount = 4 },
        { name = "beer", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining gold because ...
            descname = _"mining gold",
            actions = {
                "return=skipped unless economy needs ore or economy needs granite or workers need experience",
                "consume=ration beer",
                "sleep=duration:5s",
                "call=mine_stone",
                "call=mine_ore",
                "consume=ration beer",
                "sleep=duration:5s",
                "call=mine_stone",
                "call=mine_ore",
            }
        },
        mine_ore = {
            descname = _"mining gold",
            actions = {
                "animate=working duration:10s",
                "mine=resource_gold radius:4 yield:20% when_empty:2% experience_on_fail:10%",
                "produce=ore",
            }
        },
        mine_stone = {
            descname = _"mining granite",
            actions = {
                "animate=working duration:10s",
                "mine=resource_gold radius:4 yield:20% when_empty:2% experience_on_fail:10%",
                "produce=granite",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=ration:2 beer:2",
                "produce=ore:2 granite:2",
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
