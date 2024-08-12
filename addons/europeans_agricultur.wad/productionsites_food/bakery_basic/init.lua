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
         hotspot = { 41, 58 },
      },
      unoccupied = {
         hotspot = { 41, 58 },
      },
      working = {
         basename = "idle",
         hotspot = { 41, 58 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_bakery_advanced",
        enhancement_cost = {
            blackwood = 2,
            grout = 2,
            planks = 2,
            brick = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 4,
            granite = 4,
            marble = 2
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

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
    },

    working_positions = {
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "water", amount = 4 },
        { name = "flour", amount = 4 },
        { name = "honey", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_bread",
                "sleep=duration:30s",
                "call=produce_honey_bread",
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
        },
        produce_honey_bread = {
            -- TRANSLATORS: Completed/Skipped/Did not start Baking bread because ...
            descname = pgettext("europeans_building", "Baking honey bread"),
            actions = {
                "return=skipped when economy needs water and not economy needs honey_bread",
                "return=skipped when economy needs flour and not economy needs honey_bread",
                "return=skipped when economy needs honey and not economy needs honey_bread",
                "return=skipped when economy needs bread and not economy needs honey_bread",
                "return=skipped when economy needs biscuit and not economy needs honey_bread",
                "return=skipped unless site has honey",
                "consume=water:2 flour:2 honey",
                "animate=working duration:3m",
                "produce=honey_bread:2"
            }
        }
    },
}

pop_textdomain()
