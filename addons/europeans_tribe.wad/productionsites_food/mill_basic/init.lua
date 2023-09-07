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

    aihints = {},

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
                "sleep=duration:30s",
                "call=produce_mixed_flour",
                "return=skipped"
            }
        },
        produce_mixed_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding rye and wheat because ...
            descname = pgettext("europeans_building", "grinding rye and wheat"),
            actions = {
                "return=skipped unless economy needs flour or workers need experience",
                "return=skipped when economy needs meat and not economy needs flour",
                "return=skipped unless site has rye",
                "return=skipped unless site has wheat",
                "consume=rye",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:45s",
                "consume=wheat",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:45s",
                "produce=flour:2"
            }
        }
    },
}

pop_textdomain()
