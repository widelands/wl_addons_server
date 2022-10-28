push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_charcoal_kiln_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Charcoal Kiln"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 50, 61 },
      },
    },
    spritesheets = {
      working = {
         frames = 5,
         columns = 5,
         rows = 1,
         hotspot = { 50, 61 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_charcoal_kiln_advanced",
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
        europeans_charcoal_burner_normal = 1
    },

    inputs = {
        { name = "scrap_wood", amount = 6 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=burn_wood",
                "call=burn_wood_idle",
                "return=skipped"
            }
        },
        burn_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
            descname = pgettext("europeans_building", "producing coal"),
            actions = {
                "return=skipped unless economy needs coal or workers need experience",
                "return=skipped unless site has scrap_wood:4",
                "consume=scrap_wood:6",
                "animate=working duration:90s",
                "produce=coal:3"
            }
        },
        burn_wood_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs coal",
                "consume=scrap_wood:3",
                "animate=working duration:90s",
                "produce=coal",
                "sleep=duration:60s"
            }
        }
    },
}

pop_textdomain()
