push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_beekeepers_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Beekeeper’s House"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 55, 57 },
      },
    },

    size = "small",
    
    aihints = { },

    working_positions = {
        europeans_beekeeper_advanced = 1
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
            descname = pgettext("europeans_building", "making honey"),
            actions = {
                "return=skipped unless economy needs honey or workers need experience",
                "callworker=bees"
            }
        },
        making_honey_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs honey",
                "callworker=bees",
                "sleep=duration:120s"
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
