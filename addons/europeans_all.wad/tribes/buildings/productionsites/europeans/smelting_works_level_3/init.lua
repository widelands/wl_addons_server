push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/smelting_works/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_smelting_works_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Smelting Works Level 3"),
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
    enhancement = {
        name = "europeans_smelting_works_level_4",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            reed = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            grout = 1
        }
    },

    aihints = {
        prohibited_till = 900,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        amazons_gold_smelter = 1,
        empire_smelter = 1
    },

    inputs = {
        { name = "coal", amount = 8 },
        { name = "iron_ore", amount = 4 },
        { name = "gold_ore", amount = 4 },
        { name = "gold_dust", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=smelting_gold_dust",
                "call=smelting_gold_ore",
                "call=smelting_iron_ore",
                "return=skipped"
            }
        },
        smelting_gold_dust = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = _("smelting gold"),
            actions = {
                -- time total: 25.4 + 35 + 3.6 = 64 sec
                "return=skipped unless economy needs gold",
                "consume=coal gold_dust",
                "sleep=duration:25s400ms",
                "playsound=sound/metal/furnace priority:50% allow_multiple",
                "animate=working duration:35s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold"
            },
        },
        smelting_gold_ore = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting gold because ...
            descname = _("smelting gold"),
            actions = {
                -- time: 25.4 + 35 + 3.6 = 64 sec
                "return=skipped unless economy needs gold",
                "consume=gold_ore coal",
                "sleep=duration:25s400ms",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:35s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=gold"
            },
        },
        smelting_iron_ore = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting ore because ...
            descname = pgettext("europeans_building", "smelting ore"),
            actions = {
                -- time: 25.4 + 35 + 3.6 = 64 sec
                "return=skipped unless economy needs iron",
                "consume=iron_ore coal",
                "sleep=duration:25s400ms",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:35s",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron"
            }
        },
    },
}

pop_textdomain()
