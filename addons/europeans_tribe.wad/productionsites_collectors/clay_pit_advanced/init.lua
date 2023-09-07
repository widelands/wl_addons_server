push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_clay_pit_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Clay Pit"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 39, 61 }
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 39, 61 }
      }
    },
    
    size = "small",

    aihints = {},

    working_positions = {
        europeans_claydigger_advanced = 1
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
                "sleep=duration:10s",
                "callworker=check_dig",
                "call=digging_clay",
                "return=skipped"
            }
        },
        digging_clay = {
            -- TRANSLATORS: Completed/Skipped/Did not start digging clay because ...
            descname = _"digging clay",
            actions = {
                "return=skipped unless economy needs clay or economy needs brick or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=dig",
                "animate=working duration:10s",
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
                "animate=working duration:10s",
                "return=skipped when economy needs water",
                "callworker=check_dig",
                "consume=water",
                "callworker=dig",
                "animate=working duration:10s",
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
