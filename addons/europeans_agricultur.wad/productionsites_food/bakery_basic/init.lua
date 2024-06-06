push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_bakery_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Bakery"),
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
         hotspot = { 51, 70 }
      },
      working = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 51, 70 }
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_bakery_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
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
        { name = "water", amount = 4 },
        { name = "flour", amount = 4 }
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
                "return=skipped when economy needs water and not economy needs bread",
                "return=skipped when economy needs flour and not economy needs bread",
                "return=skipped when economy needs honey_bread and not economy needs bread",
                "return=skipped when economy needs biscuit and not economy needs bread",
                "consume=water:2 flour:2",
                "animate=working duration:3m",
                "produce=bread:2"
            }
        }
    },
}

pop_textdomain()
