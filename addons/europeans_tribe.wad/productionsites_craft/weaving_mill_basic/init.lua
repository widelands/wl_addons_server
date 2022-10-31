push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_weaving_mill_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Weaving Mill"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 36, 74 },
      },
      build = {
         hotspot = { 36, 74 },
      },
      working = {
         hotspot = { 36, 74 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_weaving_mill_normal",
        enhancement_cost = {
            blackwood = 2,
            cloth = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2
        },
    },
    buildcost = {
        log = 3,
        reed = 3,
        granite = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2
    },

    aihints = {
        basic_amount = 1,
        prohibited_till = 2400,
        forced_after = 3000,
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        normal_ai_limit = 8
    },

    working_positions = {
        europeans_weaver_basic = 1
    },

    inputs = {
        { name = "reed", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_cloth",
                "call=produce_cloth_idle",
                "return=skipped"
            }
        },
        produce_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = pgettext("europeans_building", "weaving cloth"),
            actions = {
                "return=skipped when economy needs reed and not economy needs cloth",
                "return=skipped unless site has reed:2",
                "consume=reed:2",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:60s",
                "produce=cloth:2"
            }
        },
        produce_cloth_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs cloth",
                "return=skipped when economy needs reed and not workers need experience",
                "consume=reed",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:60s",
                "produce=cloth",
                "sleep=duration:180s"
            }
        }
    },
}

pop_textdomain()
