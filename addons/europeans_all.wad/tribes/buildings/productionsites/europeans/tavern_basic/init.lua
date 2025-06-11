push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/tavern/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_tavern_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Tavern"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 57, 88 },
        },
    },
    spritesheets = {
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 51, 70 }
        },
        working = {
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 51, 70 }
        },
    },

    size = "medium",
    enhancement = {
        name = "europeans_tavern_level_1",
        enhancement_cost = {
            granite = 2,
            ironwood = 2,
            rope = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 1
        }
    },
    buildcost = {
        granite = 2,
        blackwood = 2,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2
    },

    aihints = {
        prohibited_till = 4200,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        barbarians_innkeeper = 1
    },

    inputs = {
        { name = "fish", amount = 4 },
        { name = "meat", amount = 4 },
        { name = "barbarians_bread", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=produce_barbarians_ration",
            }
        },
        produce_barbarians_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start preparing a ration because ...
            descname = _("preparing a ration"),
            actions = {
                -- time total: 23.4 + 10 + 3.6 = 37 sec
                "return=skipped unless economy needs ration",
                "consume=barbarians_bread fish,meat",
                "playsound=sound/barbarians/taverns/tavern priority:80%",
                "animate=working duration:23s400ms",
                "sleep=duration:10s",
                "produce=ration"
            },
        },
    },
}

pop_textdomain()
