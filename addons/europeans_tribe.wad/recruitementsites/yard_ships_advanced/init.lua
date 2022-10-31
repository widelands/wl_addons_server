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
    map_check = {"seafaring"},

    aihints = {},

    working_positions = {
        europeans_shipwright_advanced = 1
    },

    inputs = {
        { name = "blackwood", amount = 2 },
        { name = "planks", amount = 10 },
        { name = "reed", amount = 2 },
        { name = "cloth", amount = 2 },
        { name = "quartz", amount = 1 },
        { name = "diamond", amount = 1 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=ship on failure fail",
                "call=ship_preparation",
                "return=completed"
            }
        },
        ship = {
            -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
            descname = pgettext("europeans_building", "constructing a ship"),
            actions = {
                "return=skipped when not site has blackwood",
                "return=skipped when not site has planks",
                "return=skipped when not site has cloth",
                "return=skipped when not site has quartz",
                "return=skipped when not site has diamond",
                "sleep=duration:15s",
                "construct=europeans_shipconstruction worker:buildship radius:7",
                "sleep=duration:15s",
            }
        },
        ship_preparation = {
            descname = _"working",
            actions = {
                "animate=working duration:30s",
            }
        },
    },
}

pop_textdomain()
