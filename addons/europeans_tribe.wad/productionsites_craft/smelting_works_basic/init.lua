push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_smelting_works_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Smelting Works"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 44, 58 },
      },
      working = {
         basename = "idle",
         hotspot = { 44, 58 },
      },
    },
    
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

    aihints = {},

    working_positions = {
        europeans_worker_basic = 1
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
                "call=pausing_production",
                "sleep=duration:30s",
                "call=smelt_iron",
                "sleep=duration:30s",
                "call=smelt_gold",
                "return=skipped"
            }
        },
        pausing_production = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for ore and coal"),
            actions = {
                "return=skipped when site has ore:4 and site has coal:4",
                "sleep=duration:5m",
            }
        },
        smelt_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = pgettext("europeans_building", "smelting gold"),
            actions = {
                "return=skipped unless economy needs gold or workers need experience",
                "return=skipped when economy needs iron and not economy needs gold",
                "consume=ore:2 coal:2",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:120s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold"
            }
        },
        smelt_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
            descname = pgettext("europeans_building", "smelting iron"),
            actions = {
                "return=skipped unless economy needs iron or workers need experience",
                "return=skipped when economy needs gold and not economy needs iron",
                "consume=ore:2 coal:2",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:120s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron:2"
            }
        }
    },
}

pop_textdomain()
