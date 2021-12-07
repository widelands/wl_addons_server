push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_coalmine_level_5",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Coal Mine Level 5"),
    icon = dirname .. "menu.png",
    size = "mine",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 50, 56 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 50, 56 },
        },
        empty = {
            pictures = path.list_files(dirname .. "empty_??.png"),
            hotspot = { 50, 56 },
        },
    },

    aihints = {},

    working_positions = {
        europeans_miner_advanced = 3
    },

    inputs = {
        { name = "meal", amount = 8 },
        { name = "wine", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining iron because ...
            descname = _"mining coal",
            actions = {
                "return=skipped unless economy needs coal or economy needs granite or economy needs diamond or workers need experience",
                "consume=meal wine",
                "sleep=duration:5s",
                "call=mine_stone",
                "call=mine_coal",
                "call=mine_coal",
                "consume=meal wine",
                "sleep=duration:5s",
                "call=mine_stone",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_diamond",
            }
        },
        mine_coal = {
            descname = _"mining coal",
            actions = {
                "animate=working duration:35s",
                "mine=resource_coal radius:12 yield:100% when_empty:20% experience_on_fail:10%",
                "produce=coal",
            }
        },
        mine_stone = {
            descname = _"mining granite",
            actions = {
                "animate=working duration:35s",
                "mine=resource_coal radius:12 yield:100% when_empty:20% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_diamond = {
            descname = _"mining diamond",
            actions = {
                "animate=working duration:35s",
                "mine=resource_coal radius:12 yield:100% when_empty:20% experience_on_fail:10%",
                "produce=diamond",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=meal:2 wine:2",
                "produce=coal:4 granite:2 diamond",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Coal",
        heading = _"Main Coal Vein Exhausted",
        message =
            pgettext("europeans_building", "This coal mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider dismantling or destroying it."),
    },
}

pop_textdomain()
