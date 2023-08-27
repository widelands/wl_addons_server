push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_tailors_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Tailors House"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 65, 83 },
      },
      unoccupied = {
         hotspot = { 65, 83 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 65, 83 }
      },
      working = {
         fps = 20,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 65, 83 }
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_tailors_house_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2
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
        europeans_worker_basic = 2
    },

    inputs = {
        { name = "armor", amount = 4 },
        { name = "cloth", amount = 4 },
        { name = "planks", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_armor_wooden",
                "sleep=duration:20s",
                "call=produce_armor_processed",
                "sleep=duration:20s",
                "return=skipped"
            }
        },
        produce_armor_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden armor because ...
            descname = pgettext("europeans_building", "making a wooden armor"),
            actions = {
                "return=skipped unless economy needs armor_wooden or workers need experience",
                "consume=planks",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:50s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=armor_wooden:2"
            }
        },
        produce_armor_processed = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring processed armor because ...
            descname = pgettext("europeans_building", "tailoring processed armor"),
            actions = {
                "return=skipped unless economy needs armor_processed or workers need experience",
                "consume=armor cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:50s",
                "produce=armor_processed:2"
            }
        }
    },
}

pop_textdomain()
