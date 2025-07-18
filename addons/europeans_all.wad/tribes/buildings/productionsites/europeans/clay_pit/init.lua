push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/clay_pit/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_clay_pit",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext ("europeans_building", "Clay Pit"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {40, 52}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {40, 68},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        working = {
            hotspot = {40, 68},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "small",
    buildcost = {
        brick = 2,
        grout = 2,
        reed = 2
    },
    return_on_dismantle = {
        brick = 1,
        grout = 1,
        reed = 1
    },

    aihints = {
        space_consumer = true,
        prohibited_till = 5400,
        basic_amount = 1,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        frisians_claydigger = 1
    },

    inputs = {
        { name = "water", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start making clay because ...
            descname = _("making clay"),
            actions = {
                "return=skipped unless economy needs clay or economy needs fish or economy needs coal",
                -- Fish-producing aqua farms and charcoal burners houses can stop working if the clay pits do so
                "return=failed unless site has water",
                "callworker=dig",
                "consume=water",
                "sleep=duration:22s",
                "animate=working duration:17s",
                "sleep=duration:1s",
                "produce=clay"
            },
        },
    },
    out_of_resource_notification = {
        -- TRANSLATORS: Short for "No Level Ground" for clay pits
        title = _("No Ground"),
        heading = _("No Level Ground"),
        message = pgettext ("europeans_building", "The clay digger working at this clay pit can’t find any level ground in his work area. Consider dismantling this clay pit and rebuilding it somewhere else."),
        productivity_threshold = 33
    },
}

pop_textdomain()
