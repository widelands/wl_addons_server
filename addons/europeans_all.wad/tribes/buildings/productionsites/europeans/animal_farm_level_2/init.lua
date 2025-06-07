push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/atlanteans/horsefarm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Horse Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 83, 75 },
        },
        working = {
            basename = "idle",
            hotspot = { 83, 75 },
        }
    },

    size = "big",
    enhancement = {
        name = "europeans_animal_farm_level_3",
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
        prohibited_till = 2400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        atlanteans_horsebreeder = 2
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "corn", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                -- time total: 30 + 38.6 + 30 + 38.6 + 30 + 42.2 = 209.4 sec
                "call=recruit_horse",
                "call=make_fur_leather",
                "call=recruit_horse",
                "call=make_fur_leather",
                "call=recruit_horse",
                "call=make_fur_meat",
            }
        },
        recruit_horse = {
            -- TRANSLATORS: Completed/Skipped/Did not start breeding horses because ...
            descname = pgettext("europeans_building", "breeding horses"),
            actions = {
                -- time total: 15 + 15 = 30 sec
                "return=skipped unless economy needs atlanteans_horse",
                "consume=corn water",
                "sleep=duration:15s",
                "playsound=sound/farm/horse priority:50% allow_multiple",
                "animate=working duration:15s", -- Feeding cute little foals ;)
                "recruit=atlanteans_horse"
            }
        },
        make_fur_leather = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fur because ...
            descname = pgettext("europeans_building", "producing fur"),
            actions = {
                -- time: 15 + 20 + 3.6 = 38.6 sec
                "return=skipped unless economy needs fur or economy needs leather",
                "consume=corn water",
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
                "consume=corn water",
                "sleep=duration:15s",
                "animate=working duration:20s",
                "produce=fur meat"
            }
        },
    },
}

pop_textdomain()
