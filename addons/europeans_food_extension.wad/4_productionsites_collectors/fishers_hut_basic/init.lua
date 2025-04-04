push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/fishers_hut/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_fishers_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("barbarians_building", "Basic Fisher’s Hut"),
    icon = dirname .. "menu.png",
    size = "small",

    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 39, 52 },
        },
        unoccupied = {
            hotspot = { 39, 52 },
        },
    },
    spritesheets ={
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 39, 52 }
        },
    },
   
    size = "small",
    enhancement = {
        name = "europeans_fishers_house_advanced",
        enhancement_cost = {
            brick = 1,
            grout = 1
        },
        enhancement_return_on_dismantle = {
            granite = 1
        }
    },
    buildcost = {
        granite = 2,
        planks = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },
    
    aihints = {
        needs_water = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3
    },

    working_positions = {
        europeans_fisher_basic = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _("fishing"),
            actions = {
                "return=skipped unless economy needs fish",
                "callworker=fish",
                "sleep=duration:2m"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fish"),
        heading = _("Out of Fish"),
        message = pgettext("europeans_building", "The fisher working out of this fisher’s hut can’t find any fish in his work area. Remember that you can enhance the building. An advanced fishbreeder can release more fish into the waters."),
    },
}

pop_textdomain()
