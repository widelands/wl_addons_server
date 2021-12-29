push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

descriptions:new_productionsite_type {
    name = "europeans_beekeepers_house",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Beekeepers House"),
    icon = dirname .. "menu.png",
    size = "small",

    buildcost = {
        blackwood = 2,
        reed = 2,
        granite = 1
    },
    return_on_dismantle = {
        blackwood = 1,
        granite = 1
    },

    animations = {
        idle = {
            pictures = path.list_files(dirname .. "idle_??.png"),
            hotspot = { 33, 64 },
        },
        working = {
            pictures = path.list_files(dirname .. "idle_??.png"), -- TODO(GunChleoc): No animation yet.
            hotspot = { 33, 64 },
        }
    },

    aihints = {
        requires_supporters = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
        basic_amount = 1,
        prohibited_till = 2100,
        forced_after = 3000
    },

    working_positions = {
        europeans_beekeeper_basic = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=making_honey",
                "call=making_honey_idle",
                "return=skipped"
            }
        },
        making_honey = {
            -- TRANSLATORS: Completed/Skipped/Did not start making honey because ...
            descname = _"making honey",
            actions = {
                "return=skipped unless economy needs honey or workers need experience",
                "callworker=bees",
                "sleep=duration:30s"
            }
        },
        making_honey_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs honey",
                "callworker=bees",
                "sleep=duration:90s"
            }
        },
    },
    
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Flowers",
        heading = _"Out of Flowers",
        message = pgettext ("europeans_building", "The beekeeper working at this beekeepers’s house can’t find any flowering fields or bushes in his work area. You should consider building another farm or berry farm nearby, or dismantling or destroying this building."),
        productivity_threshold = 8
    },
}

pop_textdomain()
