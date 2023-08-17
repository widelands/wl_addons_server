push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Animal Farm"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 89, 82 },
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 89, 82 },
      },
    },
    
    size = "big",
    enhancement = {
        name = "europeans_animal_farm_big",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        }
    },

    aihints = {},

    working_positions = {
        europeans_breeder_advanced = 1,
        europeans_breeder_normal = 2
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
                "call=produce_wool",
                "call=produce_wool",
                "call=produce_meat",
                "call=produce_meat_leather",
                "call=produce_fish",
                "call=produce_fish",
                "call=produce_cattle",
                "call=produce_donkey",
                "return=skipped"
            }
        },
        feed_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs meat or economy needs leather or economy needs fish or economy needs wool",
                "return=skipped when economy needs water",
                "return=skipped when economy needs flour or economy needs beer",
                "consume=water:2 corn blackroot fruit",
                "animate=working duration:60s",
                "sleep=duration:120s"
            }
        },
        produce_wool = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "producing wool"),
           actions = {
                "return=skipped unless economy needs wool or workers need experience",
                "return=skipped when economy needs water",
                "return=skipped unless site has water:3",
                "consume=water blackroot,corn",
                "playsound=sound/farm/sheep priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water blackroot,corn",
                "playsound=sound/farm/sheep priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water blackroot,corn",
                "playsound=sound/farm/sheep priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=wool:3"
           }
        },
        produce_cattle = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_ox or workers need experience",
                "return=skipped when economy needs meat or economy needs fish or economy needs wool",
                "return=skipped when economy needs water",
                "return=skipped unless site has water:3",
                "consume=water blackroot,corn fruit",
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
                "return=skipped when economy needs meat or economy needs fish or economy needs wool",
                "return=skipped when economy needs water",
                "return=skipped unless site has water:3",
                "consume=water blackroot,corn fruit",
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
                "consume=water blackroot,corn fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water:2 blackroot,corn:2",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water blackroot,corn",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:4"
           }
        },
        produce_meat_leather = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing meat and leather because ...
           descname = pgettext("europeans_building", "producing meat and leather"),
           actions = {
                "return=skipped unless economy needs leather or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water blackroot,corn fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water:2 blackroot,corn:2",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water blackroot,corn",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:4 leather"
           }
        },
        produce_fish = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fish because ...
           descname = pgettext("europeans_building", "breeding fish"),
            actions = {
                "return=skipped unless economy needs fish or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water blackroot,corn fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water:2 blackroot,corn:2 fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water blackroot,corn fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=fish:4"
            }
        }
    },
}

pop_textdomain()
