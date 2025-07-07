push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/vineyard/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_fruit_farm_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Berry Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 59, 65 },
        },
        working = {
            basename = "idle",
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
        prohibited_till = 3600,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_gardener_basic = 2
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=planting_berry_bushes",
                "call=gathering_berries",
            }
        },
        planting_berry_bushes = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting bushes because ...
            descname = _("planting bushes"),
            actions = {
                "return=skipped unless economy needs fruit or economy needs honey",
                "callworker=plant_berrybush",
                "sleep=duration:31s",
                "callworker=bees"
            }
        },
        gathering_berries = {
            -- TRANSLATORS: Completed/Skipped/Did not start gathering berries because ...
            descname = _("gathering berries"),
            actions = {
                "return=skipped unless economy needs fruit",
                "sleep=duration:31s",
                "callworker=harvest_berrybush",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fields"),
        heading = _("Out of Fields"),
        message = pgettext("europeans_building", "The fruit farmer working at this farm has no cleared soil to plant his berrybushes."),
        productivity_threshold = 30
    },
}

pop_textdomain()
