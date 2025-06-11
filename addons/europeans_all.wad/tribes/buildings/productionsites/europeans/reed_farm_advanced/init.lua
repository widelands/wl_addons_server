push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/reed_farm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_reed_farm_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Advanced Reed Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {40, 54}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {40, 72},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "small",

    aihints = {
        space_consumer = true,
        prohibited_till = 1800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        frisians_reed_farmer = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=plant_reed",
                "call=harvest_reed",
            }
        },
        plant_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = _("planting reed"),
            actions = {
                "callworker=plant_reed",
                "sleep=duration:10s",
                "callworker=plant_reed",
                "sleep=duration:10s"
            }
        },
        harvest_reed = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = _("harvesting reed"),
            actions = {
                "return=skipped unless economy needs reed",
                "callworker=harvest_reed",
                "sleep=duration:5s",
                "callworker=harvest_reed",
                "sleep=duration:5s"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fields"),
        heading = _("Out of Fields"),
        message = pgettext("europeans_building", "The reed farmer working at this reed farm has no cleared soil to plant his seeds."),
        productivity_threshold = 20
    },
}

pop_textdomain()
