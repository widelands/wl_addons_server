push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

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
        name = "europeans_sawmill_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 4,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2
        },
    },
    buildcost = {
        log = 3,
        reed = 3,
        granite = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2
    },

    aihints = {
        supports_seafaring = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 4,
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
                "call=pausing_production_for_inputs",
                "sleep=duration:30s",
                "call=pausing_production_for_outputs",
                "sleep=duration:30s",
                "call=hardening_wood",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has log:4",
                "sleep=duration:5m",
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs blackwood",
                "sleep=duration:10m",
            }
        },
        hardening_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start hardening wood because ...
            descname = pgettext("europeans_building", "hardening wood"),
            actions = {
                "return=skipped unless economy needs blackwood or economy needs scrap_wood or workers need experience",
                "return=skipped when economy needs log and not economy needs blackwood",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:25s",
                "produce=scrap_wood",
                "consume=log",
                "playsound=sound/barbarians/blackwood priority:60%",
                "animate=working duration:25s",
                "produce=scrap_wood",
                "produce=blackwood:2"
            }
        }
    },
}

pop_textdomain()
