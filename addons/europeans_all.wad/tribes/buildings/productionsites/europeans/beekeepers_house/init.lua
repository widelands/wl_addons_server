include "addons/europeans_tribe.wad/animations.lua"

push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/beekeepers_house/"
local animations = get_animations(dirname)
local spritesheets = get_spritesheets(dirname)

wl.Descriptions():new_productionsite_type {
    name = "europeans_beekeepers_house",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Beekeeper’s House"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = animations,
    spritesheets = spritesheets,

    size = "small",
    buildcost = {
        brick = 2,
        grout = 2,
        reed = 2
    },
    return_on_dismantle = {
        brick = 1,
        grout = 1,
        reed = 1
    },

    aihints = {
        requires_supporters = true,
        prohibited_till = 5400,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        frisians_beekeeper = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "return=skipped unless economy needs honey",
                "callworker=bees",
                "sleep=duration:45s"
            }
        },
    },

    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Flowers"),
        heading = _("Out of Flowers"),
        message = pgettext ("europeans_building", "The beekeeper working at this beekeeper’s house can’t find any flowering fields or bushes in his work area. You should consider building another farm or berry farm nearby, or dismantling or destroying this building."),
        productivity_threshold = 8
    },
}

pop_textdomain()
