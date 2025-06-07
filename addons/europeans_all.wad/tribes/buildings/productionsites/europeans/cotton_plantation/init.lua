push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/amazons/cassava_plantation/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_cotton_farm",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Cotton Plantation"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        idle = {hotspot = {92, 73}},
        unoccupied = {hotspot = {92, 73}},
    },
    
    size = "big",
    buildcost = {
        granite = 3,
        ironwood = 3,
        rope = 2
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2,
        rope = 1
    },

    aihints = {
        space_consumer = true,
        prohibited_till = 1800,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        amazons_cassava_farmer = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=plant_cotton",
                "call=harvest_cotton",
            }
        },
        plant_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting cotton because ...
            descname = _("planting cotton"),
            actions = {
                "callworker=plant_cotton",
                "sleep=duration:10s"
            }
        },
        harvest_cotton = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting cotton because ...
            descname = _("harvesting cotton"),
            actions = {
                "return=skipped unless economy needs cotton",
                "callworker=harvest_cotton",
                "sleep=duration:4s",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fields"),
        heading = _("Out of Fields"),
        message = pgettext ("europeans_building", "The farmer working at this cotton plantation has no cleared soil to plant her seeds."),
        productivity_threshold = 30
    },
}

pop_textdomain()
