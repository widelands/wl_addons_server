push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/marblemine/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_stonemine_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Stone Mine Level 3"),
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
        name = "europeans_stonemine_level_4",
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
        empire_miner = 2
    },

    inputs = {
        { name = "snack", amount = 6 },
        { name = "wine", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining marble because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs granite or economy needs marble or economy needs diamond or economy needs quartz",
                "return=skipped when economy needs snack and not economy needs granite and not economy needs marble and not economy needs diamond and not economy needs quartz",
                "return=skipped unless site has snack:4",
                "consume=snack wine",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=snack wine",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_diamond",
                "sleep=duration:5s",
                "consume=snack wine",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=snack wine",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_diamond",
            }
        },
        mine_granite = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:30s",
                "mine=resource_stones radius:5 yield:50% when_empty:8% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:30s",
                "mine=resource_stones radius:5 yield:50% when_empty:8% experience_on_fail:10%",
                "produce=marble",
            }
        },
        mine_diamond = {
            descname = pgettext("europeans_building", "mining diamond"),
            actions = {
                "animate=working duration:30s",
                "mine=resource_stones radius:5 yield:50% when_empty:8% experience_on_fail:10%",
                "produce=diamond",
            }
        },
        mine_quartz = {
            descname = pgettext("europeans_building", "mining quartz"),
            actions = {
                "animate=working duration:30s",
                "mine=resource_stones radius:5 yield:50% when_empty:8% experience_on_fail:10%",
                "produce=quartz",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=snack:4 wine:4",
                "produce=granite:8 marble:4 quartz:2 diamond:2",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No rare stone",
        heading = _"Main Rare Stone Vein Exhausted",
        message =
            pgettext("europeans_building", "This stone mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
    },
}

pop_textdomain()
