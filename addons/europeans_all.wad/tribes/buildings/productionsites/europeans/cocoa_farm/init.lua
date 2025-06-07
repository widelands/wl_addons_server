push_textdomain("tribes")

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/amazons/cocoa_farm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_cocoa_farm",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Cocoa Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = { unoccupied = {hotspot = {92, 73}}},
    spritesheets = { idle = {
        hotspot = {92, 112},
        fps = 8,
        frames = 4,
        columns = 2,
        rows = 2
    }},
    
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
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        amazons_cocoa_farmer = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=plant_cocoa",
                "call=harvest_cocoa",
            }
        },
        plant_cocoa = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting reed because ...
            descname = _("planting cocoa"),
            actions = {
                "callworker=plant",
                "sleep=duration:10s"
            }
        },
        harvest_cocoa = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting reed because ...
            descname = _("harvesting cocoa"),
            actions = {
                "return=skipped unless economy needs cocoa_beans",
                "callworker=harvest",
                "sleep=duration:4s"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fields"),
        heading = _("Out of Fields"),
        message = pgettext("europeans_building", "The cocoa farmer working at this cocoa farm has no cleared soil to plant her seeds."),
        productivity_threshold = 20
    },
}

pop_textdomain()
