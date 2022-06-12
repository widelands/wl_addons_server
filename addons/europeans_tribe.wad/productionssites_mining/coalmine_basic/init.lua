push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_coalmine_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Coal Mine"),
    icon = dirname .. "menu.png",
    size = "mine",

    enhancement = {
        name = "europeans_coalmine_level_1",
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
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 4,
        prohibited_till = 3000,
        forced_after = 3600
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
            -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs coal or economy needs granite or economy needs diamond or workers need experience",
                "return=skipped unless site has ration:3",
                "return=skipped unless site has beer:3",
                "consume=ration beer",
                "call=mine_stone",
                "call=mine_coal",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=ration beer",
                "call=mine_stone",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=ration beer",
                "call=mine_stone",
                "call=mine_coal",
                "call=mine_diamond",
                "sleep=duration:5s",
            }
        },
        mine_coal = {
            descname = pgettext("europeans_building", "mining coal"),
            actions = {
                "animate=working duration:10s",
                "mine=resource_coal radius:4 yield:20% when_empty:2% experience_on_fail:10%",
                "produce=coal",
            }
        },
        mine_stone = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:10s",
                "mine=resource_coal radius:4 yield:20% when_empty:2% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_diamond = {
            descname = pgettext("europeans_building", "mining diamond"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_coal radius:4 yield:20% when_empty:2% experience_on_fail:10%",
                "produce=diamond",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=ration:3 beer:3",
                "produce=coal:4 granite:3 diamond",
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
