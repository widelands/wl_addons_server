push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/ironmine_deep/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_food_ironmine_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Iron Mine Level 1"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 21, 37 },
      },
      empty = {
         hotspot = { 21, 37 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 21, 37 }
      },
      working = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 21, 37 }
      },
    },
    
    size = "mine",
    enhancement = {
        name = "europeans_food_ironmine_level_2",
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
        europeans_miner_basic = 2
    },

    inputs = {
        { name = "ration", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining iron because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs ore",
                "return=skipped when economy needs ration and not economy needs granite and not economy needs marble and not economy needs ore",
                "return=skipped unless site has ration:3",
                "consume=ration",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=ration",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=ration",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_ore",
            }
        },
        mine_granite = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:15s",
                "mine=resource_iron radius:4 yield:40% when_empty:5% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_iron radius:4 yield:40% when_empty:5% experience_on_fail:10%",
                "produce=marble",
            }
        },
        mine_ore = {
            descname = pgettext("europeans_building", "mining ore"),
            actions = {
                "animate=working duration:15s",
                "mine=resource_iron radius:4 yield:40% when_empty:5% experience_on_fail:10%",
                "produce=ore",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=ration:3",
                "produce=granite:3 marble:3 ore:3",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Iron",
        heading = _"Main Iron Vein Exhausted",
        message =
            pgettext("europeans_building", "This iron mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
    },
}

pop_textdomain()
