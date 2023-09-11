push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Animal Farm"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 83, 75 },
      },
      working = {
         basename = "idle",
         hotspot = { 83, 75 },
      }
    },
    
    size = "big",
    enhancement = {
        name = "europeans_animal_farm_advanced",
        enhancement_cost = {
            planks = 3,
            brick = 3,
            marble = 3
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 3,
            marble = 3
        }
    },

    aihints = {},

    working_positions = {
        europeans_farmer_normal = 1,
        europeans_worker_normal = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "water", amount = 10 },
        { name = "corn", amount = 6 },
        { name = "blackroot", amount = 6 },
        { name = "fruit", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=feed_idle",
                "call=produce_meat",
                "call=produce_meat_leather",
                "sleep=duration:10s",
                "call=produce_fish",
                "call=produce_fish",
                "sleep=duration:10s",
                "call=produce_cattle",
                "call=produce_donkey",
                "return=skipped"
            }
        },
        feed_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs meat or economy needs leather or economy needs fish",
                "return=skipped when economy needs water",
                "return=skipped when economy needs flour or economy needs beer",
                "consume=water:2 corn blackroot fruit",
                "animate=working duration:60s",
                "sleep=duration:120s"
            }
        },
        produce_cattle = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_ox or workers need experience",
                "return=skipped when economy needs meat or economy needs leather or economy needs fish",
                "return=skipped when economy needs water",
                "return=skipped unless site has water:3",
                "return=skipped unless site has blackroot,corn:3",
                "consume=water blackroot,corn",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:20s", -- Animation of feeding the cattle
                "consume=water blackroot,corn",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:20s", -- Animation of feeding the cattle
                "consume=water blackroot,corn",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:20s", -- Animation of feeding the cattle
                "recruit=europeans_carrier_ox"
            }
        },
        produce_donkey = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing donkeys because ...
            descname = pgettext("europeans_building", "rearing donkeys"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_donkey or workers need experience",
                "return=skipped when economy needs meat or economy needs leather or economy needs fish",
                "return=skipped when economy needs water",
                "return=skipped unless site has water:3",
                "return=skipped unless site has blackroot,corn:3",
                "consume=water blackroot,corn",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:20s", -- Feeding cute little baby donkeys ;)
                "consume=water blackroot,corn",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:20s", -- Feeding cute little baby donkeys ;)
                "consume=water blackroot,corn",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:20s", -- Feeding cute little baby donkeys ;)
                "recruit=europeans_carrier_donkey"
            }
        },
        produce_meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "producing meat"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "return=skipped unless site has water:3",
                "return=skipped unless site has blackroot,corn:3",
                "consume=water blackroot,corn",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water blackroot,corn",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water blackroot,corn",
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
                "return=skipped unless site has water:3",
                "return=skipped unless site has blackroot,corn:3",
                "consume=water blackroot,corn",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water blackroot,corn",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water blackroot,corn",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:2 leather"
           }
        },
        produce_fish = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fish because ...
           descname = pgettext("europeans_building", "breeding fish"),
            actions = {
                "return=skipped unless economy needs fish or workers need experience",
                "return=skipped unless site has water:3",
                "return=skipped unless site has fruit:3",
                "return=skipped unless site has blackroot,corn:3",
                "consume=water blackroot,corn fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water blackroot,corn fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water blackroot,corn fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=fish:2"
            }
        }
    },
}

pop_textdomain()
