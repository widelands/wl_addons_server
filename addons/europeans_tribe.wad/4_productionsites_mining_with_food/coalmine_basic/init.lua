push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/coalmine/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_food_coalmine_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Coal Mine"),
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
        name = "europeans_food_coalmine_level_1",
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
            -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped when economy needs ration and not economy needs granite and not economy needs coal and not economy needs diamond",
                "sleep=duration:5s",
                "call=mine_stone_basic",
                "return=skipped unless site has ration:3",
                "consume=ration",
                "call=mine_stone",
                "call=mine_coal",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=ration",
                "call=mine_stone",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=ration",
                "call=mine_stone",
                "call=mine_coal",
                "call=mine_diamond",
            }
        },
        mine_coal = {
            descname = pgettext("europeans_building", "mining coal"),
            actions = {
                "animate=working duration:10s",
                "mine=resource_coal radius:4 yield:20% when_empty:2% experience_on_fail:10%",
                "produce=coal",
            }
        },
        mine_stone = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "animate=working duration:10s",
                "mine=resource_coal radius:4 yield:20% when_empty:2% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_stone_basic = {
            descname = pgettext("europeans_building", "mining granite"),
            actions = {
                "return=skipped unless economy needs granite",
                "return=skipped when site has ration:3",
                "animate=working duration:30s",
                "mine=resource_coal radius:4 yield:20% when_empty:2% experience_on_fail:10%",
                "produce=granite",
            }
        },
        mine_diamond = {
            descname = pgettext("europeans_building", "mining diamond"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_coal radius:4 yield:20% when_empty:2% experience_on_fail:10%",
                "produce=diamond",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=ration:3",
                "produce=coal:4 granite:3 diamond",
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
