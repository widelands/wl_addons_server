push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_brewery_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Brewery"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 60, 59 },
      },
      working = {
         basename = "idle",
         hotspot = { 60, 59 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_brewery_advanced",
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
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "water", amount = 4 },
        { name = "barley", amount = 4 },
        { name = "honey", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=brew_beer",
                "sleep=duration:30s",
                "call=brew_mead",
                "return=skipped"
            }
        },
        brew_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
            descname = pgettext("europeans_building", "brewing beer"),
            actions = {
                "return=skipped when economy needs water and not economy needs beer",
                "return=skipped when economy needs barley and not economy needs beer",
                "return=skipped when economy needs mead and not economy needs beer",
                "return=skipped when economy needs beer_strong and not economy needs beer",
                "consume=water barley",
                "animate=working duration:3m",
                "produce=beer"
            }
        },
        brew_mead = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing mead because ...
            descname = pgettext("europeans_building", "brewing mead"),
            actions = {
                "return=skipped when economy needs water and not economy needs mead",
                "return=skipped when economy needs barley and not economy needs mead",
                "return=skipped when economy needs honey and not economy needs mead",
                "return=skipped when economy needs beer and not economy needs mead",
                "return=skipped when economy needs beer_strong and not economy needs mead",
                "return=skipped unless site has honey",
                "consume=water barley honey",
                "animate=working duration:3m",
                "produce=mead"
            }
        }
    },
}

pop_textdomain()
