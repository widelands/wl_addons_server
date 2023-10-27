push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_clay_pit_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Clay Pit"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 40, 50 },
      },
      working = {
         basename = "idle",
         hotspot = { 40, 50 },
      },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_clay_pit_advanced",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        },
    },

    aihints = {},

    working_positions = {
        europeans_claydigger_normal = 1
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
            descname = pgettext("europeans_building", "digging clay"),
            actions = {
                "return=skipped unless economy needs clay or economy needs brick or workers need experience",
                "return=skipped unless site has water:2",
                "consume=water",
                "callworker=dig",
                "animate=working duration:30s",
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
                "animate=working duration:30s",
                "return=skipped when economy needs water",
                "callworker=check_dig",
                "consume=water",
                "callworker=dig",
                "animate=working duration:30s",
                "sleep=duration:3m"
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
