push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_bakery_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Bakery"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 57, 88 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 51, 81 }
      },
      working = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 51, 81 }
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_bakery_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 2,
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
        { name = "water", amount = 6 },
        { name = "flour", amount = 6 },
        { name = "honey", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production",
                "sleep=duration:20s",
                "call=produce_bread",
                "sleep=duration:20s",
                "call=produce_honey_bread",
                "return=skipped"
            }
        },
        pausing_production = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for water and flour"),
            actions = {
                "return=skipped when site has water:4 and site has flour:4",
                "sleep=duration:5m",
            }
        },
        produce_bread = {
            -- TRANSLATORS: Completed/Skipped/Did not start Baking bread because ...
            descname = pgettext("europeans_building", "Baking bread"),
            actions = {
                "return=skipped unless economy needs bread or workers need experience",
                "return=skipped when economy needs water and not economy needs bread",
                "consume=water:2 flour:2",
                "animate=working duration:90s",
                "produce=bread:2"
            }
        },
        produce_honey_bread = {
            -- TRANSLATORS: Completed/Skipped/Did not start Baking bread because ...
            descname = pgettext("europeans_building", "Baking honey bread"),
            actions = {
                "return=skipped unless economy needs honey_bread or workers need experience",
                "return=skipped when economy needs water and not economy needs honey_bread",
                "return=skipped unless site has honey",
                "consume=water:2 flour:2 honey",
                "animate=working duration:90s",
                "produce=honey_bread:2"
            }
        },
    },
}

pop_textdomain()
