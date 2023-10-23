push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_mill_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Mill"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 63, 68 },
      },
    },
    spritesheets = {
      working = {
         fps = 25,
         frames = 19,
         columns = 10,
         rows = 2,
         hotspot = { 63, 68 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_mill_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 2,
            cloth = 2
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
        { name = "rye", amount = 4 },
        { name = "wheat", amount = 4 }
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
                "call=produce_mixed_flour",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has rye:2 and site has wheat:2",
                "sleep=duration:5m",
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs flour",
                "sleep=duration:20m",
            }
        },
        produce_mixed_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding rye and wheat because ...
            descname = pgettext("europeans_building", "grinding rye and wheat"),
            actions = {
                "return=skipped unless economy needs flour or workers need experience",
                "return=skipped when economy needs meat and not economy needs flour",
                "consume=rye",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:30s",
                "consume=wheat",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:30s",
                "produce=flour:2"
            }
        }
    },
}

pop_textdomain()
