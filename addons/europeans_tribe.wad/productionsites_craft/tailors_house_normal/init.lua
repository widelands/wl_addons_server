push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_tailors_house_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Tailors House"),
    icon = dirname .. "menu.png",
    
   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 56, 61 },
      },
      working = {
         basename = "idle",
         hotspot = { 56, 61 },
      }
   },
    
    size = "medium",
    enhancement = {
        name = "europeans_tailors_house_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2
        },
    },

    aihints = {},

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "armor", amount = 6 },
        { name = "cloth", amount = 4 },
        { name = "blackwood", amount = 4 },
        { name = "leather", amount = 4 },
        { name = "rubber", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production_for_inputs",
                "sleep=duration:20s",
                "call=produce_armor_wooden",
                "sleep=duration:20s",
                "call=produce_armor_processed",
                "sleep=duration:20s",
                "call=produce_armor_compressed",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has blackwood:2 and site has cloth:2 and site has armor:4 and site has leather:2",
                "return=skipped when site has blackwood:2 and site has cloth:2 and site has armor:4 and site has rubber:2",
                "sleep=duration:5m",
            }
        },
        produce_armor_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden armor because ...
            descname = pgettext("europeans_building", "making a wooden armor"),
            actions = {
                "return=skipped unless economy needs armor_wooden or workers need experience",
                "consume=blackwood",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:150s",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=armor_wooden:2"
            }
        },
        produce_armor_processed = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring processed armor because ...
            descname = pgettext("europeans_building", "tailoring processed armor"),
            actions = {
                "return=skipped unless economy needs armor_processed or workers need experience",
                "consume=armor:2 cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:150s",
                "produce=armor_processed:2"
            }
        },
        produce_armor_compressed = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a suit of chain armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of chain armor"),
            actions = {
                "return=skipped unless economy needs armor_compressed or workers need experience",
                "consume=armor:2 leather,rubber",
                "animate=working duration:150s",
                "produce=armor_compressed:2"
            }
        }
     },
}

pop_textdomain()
