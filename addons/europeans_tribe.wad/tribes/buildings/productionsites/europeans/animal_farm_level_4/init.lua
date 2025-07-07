push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/sheepfarm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_animal_farm_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Sheep Farm"),
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
        name = "europeans_animal_farm_level_5",
        enhancement_cost = {
            brick = 3,
            grout = 3,
            reed = 3
        },
        enhancement_return_on_dismantle = {
            brick = 2,
            grout = 1,
            reed = 1
        }
    },

    aihints = {
        prohibited_till = 3600,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
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
                "call=make_wool",
                "call=make_wool",
                "call=make_wool",
                "call=make_leather"
            }
        },
        make_leather = {
            -- TRANSLATORS: Completed/Skipped/Did not start breeding sheep because ...
            descname = _("breeding sheep and producing leather and wool"),
            actions = {
                "return=skipped unless economy needs leather",
                "consume=water fruit honey",
                "sleep=duration:25s",
                "playsound=sound/farm/sheep priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=leather"
            }
        },
        make_wool = {
            -- TRANSLATORS: Completed/Skipped/Did not start breeding sheep because ...
            descname = _("breeding sheep and producing meat and wool"),
            actions = {
                "return=skipped unless economy needs wool",
                "consume=water fruit honey",
                "sleep=duration:25s",
                "playsound=sound/farm/sheep priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=wool"
            }
        },
    },
}

pop_textdomain()
