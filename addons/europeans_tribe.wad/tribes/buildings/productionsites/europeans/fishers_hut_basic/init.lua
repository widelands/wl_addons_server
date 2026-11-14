push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/fishers_hut/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_fishers_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Fisher’s Hut"),
    icon = dirname .. "menu.png",

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
        name = "europeans_fishers_house_level_1",
        enhancement_cost = {
            ironwood = 1,
            rope = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1
        }
    },
    buildcost = {
        granite = 2,
        blackwood = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },
    
    aihints = {
        needs_water = true,
        prohibited_till = 4800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3
    },

    working_positions = {
        barbarians_fisher = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = _("fishing"),
            actions = {
                -- time of worker: 17.7-46.5 sec, min+max average 32.1 sec
                -- min. time total: 17.7 + 10.5 = 28.2 sec
                -- max. time total: 46.5 + 10.5 = 57 sec
                -- avg. time total: 32.1 + 10.5 = 42.6 sec
                "return=skipped unless economy needs fish",
                "callworker=fish",
                "sleep=duration:10s500ms"
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
