push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_well_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Well Level 4"),
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
        name = "europeans_well_level_5",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
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
            descname = _"mining water",
            actions = {
                "return=skipped unless economy needs water",
                "animate=working duration:7s",
                "mine=resource_water radius:12 yield:90% when_empty:90%",
                "produce=water:6"
            }
        },
        mining_water_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs water",
                "animate=working duration:7s",
                "mine=resource_water radius:12 yield:90% when_empty:90%",
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
        productivity_threshold = 15
    },
}

pop_textdomain()
