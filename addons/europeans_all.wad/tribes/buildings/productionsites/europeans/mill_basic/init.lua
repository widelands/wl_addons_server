push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/atlanteans/mill/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_mill_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Mill"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 63, 68 },
      },
    },
    spritesheets = {
      working = {
         fps = 25,
         frames = 19,
         columns = 10,
         rows = 2,
         hotspot = { 63, 68 },
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_mill_advanced",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            marble = 2,
            cloth = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            grout = 1,
            marble = 1
        }
    },
    
    buildcost = {
        granite = 3,
        planks = 3,
        spidercloth = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2
    },

    aihints = {
        prohibited_till = 3600,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        atlanteans_miller = 1
    },

    inputs = {
        { name = "corn", amount = 8 },
        { name = "blackroot", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_cornmeal",
                "call=produce_blackroot_flour",
                "return=skipped"
            }
        },
        produce_blackroot_flour = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding blackroot because ...
            descname = _("grinding blackroot"),
            actions = {
                -- time: 3.4 + 15 + 3.6 = 22 sec
                -- No check whether we need blackroot_flour because blackroots cannot be used for anything else.
                "return=skipped when site has corn and economy needs cornmeal and not economy needs blackroot_flour",
                "return=skipped unless economy needs blackroot_flour",
                "consume=blackroot",
                "sleep=duration:3s400ms",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:15s",
                "produce=blackroot_flour"
            }
        },
        produce_cornmeal = {
            -- TRANSLATORS: Completed/Skipped/Did not start grinding corn because ...
            descname = _("grinding corn"),
            actions = {
                -- time: 3.4 + 15 + 3.6 = 22 sec
                "return=skipped when site has blackroot and economy needs blackroot_flour and not economy needs cornmeal",
                "return=skipped unless economy needs cornmeal",
                "sleep=duration:3s400ms",
                "consume=corn",
                "playsound=sound/mill/mill_turning priority:85% allow_multiple",
                "animate=working duration:15s",
                "produce=cornmeal"
            }
        },
    },
}

pop_textdomain()
