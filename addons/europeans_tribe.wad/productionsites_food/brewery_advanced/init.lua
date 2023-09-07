push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

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
                "sleep=duration:20s",
                "call=brew_beer",
                "sleep=duration:20s",
                "call=brew_mead",
                "sleep=duration:20s",
                "call=brew_strong_beer",
                "return=skipped"
            }
        },
        brew_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
            descname = pgettext("europeans_building", "brewing beer"),
            actions = {
                "return=skipped unless economy needs beer or workers need experience",
                "return=skipped when economy needs water and not economy needs beer",
                "return=skipped when site has honey and economy needs mead and not economy needs beer",
                "return=skipped when site has barley and economy needs beer_strong and not economy needs beer",
                "return=skipped unless site has water",
                "return=skipped unless site has barley",
                "consume=water barley",
                "animate=working duration:45s",
                "produce=beer"
            }
        },
        brew_mead = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing mead because ...
            descname = pgettext("europeans_building", "brewing mead"),
            actions = {
                "return=skipped unless economy needs mead or workers need experience",
                "return=skipped when economy needs water and not economy needs mead",
                "return=skipped when site has barley and economy needs beer and not economy needs mead",
                "return=skipped when site has barley and economy needs beer_strong and not economy needs mead",
                "return=skipped unless site has water",
                "return=skipped unless site has barley",
                "return=skipped unless site has honey",
                "consume=water barley honey",
                "animate=working duration:45s",
                "produce=mead"
            }
        },
        brew_strong_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing strong beer because ...
            descname = pgettext("europeans_building", "brewing strong beer"),
            actions = {
                "return=skipped unless economy needs beer_strong or workers need experience",
                "return=skipped when economy needs water and not economy needs beer_strong",
                "return=skipped when site has barley and economy needs beer and not economy needs beer_strong",
                "return=skipped when site has honey and economy needs mead and not economy needs beer_strong",
                "return=skipped unless site has water",
                "return=skipped unless site has barley",
                "return=skipped unless site has fruit",
                "consume=water barley fruit",
                "animate=working duration:45s",
                "produce=beer_strong"
            }
        }
    },
}

pop_textdomain()
