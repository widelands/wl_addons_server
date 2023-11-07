push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_smelting_works_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Smelting Works"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 62, 76 },
      },
      working = {
         basename = "idle",
         hotspot = { 62, 76 },
      }
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_smelting_works_advanced",
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
        { name = "coal", amount = 8 },
        { name = "ore", amount = 8 }
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
                "call=smelting_ore",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has ore:6 and site has coal:6",
                "return=skipped when economy needs ore", -- for statistical reason
                "sleep=duration:5m",
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs gold",
                "return=skipped when economy needs iron",
                "sleep=duration:20m",
            }
        },
        smelting_ore = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting ore because ...
            descname = pgettext("europeans_building", "smelting ore"),
            actions = {
                "return=skipped when economy needs coal",
                "consume=ore:4 coal:4",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:45s",
                "playsound=sound/metal/ironping priority:60%",
                "animate=working duration:45s",
                "playsound=sound/metal/goldping priority:60%",
                "produce=iron:2 gold:2"
            }
        }
    },
}

pop_textdomain()
