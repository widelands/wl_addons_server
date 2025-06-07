push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/frisians/farm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_grain_farm_level_2",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Grain Farm Level 2"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {91, 90}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {91, 111},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            hotspot = {91, 111},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        build = {
            hotspot = {91, 90},
            frames = 2,
            columns = 2,
            rows = 1
        }
    },

    size = "big",

    aihints = {
        space_consumer = true,
        prohibited_till = 1800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        frisians_farmer = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=plant_barley",
                "call=plant_oat",
                "call=plant_rye",
                "call=plant_wheat",
                "call=harvest_barley",
                "call=harvest_oat",
                "call=harvest_rye",
                "call=harvest_wheat",
            }
        },
        plant_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting barley because ...
            descname = _("planting barley"),
            actions = {
                "callworker=plant",
                "sleep=duration:10s"
            }
        },
        harvest_barley = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting barley because ...
            descname = _("harvesting barley"),
            actions = {
                "return=skipped unless economy needs barley",
                "callworker=harvest",
                "animate=working duration:40s",
                "sleep=duration:4s",
                "produce=barley" --produces 2 barley per field
            }
        },
        plant_oat = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting oat because ...
            descname = _("planting oat"),
            actions = {
                "callworker=plant_oat",
                "sleep=duration:10s"
            }
        },
        harvest_oat = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting oat because ...
            descname = _("harvesting oat"),
            actions = {
                "return=skipped unless economy needs oat",
                "callworker=harvest_oat",
                "animate=working duration:40s",
                "sleep=duration:4s",
                "produce=oat" --produces 2 oat per field
            }
        },
        plant_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting rye because ...
            descname = _("planting rye"),
            actions = {
                "callworker=plant_rye",
                "sleep=duration:10s"
            }
        },
        harvest_rye = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting rye because ...
            descname = _("harvesting rye"),
            actions = {
                "return=skipped unless economy needs rye",
                "callworker=harvest_rye",
                "animate=working duration:40s",
                "sleep=duration:4s",
                "produce=rye" --produces 2 rye per field
            }
        },
        plant_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting wheat because ...
            descname = _("planting wheat"),
            actions = {
                "callworker=plant",
                "sleep=duration:10s"
            }
        },
        harvest_wheat = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting wheat because ...
            descname = _("harvesting wheat"),
            actions = {
                "return=skipped unless economy needs wheat",
                "callworker=harvest",
                "animate=working duration:40s",
                "sleep=duration:4s",
                "produce=wheat" --produces 2 wheat per field
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fields"),
        heading = _("Out of Fields"),
        message = pgettext ("europeans_building", "The farmer working at this farm has no cleared soil to plant his seeds."),
        productivity_threshold = 30
    },
}

pop_textdomain()
