push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_smelting_works_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Smelting Works"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 48, 60 },
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 48, 60 },
      },
      working = {
         fps = 5,
         frames = 20,
         columns = 10,
         rows = 2,
         hotspot = { 48, 60 },
      },
    },
    
    size = "medium",

    aihints = {},

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "coal", amount = 10 },
        { name = "ore", amount = 8 },
        { name = "scrap_iron", amount = 4 },
        { name = "scrap_metal_mixed", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production_for_inputs",
                "sleep=duration:20s",
                "call=pausing_production_for_outputs",
                "sleep=duration:20s",
                "call=recycle_iron",
                "sleep=duration:20s",
                "call=recycle_gold",
                "sleep=duration:20s",
                "call=smelting_ore",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has ore:6 and site has coal:6",
                "return=skipped when site has scrap_iron:2 and site has coal:2",
                "return=skipped when site has scrap_metal_mixed:2 and site has coal:2",
                "return=skipped when economy needs ore and economy needs scrap_iron and economy needs scrap_metal_mixed", -- for statistical reason
                "sleep=duration:5m",
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs gold",
                "return=skipped when economy needs iron",
                "sleep=duration:30m",
            }
        },
        recycle_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start recyling iron because ...
            descname = pgettext("europeans_building", "recycling iron"),
            actions = {
                "return=skipped when economy needs gold and not economy needs iron",
                "consume=scrap_iron:2 coal:2",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron:2"
            }
        },
        recycle_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start recyling iron and gold because ...
            descname = pgettext("europeans_building", "recycling iron and gold"),
            actions = {
                "return=skipped when economy needs iron and not economy needs gold",
                "consume=scrap_metal_mixed:2 coal:2",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=iron gold"
            }
        },
        smelting_ore = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting ore because ...
            descname = pgettext("europeans_building", "smelting ore"),
            actions = {
                "return=skipped when site has scrap_iron:2 and economy needs ore",
                "return=skipped when site has scrap_metal_mixed:2 and economy needs ore",
                "consume=ore:6 coal:6",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:60s",
                "playsound=sound/metal/ironping priority:60%",
                "animate=working duration:60s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold:4 iron:2"
            }
        }
    },
}

pop_textdomain()
