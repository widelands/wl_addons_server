push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_market_small",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Small Market"),
    animation_directory = dirname,
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 55, 59 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 55, 59 },
      },
    },
    
    size = "medium",
    destructible = true,
    
    buildcost = {
        blackwood = 4,
        planks = 4,
        cloth = 2,
        reed = 2,
        brick = 2,
        grout = 2,
        marble = 2,
        marble_column = 1,
        quartz = 1,
        diamond = 1
    },
    return_on_dismantle = {
        scrap_wood = 6,
        granite = 3,
        marble = 3,
        quartz = 1,
        diamond = 1
    },
    
    aihints = {
          very_weak_ai_limit = 1,
          weak_ai_limit = 2,
          normal_ai_limit = 4,
          prohibited_till = 3600,
          forced_after = 7200
    },

    working_positions = {
        europeans_carrier_1 = 1,
        europeans_carrier_2 = 1,
        europeans_carrier_3 = 1,
        europeans_trader = 1
    },

    inputs = {
        { name = "planks", amount = 2 },
        { name = "gold", amount = 2 },
        { name = "ration", amount = 8 },
        { name = "beer", amount = 8 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trade_ration",
                "call=trade_beer",
                "call=trade_ration_copper",
                "call=trade_beer_copper",
            }
        },
        trade_ration = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_wood",
                "return=skipped when economy needs ration",
                "return=skipped unless site has ration:4",
                "return=failed unless site has planks",
                "consume=ration:4 planks",
                "animate=working duration:15s",
                "produce=coin_wood:3",
                "sleep=duration:30s",
            }
        },
        trade_beer = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_wood",
                "return=skipped when economy needs beer",
                "return=skipped unless site has beer:4",
                "return=failed unless site has planks",
                "consume=beer:4 planks",
                "animate=working duration:15s",
                "produce=coin_wood:3",
                "sleep=duration:30s",
            }
        },
        trade_ration_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_wood or economy needs coin_copper",
                "return=skipped when economy needs ration",
                "return=skipped unless site has gold",
                "return=skipped unless site has ration:4",
                "return=failed unless site has planks",
                "consume=ration:4 planks gold",
                "animate=working duration:15s",
                "produce=coin_wood:2 coin_copper:2",
                "sleep=duration:30s",
            }
        },
        trade_beer_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs coin_wood or economy needs coin_copper",
                "return=skipped when economy needs beer",
                "return=skipped unless site has gold",
                "return=skipped unless site has beer:4",
                "return=failed unless site has planks",
                "consume=beer:4 planks gold",
                "animate=working duration:15s",
                "produce=coin_wood:2 coin_copper:2",
                "sleep=duration:30s",
            }
        },
     },
}

pop_textdomain()
