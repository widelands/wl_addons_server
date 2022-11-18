push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_ferry_yard_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Ferry Yard"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 56, 58 },
      },
      build = {
         frames = 4,
         columns = 4,
         rows = 1,
         hotspot = { 56, 58 },
      },
      unoccupied = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 56, 58 },
      },
      working = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 56, 58 },
      },
    },

    size = "medium",
    map_check = {"waterways"},
    enhancement = {
        name = "europeans_shipyard_basic",
        enhancement_cost = {
            planks = 2,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            scrap_metal_mixed = 1
        }
    },

    aihints = {},

    working_positions = {
        europeans_shipwright_advanced = 1
    },

    inputs = {
        { name = "planks", amount = 6 },
        { name = "cloth", amount = 3 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "sleep=duration:15s",
                "callworker=buildferry_1",
                "consume=planks:2 cloth",
                "callworker=buildferry_2"
            }
        },
    },
}

pop_textdomain()
