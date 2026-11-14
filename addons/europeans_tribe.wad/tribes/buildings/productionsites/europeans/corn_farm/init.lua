push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/atlanteans/farm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_corn_farm",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Corn Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 86, 78 },
        },
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
        space_consumer = true,
        prohibited_till = 1800,
        basic_amount = 2,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        atlanteans_farmer = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=plant",
                "call=harvest",
            }
        },
        plant = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting corn because ...
            descname = _("planting corn"),
            actions = {
                "callworker=plant",
                "sleep=duration:10s"
            }
        },
        harvest = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting corn because ...
            descname = _("harvesting corn"),
            actions = {
                "return=skipped unless economy needs corn",
                "callworker=harvest",
                "sleep=duration:4s"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fields"),
        heading = _("Out of Fields"),
        message = pgettext("europeans_building", "The farmer working at this farm has no cleared soil to plant his seeds."),
        productivity_threshold = 30
    },
}

pop_textdomain()
