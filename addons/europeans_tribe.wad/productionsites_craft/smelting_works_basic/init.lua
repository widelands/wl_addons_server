push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_smelting_works_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Smelting Works"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_smelting_works_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2
        },
    },

    buildcost = {
        log = 3,
        reed = 3,
        granite = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
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
        prohibited_till = 4200,
        forced_after = 5400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 4
    },

    working_positions = {
        europeans_smelter_basic = 1
    },

    inputs = {
        { name = "coal", amount = 4 },
        { name = "ore", amount = 4 }
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
            descname = pgettext("europeans_building", "smelting iron"),
            actions = {
                "return=skipped unless economy needs iron or workers need experience",
                "return=skipped unless site has coal:2",
                "return=skipped unless site has ore:2",
                "consume=ore:2 coal:2",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:60s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron:2"
            }
        },
        smelt_iron_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs iron",
                "return=skipped when economy needs coal",
                "consume=ore coal",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:60s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron",
                "sleep=duration:120s"
            }
        }
    },
}

pop_textdomain()
