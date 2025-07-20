push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/weaving_mill/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_weaving_mill_level_3",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Weaving Mill Level 3"),
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
    
    size = "big",
    enhancement = {
        name = "europeans_weaving_mill_level_4",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            reed = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            grout = 1,
            reed = 1
        }
    },
    
    aihints = {
        supports_seafaring = true,
        prohibited_till = 600,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 1
    },

    working_positions = {
        empire_weaver = 2
    },

    inputs = {
        { name = "wool", amount = 8 },
        { name = "spider_silk", amount = 8 },
        { name = "liana", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_spidercloth",
                "sleep=duration:30s",
                "call=produce_cloth",
                "sleep=duration:30s",
                "call=produce_rope",
                "return=skipped"
            }
        },
        produce_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = pgettext("europeans_building", "weaving cloth"),
            actions = {
                "return=skipped unless economy needs cloth or workers need experience",
                "consume=wool:4",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:3m",
                "produce=cloth:3"
            }
        },
        produce_rope = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving rope because ...
            descname = pgettext("europeans_building", "weaving rope"),
            actions = {
                "return=skipped unless economy needs rope or workers need experience",
                "consume=liana:4",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:3m",
                "produce=rope:3"
            }
        },
        produce_spidercloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving spidercloth because ...
            descname = pgettext("europeans_building", "weaving spidercloth"),
            actions = {
                "return=skipped unless economy needs spidercloth or workers need experience",
                "consume=spider_silk:4",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:3m",
                "produce=spidercloth:3"
            }
        },
    },
}

pop_textdomain()
