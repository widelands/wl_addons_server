push_textdomain("europeans_tribe.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/productionsites/frisians/dikers_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_dikers_house",
    descname = pgettext("europeans_building", "Diker’s House"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
        unoccupied = {
            hotspot = {75, 76}
        }
    },
    spritesheets = {
        idle = {
            hotspot = {75, 95},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
    },

    size = "big",
    enhancement = {
        name = "europeans_gardening_center",
        enhancement_cost = {
            ironwood = 1,
            balsa = 1,
            rope = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1
        }
    },
    buildcost = {
        brick = 3,
        grout = 3,
        reed = 2,
        log = 5
    },
    return_on_dismantle = {
        scrap_wood = 3,
        brick = 2,
        grout = 1,
        reed = 1
    },

    working_positions = {
        europeans_diker = 1
    },
    aihints = {
        needs_water = true,
        very_weak_ai_limit = 2,
        weak_ai_limit = 4
    },

    inputs = {
        { name = "log", amount = 12 },
        { name = "blackwood", amount = 12 },
        { name = "ironwood", amount = 12 },
        { name = "planks", amount = 12 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _("working"),
            actions = {
                "return=skipped unless site has log:6 or site has blackwood:6 or site has ironwood:6",
                "call=build_dike_with_log",
                "call=dike_with_log",
                "call=dike_with_log",
                "sleep=duration:8s",
                "call=build_dike_with_blackwood",
                "call=dike_with_blackwood",
                "call=dike_with_blackwood",
                "sleep=duration:8s",
                "call=build_dike_with_planks",
                "call=dike_with_planks",
                "call=dike_with_planks",
                "sleep=duration:8s",
                "call=build_dike_with_ironwood",
                "call=dike_with_ironwood",
                "call=dike_with_ironwood",
                "sleep=duration:8s"
            }
        },
        build_dike_with_blackwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start building a dike because ...
            descname = _("building a dike"),
            actions = {
                "return=skipped when economy needs blackwood",
                "callworker=check_build",
                "consume=blackwood:4",
                "callworker=build"
            }
        },
        build_dike_with_ironwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start building a dike because ...
            descname = _("building a dike"),
            actions = {
                "return=skipped when economy needs ironwood",
                "callworker=check_build",
                "consume=ironwood:4",
                "callworker=build"
            }
        },
        build_dike_with_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start building a dike because ...
            descname = _("building a dike"),
            actions = {
                "return=skipped unless site has log:4",
                "callworker=check_build",
                "consume=log:4",
                "callworker=build"
            }
        },
        build_dike_with_planks = {
            -- TRANSLATORS: Completed/Skipped/Did not start building a dike because ...
            descname = _("building a dike"),
            actions = {
                "return=skipped when economy needs planks",
                "callworker=check_build",
                "consume=planks:4",
                "callworker=build"
            }
        },
        dike_with_blackwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start diking because ...
            descname = _("diking"),
            actions = {
                "callworker=check_dike",
                "consume=blackwood",
                "callworker=dike"
            }
        },
        dike_with_ironwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start diking because ...
            descname = _("diking"),
            actions = {
                "callworker=check_dike",
                "consume=ironwood",
                "callworker=dike"
            }
        },
        dike_with_log = {
            -- TRANSLATORS: Completed/Skipped/Did not start diking because ...
            descname = _("diking"),
            actions = {
                "callworker=check_dike",
                "consume=log",
                "callworker=dike"
            }
        },
        dike_with_planks = {
            -- TRANSLATORS: Completed/Skipped/Did not start diking because ...
            descname = _("diking"),
            actions = {
                "callworker=check_dike",
                "consume=planks",
                "callworker=dike"
            }
        },
        dummy = {
            -- just a dummy program to fix AI
            descname = "dummy program",
            actions = {
                "produce=ore marble granite",
            },
        },
    },
}
pop_textdomain()
