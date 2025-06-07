push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/atlanteans/coalmine/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_coalmine_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Coal Mine Level 3"),
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
        name = "europeans_coalmine_level_4",
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
        atlanteans_miner = 3
    },

    inputs = {
        { name = "meal", amount = 8 },
        { name = "chocolate", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining coal because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs coal",
                "return=skipped when economy needs meal and not economy needs granite and not economy needs diamond and not economy needs coal",
                "consume=meal chocolate",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=meal chocolate",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_diamond",
                "sleep=duration:5s",
                "consume=meal chocolate",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "sleep=duration:5s",
                "consume=meal chocolate",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_coal",
                "call=mine_diamond",
            }
        },
        mine_coal = {
            descname = pgettext("europeans_building", "mining coal"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_coal radius:5 yield:50% when_empty:8% experience_on_fail:10%",
                "produce=granite coal",
            }
        },
        mine_diamond = {
            descname = pgettext("europeans_building", "mining diamond"),
            actions = {
                "animate=working duration:25s",
                "mine=resource_coal radius:5 yield:50% when_empty:8% experience_on_fail:10%",
                "produce=diamond",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=meal:4 chocolate:4",
                "produce=coal:12 granite:12 diamond:2",
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
