push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/charcoal_burners_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_charcoal_burners_house",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Charcoal Burner’s House"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {43, 56}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {43, 74},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
    },

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
        frisians_charcoal_burner = 1
    },

    inputs = {
        { name = "log", amount = 6 },
        { name = "clay", amount = 2 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                -- min. time total: 37.2 + 30.2 = 67.4 sec
                -- max. time total: 69.6 + 62.6 = 132.2 sec
                "call=erect_stack",
                "call=collect_coal",
            },
        },
        erect_stack = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a charcoal stack because ...
            descname = _("making a charcoal stack"),
            actions = {
                -- time of worker: 22.2-54.6 sec
                -- min. time: 22.2 + 15 = 37.2 sec
                -- max. time: 54.6 + 15 = 69.6 sec
                "return=skipped unless economy needs coal",
                "callworker=find_pond",
                "consume=log:3",
                "callworker=make_stack",
                "consume=clay",
                "sleep=duration:15s",
            },
        },
        collect_coal = {
            -- TRANSLATORS: Completed/Skipped/Did not start collecting coal because ...
            descname = _("collecting coal"),
            actions = {
                -- time of worker: 15.2-47.6 sec
                -- min. time: 15 + 15.2 = 30.2 sec
                -- max. time: 15 + 47.6 = 62.6 sec
                "sleep=duration:15s",
                "callworker=collect_coal",
            },
        },
        encyclopedia = {
            -- just a dummy program to fix encyclopedia
            descname = "encyclopedia",
            actions = {
                "consume=log:3",
                "produce=coal",
            },
        },
    },

    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Ponds"),
        heading = _("Out of Clay Ponds"),
        message = pgettext ("europeans_building", "The charcoal burner working at this charcoal burner’s house can’t find any clay ponds in his work area. Please make sure there is a working clay pit nearby and the charcoal burner’s house is supplied with all needed wares, or consider dismantling or destroying this building."),
        productivity_threshold = 12
    },
}

pop_textdomain()
