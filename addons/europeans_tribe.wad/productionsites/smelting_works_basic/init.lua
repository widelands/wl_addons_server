push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_smelting_works_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Smelting Works"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_smelting_works_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2
        },
        enhancement_return_on_dismantle = {
            blackwood = 1
        },
    },

    buildcost = {
        log = 3,
        reed = 3,
        granite = 3
    },
    return_on_dismantle = {
        log = 2,
        granite = 2
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 44, 58 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 44, 58 },
        },
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
        basic_amount = 1,
        prohibited_till = 3000,
        forced_after = 3900
    },

    working_positions = {
        europeans_smelter_basic = 1
    },

    inputs = {
        { name = "coal", amount = 6 },
        { name = "ore", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=smelt_iron",
                "call=smelt_iron_idle",
                "return=skipped"
            }
        },
        smelt_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
            descname = _"smelting iron",
            actions = {
                "return=skipped unless economy needs iron or workers need experience",
                "return=skipped unless site has coal:3",
                "consume=ore:3 coal:3",
                "sleep=duration:10s",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:35s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron:3",
            }
        },
        smelt_iron_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs iron",
                "return=skipped when economy needs coal",
                "consume=ore coal",
                "sleep=duration:90s",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:25s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron",
            }
        }
    },
}

pop_textdomain()
