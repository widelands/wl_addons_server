push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/atlanteans/spiderfarm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_spiderfarm",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Spider Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 86, 78 },
        },
        working = {
            basename = "idle",
            hotspot = { 86, 78 },
        }
    },

    size = "big",
    buildcost = {
        granite = 3,
        planks = 3,
        spidercloth = 2
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2
    },

    aihints = {
        prohibited_till = 3600,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_worker_basic = 2
    },

    inputs = {
        { name = "water", amount = 6 },
        { name = "fruit", amount = 6 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "return=skipped unless economy needs spider_silk",
                "consume=water fruit",
                "sleep=duration:25s",
                "animate=working duration:30s",
                "produce=spider_silk"
            }
        },
    },
}

pop_textdomain()
