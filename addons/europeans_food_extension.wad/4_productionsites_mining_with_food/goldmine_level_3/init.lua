push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/goldmine/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_food_goldmine_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Gold Mine Level 3"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 51, 54 },
      },
      empty = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 51, 54 },
      },
      working = {
         fps = 10,
         frames = 10,
         columns = 10,
         rows = 1,
         hotspot = { 51, 54 },
      },
    },
    
    size = "mine",
    enhancement = {
        name = "europeans_food_goldmine_level_4",
        enhancement_cost = {
            planks = 4
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1,
            marble = 1
        }
    },

    aihints = {},

    working_positions = {
        europeans_miner_advanced = 2,
        europeans_miner_basic = 1
    },

    inputs = {
        { name = "snack", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining gold because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs ore",
                "return=skipped when economy needs snack and not economy needs granite and not economy needs marble and not economy needs ore",
                "return=skipped unless site has snack:4",
                "consume=snack",
                "call=mine_granite",
                "call=mine_ore",
                "call=mine_marble",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=snack",
                "call=mine_granite",
                "call=mine_ore",
                "call=mine_marble",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=snack",
                "call=mine_granite",
                "call=mine_ore",
                "call=mine_marble",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=snack",
                "call=mine_granite",
                "call=mine_ore",
                "call=mine_marble",
                "call=mine_ore",
            }
        },
        mine_granite = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_gold radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_gold radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=marble",
            }
        },
        mine_ore = {
            descname = pgettext("europeans_building", "mining ore"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_gold radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=ore",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=snack:4",
                "produce=granite:8 ore:8",
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
