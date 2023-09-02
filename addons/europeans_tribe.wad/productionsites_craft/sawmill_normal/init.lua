push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_sawmill_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Sawmill"),
    icon = dirname .. "menu.png",
    
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

    aihints = {},

    working_positions = {
        europeans_worker_normal = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "log", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=saw_log",
                "call=hardening_wood",
                "return=skipped"
            }
        },
        saw_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start sawing logs because ...
            descname = pgettext("europeans_building", "sawing logs"),
            actions = {
                "return=skipped unless economy needs planks or economy needs scrap_wood or workers need experience",
                "return=skipped when economy needs blackwood and not economy needs planks",
                "return=skipped when economy needs log and not economy needs planks",
                "return=skipped unless site has log:2",
                "consume=log",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:30s",
                "consume=log",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:30s",
                "produce=scrap_wood:2",
                "produce=planks"
            }
        },
        hardening_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
            descname = pgettext("europeans_building", "hardening wood"),
            actions = {
                "return=skipped unless economy needs blackwood or economy needs scrap_wood or workers need experience",
                "return=skipped when economy needs planks and not economy needs blackwood",
                "return=skipped when economy needs log and not economy needs blackwood",
                "return=skipped unless site has log:2",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:30s",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:30s",
                "produce=scrap_wood:2",
                "produce=blackwood:2"
            }
        }
    },
}

pop_textdomain()
