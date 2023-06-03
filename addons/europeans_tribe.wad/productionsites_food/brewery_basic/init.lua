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
         hotspot = { 42, 50 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 42, 50 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_brewery_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2
        }
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
        prohibited_till = 2400,
        forced_after = 3000
    },

    working_positions = {
        europeans_brewer_basic = 1
    },

    inputs = {
        { name = "water", amount = 4 },
        { name = "barley", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=brew_beer",
                "call=brew_beer_idle",
                "return=skipped"
            }
        },
        brew_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start brewing beer because ...
            descname = pgettext("europeans_building", "brewing beer"),
            actions = {
                "return=skipped when economy needs water and not economy needs beer",
                "return=skipped unless economy needs beer or workers need experience",
                "return=skipped unless site has water",
                "return=skipped unless site has barley",
                "consume=water barley",
                "animate=working duration:45s",
                "produce=beer"
            }
        },
        brew_beer_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs beer",
                "return=skipped when economy needs water",
                "consume=water barley",
                "animate=working duration:45s",
                "produce=beer",
                "sleep=duration:120s"
            }
        }
    },
}

pop_textdomain()
