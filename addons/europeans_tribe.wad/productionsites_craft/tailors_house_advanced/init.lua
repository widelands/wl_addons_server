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
        { name = "leather", amount = 4 },
        { name = "rubber", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production_for_inputs",
                "sleep=duration:10s",
                "call=produce_armor_wooden",
                "sleep=duration:10s",
                "call=produce_armor_processed",
                "sleep=duration:10s",
                "call=produce_armor_compressed",
                "sleep=duration:10s",
                "call=produce_armor_advanced",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has planks:2 and site has cloth:2 and site has armor:4 and site has leather:2",
                "return=skipped when site has planks:2 and site has cloth:2 and site has armor:4 and site has rubber:2",
                "sleep=duration:5m",
            }
        },
        produce_armor_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden armor because ...
            descname = pgettext("europeans_building", "making a wooden armor"),
            actions = {
                "return=skipped unless economy needs armor_wooden or workers need experience",
                "return=skipped when economy needs armor_processed and not economy needs armor_wooden",
                "return=skipped when economy needs armor_compressed and not economy needs armor_wooden",
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
                "return=skipped unless economy needs armor_processed or workers need experience",
                "return=skipped when economy needs armor_compressed and not economy needs armor_processed",
                "return=skipped when economy needs armor_advanced and not economy needs armor_processed",
                "consume=armor:2 cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:120s",
                "produce=armor_processed:2"
            }
        },
        produce_armor_compressed = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a suit of chain armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of chain armor"),
            actions = {
                "return=skipped unless economy needs armor_compressed or workers need experience",
                "return=skipped when economy needs armor_processed and not economy needs armor_compressed",
                "return=skipped when economy needs armor_advanced and not economy needs armor_compressed",
                "consume=armor:2 leather,rubber",
                "animate=working duration:120s",
                "produce=armor_compressed:2"
            }
        },
        produce_armor_advanced= {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a suit of advanced armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of advanced armor"),
            actions = {
                "return=skipped unless economy needs armor_advanced or workers need experience",
                "return=skipped when economy needs armor_processed and not economy needs armor_advanced",
                "return=skipped when economy needs armor_compressed and not economy needs armor_advanced",
                "consume=armor:2 leather,rubber:2",
                "animate=working duration:120s",
                "produce=armor_advanced:2"
            }
        }
    },
}

pop_textdomain()
