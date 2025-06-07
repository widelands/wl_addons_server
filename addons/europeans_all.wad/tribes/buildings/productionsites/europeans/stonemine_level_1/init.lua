push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/amazons/stonemine/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_stonemine_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Stone Mine Level 1"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {hotspot = {39, 46}},
        empty = {hotspot = {39, 46}},
        unoccupied = {hotspot = {39, 46}},
    },
    spritesheets = {
        working = {
            hotspot = {39, 46},
            fps = 15,
            frames = 15,
            columns = 5,
            rows = 3
        }
    },
    
    size = "mine",
    enhancement = {
        name = "europeans_stonemine_level_2",
        enhancement_cost = {
            planks = 3
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1
        }
    },

    aihints = {},

    working_positions = {
        amazons_stonecutter = 2
    },

    inputs = {
        { name = "ration", amount = 8 },
        { name = "chocolate", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining marble because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs granite or economy needs marble or economy needs diamond or economy needs quartz",
                "return=skipped when economy needs ration and not economy needs granite and not economy needs marble and not economy needs diamond and not economy needs quartz",
                "return=skipped unless site has ration:4",
                "consume=ration chocolate",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=ration chocolate",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_diamond",
                "sleep=duration:5s",
                "consume=ration chocolate",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=ration chocolate",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_diamond",
            }
        },
        mine_granite = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_stones radius:4 yield:30% when_empty:4% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_stones radius:4 yield:30% when_empty:4% experience_on_fail:10%",
                "produce=marble",
            }
        },
        mine_diamond = {
            descname = pgettext("europeans_building", "mining diamond"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_stones radius:4 yield:30% when_empty:4% experience_on_fail:10%",
                "produce=diamond",
            }
        },
        mine_quartz = {
            descname = pgettext("europeans_building", "mining quartz"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_stones radius:4 yield:30% when_empty:4% experience_on_fail:10%",
                "produce=quartz",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=ration:4 chocolate:4",
                "produce=granite:8 marble:4 quartz:2 diamond:2",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No rare stone",
        heading = _"Main Rare Stone Vein Exhausted",
        message =
            pgettext("europeans_building", "This marble mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
    },
}

pop_textdomain()
