push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/donkeyfarm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Donkey Farm"),
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
        name = "europeans_animal_farm_level_4",
        enhancement_cost = {
            brick = 3,
            grout = 3,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            brick = 2,
            grout = 1,
            marble = 1
        }
    },

    aihints = {
        prohibited_till = 3600,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        europeans_worker_basic = 2,
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "fruit", amount = 8 },
        { name = "honey", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                -- time total: 30 + 38.6 + 30 + 38.6 + 30 + 42.2 = 209.4 sec
                "call=recruit_donkey",
                "call=make_leather",
                "call=recruit_donkey",
                "call=make_leather",
                "call=recruit_donkey",
                "call=make_fur",
            }
        },
        recruit_donkey = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing donkeys because ...
            descname = pgettext("europeans_building", "rearing donkeys"),
            actions = {
                -- time total: 15 + 15 = 30 sec
                "return=skipped unless economy needs europeans_carrier_donkey",
                 "consume=water fruit honey",
                "sleep=duration:15s",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:15s", -- Feeding cute little baby donkeys ;)
                "recruit=europeans_carrier_donkey"
            }
        },
        make_leather = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fur because ...
            descname = pgettext("europeans_building", "producing fur"),
            actions = {
                -- time: 15 + 20 + 3.6 = 38.6 sec
                "return=skipped unless economy needs leather",
                 "consume=water fruit honey",
                "sleep=duration:15s",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=leather"
            }
        },
        make_fur = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fur because ...
            descname = pgettext("europeans_building", "producing fur"),
            actions = {
                -- time: 15 + 20 + 2 * 3.6 = 42.2 sec
                "return=skipped unless economy needs fur",
                 "consume=water fruit honey",
                "sleep=duration:15s",
                "playsound=sound/farm/donkey priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=fur"
            }
        },
    },
}

pop_textdomain()
