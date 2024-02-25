push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_lumberjacks_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Lumberjack’s House"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 42, 57 },
      },
    },

    size = "small",
   
    aihints = {},

    working_positions = {
        europeans_lumberjack_advanced = 1
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
                "sleep=duration:5s",
                "call=harvesting_cotton",
                "sleep=duration:5s",
                "call=harvesting_rubber",
                "return=skipped"
            }
        },
        pausing_production_for_outputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing production because output not needed yet"),
            actions = {
                "return=skipped when economy needs log or economy needs reed or economy needs cotton or economy needs rubber",
                "sleep=duration:2m",
            }
        },
        felling_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
            descname = pgettext("europeans_building", "felling trees"),
            actions = {
                "return=skipped when economy needs reed and not economy needs log",
                "return=skipped when economy needs cotton and not economy needs log",
                "return=skipped when economy needs rubber and not economy needs log",
                "callworker=harvest_tree",
                "produce=log"
            }
        },
        harvesting_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting cotton because ...
            descname = _"harvesting cotton",
            actions = {
                "return=skipped when economy needs log and not economy needs cotton",
                "return=skipped when economy needs reed and not economy needs cotton",
                "return=skipped when economy needs rubber and not economy needs cotton",
                "callworker=harvest_cotton",
                "produce=cotton"
            }
        },
        harvesting_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = _"harvesting reed",
            actions = {
                "return=skipped when economy needs log and not economy needs reed",
                "return=skipped when economy needs cotton and not economy needs reed",
                "return=skipped when economy needs rubber and not economy needs reed",
                "callworker=harvest_reed",
                "produce=reed"
            }
        },
        harvesting_rubber = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting rubber because ...
            descname = _"harvesting rubber",
            actions = {
                "return=skipped when economy needs log and not economy needs rubber",
                "return=skipped when economy needs reed and not economy needs rubber",
                "return=skipped when economy needs cotton and not economy needs rubber",
                "callworker=harvest_rubber",
                "produce=rubber"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _"No Trees",
        heading = _"Out of Trees",
        message = pgettext("europeans_building", "The lumberjack working at this lumberjack’s house can’t find any trees in his work area. You should consider dismantling or destroying the building or building a forester’s house."),
        productivity_threshold = 60
    },
}

pop_textdomain()
