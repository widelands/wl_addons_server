push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_sawmill_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Sawmill"),
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

    aihints = {},

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "log", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production",
                "sleep=duration:20s",
                "call=saw_log",
                "sleep=duration:20s",
                "call=hardening_wood",
                "return=skipped"
            }
        },
        pausing_production = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for log"),
            actions = {
                "return=skipped when site has log:4",
                "sleep=duration:5m",
            }
        },
        saw_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
            descname = pgettext("europeans_building", "sawing logs"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs planks",
                "return=skipped when economy needs log and not economy needs planks",
                "consume=log",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:10s",
                "produce=scrap_wood",
                "consume=log",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:10s",
                "produce=scrap_wood",
                "produce=planks"
            }
        },
        hardening_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
            descname = pgettext("europeans_building", "hardening wood"),
            actions = {
                "return=skipped when economy needs planks and not economy needs blackwood",
                "return=skipped when economy needs log and not economy needs blackwood",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:10s",
                "produce=scrap_wood",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:10s",
                "produce=scrap_wood",
                "produce=blackwood:2"
            }
        }
    },
}

pop_textdomain()
