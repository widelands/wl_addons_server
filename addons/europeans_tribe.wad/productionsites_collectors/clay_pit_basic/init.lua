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
      working = {
         basename = "idle",
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
                "call=making_pond_idle",
                "callworker=check_dig",
                "call=digging_clay",
                "return=skipped"
            }
        },
        digging_clay = {
            -- TRANSLATORS: Completed/Skipped/Did not start digging clay because ...
            descname = pgettext("europeans_building", "digging clay"),
            actions = {
                "return=skipped unless economy needs clay or economy needs brick or workers need experience",
                "return=skipped unless site has water",
                "consume=water",
                "callworker=dig",
                "animate=working duration:20s",
                "produce=clay"
            }
        },
        making_pond_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs clay or economy needs brick",
                "callworker=check_dig_dry",
                "callworker=dig_dry",
                "animate=working duration:20s",
                "return=skipped when economy needs water",
                "callworker=check_dig",
                "consume=water",
                "callworker=dig",
                "animate=working duration:20s",
                "sleep=duration:120s"
            }
        },
        dummy_program = {
            -- TRANSLATORS: Completed/Skipped/Did not start dummy program because ...
            descname = _"dummy program",
            actions = {
                "callworker=check_dike",
                "sleep=duration:1s",
                "callworker=dike",
                "sleep=duration:10s",
            }
        }
    },
}

pop_textdomain()
