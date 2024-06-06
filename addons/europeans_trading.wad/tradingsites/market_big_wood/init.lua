push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_wood",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Wood Market"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 64, 106 }
      },
      working = {
         basename = "idle",
         hotspot = { 64, 106 }
      },
    },
   
    size = "big",
    destructible = true,
    
    buildcost = {
        planks = 4,
        brick = 4,
        marble = 4,
        marble_column = 2,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4,
        marble = 5,
        quartz = 1,
        diamond = 1
    },
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 1,
        normal_ai_limit = 2,
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 1
    },

    inputs = {
        { name = "gold", amount = 4 },
        { name = "armor_wooden", amount = 8 },
        { name = "boots_wooden", amount = 8 },
        { name = "helmet_wooden", amount = 8 },
        { name = "spear_wooden", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trading_for_copper",
                "sleep=duration:15s",
                "call=trading_for_silver",
                "sleep=duration:15s",
                "call=trading_for_gold"
            }
        },
        trading_for_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading goods for copper coins"),
            actions = {
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "sleep=duration:10s",
                "call=trade_armor_wooden_copper",
                "sleep=duration:10s",
                "call=trade_boots_wooden_copper",
                "sleep=duration:10s",
                "call=trade_helmet_wooden_copper",
                "sleep=duration:10s",
                "call=trade_spear_wooden_copper",
                "sleep=duration:10s",
            }
        },
        trading_for_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading goods for silver coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "sleep=duration:10s",
                "call=trade_armor_wooden_silver",
                "sleep=duration:10s",
                "call=trade_boots_wooden_silver",
                "sleep=duration:10s",
                "call=trade_helmet_wooden_silver",
                "sleep=duration:10s",
                "call=trade_spear_wooden_silver",
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading goods for gold coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "sleep=duration:10s",
                "call=trade_armor_wooden_gold",
                "sleep=duration:10s",
                "call=trade_boots_wooden_gold",
                "sleep=duration:10s",
                "call=trade_helmet_wooden_gold",
                "sleep=duration:10s",
                "call=trade_spear_wooden_gold",
            }
        },
        trade_armor_wooden_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor_wooden and not economy needs coin_copper",
                "return=skipped unless site has armor_wooden:2",
                "return=skipped unless site has gold",
                "consume=armor_wooden:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:2",
                "sleep=duration:1m",
            }
        },
        trade_armor_wooden_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor_wooden and not economy needs coin_silver",
                "return=skipped unless site has armor_wooden:3",
                "return=skipped unless site has gold",
                "consume=armor_wooden:3 gold",
                "animate=working duration:1m",
                "produce=coin_silver:2",
                "sleep=duration:1m",
            }
        },
        trade_armor_wooden_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor_wooden and not economy needs coin_gold",
                "return=skipped unless site has armor_wooden:4",
                "return=skipped unless site has gold",
                "consume=armor_wooden:4 gold",
                "animate=working duration:1m",
                "produce=coin_gold:2",
                "sleep=duration:1m",
            }
        },
        trade_boots_wooden_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs boots_wooden and not economy needs coin_copper",
                "return=skipped unless site has boots_wooden:2",
                "return=skipped unless site has gold",
                "consume=boots_wooden:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:2",
                "sleep=duration:1m",
            }
        },
        trade_boots_wooden_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs boots_wooden and not economy needs coin_silver",
                "return=skipped unless site has boots_wooden:3",
                "return=skipped unless site has gold",
                "consume=boots_wooden:3 gold",
                "animate=working duration:1m",
                "produce=coin_silver:2",
                "sleep=duration:1m",
            }
        },
        trade_boots_wooden_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs boots_wooden and not economy needs coin_gold",
                "return=skipped unless site has boots_wooden:4",
                "return=skipped unless site has gold",
                "consume=boots_wooden:4 gold",
                "animate=working duration:1m",
                "produce=coin_gold:2",
                "sleep=duration:1m",
            }
        },
        trade_helmet_wooden_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs helmet_wooden and not economy needs coin_copper",
                "return=skipped unless site has helmet_wooden:2",
                "return=skipped unless site has gold",
                "consume=helmet_wooden:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_helmet_wooden_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs helmet_wooden and not economy needs coin_silver",
                "return=skipped unless site has helmet_wooden:3",
                "return=skipped unless site has gold",
                "consume=helmet_wooden:3 gold",
                "animate=working duration:1m",
                "produce=coin_silver:2",
                "sleep=duration:1m",
            }
        },
        trade_helmet_wooden_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs helmet_wooden and not economy needs coin_gold",
                "return=skipped unless site has helmet_wooden:4",
                "return=skipped unless site has gold",
                "consume=helmet_wooden:4 gold",
                "animate=working duration:1m",
                "produce=coin_gold:2",
                "sleep=duration:1m",
            }
        },
        trade_spear_wooden_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs spear_wooden and not economy needs coin_copper",
                "return=skipped unless site has spear_wooden:2",
                "return=skipped unless site has gold",
                "consume=spear_wooden:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:3",
                "sleep=duration:1m",
            }
        },
        trade_spear_wooden_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs spear_wooden and not economy needs coin_silver",
                "return=skipped unless site has spear_wooden:3",
                "return=skipped unless site has gold",
                "consume=spear_wooden:3 gold",
                "animate=working duration:1m",
                "produce=coin_silver:2",
                "sleep=duration:1m",
            }
        },
        trade_spear_wooden_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs spear_wooden and not economy needs coin_gold",
                "return=skipped unless site has spear_wooden:4",
                "return=skipped unless site has gold",
                "consume=spear_wooden:4 gold",
                "animate=working duration:1m",
                "produce=coin_gold:2",
                "sleep=duration:1m",
            }
        },
    },
}

pop_textdomain()
