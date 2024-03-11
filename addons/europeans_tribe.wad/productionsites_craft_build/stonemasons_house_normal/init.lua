push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_stonemasons_house_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Lime Kiln"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 54, 74 },
      },
    },
    spritesheets = {
      working = {
         fps = 20,
         frames = 5,
         columns = 5,
         rows = 1,
         hotspot = { 54, 74 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_stonemasons_house_advanced",
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
        { name = "granite", amount = 6 },
        { name = "clay", amount = 6 },
        { name = "water", amount = 6 },
        { name = "coal", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production_for_inputs",
                "sleep=duration:20s",
                "call=pausing_production_for_outputs",
                "sleep=duration:20s",
                "call=mixing_grout",
                "sleep=duration:20s",
                "call=burning_bricks",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when site has granite:3 and site has water:3 and site has coal:2",
                "return=skipped when site has granite and site has clay:3 and site has coal:2",
                "return=skipped when economy needs granite", -- for statistical reason
                "sleep=duration:5m",
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs grout",
                "return=skipped when economy needs brick",
                "sleep=duration:60m",
            }
        },
        mixing_grout = {
            -- TRANSLATORS: Completed/Skipped/Did not start mixing grout because ...
            descname = pgettext("europeans_building", "mixing grout"),
            actions = {
                "return=skipped unless economy needs grout or workers need experience",
                "return=skipped when economy needs granite",
                "consume=coal:2 granite:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:60s",
                "consume=water:3",
                "playsound=sound/barbarians/mortar priority:60%",
                "animate=working duration:30s",
                "produce=grout:3"
            }
        },
        burning_bricks = {
            -- TRANSLATORS: Completed/Skipped/Did not start burning bricks because ...
            descname = pgettext("europeans_building", "burning bricks"),
            actions = {
                "return=skipped unless economy needs brick or workers need experience",
                "return=skipped when economy needs granite",
                "consume=granite clay:3",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:30s",
                "consume=coal:2",
                "playsound=sound/barbarians/stonegrind priority:80%",
                "animate=working duration:60s",
                "produce=brick:3"
            }
        }
    },
}

pop_textdomain()

