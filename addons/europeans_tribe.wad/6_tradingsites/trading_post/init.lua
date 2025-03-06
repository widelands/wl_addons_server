push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/scouts_house/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_trading_post",
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
    
    buildcost = {
        granite = 1,
        brick = 1,
        grout = 1,
        planks = 1,
        marble = 1,
        marble_column = 1
    },
    return_on_dismantle = {
        scrap_wood = 1,
        granite = 1,
        marble = 1
    },
    
    aihints = {},

    working_positions = {
        europeans_trader = 1
    },

    inputs = {
        { name = "coin_copper", amount = 12 },
        { name = "coin_silver", amount = 6 },
        { name = "coin_gold", amount = 4 },
        { name = "quartz", amount = 6 },
        { name = "diamond", amount = 4 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "call=trade_granite_copper",
                "call=trade_marble_copper",
                "sleep=duration:30s",
                "call=trade_granite_quartz",
                "call=trade_marble_quartz",
            }
        },
        trade_granite_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs granite",
                "callworker=find_pole",
                "return=failed unless site has coin_copper:5",
                "consume=coin_copper:5",
                "callworker=purchase_granite_copper",
                "produce=granite:2",
                "sleep=duration:30s",
            }
        },
        trade_granite_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs granite",
                "callworker=find_pole",
                "return=failed unless site has quartz:2",
                "consume=quartz:2",
                "callworker=purchase_granite_quartz",
                "produce=granite:6",
                "sleep=duration:30s",
            }
        },
        trade_marble_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs marble",
                "callworker=find_pole",
                "return=failed unless site has coin_copper:8",
                "consume=coin_copper:4",
                "callworker=purchase_marble_copper",
                "produce=marble:2",
                "sleep=duration:30s",
            }
        },
        trade_marble_quartz = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs marble",
                "callworker=find_pole",
                "return=failed unless site has quartz:2",
                "consume=quartz:2",
                "callworker=purchase_marble_quartz",
                "produce=marble:4",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
