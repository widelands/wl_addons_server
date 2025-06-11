push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/vineyard/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_fruit_farm_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Vineyard"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 59, 65 },
        },
    },

    size = "medium",
    enhancement = {
        name = "europeans_fruit_farm_advanced",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            reed = 2
        },
        enhancement_return_on_dismantle = {
            brick = 2,
            grout = 1
        }
    },
    buildcost = {
        planks = 2,
        granite = 2,
        marble = 2,
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1,
        marble = 1
    },

    aihints = {
        space_consumer = true,
        prohibited_till = 5400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        empire_vinefarmer = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=plant_grape",
                "call=harvest_grape",
            }
        },
        plant_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting grapevines because ...
            descname = _("planting grapevines"),
            actions = {
                "callworker=plant_grape",
                "sleep=duration:5s"
            }
        },
        harvest_grape = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting grapevines because ...
            descname = _("harvesting grapes"),
            actions = {
                "return=skipped unless economy needs grape",
                "callworker=harvest_grape",
                "sleep=duration:5s"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fields"),
        heading = _("Out of Fields"),
        message = pgettext("europeans_building", "The vine farmer working at this vineyard has no cleared soil to plant his grapevines."),
        productivity_threshold = 30
    },
}

pop_textdomain()
