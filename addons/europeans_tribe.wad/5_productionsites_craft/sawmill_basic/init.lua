push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/wood_hardener/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_sawmill_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Sawmill"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 52, 64 },
      }
    },
    spritesheets = {
      idle = {
         frames = 20,
         columns = 4,
         rows = 5,
         hotspot = { 50, 65 }
      },
      build = {
         frames = 4,
         columns = 2,
         rows = 2,
         hotspot = { 50, 61 }
      },
      working = {
         frames = 20,
         columns = 4,
         rows = 5,
         hotspot = { 53, 65 }
      }
    },
   
    size = "medium",
    enhancement = {
        name = "europeans_sawmill_advanced",
        enhancement_cost = {
            brick = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            granite = 2
        },
    },
    buildcost = {
        granite = 3,
        log = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2
    },

    aihints = {
        supports_seafaring = true,
        basic_amount = 2,
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        normal_ai_limit = 8
    },

    working_positions = {
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
                "call=hardening_wood",
                "sleep=duration:30s",
                "call=saw_log",
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
                "consume=log",
                "playsound=sound/atlanteans/saw/sawing priority:50% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood",
                "consume=log",
                "playsound=sound/atlanteans/saw/sawing priority:50% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood",
                "produce=planks:2",
                "consume=log",
                "playsound=sound/atlanteans/saw/sawing priority:50% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood",
                "consume=log",
                "playsound=sound/atlanteans/saw/sawing priority:50% allow_multiple",
                "animate=working duration:1m",
                "produce=scrap_wood",
                "produce=planks:2"
            }
        },
        hardening_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
            descname = pgettext("europeans_building", "hardening wood"),
            actions = {
                "return=skipped unless economy needs blackwood",
                "return=skipped when economy needs log and not economy needs blackwood",
                "return=skipped when economy needs planks and not economy needs blackwood",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood",
                "produce=blackwood:2",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:1m",
                "produce=scrap_wood",
                "produce=blackwood:2"
            }
        }
    },
}

pop_textdomain()
