push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/reed_yard/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_reed_farm_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Reed Yard"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 46, 44 },
        },
    },

    size = "medium",
    enhancement = {
        name = "europeans_reed_farm_advanced",
        enhancement_cost = {
            brick = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            brick = 2
        }
    },
    buildcost = {
        log = 3,
        granite = 3
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 2
    },

    aihints = {
        space_consumer = true,
        prohibited_till = 1800,
        basic_amount = 2,
        very_weak_ai_limit = 2,
        weak_ai_limit = 3
    },

    working_positions = {
        barbarians_gardener = 1
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
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = _("planting reed"),
            actions = {
                "callworker=plant",
                "sleep=duration:8s" -- orig sleep=duration:20s but gardener animation was increased by 2sec
            }
        },
        harvest = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = _("harvesting reed"),
            actions = {
                "return=skipped unless economy needs reed",
                "callworker=harvest",
                "sleep=duration:3s"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fields"),
        heading = _("Out of Fields"),
        message = pgettext("europeans_building", "The gardener working at this reed yard has no cleared soil to plant his seeds."),
        productivity_threshold = 20
    },
}

pop_textdomain()
