push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_lumberjacks_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Lumberjack’s Hut"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 43, 45 },
      },
      unoccupied = {
         hotspot = { 43, 45 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 42, 44 }
      },
    },
    
    size = "small",
    enhancement = {
        name = "europeans_lumberjacks_house_normal",
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
        basic_amount = 4
    },

    working_positions = {
        europeans_lumberjack_basic = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_trees",
                "call=pausing_production_for_outputs",
                "call=felling_trees",
                "sleep=duration:5s",
                "call=harvesting_reed",
                "return=skipped"
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs log or economy needs reed",
                "sleep=duration:4m",
            }
        },
        felling_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
            descname = _"felling trees",
            actions = {
                "return=skipped when economy needs reed and not economy needs log",
                "callworker=harvest_tree",
                "produce=log"
            }
        },
        harvesting_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = _"harvesting reed",
            actions = {
                "return=skipped when economy needs log and not economy needs reed",
                "callworker=harvest_reed",
                "produce=reed"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Trees",
        heading = _"Out of Trees",
        message = pgettext("europeans_building", "The lumberjack working at this lumberjack’s hut can’t find any trees in his work area. You should consider enhancing it to increase its working area or building a ranger’s hut."),
        productivity_threshold = 60
    },
}

pop_textdomain()
