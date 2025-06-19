push_textdomain("europeans_all.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_store_animals",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Animal Store"),
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


    size = "medium",
    buildcost = {
        granite = 6,
        planks = 6,
        spidercloth = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 4
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
        { name = "gold", amount = 12 },
        { name = "barbarians_ox", amount = 6 },
        { name = "amazons_tapir", amount = 6 },
        { name = "atlanteans_horse", amount = 6 },
        { name = "empire_donkey", amount = 6 },
        { name = "frisians_reindeer", amount = 6 },
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
                     "return=skipped when economy needs gold and not economy needs coin_copper",
                     "return=skipped when economy needs coin_silver and not economy needs coin_copper",
                     "return=skipped when economy needs coin_gold and not economy needs coin_copper",
                     "sleep=duration:30s",
                     "call=trade_frisians_reindeer_copper",
                     "sleep=duration:30s",
                     "call=trade_empire_donkey_copper",
                     "sleep=duration:30s",
                     "call=trade_atlanteans_horse_copper",
                     "sleep=duration:30s",
                     "call=trade_amazons_tapir_copper",
                     "sleep=duration:30s",
                     "call=trade_barbarians_ox_copper"
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
                     "call=trade_frisians_reindeer_silver",
                     "sleep=duration:30s",
                     "call=trade_empire_donkey_silver",
                     "sleep=duration:30s",
                     "call=trade_atlanteans_horse_silver",
                     "sleep=duration:30s",
                     "call=trade_amazons_tapir_silver",
                     "sleep=duration:30s",
                     "call=trade_barbarians_ox_silver"
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
                     "call=trade_frisians_reindeer_gold",
                     "sleep=duration:30s",
                     "call=trade_empire_donkey_gold",
                     "sleep=duration:30s",
                     "call=trade_atlanteans_horse_gold",
                     "sleep=duration:30s",
                     "call=trade_amazons_tapir_gold",
                     "sleep=duration:30s",
                     "call=trade_barbarians_ox_gold"
                }
          },
          trade_amazons_tapir_copper = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has amazons_tapir",
                     "return=skipped unless site has gold",
                     "consume=amazons_tapir gold",
                     "animate=working duration:20s",
                     "produce=coin_copper:2",
                     "sleep=duration:30s",
                }
          },
          trade_amazons_tapir_silver = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has amazons_tapir:2",
                     "return=skipped unless site has gold",
                     "consume=amazons_tapir:2 gold",
                     "animate=working duration:20s",
                     "produce=coin_silver:2",
                     "sleep=duration:30s",
                }
          },
          trade_amazons_tapir_gold = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has amazons_tapir:3",
                     "return=skipped unless site has gold",
                     "consume=amazons_tapir:3 gold",
                     "animate=working duration:20s",
                     "produce=coin_gold:2",
                     "sleep=duration:30s",
                }
          },
          trade_atlanteans_horse_copper = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has atlanteans_horse",
                     "return=skipped unless site has gold",
                     "consume=atlanteans_horse gold",
                     "animate=working duration:20s",
                     "produce=coin_copper:2",
                     "sleep=duration:30s",
                }
          },
          trade_atlanteans_horse_silver = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has atlanteans_horse:2",
                     "return=skipped unless site has gold",
                     "consume=atlanteans_horse:2 gold",
                     "animate=working duration:20s",
                     "produce=coin_silver:2",
                     "sleep=duration:30s",
                }
          },
          trade_atlanteans_horse_gold = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has atlanteans_horse:3",
                     "return=skipped unless site has gold",
                     "consume=atlanteans_horse:3 gold",
                     "animate=working duration:20s",
                     "produce=coin_gold:2",
                     "sleep=duration:30s",
                }
          },
          trade_barbarians_ox_copper = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has barbarians_ox",
                     "return=skipped unless site has gold",
                     "consume=barbarians_ox gold",
                     "animate=working duration:20s",
                     "produce=coin_copper:2",
                     "sleep=duration:30s",
                }
          },
          trade_barbarians_ox_silver = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has barbarians_ox:2",
                     "return=skipped unless site has gold",
                     "consume=barbarians_ox:2 gold",
                     "animate=working duration:20s",
                     "produce=coin_silver:2",
                     "sleep=duration:30s",
                }
          },
          trade_barbarians_ox_gold = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has barbarians_ox:3",
                     "return=skipped unless site has gold",
                     "consume=barbarians_ox:3 gold",
                     "animate=working duration:20s",
                     "produce=coin_gold:2",
                     "sleep=duration:30s",
                }
          },
          trade_empire_donkey_copper = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has empire_donkey",
                     "return=skipped unless site has gold",
                     "consume=empire_donkey gold",
                     "animate=working duration:20s",
                     "produce=coin_copper:2",
                     "sleep=duration:30s",
                }
          },
          trade_empire_donkey_silver = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has empire_donkey:2",
                     "return=skipped unless site has gold",
                     "consume=empire_donkey:2 gold",
                     "animate=working duration:20s",
                     "produce=coin_silver:2",
                     "sleep=duration:30s",
                }
          },
          trade_empire_donkey_gold = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has empire_donkey:3",
                     "return=skipped unless site has gold",
                     "consume=empire_donkey:3 gold",
                     "animate=working duration:20s",
                     "produce=coin_gold:2",
                     "sleep=duration:30s",
                }
          },
          trade_frisians_reindeer_copper = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has frisians_reindeer",
                     "return=skipped unless site has gold",
                     "consume=frisians_reindeer gold",
                     "animate=working duration:20s",
                     "produce=coin_copper:2",
                     "sleep=duration:30s",
                }
          },
          trade_frisians_reindeer_silver = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has frisians_reindeer:2",
                     "return=skipped unless site has gold",
                     "consume=frisians_reindeer:2 gold",
                     "animate=working duration:20s",
                     "produce=coin_silver:2",
                     "sleep=duration:30s",
                }
          },
          trade_frisians_reindeer_gold = {
                -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
                descname = _("trading"),
                actions = {
                     "return=skipped unless site has frisians_reindeer:3",
                     "return=skipped unless site has gold",
                     "consume=frisians_reindeer:3 gold",
                     "animate=working duration:20s",
                     "produce=coin_gold:2",
                     "sleep=duration:30s",
                }
          },
     },
}
pop_textdomain()
