push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/granitemine/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_food_stonemine_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Stone Mine"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 42, 35 },
        },
        empty = {
            hotspot = { 42, 35 },
        },
    },
    spritesheets = {
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 42, 35 }
        },
        working = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 42, 35 }
        },
    },
    
    size = "mine",
    enhancement = {
        name = "europeans_food_stonemine_level_1",
        enhancement_cost = {
            planks = 4
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1
        }
    },
    buildcost = {
        log = 6,
        reed = 6
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 1
    },

    aihints = {},

    working_positions = {
        europeans_miner_basic = 1
    },

    inputs = {
        { name = "ration", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining marble because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs granite or economy needs marble or economy needs quartz or economy needs diamond",
                "return=skipped when economy needs ration and not economy needs granite and not economy needs marble and not economy needs quartz and not economy needs diamond",
                "sleep=duration:5s",
                "call=mine_granite_basic",
                "return=skipped unless site has ration:3",
                "consume=ration",
                "call=mine_granite",
                "call=mine_granite",
                "call=mine_marble",
                "sleep=duration:5s",
                "consume=ration",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=ration",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_diamond",
            }
        },
        mine_granite = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:10s",
                "mine=resource_stones radius:4 yield:25% when_empty:5% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_granite_basic = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "return=skipped unless economy needs granite",
                "return=skipped when site has ration:3",
                "animate=working duration:30s",
                "mine=resource_stones radius:4 yield:25% when_empty:5% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:10s",
                "mine=resource_stones radius:4 yield:25% when_empty:5% experience_on_fail:10%",
                "produce=marble",
            }
        },
        mine_quartz = {
            descname = pgettext("europeans_building", "mining quartz"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_stones radius:4 yield:25% when_empty:5% experience_on_fail:10%",
                "produce=quartz",
            }
        },
        mine_diamond = {
            descname = pgettext("europeans_building", "mining diamond"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_stones radius:4 yield:25% when_empty:5% experience_on_fail:10%",
                "produce=diamond",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=ration:3",
                "produce=granite:4 marble:3 quartz diamond",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No marble",
        heading = _"Main marble Vein Exhausted",
        message =
            pgettext("europeans_building", "This stone mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
    },
}

pop_textdomain()
