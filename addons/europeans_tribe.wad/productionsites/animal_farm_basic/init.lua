push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Animal Farm"),
    icon = dirname .. "menu.png",
    size = "big",

    enhancement = {
        name = "europeans_animal_farm_normal",
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
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
        prohibited_till = 3600
    },

    working_positions = {
        europeans_breeder_basic = 1
    },

    inputs = {
        { name = "water", amount = 4 },
        { name = "corn", amount = 4 }
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
                "consume=corn water",
                "sleep=duration:10s",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:40s", -- Animation of feeding the cattle
                "recruit=europeans_carrier_ox"
            }
        },
        produce_meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "raising pigs"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "consume=corn water",
                "sleep=duration:10s",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=meat"
           }
        },
    },
}

pop_textdomain()
