push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/charcoal_kiln/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_charcoal_kiln_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Charcoal Kiln"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 50, 71 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 50, 51 }
      },
      working = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 50, 71 }
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_charcoal_kiln_advanced",
        enhancement_cost = {
            brick = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            granite = 2
        },
    },
    buildcost = {
        granite = 3,
        planks = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2
    },
   
    aihints = {
        basic_amount = 2,
        very_weak_ai_limit = 2,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_worker_basic = 2
    },

    inputs = {
        { name = "scrap_wood", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=burn_wood",
                "return=skipped"
            }
        },
        burn_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
            descname = pgettext("europeans_building", "producing coal"),
            actions = {
                "return=skipped unless site has scrap_wood:4",
                "consume=scrap_wood:4",
                "animate=working duration:5m",
                "produce=coal:2"
            }
        }
    },
}

pop_textdomain()
