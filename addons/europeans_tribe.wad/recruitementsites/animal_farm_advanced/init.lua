push_textdomain("tribes")

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_animal_farm_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Animal Farm"),
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
        europeans_breeder_advanced = 1
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "corn", amount = 8 },
        { name = "blackroot", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_cattle",
                "call=produce_donkey",
                "call=produce_horse",
                "return=skipped"
            }
        },
        produce_cattle = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_ox",
                "consume=corn blackroot water",
                "sleep=duration:10s",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:20s", -- Animation of feeding the cattle
                "recruit=europeans_carrier_ox"
            }
        },
        produce_donkey = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing donkeys because ...
            descname = pgettext("europeans_building", "rearing donkeys"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_donkey",
                "consume=corn blackroot water",
                "sleep=duration:10s",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:20s", -- Feeding cute little baby donkeys ;)
                "recruit=europeans_carrier_donkey"
            }
        },
        produce_horse = {
            -- TRANSLATORS: Completed/Skipped/Did not start breeding horses because ...
            descname = pgettext("europeans_building", "breeding horses"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_horse",
                "consume=corn blackroot water",
                "sleep=duration:10s",
                "playsound=sound/farm/horse priority:50% allow_multiple",
                "animate=working duration:20s", -- Feeding cute little foals ;)
                "recruit=europeans_carrier_horse"
            }
        },
    },
}

pop_textdomain()
