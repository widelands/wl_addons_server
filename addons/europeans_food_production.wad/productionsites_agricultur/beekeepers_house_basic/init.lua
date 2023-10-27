push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_beekeepers_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Beekeeper’s Hut"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      unoccupied = {
         hotspot = { 44, 43 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 44, 43 }
      },
      idle = {
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 44, 43 }
      },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_beekeepers_house_normal",
        enhancement_cost = {
            blackwood = 1,
            cloth = 1,
            grout = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1
        },
    },
    buildcost = {
        log = 2,
        reed = 2,
        granite = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 1
    },

    aihints = {
        requires_supporters = true,
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
                "sleep=duration:90s"
            }
        },
        making_honey_idle = {
            -- TRANSLATORS: Completed/Skipped/Did not start idle program because ...
            descname = _"idle program",
            actions = {
                "return=skipped when economy needs honey",
                "callworker=bees",
                "sleep=duration:5m"
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
