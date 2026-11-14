push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/frisians/warehouse/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_store_grain",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Grain Store"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
        idle = {
            hotspot = {50, 69},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        },
        build = {
           hotspot = {50, 69},
           frames = 4,
           columns = 2,
           rows = 2,
        },
        working = {
            basename = "idle",
            hotspot = {50, 69},
            frames = 10,
            columns = 5,
            rows = 2,
            fps = 10
        }
    },

    size = "medium",
    buildcost = {
        brick = 3,
        grout = 3,
        planks = 3,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        brick = 2,
        grout = 2
    },

    aihints = {
        prohibited_till = 3600,
        forced_after = 7200,
        very_weak_ai_limit = 1,
        weak_ai_limit = 2
    },

    working_positions = {
        atlanteans_trader = 1,
        barbarians_scout = 1,
        amazons_scout = 1,
        atlanteans_scout = 1,
        empire_scout = 1,
        frisians_scout = 1
    },

    inputs = {
        { name = "gold", amount = 8 },
        { name = "corn", amount = 18 },
        { name = "barley", amount = 18 },
        { name = "oat", amount = 18 },
        { name = "rye", amount = 18 },
        { name = "wheat", amount = 18 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skiwoolpped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trading_for_copper",
                "sleep=duration:30s",
                "call=trading_for_silver",
                "sleep=duration:30s",
                "call=trading_for_gold"
            }
        },
        trading_for_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for copper coins"),
            actions = {
                "return=skipped when economy needs gold and not economy needs coin_copper",
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "sleep=duration:30s",
                "call=trade_corn_copper",
                "sleep=duration:30s",
                "call=trade_barley_copper",
                "sleep=duration:30s",
                "call=trade_oat_copper",
                "sleep=duration:30s",
                "call=trade_rye_copper",
                "sleep=duration:30s",
                "call=trade_wheat_copper"
            }
        },
        trading_for_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for silver coins"),
            actions = {
                "return=skipped when economy needs gold and not economy needs coin_silver",
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "sleep=duration:30s",
                "call=trade_corn_silver",
                "sleep=duration:30s",
                "call=trade_barley_silver",
                "sleep=duration:30s",
                "call=trade_oat_silver",
                "sleep=duration:30s",
                "call=trade_rye_silver",
                "sleep=duration:30s",
                "call=trade_wheat_silver"
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for gold coins"),
            actions = {
                "return=skipped when economy needs gold and not economy needs coin_gold",
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "sleep=duration:30s",
                "call=trade_corn_gold",
                "sleep=duration:30s",
                "call=trade_barley_gold",
                "sleep=duration:30s",
                "call=trade_oat_gold",
                "sleep=duration:30s",
                "call=trade_rye_gold",
                "sleep=duration:30s",
                "call=trade_wheat_gold"
            }
        },
        trade_barley_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs barley",
                "return=skipped unless site has gold",
                "consume=barley:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_barley_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs barley",
                "return=skipped unless site has gold",
                "consume=barley:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_barley_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs barley",
                "return=skipped unless site has gold",
                "consume=barley:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_corn_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs corn",
                "return=skipped unless site has gold",
                "consume=corn:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:3",
                "sleep=duration:30s",
            }
        },
        trade_corn_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs corn",
                "return=skipped unless site has gold",
                "consume=corn:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:3",
                "sleep=duration:30s",
            }
        },
        trade_corn_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs corn",
                "return=skipped unless site has gold",
                "consume=corn:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:3",
                "sleep=duration:30s",
            }
        },
        trade_oat_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs oat",
                "return=skipped unless site has gold",
                "consume=oat:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:3",
                "sleep=duration:30s",
            }
        },
        trade_oat_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs oat",
                "return=skipped unless site has gold",
                "consume=oat:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:3",
                "sleep=duration:30s",
            }
        },
        trade_oat_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs oat",
                "return=skipped unless site has gold",
                "consume=oat:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:3",
                "sleep=duration:30s",
            }
        },
        trade_rye_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs rye",
                "return=skipped unless site has gold",
                "consume=rye:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_rye_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs rye",
                "return=skipped unless site has gold",
                "consume=rye:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_rye_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs rye",
                "return=skipped unless site has gold",
                "consume=rye:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
        trade_wheat_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs wheat",
                "return=skipped unless site has gold",
                "consume=wheat:4 gold",
                "animate=working duration:20s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_wheat_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs wheat",
                "return=skipped unless site has gold",
                "consume=wheat:6 gold",
                "animate=working duration:20s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_wheat_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs wheat",
                "return=skipped unless site has gold",
                "consume=wheat:8 gold",
                "animate=working duration:20s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
