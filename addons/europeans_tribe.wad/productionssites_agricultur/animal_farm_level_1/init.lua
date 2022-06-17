push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
     name = "europeans_animal_farm_level_1",
     -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Animal Farm Level 1"),
    icon = dirname .. "menu.png",
    size = "big",

    enhancement = {
        name = "europeans_animal_farm_level_2",
        enhancement_cost = {
            blackwood = 3,
            cloth = 3
        },
        enhancement_return_on_dismantle = {
            blackwood = 2
        },
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 87, 75 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 87, 75 },
        }
    },

    aihints = {
        basic_amount = 1,
        prohibited_till = 2400,
        forced_after = 3000
    },

    working_positions = {
        europeans_breeder_normal = 2,
        europeans_breeder_basic = 1
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
                "call=produce_meat",
                "call=produce_meat",
                "call=produce_fish",
                "call=produce_fish",
                "call=produce_cattle",
                "call=produce_meat_idle",
                "call=produce_fish_idle",
                "return=skipped"
            }
        },
        produce_cattle = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                "return=skipped unless economy needs europeans_carrier_ox or workers need experience",
                "return=skipped when economy needs meat or economy needs fish",
                "return=skipped unless site has water:3",
                "return=skipped unless site has corn:3",
                "consume=water:3 corn:3",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:50s", -- Animation of feeding the cattle
                "recruit=europeans_carrier_ox"
            }
        },
        produce_meat = {
         -- TRANSLATORS: Completed/Skipped/Did not start raising pigs because ...
           descname = pgettext("europeans_building", "producing meat"),
           actions = {
                "return=skipped unless economy needs meat or workers need experience",
                "return=skipped unless site has water:3",
                "return=skipped unless site has corn:3",
                "consume=water:3 corn:3",
                "playsound=sound/farm/farm_animal priority:50% allow_multiple",
                "animate=working duration:50s",
                "produce=meat:2"
           }
        },
        produce_fish = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fish because ...
           descname = pgettext("europeans_building", "breeding fish"),
            actions = {
                "return=skipped unless economy needs fish or workers need experience",
                "return=skipped unless site has water:3",
                "return=skipped unless site has corn:3",
                "consume=water:3 corn:3",
                "animate=working duration:50s",
                "produce=fish:2"
            }
        },
        produce_meat_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs meat",
                "return=skipped when economy needs water",
                "consume=water:2 corn:2",
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
                "consume=water:2 corn:2",
                "animate=working duration:60s",
                "produce=fish",
                "sleep=duration:90s"
            }
        }
    },
}

pop_textdomain()
