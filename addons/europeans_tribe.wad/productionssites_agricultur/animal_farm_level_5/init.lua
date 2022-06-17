push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_level_5",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Animal Farm Level 5"),
    icon = dirname .. "menu.png",
    size = "big",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 85, 78 },
        },
        working = {
            basename = "idle", -- TODO(GunChleoc): No animation yet.
            hotspot = { 85, 78 },
        },
    },
    
    aihints = {},

    working_positions = {
        europeans_breeder_advanced = 3
    },

    inputs = {
        { name = "water", amount = 10 },
        { name = "corn", amount = 6 },
        { name = "blackroot", amount = 6 },
        { name = "fruit", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_wool",
                "call=produce_wool",
                "call=produce_meat",
                "call=produce_meat",
                "call=produce_fish",
                "call=produce_fish",
                "call=produce_cattle",
                "call=produce_donkey",
                "call=produce_horse",
                "call=produce_meat_idle",
                "call=produce_fish_idle",
                "return=skipped"
            }
        },
        produce_wool = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "producing wool"),
           actions = {
                "return=skipped unless economy needs wool or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water:3 blackroot,corn:3",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=wool:3"
           }
        },
        produce_cattle = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_ox or workers need experience",
                "return=skipped when economy needs meat or economy needs fish or economy needs wool",
                "return=skipped unless site has water:3",
                "consume=water:3 blackroot,corn:3 fruit",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:30s", -- Animation of feeding the cattle
                "recruit=europeans_carrier_ox"
            }
        },
        produce_donkey = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing donkeys because ...
            descname = pgettext("europeans_building", "rearing donkeys"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_donkey or workers need experience",
                "return=skipped when economy needs meat or economy needs fish or economy needs wool",
                "return=skipped unless site has water:3",
                "consume=water:3 blackroot,corn:3 fruit",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:30s", -- Feeding cute little baby donkeys ;)
                "recruit=europeans_carrier_donkey"
            }
        },
        produce_horse = {
            -- TRANSLATORS: Completed/Skipped/Did not start breeding horses because ...
            descname = pgettext("europeans_building", "breeding horses"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_horse or workers need experience",
                "return=skipped when economy needs meat or economy needs fish or economy needs wool",
                "return=skipped unless site has water:3",
                "consume=water:3 blackroot,corn:3 fruit",
                "playsound=sound/farm/horse priority:50% allow_multiple",
                "animate=working duration:30s", -- Feeding cute little foals ;)
                "recruit=europeans_carrier_horse"
            }
        },
        produce_meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "producing meat"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water:4 blackroot:2 corn:2 fruit:2",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=meat:4"
           }
        },
        produce_fish = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fish because ...
           descname = pgettext("europeans_building", "breeding fish"),
            actions = {
                "return=skipped unless economy needs fish or workers need experience",
                "return=skipped unless site has water:3",
                "consume=water:4 blackroot:2 corn:2 fruit:2",
                "animate=working duration:30s",
                "produce=fish:4"
            }
        },
        produce_meat_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs meat",
                "return=skipped when economy needs water",
                "consume=water:2 blackroot corn fruit",
                "animate=working duration:60s",
                "produce=meat",
                "sleep=duration:90s"
            }
        },
        produce_fish_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs fish",
                "return=skipped when economy needs water",
                "consume=water:2 blackroot corn fruit",
                "animate=working duration:60s",
                "produce=fish",
                "sleep=duration:90s"
            }
        }
    },
}

pop_textdomain()
