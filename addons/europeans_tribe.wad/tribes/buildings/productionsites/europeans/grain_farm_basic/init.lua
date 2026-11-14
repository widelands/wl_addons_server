push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/barbarians/farm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_grain_farm_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Basic Grain Farm"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = { 69, 76 },
        },
    },
    spritesheets = {
        idle = {
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 69, 76 }
        },
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 69, 76 }
        },
        working = {
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 69, 76 }
        },
    },
    
    size = "big",
    enhancement = {
        name = "europeans_grain_farm_level_1",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            planks = 2
        },
        enhancement_return_on_dismantle = {
            brick = 1,
            grout = 1,
            planks = 1
        }
    },
    buildcost = {
        granite = 3,
        blackwood = 3,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 2
    },

    aihints = {
        space_consumer = true,
        prohibited_till = 1800,
        basic_amount = 3,
        very_weak_ai_limit = 3,
        weak_ai_limit = 4
    },

    working_positions = {
        barbarians_farmer = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=plant",
                "call=harvest",
            }
        },
        plant = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting wheat because ...
            descname = _("planting wheat"),
            actions = {
                "callworker=plant",
                "animate=working duration:7s",
                "sleep=duration:3s"
            }
        },
        harvest = {
            -- TRANSLATORS: Completed/Skipped/Did not start harvesting wheat because ...
            descname = _("harvesting wheat"),
            actions = {
                "return=skipped unless economy needs wheat",
                "callworker=harvest",
                "animate=working duration:3s",
                "sleep=duration:1s"
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
