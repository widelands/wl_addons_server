push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_well_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Big Well"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 40, 55 }
        },
        working = {
            basename = "idle",
            hotspot = { 40, 55 }
        },
    },
    
    size = "medium",

    aihints = {
        very_weak_ai_limit = 4,
        weak_ai_limit = 8
    },
    
    working_positions = {
        europeans_carrier = 3
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
                "animate=working duration:2s",
                "mine=resource_water radius:8 yield:100% when_empty:99%",
                "produce=water",
                "animate=working duration:1s",
                "produce=water",
                "animate=working duration:1s",
                "produce=water",
                "animate=working duration:1s",
                "produce=water",
                "animate=working duration:1s",
                "produce=water",
                "animate=working duration:1s",
                "produce=water",
                "animate=working duration:1s",
                "produce=water",
                "animate=working duration:1s",
                "produce=water"
            }
        },
        mining_water_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs water",
                "animate=working duration:3s",
                "mine=resource_water radius:8 yield:100% when_empty:99%",
                "animate=working duration:3s",
                "produce=water",
                "animate=working duration:3s",
                "produce=water",
                "sleep=duration:60s"
            }
        }
    },
    
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Water",
        heading = _"Out of Water",
        message = pgettext("europeans_building", "The carrier working at this well can’t find any water in his well."),
        productivity_threshold = 1
    }
}

pop_textdomain()
