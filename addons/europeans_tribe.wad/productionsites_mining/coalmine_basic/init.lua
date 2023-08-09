push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_coalmine_basic",
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
        name = "europeans_coalmine_level_1",
        enhancement_cost = {
            log = 2,
            blackwood = 1,
            planks = 1,
            reed = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1
        }
    },
    buildcost = {
        log = 2,
        blackwood = 2,
        planks = 2,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },

    aihints = {},

    working_positions = {
        europeans_miner_basic = 1
    },

    inputs = {
        { name = "coin_wood", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs coal or economy needs granite or economy needs diamond or workers need experience",
                "call=mine_stone_basic",
                "return=skipped unless site has coin_wood:3",
                "consume=coin_wood",
                "call=mine_stone",
                "call=mine_coal",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=coin_wood",
                "call=mine_stone",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=coin_wood",
                "call=mine_stone",
                "call=mine_coal",
                "call=mine_diamond",
                "sleep=duration:5s",
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
                "return=skipped when site has coin_wood:3",
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
                "consume=coin_wood:3",
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
