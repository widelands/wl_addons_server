push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/sawmill/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_sawmill_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Sawmill Level 2"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 48, 62 },
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 48, 62 },
      },
    },

    size = "medium",

    aihints = {
        supports_seafaring = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_worker_advanced = 2
    },

    inputs = {
        { name = "log", amount = 24 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=saw_log",
                "sleep=duration:30s",
                "call=hardening_wood",
                "return=skipped"
            }
        },
        saw_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
            descname = pgettext("europeans_building", "sawing logs"),
            actions = {
                "return=skipped unless economy needs planks",
                "return=skipped when economy needs log and not economy needs planks",
                "return=skipped when economy needs blackwood and not economy needs planks",
                "consume=log:3",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:3",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:3",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "produce=planks:12",
                "consume=log:3",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:3",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:3",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "produce=planks:12"
            }
        },
        hardening_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
            descname = pgettext("europeans_building", "hardening wood"),
            actions = {
                "return=skipped unless economy needs blackwood",
                "return=skipped when economy needs log and not economy needs blackwood",
                "return=skipped when economy needs planks and not economy needs blackwood",
                "consume=log:3",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:3",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:3",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "produce=blackwood:12",
                "consume=log:3",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:3",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "consume=log:3",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood:2",
                "produce=blackwood:12"
            }
        }
    },
}

pop_textdomain()
