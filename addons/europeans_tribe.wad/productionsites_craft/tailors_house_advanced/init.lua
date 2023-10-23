push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_tailors_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Tailors House"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 50, 66 },
      },
      unoccupied = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 50, 66 },
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 50, 66 }
      },
      working = {
         fps = 5,
         frames = 20,
         columns = 10,
         rows = 2,
         hotspot = { 50, 66 }
      },
    },

    size = "medium",
    
    aihints = {},

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_normal = 1
    },

    inputs = {
        { name = "armor", amount = 6 },
        { name = "cloth", amount = 4 },
        { name = "planks", amount = 4 },
        { name = "iron", amount = 4 },
        { name = "coal", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production_for_inputs",
                "sleep=duration:10s",
                "call=pausing_production_for_outputs",
                "sleep=duration:10s",
                "call=produce_armor_wooden",
                "sleep=duration:10s",
                "call=produce_armor_processed",
                "sleep=duration:10s",
                "call=produce_armor_chain",
                "sleep=duration:10s",
                "call=produce_armor_advanced",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has planks:2 and site has cloth:2 and site has armor:3 and site has iron:2 and site has coal:2",
                "return=skipped when economy needs iron", -- for statistical reason
                "sleep=duration:5m",
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs armor_wooden",
                "return=skipped when economy needs armor_processed",
                "return=skipped when economy needs armor_chain",
                "return=skipped when economy needs armor_advanced",
                "sleep=duration:30m",
            }
        },
        produce_armor_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden armor because ...
            descname = pgettext("europeans_building", "making a wooden armor"),
            actions = {
                "return=skipped when economy needs armor_processed and not economy needs armor_wooden",
                "return=skipped when economy needs armor_chain and not economy needs armor_wooden",
                "return=skipped when economy needs armor_advanced and not economy needs armor_wooden",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:120s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=armor_wooden:2"
            }
        },
        produce_armor_processed = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring processed armor because ...
            descname = pgettext("europeans_building", "tailoring processed armor"),
            actions = {
                "return=skipped when economy needs armor_chain and not economy needs armor_processed",
                "return=skipped when economy needs armor_advanced and not economy needs armor_processed",
                "consume=armor cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:120s",
                "produce=armor_processed:2"
            }
        },
        produce_armor_chain = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a suit of chain armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of chain armor"),
            actions = {
                "return=skipped when economy needs armor_processed and not economy needs armor_chain",
                "return=skipped when economy needs armor_advanced and not economy needs armor_chain",
                "consume=armor coal iron",
                "animate=working duration:120s",
                "produce=armor_chain:2"
            }
        },
        produce_armor_advanced= {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a suit of advanced armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of advanced armor"),
            actions = {
                "return=skipped when economy needs armor_processed and not economy needs armor_advanced",
                "return=skipped when economy needs armor_chain and not economy needs armor_advanced",
                "consume=armor cloth coal iron",
                "animate=working duration:120s",
                "produce=armor_advanced:2"
            }
        }
    },
}

pop_textdomain()
