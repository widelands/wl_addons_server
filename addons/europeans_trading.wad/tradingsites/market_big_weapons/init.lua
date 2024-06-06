push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_weapons",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Weapon Market"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 86, 91 },
      },
      working = {
         basename = "idle",
         hotspot = { 86, 91 },
      }
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
        { name = "helmet_mask", amount = 4 },
        { name = "spear_advanced", amount = 4 },
        { name = "shield_steel", amount = 4 },
        { name = "ax_broad", amount = 4 },
        { name = "shield_advanced", amount = 4 },
        { name = "sword_broad", amount = 4 }
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
                "call=trade_helmet_mask_copper",
                "sleep=duration:10s",
                "call=trade_spear_advanced_copper",
                "sleep=duration:10s",
                "call=trade_shield_steel_copper",
                "sleep=duration:10s",
                "call=trade_ax_broad_copper",
                "sleep=duration:10s",
                "call=trade_shield_advanced_copper",
                "sleep=duration:10s",
                "call=trade_sword_broad_copper",
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
                "call=trade_helmet_mask_silver",
                "sleep=duration:10s",
                "call=trade_spear_advanced_silver",
                "sleep=duration:10s",
                "call=trade_shield_steel_silver",
                "sleep=duration:10s",
                "call=trade_ax_broad_silver",
                "sleep=duration:10s",
                "call=trade_shield_advanced_silver",
                "sleep=duration:10s",
                "call=trade_sword_broad_silver",
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading goods for gold coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "sleep=duration:10s",
                "call=trade_helmet_mask_gold",
                "sleep=duration:10s",
                "call=trade_spear_advanced_gold",
                "sleep=duration:10s",
                "call=trade_shield_steel_gold",
                "sleep=duration:10s",
                "call=trade_ax_broad_gold",
                "sleep=duration:10s",
                "call=trade_shield_advanced_gold",
                "sleep=duration:10s",
                "call=trade_sword_broad_gold",
            }
        },
        trade_helmet_mask_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs helmet_mask and not economy needs coin_copper",
                "return=skipped unless site has helmet_mask",
                "return=skipped unless site has gold",
                "consume=helmet_mask gold",
                "animate=working duration:1m",
                "produce=coin_copper:3",
                "sleep=duration:1m",
            }
        },
        trade_helmet_mask_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs helmet_mask and not economy needs coin_silver",
                "return=skipped unless site has helmet_mask",
                "return=skipped unless site has gold",
                "consume=helmet_mask gold",
                "animate=working duration:1m",
                "produce=coin_silver:2",
                "sleep=duration:1m",
            }
        },
        trade_helmet_mask_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs helmet_mask and not economy needs coin_gold",
                "return=skipped unless site has helmet_mask",
                "return=skipped unless site has gold",
                "consume=helmet_mask gold",
                "animate=working duration:1m",
                "produce=coin_gold",
                "sleep=duration:1m",
            }
        },
        trade_spear_advanced_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs spear_advanced and not economy needs coin_copper",
                "return=skipped unless site has spear_advanced",
                "return=skipped unless site has gold",
                "consume=spear_advanced gold",
                "animate=working duration:1m",
                "produce=coin_copper:3",
                "sleep=duration:1m",
            }
        },
        trade_spear_advanced_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs spear_advanced and not economy needs coin_silver",
                "return=skipped unless site has spear_advanced",
                "return=skipped unless site has gold",
                "consume=spear_advanced gold",
                "animate=working duration:1m",
                "produce=coin_silver:2",
                "sleep=duration:1m",
            }
        },
        trade_spear_advanced_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs spear_advanced and not economy needs coin_gold",
                "return=skipped unless site has spear_advanced",
                "return=skipped unless site has gold",
                "consume=spear_advanced gold",
                "animate=working duration:1m",
                "produce=coin_gold",
                "sleep=duration:1m",
            }
        },
        trade_shield_steel_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs shield_steel and not economy needs coin_copper",
                "return=skipped unless site has shield_steel",
                "return=skipped unless site has gold",
                "consume=shield_steel gold",
                "animate=working duration:1m",
                "produce=coin_copper:3",
                "sleep=duration:1m",
            }
        },
        trade_shield_steel_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs shield_steel and not economy needs coin_silver",
                "return=skipped unless site has shield_steel",
                "return=skipped unless site has gold",
                "consume=shield_steel gold",
                "animate=working duration:1m",
                "produce=coin_silver:2",
                "sleep=duration:1m",
            }
        },
        trade_shield_steel_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs shield_steel and not economy needs coin_gold",
                "return=skipped unless site has shield_steel",
                "return=skipped unless site has gold",
                "consume=shield_steel gold",
                "animate=working duration:1m",
                "produce=coin_gold",
                "sleep=duration:1m",
            }
        },
        trade_ax_broad_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs ax_broad and not economy needs coin_copper",
                "return=skipped unless site has ax_broad",
                "return=skipped unless site has gold",
                "consume=ax_broad gold",
                "animate=working duration:1m",
                "produce=coin_copper:3",
                "sleep=duration:1m",
            }
        },
        trade_ax_broad_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs ax_broad and not economy needs coin_silver",
                "return=skipped unless site has ax_broad",
                "return=skipped unless site has gold",
                "consume=ax_broad gold",
                "animate=working duration:1m",
                "produce=coin_silver:2",
                "sleep=duration:1m",
            }
        },
        trade_ax_broad_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs ax_broad and not economy needs coin_gold",
                "return=skipped unless site has ax_broad",
                "return=skipped unless site has gold",
                "consume=ax_broad gold",
                "animate=working duration:1m",
                "produce=coin_gold",
                "sleep=duration:1m",
            }
        },
        trade_shield_advanced_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs shield_advanced and not economy needs coin_copper",
                "return=skipped unless site has shield_advanced",
                "return=skipped unless site has gold:2",
                "consume=shield_advanced gold:2",
                "animate=working duration:1m",
                "produce=coin_copper:6",
                "sleep=duration:1m",
            }
        },
        trade_shield_advanced_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs shield_advanced and not economy needs coin_silver",
                "return=skipped unless site has shield_advanced",
                "return=skipped unless site has gold:2",
                "consume=shield_advanced gold:2",
                "animate=working duration:1m",
                "produce=coin_silver:4",
                "sleep=duration:1m",
            }
        },
        trade_shield_advanced_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs shield_advanced and not economy needs coin_gold",
                "return=skipped unless site has shield_advanced",
                "return=skipped unless site has gold:2",
                "consume=shield_advanced gold:2",
                "animate=working duration:1m",
                "produce=coin_gold:2",
                "sleep=duration:1m",
            }
        },
        trade_sword_broad_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs sword_broad and not economy needs coin_copper",
                "return=skipped unless site has sword_broad",
                "return=skipped unless site has gold:2",
                "consume=sword_broad gold:2",
                "animate=working duration:1m",
                "produce=coin_copper:6",
                "sleep=duration:1m",
            }
        },
        trade_sword_broad_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs sword_broad and not economy needs coin_silver",
                "return=skipped unless site has sword_broad",
                "return=skipped unless site has gold:2",
                "consume=sword_broad gold:2",
                "animate=working duration:1m",
                "produce=coin_silver:4",
                "sleep=duration:1m",
            }
        },
        trade_sword_broad_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs sword_broad and not economy needs coin_gold",
                "return=skipped unless site has sword_broad",
                "return=skipped unless site has gold:2",
                "consume=sword_broad gold:2",
                "animate=working duration:1m",
                "produce=coin_gold:2",
                "sleep=duration:1m",
            }
        },
    },
}

pop_textdomain()
