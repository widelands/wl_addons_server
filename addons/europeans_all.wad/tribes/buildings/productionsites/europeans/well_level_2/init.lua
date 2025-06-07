push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/well/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_well_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Well Level 2"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 39, 57 },
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 39, 57 },
      },
    },

    size = "medium",
    enhancement = {
        name = "europeans_well_level_3",
        enhancement_cost = {
            brick = 1,
            grout = 1,
            reed = 1
        },
        enhancement_return_on_dismantle = {
            brick = 1
        }
    },

    aihints = {
        very_weak_ai_limit = 4,
        weak_ai_limit = 8,
        normal_ai_limit = 16,
    },

    working_positions = {
        empire_carrier = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=mining_water",
                "sleep=duration:5s",
                "call=mining_water",
                "sleep=duration:5s",
                "call=mining_water",
                "sleep=duration:5s",
                "call=mining_water_idle",
                "return=skipped"
            }
        },
        mining_water = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining water because ...
            descname = pgettext("europeans_building", "mining water"),
            actions = {
                "return=skipped unless economy needs water",
                "animate=working duration:8s",
                "mine=resource_water radius:4 yield:70% when_empty:70%",
                "produce=water",
                "animate=working duration:2s",
                "produce=water",
                "animate=working duration:2s",
                "produce=water",
                "animate=working duration:2s",
                "produce=water"
            }
        },
        mining_water_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs water",
                "animate=working duration:7s",
                "mine=resource_water radius:4 yield:70% when_empty:70%",
                "animate=working duration:7s",
                "produce=water",
                "sleep=duration:60s"
            }
        },
    },
    
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Water",
        heading = _"Out of Water",
        message = pgettext("europeans_building", "The carrier working at this well can’t find any water in his well."),
        productivity_threshold = 35
    },
}

pop_textdomain()
