push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_shipyard_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Shipyard"),
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
    destructible = true,
    map_check = {"seafaring", "waterways"},

    aihints = {
        needs_water = true,
        shipyard = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_shipwright_advanced = 1
    },

    inputs = {
        { name = "planks", amount = 12 },
        { name = "blackwood", amount = 4 },
        { name = "rubber", amount = 4 },
        { name = "metal_alloy", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=ferry_construction",
                "sleep=duration:15s",
                "call=ship_construction",
                "return=completed"
            }
        },
        ferry_construction = {
            -- TRANSLATORS: Completed/Skipped/Did not start constructing a ferry because ...
            descname = pgettext("europeans_building", "constructing a ferry"),
            actions = {
                "return=skipped when economy needs planks and not economy needs europeans_ferry",
                "return=skipped when economy needs rubber and not economy needs europeans_ferry",
                "return=skipped when not site has planks:2",
                "return=skipped when not site has rubber",
                "callworker=buildferry_1",
                "consume=planks:2 rubber",
                "callworker=buildferry_2"
            }
        },
        ship_construction = {
            -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
            descname = pgettext("europeans_building", "constructing a ship"),
            actions = {
                "return=skipped when economy needs blackwood",
                "return=skipped when economy needs planks",
                "return=skipped when economy needs metal_alloy",
                "call=ship_preparation",
                "sleep=duration:15s",
                "call=ship_build"
            }
        },
        ship_preparation = {
            descname = _"working",
            actions = {
                "callworker=check_space",
                "consume=planks",
                "animate=working duration:15s",
            }
        },
        ship_build = {
            -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
            descname = pgettext("europeans_building", "constructing a ship"),
            actions = {
                "call=ship on failure fail",
                "sleep=duration:15s",
                "call=ship on failure fail",
                "sleep=duration:15s",
                "call=ship on failure fail",
                "sleep=duration:15s",
                "call=ship on failure fail",
                "sleep=duration:15s",
                "call=ship on failure fail",
                "sleep=duration:15s",
                "call=ship on failure fail",
                "sleep=duration:15s",
                "call=ship on failure fail",
                "sleep=duration:15s",
                "call=ship on failure fail",
                "sleep=duration:15s",
                "call=ship on failure fail",
                "sleep=duration:15s",
                "call=ship on failure fail",
                "sleep=duration:15s",
                "call=ship on failure fail",
                "sleep=duration:15s",
                "call=ship on failure fail",
                "sleep=duration:15s",
                "call=ship on failure fail",
                "sleep=duration:15s",
                "call=ship on failure fail"
            }
        },
        ship = {
            -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
            descname = pgettext("europeans_building", "constructing a ship"),
            actions = {
                "return=skipped when not site has blackwood",
                "return=skipped when not site has planks",
                "return=skipped when not site has rubber",
                "return=skipped when not site has metal_alloy",
                "animate=working duration:15s",
                "construct=europeans_shipconstruction worker:buildship radius:6",
            }
        },
    },
}

pop_textdomain()
