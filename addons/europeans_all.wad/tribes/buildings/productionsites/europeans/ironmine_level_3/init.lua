push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/atlanteans/ironmine/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_ironmine_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Iron Mine Level 3"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 53, 61 },
      },
      working = {
         basename = "idle",
         hotspot = { 53, 61 },
      },
      empty = {
         hotspot = { 53, 61 },
      },
    },
    
    size = "mine",
    enhancement = {
        name = "europeans_ironmine_level_4",
        enhancement_cost = {
            planks = 3
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        }
    },

    aihints = {},

    working_positions = {
        atlanteans_miner = 3
    },

    inputs = {
        { name = "meal", amount = 8 },
        { name = "chocolate", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining iron because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs iron_ore",
                "return=skipped when economy needs meal and not economy needs granite and not economy needs marble and not economy needs iron_ore",
                "consume=meal chocolate",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_marble",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=meal chocolate",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_marble",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=meal chocolate",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_marble",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=meal chocolate",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_marble",
                "call=mine_ore",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_iron radius:5 yield:50% when_empty:8% experience_on_fail:10%",
                "produce=marble",
            }
        },
        mine_ore = {
            descname = pgettext("europeans_building", "mining iron_ore"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_iron radius:5 yield:50% when_empty:8% experience_on_fail:10%",
                "produce=granite iron_ore",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=meal:4 chocolate:4",
                "produce=granite:12 marble:4 iron_ore:12",
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
