push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_trading_post_food",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Trading Post"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    spritesheets = {
      build = {
         frames = 3,
         columns = 3,
         rows = 1,
         hotspot = { 55, 57 }
      },
      idle = {
         fps = 10,
         frames = 12,
         columns = 6,
         rows = 2,
         hotspot = { 55, 57 }
      },
    },
    
    size = "small",
    destructible = true,
    
    aihints = {},

    working_positions = {
        europeans_food_trader = 1
    },

    inputs = {
        { name = "coin_copper", amount = 12 },
        { name = "coin_silver", amount = 6 },
        { name = "coin_gold", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trade_granite",
                "call=trade_marble",
                "sleep=duration:10s",
                "call=trade_quartz",
                "call=trade_diamond",
                "sleep=duration:10s",
                "call=trade_iron"
            }
        },
        trade_granite = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs granite",
                "callworker=find_pole",
                "return=failed unless site has coin_copper:5",
                "consume=coin_copper:5",
                "callworker=purchase_granite",
                "produce=granite:2",
                "sleep=duration:30s",
            }
        },
        trade_marble = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs marble",
                "callworker=find_pole",
                "return=failed unless site has coin_copper:8",
                "consume=coin_copper:4",
                "callworker=purchase_marble",
                "produce=marble:2",
                "sleep=duration:30s",
            }
        },
        trade_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs quartz",
                "callworker=find_pole",
                "return=failed unless site has coin_copper:4",
                "consume=coin_silver:4",
                "callworker=purchase_quartz",
                "produce=quartz",
                "sleep=duration:30s",
            }
        },
        trade_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs diamond",
                "callworker=find_pole",
                "return=failed unless site has coin_copper:8",
                "consume=coin_gold:4",
                "callworker=purchase_diamond",
                "produce=diamond",
                "sleep=duration:30s",
            }
        },
        trade_iron = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs iron",
                "callworker=find_pole",
                "return=failed unless site has coin_silver:6",
                "consume=coin_silver:4",
                "callworker=purchase_iron",
                "produce=iron",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
