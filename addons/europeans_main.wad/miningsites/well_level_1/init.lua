push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_well_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Well Level 1"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 19, 33 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 19, 33 }
      },
      working = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 19, 33 }
      },
    },

    size = "medium",
    enhancement = {
        name = "europeans_well_level_2",
        enhancement_cost = {
            blackwood = 1,
            cloth = 1,
            buckets = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            scrap_iron = 1
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
                "call=mining_water_idle",
                "return=skipped"
            }
        },
        mining_water = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining water because ...
            descname = pgettext("europeans_building", "mining water"),
            actions = {
                "return=skipped unless economy needs water or workers need experience",
                "animate=working duration:13s",
                "mine=resource_water radius:3 yield:60% when_empty:60%",
                "produce=water:2"
            }
        },
        mining_water_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs water",
                "animate=working duration:13s",
                "mine=resource_water radius:3 yield:60% when_empty:60%",
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
        productivity_threshold = 45
    },
}

pop_textdomain()
