push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_sawmill_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Sawmill"),
    icon = dirname .. "menu.png",
    size = "medium",

    enhancement = {
        name = "europeans_sawmill_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2
        }
    },

   animation_directory = dirname,
   animations = {
      idle = {
         hotspot = { 60, 68 },
      },
   },

   spritesheets = {
      working = {
         fps = 25,
         frames = 19,
         columns = 10,
         rows = 2,
         hotspot = { 60, 68 },
      },
   },

    aihints = {},

    working_positions = {
        europeans_carpenter_normal = 1
    },

    inputs = {
        { name = "log", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=saw_log",
                "call=hardening_wood",
                "call=saw_log_idle",
                "return=skipped"
            }
        },
        saw_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
            descname = pgettext("europeans_building", "sawing logs"),
            actions = {
                "return=skipped when economy needs log and not economy needs planks",
                "return=skipped unless site has log:2",
                "consume=log",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=log",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=scrap_wood:2",
                "produce=planks"
            }
        },
        hardening_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
            descname = pgettext("europeans_building", "hardening wood"),
            actions = {
                "return=skipped when economy needs log and not economy needs blackwood",
                "return=skipped unless site has log:2",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:20s",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:25s",
                "produce=scrap_wood:2",
                "produce=blackwood:2"
            }
        },
        saw_log_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs blackwood",
                "return=skipped when economy needs planks",
                "return=skipped when economy needs log",
                "consume=log",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:20s",
                "consume=log",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=scrap_wood:2",
                "produce=planks",
                "sleep=duration:180s"
            }
        },
    },
}

pop_textdomain()
