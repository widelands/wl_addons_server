push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_craft",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Craft products market"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
      idle = {
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 87, 113 }
      },
      working = {
         basename = "idle",
         frames = 1,
         columns = 1,
         rows = 1,
         hotspot = { 87, 113 }
      }
    },
    
    size = "medium",
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
        basic_amount = 1,
        very_weak_ai_limit = 2,
        weak_ai_limit = 4,
        normal_ai_limit = 6,
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 1
    },

    inputs = {
        { name = "gold", amount = 4 },
        { name = "blackwood", amount = 10 },
        { name = "planks", amount = 10 },
        { name = "cloth", amount = 10 },
        { name = "armor", amount = 10 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
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
                "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                "call=pausing_production_for_gold",
                "sleep=duration:10s",
                "call=trade_cloth_copper",
                "sleep=duration:10s",
                "call=trade_blackwood_copper",
                "sleep=duration:10s",
                "call=trade_armor_copper",
                "sleep=duration:10s",
                "call=trade_planks_copper"
            }
        },
        trading_for_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for silver coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_silver",
                "return=skipped when economy needs coin_gold and not economy needs coin_silver",
                "call=pausing_production_for_gold",
                "sleep=duration:10s",
                "call=trade_cloth_silver",
                "sleep=duration:10s",
                "call=trade_blackwood_silver",
                "sleep=duration:10s",
                "call=trade_armor_silver",
                "sleep=duration:10s",
                "call=trade_planks_silver"
            }
        },
        trading_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = pgettext("europeans_building", "trading food for gold coins"),
            actions = {
                "return=skipped when economy needs coin_copper and not economy needs coin_gold",
                "return=skipped when economy needs coin_silver and not economy needs coin_gold",
                "call=pausing_production_for_gold",
                "sleep=duration:10s",
                "call=trade_cloth_gold",
                "sleep=duration:10s",
                "call=trade_blackwood_gold",
                "sleep=duration:10s",
                "call=trade_armor_gold",
                "sleep=duration:10s",
                "call=trade_planks_gold"
            }
        },
        pausing_production_for_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production because ...
            descname = pgettext("europeans_building", "pausing trading of gold"),
            actions = {
                "return=skipped when site has gold:4",
                "sleep=duration:15m",
            }
        },
        trade_blackwood_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has blackwood:2",
                "return=skipped unless site has gold",
                "consume=blackwood:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_blackwood_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has blackwood:3",
                "return=skipped unless site has gold",
                "consume=blackwood:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_blackwood_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has blackwood:4",
                "return=skipped unless site has gold",
                "consume=blackwood:4 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_planks_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has planks:2",
                "return=skipped unless site has gold",
                "consume=planks:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_planks_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has planks:3",
                "return=skipped unless site has gold",
                "consume=planks:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_planks_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has planks:4",
                "return=skipped unless site has gold",
                "consume=planks:4 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_cloth_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has cloth:2",
                "return=skipped unless site has gold",
                "consume=cloth:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_cloth_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has cloth:3",
                "return=skipped unless site has gold",
                "consume=cloth:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_cloth_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has cloth:4",
                "return=skipped unless site has gold",
                "consume=cloth:4 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
        trade_armor_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has armor:2",
                "return=skipped unless site has gold",
                "consume=armor:2 gold",
                "animate=working duration:30s",
                "produce=coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_armor_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has armor:3",
                "return=skipped unless site has gold",
                "consume=armor:3 gold",
                "animate=working duration:30s",
                "produce=coin_silver:2",
                "sleep=duration:30s",
            }
        },
        trade_armor_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless site has armor:4",
                "return=skipped unless site has gold",
                "consume=armor:4 gold",
                "animate=working duration:30s",
                "produce=coin_gold:2",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
