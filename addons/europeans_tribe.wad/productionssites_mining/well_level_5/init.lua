push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_well_level_5",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Well Level 5"),
    icon = dirname .. "menu.png",
    size = "medium",
    
    enhancement = {
        name = "europeans_well_level_6",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            grout = 1,
            marble_column = 1,
            buckets = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1,
            marble = 1,
            buckets = 1
        },
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 43, 43 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 43, 43 },
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
                "return=skipped unless economy needs water",
                "animate=working duration:5s",
                "mine=resource_water radius:12 yield:100% when_empty:99%",
                "produce=water:6"
            }
        },
        mining_water_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs water",
                "animate=working duration:5s",
                "mine=resource_water radius:12 yield:100% when_empty:99%",
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
        productivity_threshold = 1
    },
}

pop_textdomain()
