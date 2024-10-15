push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_stonemine_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Stone Mine Level 1"),
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
            hotspot = { 51, 54 }
        },
        working = {
            fps = 10,
            frames = 10,
            columns = 10,
            rows = 1,
            hotspot = { 51, 54 }
        },
    },
    
    size = "mine",
    enhancement = {
        name = "europeans_stonemine_level_2",
        enhancement_cost = {
            planks = 4
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1
        }
    },

    aihints = {},

    working_positions = {
        europeans_miner_advanced = 2,
        europeans_miner_basic = 1
    },

    inputs = {
        { name = "blackwood", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining marble because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs granite and not economy needs marble and not economy needs quartz and not economy needs diamond",
                "return=skipped unless site has blackwood:4",
                "consume=blackwood",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=blackwood",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_diamond",
                "sleep=duration:5s",
                "consume=blackwood",
                "call=mine_granite",
                "call=mine_marble",
                "call=mine_granite",
                "call=mine_quartz",
                "sleep=duration:5s",
                "consume=blackwood",
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
                "mine=resource_stones radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_stones radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=marble",
            }
        },
        mine_quartz = {
            descname = pgettext("europeans_building", "mining quartz"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_stones radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=quartz",
            }
        },
        mine_diamond = {
            descname = pgettext("europeans_building", "mining diamond"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_stones radius:8 yield:80% when_empty:15% experience_on_fail:10%",
                "produce=diamond",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=blackwood:4",
                "produce=granite:8 marble:4 quartz:2 diamond:2",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No marble",
        heading = _"Main marble Vein Exhausted",
        message =
            pgettext("europeans_building", "This marble mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
    },
}

pop_textdomain()
