push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_brewery_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Brewery"),
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
        { name = "water", amount = 6 },
        { name = "barley", amount = 6 },
        { name = "honey", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production",
                "sleep=duration:30s",
                "call=brew_beer",
                "sleep=duration:30s",
                "call=brew_mead",
                "return=skipped"
            }
        },
        pausing_production = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for water and barley"),
            actions = {
                "return=skipped when not economy needs water and not economy needs barley",
                "sleep=duration:5m",
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
                "consume=water barley",
                "animate=working duration:60s",
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
                "return=skipped unless site has honey",
                "consume=water barley honey",
                "animate=working duration:60s",
                "produce=mead"
            }
        }
    },
}

pop_textdomain()
