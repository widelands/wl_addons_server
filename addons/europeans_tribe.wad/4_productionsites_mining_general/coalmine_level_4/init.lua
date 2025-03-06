push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/coalmine_deep/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_coalmine_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Coal Mine Level 4"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 51, 66 },
      },
      empty = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 51, 66 }
      },
      working = {
         fps = 10,
         frames = 10,
         columns = 10,
         rows = 1,
         hotspot = { 51, 66 }
      },
    },
    
    size = "mine",
    enhancement = {
        name = "europeans_coalmine_level_5",
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
        { name = "blackwood", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs granite and not economy needs diamond and not economy needs coal",
                "return=skipped unless site has blackwood:4",
                "consume=blackwood",
                "call=mine_stone",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=blackwood",
                "call=mine_stone",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_diamond",
                "sleep=duration:5s",
                "consume=blackwood",
                "call=mine_stone",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=blackwood",
                "call=mine_stone",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_diamond",
            }
        },
        mine_coal = {
            descname = pgettext("europeans_building", "mining coal"),
            actions = {
                "animate=working duration:30s",
                "mine=resource_coal radius:8 yield:90% when_empty:15% experience_on_fail:10%",
                "produce=coal",
            }
        },
        mine_stone = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:30s",
                "mine=resource_coal radius:8 yield:90% when_empty:15% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_diamond = {
            descname = pgettext("europeans_building", "mining diamond"),
            actions = {
                "animate=working duration:30s",
                "mine=resource_coal radius:8 yield:90% when_empty:15% experience_on_fail:10%",
                "produce=diamond",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=blackwood:4",
                "produce=coal:10 granite:4 diamond:2",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Coal",
        heading = _"Main Coal Vein Exhausted",
        message =
            pgettext("europeans_building", "This coal mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
    },
}

pop_textdomain()
