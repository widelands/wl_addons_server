push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_food_goldmine_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Gold Mine"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 21, 36 },
      },
      empty = {
         hotspot = { 21, 36 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 21, 36 }
      },
      working = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 21, 36 }
      },
    },

    size = "mine",
    enhancement = {
        name = "europeans_food_goldmine_level_1",
        enhancement_cost = {
            log = 4,
            reed = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1,
            marble = 1
        }
    },
    buildcost = {
        log = 6,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 1,
        marble = 1
    },

    aihints = {},

    working_positions = {
        europeans_miner_basic = 1
    },

    inputs = {
        { name = "beer", amount = 2 },
        { name = "bread", amount = 2 },
        { name = "meat", amount = 2 },
        { name = "fish", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining gold because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped when economy needs beer and not economy needs granite and not economy needs diamond and not economy needs quartz",
                "return=skipped when economy needs bread and not economy needs granite and not economy needs diamond and not economy needs quartz",
                "return=skipped when economy needs coal and not economy needs diamond and not economy needs quartz",
                "consume=bread",
                "call=mine_granite",
                "call=mine_granite",
                "call=mine_marble",
                "sleep=duration:5s",
                "consume=beer",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=meat,fish",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_diamond",
            }
        },
        mine_diamond = {
            descname = pgettext("europeans_building", "mining diamond"),
            actions = {
                "animate=working duration:10s",
                "mine=resource_gold radius:4 yield:20% when_empty:2% experience_on_fail:10%",
                "produce=diamond",
            }
        },
        mine_granite = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:10s",
                "mine=resource_gold radius:4 yield:20% when_empty:2% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_gold radius:4 yield:20% when_empty:2% experience_on_fail:10%",
                "produce=marble",
            }
        },
        mine_quartz = {
            descname = pgettext("europeans_building", "mining quartz"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_gold radius:4 yield:20% when_empty:2% experience_on_fail:10%",
                "produce=quartz",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=beer bread meat,fish",
                "produce=granite:4 marble:3 quartz diamond",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Gold",
        heading = _"Main Gold Vein Exhausted",
        message =
            pgettext("europeans_building", "This gold mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
    },
}

pop_textdomain()