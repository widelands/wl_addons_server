push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_tavern_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Tavern Level 1"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 57, 88 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 51, 81 }
      },
      working = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 51, 81 }
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_tavern_level_2",
        enhancement_cost = {
            blackwood = 2,
            cloth = 1,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2
        },
    },

    aihints = {},

    working_positions = {
        europeans_baker_normal = 1
    },

    inputs = {
        { name = "water", amount = 6 },
        { name = "flour", amount = 6 },
        { name = "meat", amount = 6 },
        { name = "fish", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_ration",
                "call=produce_snack",
                "call=produce_snack_idle",
                "return=skipped"
            }
        },
        produce_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = pgettext("europeans_building", "preparing a ration"),
            actions = {
                "return=skipped when economy needs water and not economy needs ration",
                "return=skipped unless economy needs ration or workers need experience",
                "return=skipped unless site has water:2",
                "return=skipped unless site has flour:2",
                "consume=water:2 flour:2",
                "animate=working duration:30s",
                "consume=fish,meat",
                "animate=working duration:15s",
                "produce=ration:2"
            }
        },
        produce_snack = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
            descname = pgettext("europeans_building", "preparing a snack"),
            actions = {
                "return=skipped when economy needs water and not economy needs snack",
                "return=skipped unless economy needs snack or workers need experience",
                "return=skipped unless site has water:2",
                "return=skipped unless site has flour:2",
                "consume=water:2 flour:2",
                "animate=working duration:30s",
                "consume=fish,meat",
                "animate=working duration:15s",
                "produce=snack:2"
            }
        },
        produce_snack_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs ration",
                "return=skipped when economy needs snack",
                "return=skipped when economy needs water",
                "consume=water flour",
                "animate=working duration:30s",
                "consume=fish,meat",
                "animate=working duration:15s",
                "produce=ration",
                "sleep=duration:30s",
                "consume=water:2 flour:2",
                "animate=working duration:30s",
                "consume=fish,meat",
                "animate=working duration:15s",
                "produce=snack",
                "sleep=duration:90s"
            }
        }
    },
}

pop_textdomain()
