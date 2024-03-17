push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_shipyard_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Shipyard"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 62, 48 },
      },
      unoccupied = {
         hotspot = { 62, 48 },
      },
      working = {
         hotspot = { 61, 47 },
      },
    },
    
    size = "medium",
    map_check = {"seafaring"},
    destructible = true,
    
    enhancement = {
        name = "europeans_shipyard_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2,
            grout = 2,
            quartz = 1,
            diamond = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            quartz = 1,
            diamond = 1
        },
    },
    buildcost = {
        log = 3,
        blackwood = 2,
        planks = 2,
        reed = 3,
        granite = 2,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 3,
        planks = 1,
        reed = 1,
        granite = 1,
        quartz = 1,
        diamond = 1
    },

    aihints = {
        needs_water = true,
        shipyard = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        --normal_ai_limit = 2,
    },

    working_positions = {
        europeans_shipwright_basic = 1
    },

    inputs = {
        { name = "planks", amount = 8 },
        { name = "cloth", amount = 4 },
        { name = "blackwood", amount = 2 },
        { name = "reed", amount = 2 },
        { name = "coin_copper", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "return=skipped when economy needs coin_copper",
                "call=ship on failure fail",
                "sleep=duration:30s",
                "call=ship on failure fail",
                "sleep=duration:30s",
                "call=ship on failure fail",
                "sleep=duration:30s",
                "call=ship on failure fail",
                "sleep=duration:30s",
                "call=ship on failure fail",
                "sleep=duration:30s",
                "call=ship on failure fail",
                "sleep=duration:30s",
                "call=ship on failure fail",
                "sleep=duration:30s",
                "call=ship on failure fail",
                "sleep=duration:30s",
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
                "animate=working duration:30s",
                "construct=europeans_shipconstruction worker:buildship radius:5",
            }
        },
        ship_preparation = {
            descname = _"working",
            actions = {
                "consume=coin_copper",
                "animate=working duration:60s",
            }
        },
    },
}

pop_textdomain()
