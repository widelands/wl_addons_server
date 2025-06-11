push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/charcoal_kiln/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_charcoal_kiln_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Charcoal Kiln Level 4"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
        idle = {
            hotspot = {50, 82},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            hotspot = {50, 82},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },
    animations = {
        unoccupied = {
            hotspot = {50, 64}
        }
    },
    
    size = "medium",
   
    aihints = {
        prohibited_till = 900,
        very_weak_ai_limit = 2,
        weak_ai_limit = 2,
        normal_ai_limit = 4
    },

    working_positions = {
        frisians_charcoal_burner = 1
    },

    inputs = {
        { name = "scrap_wood", amount = 10 },
        { name = "log", amount = 10 },
        { name = "clay", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=burn_wood",
                "sleep=duration:30s",
                "call=burn_log",
                "return=skipped"
            }
        },
        burn_wood = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
            descname = pgettext("europeans_building", "producing coal"),
            actions = {
                "return=skipped unless site has scrap_wood:8",
                "consume=scrap_wood:4 clay",
                "sleep=duration:30s",
                "consume=scrap_wood:4 clay",
                "animate=working duration:4m30s",
                "produce=coal:6"
            }
        },
        burn_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start producing coal because ...
            descname = pgettext("europeans_building", "producing coal"),
            actions = {
                "return=skipped unless economy needs coal",
                "return=skipped when economy needs log and not economy needs coal",
                "return=skipped unless site has log:8",
                "consume=log:4 clay",
                "sleep=duration:30s",
                "consume=log:4 clay",
                "animate=working duration:4m30s",
                "produce=coal:6"
            }
        }
    },
}

pop_textdomain()
