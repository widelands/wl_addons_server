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
            scrap_wood = 2,
            scrap_iron = 1
        },
    },
    buildcost = {
        log = 3,
        reed = 3,
        granite = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2,
        scrap_iron = 1
    },

    aihints = {
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 3,
        normal_ai_limit = 6,
    },

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
                "call=pausing_production_for_inputs",
                "sleep=duration:30s",
                "call=pausing_production_for_outputs",
                "sleep=duration:30s",
                "call=smelting_ore",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has ore:4 and site has coal:4",
                "return=skipped when economy needs ore", -- for statistical reason
                "sleep=duration:5m",
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs gold",
                "return=skipped when economy needs iron",
                "sleep=duration:10m",
            }
        },
        smelting_ore = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting ore because ...
            descname = pgettext("europeans_building", "smelting ore"),
            actions = {
                "return=skipped when economy needs coal",
                "consume=ore:3 coal:3",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:60s",
                "playsound=sound/metal/ironping priority:60%",
                "animate=working duration:60s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=iron:2 gold"
            }
        }
    },
}

pop_textdomain()
