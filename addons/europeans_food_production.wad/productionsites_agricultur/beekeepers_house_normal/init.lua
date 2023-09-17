push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_beekeepers_house_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Beekeeper’s House"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 40, 49 },
      },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_beekeepers_house_advanced",
        enhancement_cost = {
            planks = 1,
            brick = 1,
            marble = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            marble = 1
        },
    },
    
    aihints = {},

    working_positions = {
        europeans_beekeeper_normal = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=making_honey",
                "sleep=duration:10s",
                "call=making_honey_idle",
                "return=skipped"
            }
        },
        making_honey = {
            -- TRANSLATORS: Completed/Skipped/Did not start making honey because ...
            descname = pgettext("europeans_building", "making honey"),
            actions = {
                "return=skipped unless economy needs honey or workers need experience",
                "callworker=bees",
                "sleep=duration:60s"
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
