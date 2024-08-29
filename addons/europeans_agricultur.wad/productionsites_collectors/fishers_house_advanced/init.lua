push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_fishers_house_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Fisher’s House"),
    icon = dirname .. "menu.png",
    size = "small",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            columns = 1,
            rows = 1,
            hotspot = { 41, 59 },
        },
    },

    aihints = {
        needs_water = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3
    },

    working_positions = {
        europeans_fishbreeder = 1
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start fishing because ...
            descname = pgettext("europeans_building", "breeding and fishing"),
            actions = {
                "callworker=breed",
                "sleep=duration:30s",
                "callworker=fish",
                "sleep=duration:30s"
            }
        },
    },
    out_of_resource_notification = {
        -- Translators: Short for "Out of ..." for a resource
        title = _("No Fish"),
        heading = _("Out of Fish"),
        message = pgettext("empire_building", "The fisher working out of this fisher’s house can’t find any fish in his work area."),
    },
}

pop_textdomain()
