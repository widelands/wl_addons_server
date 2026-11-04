push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/berry_farm/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_fruit_farm_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Advanced Berry Farm"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {40, 55}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {40, 73},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            basename = "idle",
            hotspot = {40, 73},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "small",

    aihints = {
        space_consumer = true,
        prohibited_till = 3600,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_gardener_advanced = 2
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=planting_berry_bushes",
                "call=gathering_berries",
            }
        },
        planting_berry_bushes = {
            -- TRANSLATORS: Completed/Skipped/Did not start planting bushes because ...
            descname = _("planting bushes"),
            actions = {
                "return=skipped unless economy needs fruit or economy needs honey",
                "callworker=plant_berrybush",
                "sleep=duration:21s",
                "callworker=bees"
            }
        },
        gathering_berries = {
            -- TRANSLATORS: Completed/Skipped/Did not start gathering berries because ...
            descname = _("gathering berries"),
            actions = {
                "return=skipped unless economy needs fruit",
                "sleep=duration:21s",
                "callworker=harvest_berrybush",
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fields"),
        heading = _("Out of Fields"),
        message = pgettext("europeans_building", "The fruit farmer working at this farm has no cleared soil to plant his berrybushes."),
        productivity_threshold = 30
    },
}

pop_textdomain()
