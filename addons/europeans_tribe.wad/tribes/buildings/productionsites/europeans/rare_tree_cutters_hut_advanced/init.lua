push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/amazons/rare_tree_cutters_hut/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_rare_tree_cutters_hut_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Rare Tree Cutter’s Hut"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {hotspot = {40, 66}},
        unoccupied = {hotspot = {39, 66}}
    },

    size = "small",

    aihints = {
        requires_supporters = true,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        europeans_lumberjack_advanced = 2
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "call=harvest_balsa",
                "call=harvest_rubber",
                "call=harvest_ironwood",
                "call=harvest_liana",
                "call=harvest_log",
            },
        },
        harvest_balsa = {
            -- TRANSLATORS: Completed/Skipped/Did not start cutting trees because ...
            descname = _("harvesting balsa"),
            actions = {
                "return=skipped unless economy needs balsa",
                "callworker=harvest_balsa",
                "sleep=duration:12s"
            },
        },
        harvest_ironwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start cutting trees because ...
            descname = _("harvesting ironwood"),
            actions = {
                "return=skipped unless economy needs ironwood",
                "callworker=harvest_ironwood",
                "sleep=duration:12s"
            },
        },
        harvest_liana = {
            -- TRANSLATORS: Completed/Skipped/Did not start cutting liana because ...
            descname = _("cutting lianas"),
            actions = {
                "return=skipped unless economy needs liana",
                "callworker=harvest_liana",
                "sleep=duration:30s",
            },
        },
        harvest_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start cutting trees because ...
            descname = _("harvesting log"),
            actions = {
                "return=skipped when economy needs balsa",
                "return=skipped when economy needs ironwood",
                "return=skipped when economy needs liana",
                "return=skipped when economy needs rubber",
                "callworker=harvest_log",
                "sleep=duration:12s"
            },
        },
        harvest_rubber = {
            -- TRANSLATORS: Completed/Skipped/Did not start cutting trees because ...
            descname = _("harvesting rubber"),
            actions = {
                "return=skipped unless economy needs rubber",
                "callworker=harvest_rubber",
                "sleep=duration:12s"
            },
        },
    },
}

pop_textdomain()
