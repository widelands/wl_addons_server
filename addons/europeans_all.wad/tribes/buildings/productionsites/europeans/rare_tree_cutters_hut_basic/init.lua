push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/amazons/liana_cutters_hut/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_rare_tree_cutters_hut_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Basic Rare Tree Cutter’s Hut"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {hotspot = {39, 45}},
        unoccupied = {hotspot = {39, 45}}
    },

    size = "small",
    enhancement = {
        name = "europeans_rare_tree_cutters_hut_advanced",
        enhancement_cost = {
            granite = 1,
            planks = 1,
            reed = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1
        }
    },
    buildcost = {
        granite = 2,
        log = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },

    aihints = {
        requires_supporters = true,
        basic_amount = 2,
        very_weak_ai_limit = 2,
        weak_ai_limit = 3
    },

    working_positions = {
        amazons_liana_cutter = 1,
        amazons_woodcutter = 1
    },


    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start making clay because ...
            descname = _("cutting lianas"),
            actions = {
                "return=skipped unless economy needs liana",
                "callworker=harvest_liana",
                "sleep=duration:30s",
            },
        },
    },
    out_of_resource_notification = {
        -- TRANSLATORS: Short for "No Trees to cut lianas" for clay pits
        title = _("No Trees"),
        heading = _("No Tree to Cut Lianas"),
        message = pgettext ("europeans_building", "The liana cutter working at this site can’t find any tree in her work area. You should consider dismantling or destroying the building or building a jungle preserver’s hut."),
        productivity_threshold = 33
    },
}

pop_textdomain()
