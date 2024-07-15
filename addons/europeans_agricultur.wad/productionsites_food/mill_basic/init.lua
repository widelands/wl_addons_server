push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_mill_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Mill"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 41, 58 },
      },
      unoccupied = {
         hotspot = { 41, 58 },
      },
      working = {
         basename = "idle",
         hotspot = { 41, 58 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_mill_normal",
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
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "rye", amount = 4 },
        { name = "wheat", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_mixed_flour",
                "return=skipped"
            }
        },
        produce_mixed_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding rye and wheat because ...
            descname = pgettext("europeans_building", "grinding rye and wheat"),
            actions = {
                "return=skipped when economy needs rye and not economy needs flour",
                "return=skipped when economy needs wheat and not economy needs flour",
                "consume=rye",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:3m",
                "consume=wheat",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:3m",
                "produce=flour:2"
            }
        }
    },
}

pop_textdomain()
