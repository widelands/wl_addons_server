push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/cattlefarm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Cattle Farm"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 57, 80 },
        },
        working = {
            basename = "idle",
            hotspot = { 57, 80 },
        },
    },
    
    size = "big",
    enhancement = {
        name = "europeans_animal_farm_level_1",
        enhancement_cost = {
            balsa = 3,
            ironwood = 3,
            rope = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 4
        }
    },
    buildcost = {
        granite = 3,
        planks = 3,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2
    },

    aihints = {
        prohibited_till = 2400,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        barbarians_cattlebreeder = 1,
        barbarians_gamekeeper = 1
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "wheat", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                -- time total: 30 + 38.6 + 30 + 38.6 + 30 + 42.2 = 209.4 sec
                "call=recruit_ox",
                "call=make_fur_leather",
                "call=recruit_ox",
                "call=make_fur_leather",
                "call=recruit_ox",
                "call=make_fur_meat",
            }
        },
        recruit_ox = {
            -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
            descname = pgettext("europeans_building", "rearing cattle"),
            actions = {
                -- time total: 15 + 15 = 30 sec
                "return=skipped unless economy needs barbarians_ox",
                "consume=wheat water",
                "sleep=duration:15s",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:15s", -- Animation of feeding the cattle
                "recruit=barbarians_ox"
            }
        },
        make_fur_leather = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing fur because ...
            descname = pgettext("europeans_building", "producing fur"),
            actions = {
                -- time: 15 + 20 + 3.6 = 38.6 sec
                "return=skipped unless economy needs fur or economy needs leather",
                "consume=wheat water",
                "sleep=duration:15s",
                "playsound=sound/farm/ox priority:50% allow_multiple",
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
                "consume=wheat water",
                "sleep=duration:15s",
                "playsound=sound/farm/ox priority:50% allow_multiple",
                "animate=working duration:20s",
                "produce=fur meat"
            }
        },
    },
}

pop_textdomain()
