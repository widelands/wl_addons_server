push_textdomain("tribes")

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_animal_farm_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Animal Farm"),
    icon = dirname .. "menu.png",
    size = "big",
    
    enhancement = {
        name = "europeans_animal_farm_advanced",
        enhancement_cost = {
            planks = 3,
            brick = 3,
            grout = 3,
            marble_column = 2
        },
        enhancement_return_on_dismantle = {
            granite = 3,
            marble = 2,
            planks = 2
        }
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 81, 62 },
        },
        working = {
            basename = "idle", -- TODO(GunChleoc): No animation yet.
            hotspot = { 81, 62 },
        }
    },

    aihints = {},

    working_positions = {
        europeans_breeder_normal = 1
    },

    inputs = {
        { name = "water", amount = 6 },
        { name = "corn", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_cattle",
                "call=produce_donkey",
                "return=skipped"
            }
        },
        produce_cattle = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_ox",
                "consume=corn water",
                "sleep=duration:10s",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:30s", -- Animation of feeding the cattle
                "recruit=europeans_carrier_ox"
            }
        },
        produce_donkey = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing donkeys because ...
            descname = pgettext("europeans_building", "rearing donkeys"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_donkey",
                "consume=corn water",
                "sleep=duration:10s",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:30s", -- Feeding cute little baby donkeys ;)
                "recruit=europeans_carrier_donkey"
            }
        },
    },
}

pop_textdomain()
