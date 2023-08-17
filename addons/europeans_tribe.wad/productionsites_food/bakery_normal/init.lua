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
        europeans_baker_normal = 1,
        europeans_baker_basic = 1
    },

    inputs = {
        { name = "water", amount = 6 },
        { name = "flour", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_bread",
                "return=skipped"
            }
        },
        produce_bread = {
            -- TRANSLATORS: Completed/Skipped/Did not start Baking bread because ...
            descname = pgettext("europeans_building", "Baking bread"),
            actions = {
                "return=skipped unless economy needs bread or workers need experience",
                "return=skipped when economy needs water and not economy needs bread",
                "return=skipped unless site has water:2",
                "return=skipped unless site has flour:2",
                "consume=water:2 flour:2",
                "animate=working duration:50s",
                "produce=bread:2"
            }
        }
    },
}

pop_textdomain()
