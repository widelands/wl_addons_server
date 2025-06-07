push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/amazons/tapir_farm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Tapir Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = { unoccupied = {hotspot = {71, 49}}},
    spritesheets = {
        idle = {
            hotspot = {71, 49},
            fps = 10,
            frames = 10,
            columns = 5,
            rows = 2
        },
        working = {
            hotspot = {71, 49},
            fps = 15,
            frames = 30,
            columns = 6,
            rows = 5
        },
    },

    size = "big",
    enhancement = {
        name = "europeans_animal_farm_level_2",
        enhancement_cost = {
            granite = 3,
            planks = 3,
            spidercloth = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            spidercloth = 1
        }
    },

    aihints = {
        prohibited_till = 2400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        amazons_tapir_breeder = 1,
        amazons_wilderness_keeper = 1
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "cassavaroot", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                -- time total: 30 + 38.6 + 30 + 38.6 + 30 + 42.2 = 209.4 sec
                "call=recruit_tapir",
                "call=make_fur_leather",
                "call=recruit_tapir",
                "call=make_fur_leather",
                "call=recruit_tapir",
                "call=make_fur_meat",
            }
        },
        recruit_tapir = {
            -- TRANSLATORS: Completed/Skipped/Did not start breeding tapir because ...
            descname = pgettext("europeans_building", "breeding tapir"),
            actions = {
                -- time total: 15 + 15 = 30 sec
                "return=skipped unless economy needs amazons_tapir",
                "consume=cassavaroot water",
                "sleep=duration:15s",
                "animate=working duration:15s",
                "recruit=amazons_tapir"
            }
        },
        make_fur_leather = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fur because ...
            descname = pgettext("europeans_building", "producing fur"),
            actions = {
                -- time: 15 + 20 + 3.6 = 38.6 sec
                "return=skipped unless economy needs fur or economy needs leather",
                "consume=cassavaroot water",
                "sleep=duration:15s",
                "animate=working duration:20s",
                "produce=fur leather"
            }
        },
        make_fur_meat = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fur because ...
            descname = pgettext("europeans_building", "producing fur"),
            actions = {
                -- time: 15 + 20 + 2 * 3.6 = 42.2 sec
                "return=skipped unless economy needs fur or economy needs meat",
                "consume=cassavaroot water",
                "sleep=duration:15s",
                "animate=working duration:20s",
                "produce=fur meat"
            }
        },
    },
}

pop_textdomain()
