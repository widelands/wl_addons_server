push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_smelting_works_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Smelting Works"),
    icon = dirname .. "menu.png",
    size = "medium",

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 39, 53 },
        },
        build = {
            pictures = path.list_files(dirname .. "build_??.png"),
            hotspot = { 39, 53 },
        },
        working = {
            pictures = path.list_files(dirname .. "working_??.png"),
            hotspot = { 39, 53 },
            fps = 5
        },
    },

    aihints = {},

    working_positions = {
        europeans_smelter_advanced = 1
    },

    inputs = {
        { name = "coal", amount = 6 },
        { name = "ore", amount = 6 },
        { name = "scrap_iron", amount = 6 },
        { name = "scrap_metal_mixed", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=recycle_iron",
                "call=recycle_gold",
                "call=smelt_iron",
                "call=smelt_gold",
                "call=smelt_iron_idle",
                "return=skipped"
            }
        },
        recycle_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start recyling iron because ...
            descname = _"recycling iron",
            actions = {
                "return=skipped when economy needs coal",
                "return=skipped unless site has scrap_iron:2",
                "consume=scrap_iron:2 coal:2",
                "sleep=duration:30s",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:35s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron:2"
            }
        },
        recycle_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start recyling iron and gold because ...
            descname = _"recycling iron and gold",
            actions = {
                "return=skipped when economy needs coal",
                "return=skipped unless site has scrap_metal_mixed:3",
                "consume=scrap_metal_mixed:3 coal:3",
                "sleep=duration:30s",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:35s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=iron gold:2"
            }
        },
        smelt_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
            descname = _"smelting iron",
            actions = {
                "return=skipped unless economy needs iron",
                "return=skipped unless site has coal:3",
                "consume=ore:3 coal:3",
                "sleep=duration:20s",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:35s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron:3",
            }
        },
        smelt_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = _"smelting gold",
            actions = {
                "return=skipped unless economy needs gold",
                "return=skipped unless site has coal:2",
                "consume=ore:2 coal:2",
                "sleep=duration:20s",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:35s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold"
            }
        },
        smelt_iron_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs iron",
                "return=skipped when economy needs gold",
                "return=skipped when economy needs coal",
                "sleep=duration:90s",
                "consume=ore:2 coal:2",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:25s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron",
                "sleep=duration:90s",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:25s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=gold",
            }
        }
    },
}

pop_textdomain()
