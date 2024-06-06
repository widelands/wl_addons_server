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
    map_check = {"seafaring"},

    aihints = {},

    working_positions = {
        europeans_shipwright_advanced = 1,
        europeans_shipwright_basic = 1
    },

    inputs = {
        { name = "planks", amount = 8 },
        { name = "blackwood", amount = 2 },
        { name = "rubber", amount = 2 },
        { name = "metal_alloy", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=ship_preparation",
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
                "return=completed"
            }
        },
        ship = {
            -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
            descname = pgettext("europeans_building", "constructing a ship"),
            actions = {
                "return=skipped when not site has blackwood",
                "return=skipped when not site has planks",
                "return=skipped when not site has rubber",
                "animate=working duration:15s",
                "construct=europeans_shipconstruction worker:buildship radius:6",
            }
        },
        ship_preparation = {
            descname = _"working",
            actions = {
                "callworker=check_space",
                "return=skipped when economy needs metal_alloy",
                "consume=metal_alloy",
                "animate=working duration:30s",
            }
        },
    },
}

pop_textdomain()
