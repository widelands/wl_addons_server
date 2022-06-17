push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Animal Farm"),
    icon = dirname .. "menu.png",
    size = "big",

    enhancement = {
        name = "europeans_animal_farm_level_1",
        enhancement_cost = {
            blackwood = 3,
            cloth = 3
        },
        enhancement_return_on_dismantle = {
            blackwood = 2
        },
    },

    buildcost = {
        log = 4,
        reed = 4,
        granite = 3
    },
    return_on_dismantle = {
        log = 3,
        granite = 2
    },

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 57, 80 },
        },
        working = {
            basename = "idle", -- TODO(GunChleoc): No animation yet.
            hotspot = { 57, 80 },
        },
    },

    aihints = {
        basic_amount = 1,
        prohibited_till = 1800,
        forced_after = 2400
    },

    working_positions = {
        europeans_breeder_basic = 2
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
                "call=produce_cattle",
                "call=produce_meat",
                "return=skipped"
            }
        },
        produce_cattle = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_ox or workers need experience",
                "return=skipped when economy needs meat",
                "return=skipped when economy needs flour and economy needs beer",
                "return=skipped unless site has water:4",
                "consume=water:4 rye,wheat,barley:4 ",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:60s", -- Animation of feeding the cattle
                "recruit=europeans_carrier_ox"
            }
        },
        produce_meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "producing meat"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "return=skipped unless site has water:4",
                "consume=water:4 rye,wheat,barley:4",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:60s",
                "produce=meat:2"
           }
        },
        produce_meat_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs meat",
                "return=skipped when economy needs water",
                "return=skipped when economy needs flour or economy needs beer",
                "consume=water:2 wheat rye,barley",
                "animate=working duration:60s",
                "produce=meat",
                "sleep=duration:120s"
            }
        },
        dummy_program = {
            -- TRANSLATORS: Completed/Skipped/Did not start dummy program because ...
            descname = _"dummy program",
            actions = {
                "sleep=duration:10s",
                "animate=working duration:10s",
                "produce=quartz"
            }
        }
    },
}

pop_textdomain()
