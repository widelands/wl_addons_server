push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/donkeyfarm/"

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
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_farmer_advanced = 1,
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1,
    },

    inputs = {
        { name = "water", amount = 10 },
        { name = "oat", amount = 6 },
        { name = "corn", amount = 6 },
        { name = "fruit", amount = 6 },
        { name = "grape", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=feed_idle",
                "call=produce_wool",
                "call=produce_wool",
                "sleep=duration:10s",
                "call=produce_meat",
                "call=produce_meat_leather",
                "call=produce_fish",
                "call=produce_fish",
                "sleep=duration:10s",
                "call=produce_cattle",
                "call=produce_donkey",
                "call=produce_horse",
                "return=skipped"
            }
        },
        feed_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs meat or economy needs leather or economy needs fish or economy needs wool",
                "return=skipped when economy needs europeans_carrier_ox or economy needs europeans_carrier_donkey or economy needs europeans_carrier_horse",
                "return=skipped when economy needs water",
                "return=skipped when economy needs corn",
                "return=skipped when economy needs oat",
                "return=skipped when economy needs fruit",
                "consume=water:2 corn oat fruit",
                "animate=working duration:60s",
                "sleep=duration:2m"
            }
        },
        produce_cattle = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                "return=skipped when economy needs water",
                "return=skipped when economy needs oat and economy needs corn",
                "return=skipped when economy needs fruit",
                "return=skipped when economy needs grape",
                "consume=water oat,corn fruit",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:20s", -- Animation of feeding the cattle
                "consume=water oat,corn grape",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:20s", -- Animation of feeding the cattle
                "consume=water oat,corn fruit",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:20s", -- Animation of feeding the cattle
                "recruit=europeans_carrier_ox"
            }
        },
        produce_donkey = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing donkeys because ...
            descname = pgettext("europeans_building", "rearing donkeys"),
            actions = {
                "return=skipped when economy needs water",
                "return=skipped when economy needs oat and economy needs corn",
                "return=skipped when economy needs fruit",
                "return=skipped when economy needs grape",
                "consume=water oat,corn fruit",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:20s", -- Feeding cute little baby donkeys ;)
                "consume=water oat,corn grape",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:20s", -- Feeding cute little baby donkeys ;)
                "consume=water oat,corn fruit",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:20s", -- Feeding cute little baby donkeys ;)
                "recruit=europeans_carrier_donkey"
            }
        },
        produce_horse = {
            -- TRANSLATORS: Completed/Skipped/Did not start breeding horses because ...
            descname = pgettext("europeans_building", "breeding horses"),
            actions = {
                "return=skipped when economy needs water",
                "return=skipped when economy needs oat and economy needs corn",
                "return=skipped when economy needs fruit",
                "return=skipped when economy needs grape",
                "consume=water oat,corn fruit",
                "playsound=sound/farm/horse priority:50% allow_multiple",
                "animate=working duration:20s", -- Feeding cute little foals ;)
                "consume=water oat,corn grape",
                "playsound=sound/farm/horse priority:50% allow_multiple",
                "animate=working duration:20s", -- Feeding cute little foals ;)
                "consume=water oat,corn fruit",
                "playsound=sound/farm/horse priority:50% allow_multiple",
                "animate=working duration:20s", -- Feeding cute little foals ;)
                "recruit=europeans_carrier_horse"
            }
        },
        produce_wool = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "producing wool"),
           actions = {
                "return=skipped unless economy needs wool",
                "return=skipped when economy needs leather and not economy needs wool",
                "return=skipped when economy needs water and not economy needs wool",
                "return=skipped when economy needs oat and economy needs corn and not economy needs wool",
                "return=skipped when economy needs fruit and not economy needs wool",
                "return=skipped when economy needs grape and not economy needs wool",
                "consume=water oat,corn fruit",
                "playsound=sound/farm/sheep priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water oat,corn grape",
                "playsound=sound/farm/sheep priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water oat,corn fruit",
                "playsound=sound/farm/sheep priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=wool:3"
           }
        },
        produce_meat_leather = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing meat and leather because ...
           descname = pgettext("europeans_building", "producing meat and leather"),
           actions = {
                "return=skipped unless economy needs leather",
                "return=skipped when economy needs wool and not economy needs leather",
                "return=skipped when economy needs water and not economy needs leather",
                "return=skipped when economy needs oat and economy needs corn and not economy needs leather",
                "return=skipped when economy needs fruit and not economy needs leather",
                "return=skipped when economy needs grape and not economy needs leather",
                "consume=water oat,corn fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water:2 oat,corn:2 grape:2",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water oat,corn fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:4 leather"
           }
        },
        produce_meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "producing meat"),
           actions = {
                "return=skipped unless economy needs meat",
                "return=skipped when economy needs leather and not economy needs meat",
                "return=skipped when economy needs water and not economy needs meat",
                "return=skipped when economy needs oat and economy needs corn and not economy needs meat",
                "return=skipped when economy needs fruit and not economy needs meat",
                "return=skipped when economy needs grape and not economy needs meat",
                "consume=water oat,corn fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water:2 oat,corn:2 grape:2",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water oat,corn fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat:4"
           }
        },
        produce_fish = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fish because ...
           descname = pgettext("europeans_building", "breeding fish"),
            actions = {
                "return=skipped unless economy needs fish",
                "return=skipped when economy needs water and not economy needs fish",
                "return=skipped when economy needs oat and economy needs corn and not economy needs fish",
                "return=skipped when economy needs fruit and not economy needs fish",
                "return=skipped when economy needs grape and not economy needs fish",
                "consume=water oat,corn fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water:2 oat,corn:2 grape:2",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=water oat,corn fruit",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=fish:4"
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
