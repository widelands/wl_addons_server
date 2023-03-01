push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_clay_pit_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Clay Pit"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 44, 44 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 43, 44 }
      },
      idle = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 43, 44 }
      },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_clay_pit_normal",
        enhancement_cost = {
            blackwood = 1,
            cloth = 1,
            grout = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1
        },
    },
    buildcost = {
        log = 2,
        reed = 2,
        granite = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },

    aihints = {
        needs_water = true,
        basic_amount = 1,
        prohibited_till = 300,
        forced_after = 900,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 4
    },

    working_positions = {
        europeans_claydigger_basic = 1
    },
    
    inputs = {
        { name = "water", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_dig",
                "call=digging_clay",
                "callworker=check_dig",
                "call=making_pond_idle",
                "return=skipped"
            }
        },
        digging_clay = {
            -- TRANSLATORS: Completed/Skipped/Did not start digging clay because ...
            descname = pgettext("europeans_building", "digging clay"),
            actions = {
                "return=skipped unless economy needs clay or workers need experience",
                "return=skipped unless site has water:2",
                "callworker=dig",
                "consume=water",
                "produce=clay"
            }
        },
        diking_clay = {
            -- TRANSLATORS: Completed/Skipped/Did not start diking clay because ...
            descname = pgettext("europeans_building", "diking clay"),
            actions = {
                "return=skipped unless economy needs clay or workers need experience",
                "callworker=dike",
                "produce=clay"
            }
        },
        making_pond_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs clay",
                "return=skipped when economy needs water",
                "callworker=dig",
                "consume=water",
                "sleep=duration:120s"
            }
        }
    },
}

pop_textdomain()
