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
        europeans_smelter_advanced = 1,
        europeans_smelter_basic = 1
    },

    inputs = {
        { name = "coal", amount = 6 },
        { name = "ore", amount = 4 },
        { name = "scrap_iron", amount = 4 },
        { name = "scrap_metal_mixed", amount = 4 }
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
            descname = pgettext("europeans_building", "recycling iron"),
            actions = {
                "return=skipped when economy needs coal",
                "return=skipped unless site has coal:2",
                "return=skipped unless site has scrap_iron:2",
                "consume=scrap_iron:2 coal:2",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:15s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron:2"
            }
        },
        recycle_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start recyling iron and gold because ...
            descname = pgettext("europeans_building", "recycling iron and gold"),
            actions = {
                "return=skipped when economy needs coal",
                "return=skipped unless site has coal:2",
                "return=skipped unless site has scrap_metal_mixed:2",
                "consume=scrap_metal_mixed:2 coal:2",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:15s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=iron gold"
            }
        },
        smelt_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting iron because ...
            descname = pgettext("europeans_building", "smelting iron"),
            actions = {
                "return=skipped unless economy needs iron",
                "return=skipped when economy needs ore and site has scrap_iron:2",
                "return=skipped unless site has coal:2",
                "return=skipped unless site has ore:2",
                "consume=ore:2 coal:2",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron:2"
            }
        },
        smelt_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = pgettext("europeans_building", "smelting gold"),
            actions = {
                "return=skipped unless economy needs gold",
                "return=skipped when economy needs ore and site has scrap_metal_mixed:2",
                "return=skipped unless site has coal:2",
                "return=skipped unless site has ore:2",
                "consume=ore:2 coal:2",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:30s",
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
                "consume=ore:2 coal:2",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron",
                "sleep=duration:30s",
                "playsound=sound/metal/fizzle priority:20% allow_multiple",
                "animate=working duration:30s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=gold",
                "sleep=duration:90s"
            }
        }
    },
}

pop_textdomain()
