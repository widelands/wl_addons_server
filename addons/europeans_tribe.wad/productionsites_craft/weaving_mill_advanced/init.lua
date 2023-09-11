push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_weaving_mill_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Weaving Mill"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 65, 62 },
      },
      unoccupied = {
         hotspot = { 65, 62 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 65, 62 }
      },
      working = {
         fps = 5,
         frames = 11,
         rows = 4,
         columns = 3,
         hotspot = { 65, 62 }
      },
    },
    
    size = "medium",

    aihints = {},

    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "reed", amount = 4 },
        { name = "wool", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production",
                "sleep=duration:20s",
                "call=produce_cloth",
                "sleep=duration:20s",
                "call=produce_armor",
                "return=skipped"
            }
        },
        pausing_production = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production for reed"),
            actions = {
                "return=skipped when not economy needs reed",
                "sleep=duration:5m",
            }
        },
        produce_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = pgettext("europeans_building", "weaving cloth"),
            actions = {
                "return=skipped unless economy needs cloth or workers need experience",
                "consume=reed",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:40s",
                "produce=cloth"
            }
        },
        produce_armor = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring an armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of armor"),
            actions = {
                "return=skipped unless economy needs armor or workers need experience",
                "consume=wool reed",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:40s",
                "produce=armor:2"
            }
        }
    },
}

pop_textdomain()
