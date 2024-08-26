push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_scouts_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Scout’s House"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      build = {
         frames = 3,
         columns = 3,
         rows = 1,
         hotspot = { 55, 57 }
      },
      idle = {
         fps = 10,
         frames = 12,
         columns = 6,
         rows = 2,
         hotspot = { 55, 57 }
      },
    },
    
    size = "small",
    destructible = true,
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_scout_advanced = 1
    },

    inputs = {
        { name = "boots_advanced", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start scouting because ...
            descname = _"scouting",
            actions = {
                "return=skipped when economy needs boots_advanced",
                "consume=boots_advanced",
                "sleep=duration:30s",
                "callworker=scout",
                "sleep=duration:30s",
                "callworker=scout",
                "sleep=duration:30s",
                "callworker=scout",
                "sleep=duration:30s",
                "callworker=scout"
            }
        },
        targeted_scouting = {
            descname = _"scouting",
            actions = {
                "consume=boots_advanced",
                "callworker=targeted_scouting"
            }
        },
    },
}

pop_textdomain()
