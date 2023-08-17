push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_well_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Well Level 2"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 36, 42 },
      },
      working = {
         basename = "idle",
         hotspot = { 36, 42 },
      },
    },

    size = "medium",
    enhancement = {
        name = "europeans_well_level_3",
        enhancement_cost = {
            blackwood = 1,
            cloth = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1
        },
    },

    aihints = {},

    working_positions = {
        europeans_carrier = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=mining_water",
                "call=mining_water",
                "call=mining_water",
                "call=mining_water_idle",
                "return=skipped"
            }
        },
        mining_water = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining water because ...
            descname = pgettext("europeans_building", "mining water"),
            actions = {
                "return=skipped unless economy needs water or workers need experience",
                "animate=working duration:8s",
                "mine=resource_water radius:6 yield:70% when_empty:70%",
                "produce=water:4"
            }
        },
        mining_water_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs water",
                "animate=working duration:8s",
                "mine=resource_water radius:6 yield:70% when_empty:70%",
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
