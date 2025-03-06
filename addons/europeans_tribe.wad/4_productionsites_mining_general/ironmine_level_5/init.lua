push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/atlanteans/ironmine/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_ironmine_level_5",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Iron Mine Level 5"),
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
    
    aihints = {},

    working_positions = {
        europeans_miner_advanced = 3
    },

    inputs = {
        { name = "planks", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining iron because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped when economy needs planks and not economy needs granite and not economy needs marble and not economy needs quartz and not economy needs ore",
                "return=skipped unless site has planks:4",
                "consume=planks",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=planks",
                "call=mine_granite",
                "call=mine_ore",
                "call=mine_granite",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=planks",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=planks",
                "call=mine_granite",
                "call=mine_ore",
                "call=mine_granite",
                "call=mine_ore",
                "return=skipped"
            }
        },
        mine_granite = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:35s",
                "mine=resource_iron radius:12 yield:100% when_empty:20% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:35s",
                "mine=resource_iron radius:12 yield:100% when_empty:20% experience_on_fail:10%",
                "produce=marble",
            }
        },
        mine_quartz = {
            descname = pgettext("europeans_building", "mining quartz"),
            actions = {
                "animate=working duration:35s",
                "mine=resource_iron radius:12 yield:100% when_empty:20% experience_on_fail:10%",
                "produce=quartz",
            }
        },
        mine_ore = {
            descname = pgettext("europeans_building", "mining ore"),
            actions = {
                "animate=working duration:35s",
                "mine=resource_iron radius:12 yield:100% when_empty:20% experience_on_fail:10%",
                "produce=ore",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=planks:4",
                "produce=granite:8 marble:2 quartz:2 ore:4",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Iron",
        heading = _"Main Iron Vein Exhausted",
        message =
            pgettext("europeans_building", "This iron mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider dismantling or destroying it."),
    },
}

pop_textdomain()
