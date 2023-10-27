push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

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
        name = "europeans_animal_farm_normal",
        enhancement_cost = {
            blackwood = 3,
            cloth = 3,
            grout = 3
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3
        },
    },
    buildcost = {
        log = 4,
        reed = 4,
        granite = 3
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 2
    },

    aihints = {},

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
                "return=skipped when economy needs water",
                "return=skipped when economy needs flour or economy needs beer",
                "consume=water:2 wheat rye barley",
                "animate=working duration:90s",
                "sleep=duration:5m"
            }
        },
        produce_cattle = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_ox or workers need experience",
                "return=skipped when economy needs meat or economy needs leather",
                "return=skipped when economy needs flour or economy needs water",
                "return=skipped unless site has water:4",
                "return=skipped unless site has rye:4 or site has wheat:4 or site has barley:4",
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
                "return=skipped unless economy needs meat or workers need experience",
                "return=skipped unless site has water:4",
                "return=skipped unless site has wheat,rye,barley:4",
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
                "return=skipped unless economy needs leather or workers need experience",
                "return=skipped unless site has water:4",
                "return=skipped unless site has wheat,rye,barley:4",
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
        }
    },
}

pop_textdomain()
