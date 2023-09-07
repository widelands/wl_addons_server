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
         hotspot = { 27, 56 },
      },
      build = {
         hotspot = { 27, 56 },
      },
      working = {
         hotspot = { 27, 56 },
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
        supports_seafaring = true,
        basic_amount = 2,
    },

    working_positions = {
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "reed", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "sleep=duration:30s",
                "call=produce_armor",
                "sleep=duration:30s",
                "call=produce_cloth",
                "return=skipped"
            }
        },
        produce_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start weaving cloth because ...
            descname = pgettext("europeans_building", "weaving cloth"),
            actions = {
                "return=skipped unless economy needs cloth or workers need experience",
                "return=skipped when economy needs armor and not economy needs cloth",
                "return=skipped when economy needs reed and not economy needs cloth",
                "return=skipped unless site has reed:2",
                "consume=reed:2",
                "playsound=sound/barbarians/weaver priority:90%",
                "animate=working duration:90s",
                "produce=cloth:2"
            }
        },
        produce_armor = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring an armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of armor"),
            actions = {
                "return=skipped unless economy needs armor or workers need experience",
                "return=skipped when economy needs cloth and not economy needs armor",
                "return=skipped when economy needs reed and not economy needs armor",
                "return=skipped unless site has reed:2",
                "consume=reed:2",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:90s",
                "produce=armor"
            }
        }
    },
}

pop_textdomain()
