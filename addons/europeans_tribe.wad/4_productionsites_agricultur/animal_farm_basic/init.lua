push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/cattlefarm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Animal Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 57, 80 },
      },
      working = {
         basename = "idle",
         hotspot = { 57, 80 },
      },
    },
    
    size = "big",
    enhancement = {
        name = "europeans_animal_farm_advanced",
        enhancement_cost = {
            brick = 3,
            grout = 3,
            planks = 3
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 3
        }
    },
    buildcost = {
        granite = 4,
        log = 4,
        reed = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 3
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_farmer_basic = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "wheat", amount = 4 },
        { name = "rye", amount = 4 },
        { name = "barley", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=feed_idle",
                "call=produce_cattle",
                "sleep=duration:10s",
                "call=produce_meat_leather",
                "call=produce_meat",
                "return=skipped"
            }
        },
        feed_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs meat or economy needs leather",
                "return=skipped when economy needs europeans_carrier_ox",
                "return=skipped when economy needs water",
                "return=skipped when economy needs wheat",
                "return=skipped when economy needs rye",
                "return=skipped when economy needs barley",
                "consume=water:2 wheat rye barley",
                "animate=working duration:90s",
                "sleep=duration:5m"
            }
        },
        produce_cattle = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                "return=skipped when economy needs water and not economy needs europeans_carrier_ox",
                "return=skipped when economy needs rye and economy needs wheat and economy needs barley and not economy needs europeans_carrier_ox",
                "consume=water rye,wheat,barley",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:25s", -- Animation of feeding the cattle
                "consume=water rye,wheat,barley",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:20s", -- Animation of feeding the cattle
                "consume=water rye,wheat,barley",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:25s", -- Animation of feeding the cattle
                "consume=water rye,wheat,barley",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:20s", -- Animation of feeding the cattle
                "recruit=europeans_carrier_ox"
            }
        },
        produce_meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "producing meat"),
           actions = {
                "return=skipped when economy needs leather and not economy needs meat",
                "return=skipped when economy needs water and not economy needs meat",
                "return=skipped when economy needs rye and economy needs wheat and economy needs barley and not economy needs meat",
                "consume=water rye,wheat,barley",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:25s",
                "consume=water rye,wheat,barley",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water rye,wheat,barley",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:25s",
                "consume=water rye,wheat,barley",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:2"
           }
        },
        produce_meat_leather = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing meat and leather because ...
           descname = pgettext("europeans_building", "producing meat and leather"),
           actions = {
                "return=skipped when economy needs water and not economy needs leather",
                "return=skipped when economy needs rye and economy needs wheat and economy needs barley and not economy needs leather",
                "consume=water rye,wheat,barley",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:25s",
                "consume=water rye,wheat,barley",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water rye,wheat,barley",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:25s",
                "consume=water rye,wheat,barley",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:2 leather"
           }
        },
        dummy_program = {
            -- TRANSLATORS: Completed/Skipped/Did not start dummy program because ...
            descname = _"dummy program",
            actions = {
                "sleep=duration:10s",
                "recruit=europeans_carrier_1"
            }
        }
    },
}

pop_textdomain()
