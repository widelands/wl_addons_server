push_textdomain("europeans_all.wad", true)

-- local dirname = path.dirname(__file__)
local dirname = "tribes/buildings/warehouses/barbarians/warehouse/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_store_plants",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Plants Store"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            rows = 1,
            columns = 1,
            hotspot = { 60, 78 }
        },
        working = {
            basename = "idle",
            frames = 1,
            rows = 1,
            columns = 1,
            hotspot = { 60, 78 }
        },
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 60, 78 }
        },
    },
     
    size = "medium",
    buildcost = {
        granite = 3,
        grout = 3,
        blackwood = 3,
        reed = 2
    },
    return_on_dismantle = {
        scrap_wood = 2,
        granite = 2,
        grout = 2
    },
    
    aihints = {
        prohibited_till = 10800,
        forced_after = 14400,
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
        { name = "reed", amount = 12 },
        { name = "cotton", amount = 12 },
        { name = "rope", amount = 12 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skimealpped/Did not start trading because ...
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
                "call=trade_reed_copper",
                "sleep=duration:30s",
                "call=trade_cotton_copper",
                "sleep=duration:30s",
                "call=trade_rope_copper"
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
                "call=trade_reed_silver",
                "sleep=duration:30s",
                "call=trade_cotton_silver",
                "sleep=duration:30s",
                "call=trade_rope_silver"
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
                "call=trade_reed_gold",
                "sleep=duration:30s",
                "call=trade_cotton_gold",
                "sleep=duration:30s",
                "call=trade_rope_gold"
            }
        },
        trade_reed_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs reed",
                "return=skipped unless site has gold",
                "consume=reed:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_reed_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs reed",
                "return=skipped unless site has gold",
                "consume=reed:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_reed_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs reed",
                "return=skipped unless site has gold",
                "consume=reed:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_cotton_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cotton",
                "return=skipped unless site has gold",
                "consume=cotton:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:3",
                "sleep=duration:30s",
            }
        },
        trade_cotton_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cotton",
                "return=skipped unless site has gold",
                "consume=cotton:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:3",
                "sleep=duration:30s",
            }
        },
        trade_cotton_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs cotton",
                "return=skipped unless site has gold",
                "consume=cotton:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:3",
                "sleep=duration:30s",
            }
        },
        trade_rope_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs rope",
                "return=skipped unless site has gold",
                "consume=rope:2 gold",
                "animate=working duration:20s",
                "produce=coin_copper:4",
                "sleep=duration:30s",
            }
        },
        trade_rope_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs rope",
                "return=skipped unless site has gold",
                "consume=rope:3 gold",
                "animate=working duration:20s",
                "produce=coin_silver:4",
                "sleep=duration:30s",
            }
        },
        trade_rope_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs rope",
                "return=skipped unless site has gold",
                "consume=rope:4 gold",
                "animate=working duration:20s",
                "produce=coin_gold:4",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
