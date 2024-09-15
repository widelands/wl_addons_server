push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_well_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Well"),
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
        name = "europeans_well_level_1",
        enhancement_cost = {
            granite = 2,
            log = 2,
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1
        },
    },
    buildcost = {
        granite = 2,
        log = 2,
        buckets = 1
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },

    aihints = {
        basic_amount = 2,
        very_weak_ai_limit = 4,
        weak_ai_limit = 8,
        normal_ai_limit = 16,
    },

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
                "return=skipped unless economy needs water",
                "animate=working duration:14s",
                "mine=resource_water radius:3 yield:50% when_empty:50%",
                "produce=water",
                "animate=working duration:4s",
                "produce=water"
            }
        },
        mining_water_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs water",
                "animate=working duration:9s",
                "mine=resource_water radius:3 yield:50% when_empty:50%",
                "animate=working duration:9s",
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
        productivity_threshold = 55
    },
}

pop_textdomain()
