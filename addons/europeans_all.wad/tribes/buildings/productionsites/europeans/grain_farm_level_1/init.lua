push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/empire/farm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_grain_farm_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Grain Farm Level 1"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 89, 82 },
        },
    },
    
    size = "big",
    enhancement = {
        name = "europeans_grain_farm_level_2",
        enhancement_cost = {
            brick = 3,
            grout = 3,
            reed = 3
        },
        enhancement_return_on_dismantle = {
            brick = 2,
            grout = 1,
            reed = 1
        }
    },
    
    aihints = {
        space_consumer = true,
        prohibited_till = 1800,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        empire_farmer = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=plant_rye",
                "call=plant_wheat",
                "call=harvest_rye",
                "call=harvest_wheat",
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
                "sleep=duration:4s"
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
                "sleep=duration:4s"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fields"),
        heading = _("Out of Fields"),
        message = pgettext("europeans_building", "The farmer working at this farm has no cleared soil to plant his seeds."),
        productivity_threshold = 30
    },
}

pop_textdomain()
