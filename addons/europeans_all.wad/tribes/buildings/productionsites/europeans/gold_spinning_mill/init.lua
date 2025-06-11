push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/atlanteans/gold_spinning_mill/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_gold_spinning_mill",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Gold Spinning Mill"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 34, 74 },
        },
        working = {
            basename = "idle",
            hotspot = { 34, 74 },
        }
    },

    size = "small",
    buildcost = {
        planks = 2,
        granite = 2,
        spidercloth = 1
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },

    aihints = {
        prohibited_till = 900,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        atlanteans_carrier = 1
    },

    inputs = {
        { name = "gold", amount = 5 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start spinning gold because ...
            descname = _("spinning gold"),
            actions = {
                "return=skipped unless economy needs gold_thread",
                "consume=gold",
                "sleep=duration:15s",
                "playsound=sound/atlanteans/goldspin priority:50% allow_multiple",
                "animate=working duration:25s",
                "produce=gold_thread"
            }
        },
    },
}

pop_textdomain()
