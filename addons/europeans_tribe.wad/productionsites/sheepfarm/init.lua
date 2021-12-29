push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_sheepfarm",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Sheep Farm"),
    icon = dirname .. "menu.png",
    size = "big",

    buildcost = {
        blackwood = 2,
        planks = 2,
        reed = 2,
        cloth = 2,
        brick = 2,
        grout = 2,
        marble_column = 2
    },
    return_on_dismantle = {
        blackwood = 1,
        planks = 1,
        granite = 2,
        marble = 2
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 73, 60 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 73, 60 },
        },
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
        prohibited_till = 5400,
        forced_after = 7200
    },

    working_positions = {
        europeans_breeder_normal = 2
    },

    inputs = {
        { name = "water", amount = 6 },
        { name = "blackroot", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_wool",
                "call=produce_wool_idle",
                "return=skipped"
            }
        },
        produce_wool = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing wool because ...
            descname = _"producing wool",
            actions = {
                "return=skipped unless economy needs wool or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water:2 blackroot:2",
                "sleep=duration:10s",
                "playsound=sound/farm/sheep priority:50% allow_multiple",
                "animate=working duration:60s",
                "produce=wool:2"
            }
        },
        produce_wool_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs wool",
                "return=skipped when economy needs water",
                "sleep=duration:90s",
                "consume=water blackroot",
                "playsound=sound/farm/sheep priority:50% allow_multiple",
                "animate=working duration:60s",
                "produce=wool"
            }
        }
    },
}

pop_textdomain()
