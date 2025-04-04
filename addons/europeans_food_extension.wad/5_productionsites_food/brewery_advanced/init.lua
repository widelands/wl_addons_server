push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/brewery/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_brewery_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Brewery"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 42, 66 },
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 42, 66 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_brewery_winery",
        enhancement_cost = {
            brick = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            granite = 2
        }
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "water", amount = 6 },
        { name = "barley", amount = 6 },
        { name = "honey", amount = 2 },
        { name = "fruit", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=brew_strong_beer",
                "sleep=duration:10s",
                "call=brew_mead",
                "sleep=duration:20s",
                "call=brew_strong_beer",
                "sleep=duration:10s",
                "call=brew_mead",
                "sleep=duration:20s",
                "call=brew_beer",
                "return=skipped"
            }
        },
        brew_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
            descname = pgettext("europeans_building", "brewing beer"),
            actions = {
                "return=skipped unless economy needs beer",
                "return=skipped when economy needs water and not economy needs beer",
                "return=skipped when economy needs barley and not economy needs beer",
                "return=skipped when economy needs mead and not economy needs beer",
                "return=skipped when economy needs beer_strong and not economy needs beer",
                "consume=water barley",
                "animate=working duration:2m",
                "produce=beer"
            }
        },
        brew_mead = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing mead because ...
            descname = pgettext("europeans_building", "brewing mead"),
            actions = {
                "return=skipped unless economy needs mead",
                "return=skipped when economy needs water and not economy needs mead",
                "return=skipped when economy needs barley and not economy needs mead",
                "return=skipped when economy needs honey and not economy needs mead",
                "return=skipped when economy needs beer and not economy needs mead",
                "return=skipped when economy needs beer_strong and not economy needs mead",
                "return=skipped unless site has honey",
                "consume=water barley honey",
                "animate=working duration:2m",
                "produce=mead"
            }
        },
        brew_strong_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing strong beer because ...
            descname = pgettext("europeans_building", "brewing strong beer"),
            actions = {
                "return=skipped unless economy needs beer_strong",
                "return=skipped when economy needs water and not economy needs beer_strong",
                "return=skipped when economy needs barley and not economy needs beer_strong",
                "return=skipped when economy needs fruit and not economy needs beer_strong",
                "return=skipped when economy needs beer and not economy needs beer_strong",
                "return=skipped when economy needs mead and not economy needs beer_strong",
                "return=skipped unless site has fruit",
                "consume=water barley fruit",
                "animate=working duration:2m",
                "produce=beer_strong"
            }
        }
    },
}

pop_textdomain()
