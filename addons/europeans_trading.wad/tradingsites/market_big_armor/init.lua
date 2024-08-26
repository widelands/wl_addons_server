push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_armor",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Armor Market"),
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
        brick = 4,
        grout = 4,
        planks = 4,
        marble = 4,
        marble_column = 2,
        cloth = 2,
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
        europeans_trader = 2
    },

    inputs = {
        { name = "gold", amount = 4 },
        { name = "armor", amount = 8 },
        { name = "armor_processed", amount = 8 },
        { name = "armor_compressed", amount = 8 },
        { name = "armor_advanced", amount = 8 }
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
                "call=trade_armor_copper",
                "sleep=duration:10s",
                "call=trade_armor_processed_copper",
                "sleep=duration:10s",
                "call=trade_armor_compressed_copper",
                "sleep=duration:10s",
                "call=trade_armor_advanced_copper",
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
                "call=trade_armor_silver",
                "sleep=duration:10s",
                "call=trade_armor_processed_silver",
                "sleep=duration:10s",
                "call=trade_armor_compressed_silver",
                "sleep=duration:10s",
                "call=trade_armor_advanced_silver",
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading goods for gold coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "sleep=duration:10s",
                "call=trade_armor_gold",
                "sleep=duration:10s",
                "call=trade_armor_processed_gold",
                "sleep=duration:10s",
                "call=trade_armor_compressed_gold",
                "sleep=duration:10s",
                "call=trade_armor_advanced_gold",
            }
        },
        trade_armor_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor and not economy needs coin_copper",
                "return=skipped unless site has armor:2",
                "return=skipped unless site has gold",
                "consume=armor:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:2",
                "sleep=duration:1m",
            }
        },
        trade_armor_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor and not economy needs coin_silver",
                "return=skipped unless site has armor:3",
                "return=skipped unless site has gold",
                "consume=armor:3 gold",
                "animate=working duration:1m",
                "produce=coin_silver",
                "sleep=duration:1m",
            }
        },
        trade_armor_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor and not economy needs coin_gold",
                "return=skipped unless site has armor:4",
                "return=skipped unless site has gold",
                "consume=armor:4 gold",
                "animate=working duration:1m",
                "produce=coin_gold",
                "sleep=duration:1m",
            }
        },
        trade_armor_processed_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor_processed and not economy needs coin_copper",
                "return=skipped unless site has armor_processed:2",
                "return=skipped unless site has gold",
                "consume=armor_processed:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:2",
                "sleep=duration:1m",
            }
        },
        trade_armor_processed_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor_processed and not economy needs coin_silver",
                "return=skipped unless site has armor_processed:3",
                "return=skipped unless site has gold",
                "consume=armor_processed:3 gold",
                "animate=working duration:1m",
                "produce=coin_silver:2",
                "sleep=duration:1m",
            }
        },
        trade_armor_processed_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor_processed and not economy needs coin_gold",
                "return=skipped unless site has armor_processed:4",
                "return=skipped unless site has gold",
                "consume=armor_processed:4 gold",
                "animate=working duration:1m",
                "produce=coin_gold:2",
                "sleep=duration:1m",
            }
        },
        trade_armor_compressed_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor_compressed and not economy needs coin_copper",
                "return=skipped unless site has armor_compressed:2",
                "return=skipped unless site has gold",
                "consume=armor_compressed:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:3",
                "sleep=duration:1m",
            }
        },
        trade_armor_compressed_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor_compressed and not economy needs coin_silver",
                "return=skipped unless site has armor_compressed:3",
                "return=skipped unless site has gold",
                "consume=armor_compressed:3 gold",
                "animate=working duration:1m",
                "produce=coin_silver:3",
                "sleep=duration:1m",
            }
        },
        trade_armor_compressed_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor_compressed and not economy needs coin_gold",
                "return=skipped unless site has armor_compressed:4",
                "return=skipped unless site has gold",
                "consume=armor_compressed:4 gold",
                "animate=working duration:1m",
                "produce=coin_gold:3",
                "sleep=duration:1m",
            }
        },
        trade_armor_advanced_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor_advanced and not economy needs coin_copper",
                "return=skipped unless site has armor_advanced:2",
                "return=skipped unless site has gold",
                "consume=armor_advanced:2 gold",
                "animate=working duration:1m",
                "produce=coin_copper:4",
                "sleep=duration:1m",
            }
        },
        trade_armor_advanced_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor_advanced and not economy needs coin_silver",
                "return=skipped unless site has armor_advanced:3",
                "return=skipped unless site has gold",
                "consume=armor_advanced:3 gold",
                "animate=working duration:1m",
                "produce=coin_silver:4",
                "sleep=duration:1m",
            }
        },
        trade_armor_advanced_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped when economy needs armor_advanced and not economy needs coin_gold",
                "return=skipped unless site has armor_advanced:4",
                "return=skipped unless site has gold",
                "consume=armor_advanced:4 gold",
                "animate=working duration:1m",
                "produce=coin_gold:4",
                "sleep=duration:1m",
            }
        },
    },
}

pop_textdomain()
