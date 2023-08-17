push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_shipyard_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Shipyard"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 56, 72 },
      },
      working = {
         basename = "idle",
         hotspot = { 56, 72 },
      },
      unoccupied = {
         basename = "idle",
         hotspot = { 56, 72 },
      }
    },
    
    size = "medium",
    destructible = true,
    map_check = {"seafaring"},
    
    enhancement = {
        name = "europeans_shipyard_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 1,
            marble_column = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2,
            diamond = 1
        }
    },

    aihints = {},

    working_positions = {
        europeans_shipwright_normal = 1,
        europeans_shipwright_basic = 1
    },

    inputs = {
        { name = "planks", amount = 8 },
        { name = "cloth", amount = 4 },
        { name = "blackwood", amount = 2 },
        { name = "reed", amount = 2 },
        { name = "coin_silver", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship on failure fail",
                "sleep=duration:20s",
                "call=ship_preparation",
                "return=completed"
            }
        },
        ship = {
            -- TRANSLATORS: Completed/Skipped/Did not start constructing a ship because ...
            descname = _"constructing a ship",
            actions = {
                "return=skipped when not site has blackwood",
                "return=skipped when not site has planks",
                "return=skipped when not site has cloth",
                "return=skipped when not site has coin_silver",
                "animate=working duration:20s",
                "construct=europeans_shipconstruction worker:buildship radius:6",
            }
        },
        ship_preparation = {
            descname = _"working",
            actions = {
                "consume=coin_silver",
                "animate=working duration:35s",
            }
        },
    },
}

pop_textdomain()
