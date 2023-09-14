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
        { name = "planks", amount = 4 },
        { name = "iron", amount = 2 },
        { name = "coal", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production",
                "sleep=duration:20s",
                "call=produce_armor_wooden",
                "sleep=duration:20s",
                "call=produce_armor_processed",
                "sleep=duration:20s",
                "call=produce_armor_chain",
                "return=skipped"
            }
        },
        pausing_production = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for planks, cloth, armor, iron and coal"),
            actions = {
                "return=skipped when site has planks:2 and site has cloth:2 and site has armor:3 and site has iron and site has coal",
                "sleep=duration:5m",
            }
        },
        produce_armor_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden armor because ...
            descname = pgettext("europeans_building", "making a wooden armor"),
            actions = {
                "return=skipped unless economy needs armor_wooden or workers need experience",
                "consume=planks",
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
                "return=skipped when economy needs armor_chain and not economy needs armor_processed",
                "consume=armor cloth",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:150s",
                "produce=armor_processed:2"
            }
        },
        produce_armor_chain = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a suit of chain armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of chain armor"),
            actions = {
                "return=skipped unless economy needs armor_chain or workers need experience",
                "return=skipped when economy needs armor_processed and not economy needs armor_chain",
                "consume=armor:2 coal iron",
                "animate=working duration:150s",
                "produce=armor_chain:2"
            }
        }
     },
}

pop_textdomain()
