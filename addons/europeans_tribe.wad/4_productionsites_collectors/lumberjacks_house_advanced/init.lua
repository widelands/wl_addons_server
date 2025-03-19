push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/lumberjacks_house/"

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
   
    aihints = {
        very_weak_ai_limit = 4,
        weak_ai_limit = 8,
        normal_ai_limit = 16,
    },

    working_positions = {
        europeans_lumberjack_advanced = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "callworker=check_trees",
                "call=felling_trees",
                "sleep=duration:5s",
                "callworker=check_rubber",
                "call=felling_rubber_trees",
                "return=skipped"
            }
        },
        felling_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
            descname = pgettext("europeans_building", "felling trees"),
            actions = {
                "return=skipped when economy needs rubber and not economy needs log",
                "callworker=harvest_tree"
            }
        },
        felling_rubber_trees = {
            -- TRANSLATORS: Completed/Skipped/Did not start felling trees because ...
            descname = pgettext("europeans_building", "felling rubber trees"),
            actions = {
                "return=skipped when economy needs log and not economy needs rubber",
                "callworker=harvest_rubber",
                "sleep=duration:5s",
                "callworker=harvest_tree"
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
