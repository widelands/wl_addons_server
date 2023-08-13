push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_tavern_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Tavern"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 57, 88 },
      },
    },
    spritesheets = {
      working = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 57, 81 }
      },
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 57, 67 }
      }
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_tavern_inn",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2
        },
    },

    aihints = {},

    working_positions = {
        europeans_baker_advanced = 1,
        europeans_baker_basic = 1
    },

    inputs = {
        { name = "water", amount = 8 },
        { name = "flour", amount = 8 },
        { name = "meat", amount = 6 },
        { name = "fish", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_ration",
                "call=produce_snack",
                "call=produce_meal",
                "return=skipped"
            }
        },
        produce_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = pgettext("europeans_building", "preparing a ration"),
            actions = {
                "return=skipped unless economy needs ration or workers need experience",
                "return=skipped when economy needs snack and not economy needs ration",
                "return=skipped when economy needs water and not economy needs ration",
                "return=skipped unless site has water:2",
                "return=skipped unless site has flour:2",
                "return=skipped unless site has meat or site has fish",
                "consume=water:2 flour:2",
                "animate=working duration:25s",
                "consume=fish,meat",
                "animate=working duration:15s",
                "produce=ration:2"
            }
        },
        produce_snack = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a snack because ...
            descname = pgettext("europeans_building", "preparing a snack"),
            actions = {
                "return=skipped unless economy needs snack or workers need experience",
                "return=skipped when economy needs ration and not economy needs snack",
                "return=skipped when economy needs water and not economy needs snack",
                "return=skipped unless site has water:2",
                "return=skipped unless site has flour:2",
                "return=skipped unless site has meat or site has fish",
                "consume=water:2 flour:2",
                "animate=working duration:25s",
                "consume=fish,meat",
                "animate=working duration:15s",
                "produce=snack:2"
            }
        },
        produce_meal = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a meal because ...
            descname = pgettext("europeans_building", "preparing a meal"),
            actions = {
                "return=skipped unless economy needs meal or workers need experience",
                "return=skipped when economy needs ration and not economy needs meal",
                "return=skipped when economy needs snack and not economy needs meal",
                "return=skipped when economy needs water and not economy needs meal",
                "return=skipped unless site has water:2",
                "return=skipped unless site has flour:2",
                "return=skipped unless site has meat or site has fish",
                "consume=water:2 flour:2",
                "animate=working duration:25s",
                "consume=fish,meat",
                "animate=working duration:15s",
                "produce=meal"
            }
        }
    },
}

pop_textdomain()
