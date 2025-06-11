push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/goldmine/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_goldmine_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Gold Mine"),
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
        name = "europeans_goldmine_level_1",
        enhancement_cost = {
            planks = 3
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1,
            marble = 1
        }
    },
    buildcost = {
        log = 6
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 1,
        marble = 1
    },

    aihints = {},

    working_positions = {
        barbarians_miner = 2
    },

    inputs = {
        { name = "ration", amount = 6 },
        { name = "beer", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start mining gold because ...
            descname = pgettext("europeans_building", "mining"),
            actions = {
                "return=skipped unless economy needs gold_ore",
                "return=skipped when economy needs ration and not economy needs granite and not economy needs marble and not economy needs gold_ore",
                "consume=ration beer",
                "call=mine_ore",
                "call=mine_marble",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=ration beer",
                "call=mine_ore",
                "call=mine_ore",
                "call=mine_ore",
                "sleep=duration:5s",
                "consume=ration beer",
                "call=mine_ore",
                "call=mine_marble",
                "call=mine_ore",
            }
        },
        mine_marble = {
            descname = pgettext("europeans_building", "mining marble"),
            actions = {
                "animate=working duration:10s",
                "mine=resource_gold radius:4 yield:20% when_empty:2% experience_on_fail:5%",
                "produce=marble",
            }
        },
        mine_ore = {
            descname = pgettext("europeans_building", "mining gold_ore"),
            actions = {
                "animate=working duration:10s",
                "mine=resource_gold radius:4 yield:20% when_empty:2% experience_on_fail:5%",
                "produce=granite gold_dust gold_ore",
            }
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=ration:3 beer:3",
                "produce=granite:7 marble:2 gold_dust:7 gold_ore:7",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Gold",
        heading = _"Main Gold Vein Exhausted",
        message =
            pgettext("europeans_building", "This gold mine’s main vein is exhausted. Expect strongly diminished returns on investment. You should consider enhancing, dismantling or destroying it."),
    },
}

pop_textdomain()
