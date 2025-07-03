push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/weaving_mill/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_weaving_mill_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Weaving Mill"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 27, 56 },
      },
      build = {
         hotspot = { 27, 56 },
      },
      working = {
         hotspot = { 27, 56 },
      },
    },
    
    size = "big",
    enhancement = {
        name = "europeans_weaving_mill_advanced",
        enhancement_cost = {
            brick = 3,
            grout = 3
        },
        enhancement_return_on_dismantle = {
            granite = 3
        }
    },
    
    buildcost = {
        granite = 4,
        planks = 4
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 3
    },

    aihints = {
        supports_seafaring = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_worker_basic = 2
    },

    inputs = {
        { name = "reed", amount = 6 },
        { name = "liana", amount = 6 },
        { name = "rubber", amount = 4 },
        { name = "leather", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_armor",
                "sleep=duration:30s",
                "call=produce_cloth",
                "sleep=duration:30s",
                "call=produce_rope",
                "return=skipped"
            }
        },
        produce_armor = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring an armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of armor"),
            actions = {
                "return=skipped unless economy needs armor or workers need experience",
                "return=skipped when economy needs reed and not economy needs armor",
                "return=skipped when economy needs cloth and not economy needs armor",
                "return=skipped when economy needs rope and not economy needs armor",
                "return=skipped when economy needs leather and economy needs rubber and not economy needs armor",
                "consume=reed:3 leather,rubber:2",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:3m",
                "produce=armor:2"
            }
        },
        produce_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = pgettext("europeans_building", "weaving cloth"),
            actions = {
                "return=skipped unless economy needs cloth or workers need experience",
                "return=skipped when economy needs reed and not economy needs cloth",
                "return=skipped when economy needs armor and not economy needs cloth",
                "return=skipped when economy needs rope and not economy needs cloth",
                "consume=reed:3",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:2m",
                "produce=cloth:2"
            }
        },
        produce_rope = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving rope because ...
            descname = pgettext("europeans_building", "weaving rope"),
            actions = {
                "return=skipped unless economy needs rope or workers need experience",
                "return=skipped when economy needs liana and not economy needs rope",
                "return=skipped when economy needs cloth and not economy needs rope",
                "return=skipped when economy needs armor and not economy needs rope",
                "consume=liana:3",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:2m",
                "produce=rope:2"
            }
        }
    },
}

pop_textdomain()
