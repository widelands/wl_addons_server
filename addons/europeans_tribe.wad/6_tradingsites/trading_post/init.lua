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
        
    aihints = {},

    working_positions = {
        europeans_trader = 1
    },

    inputs = {
        { name = "meal", amount = 2 },
        { name = "coin_copper", amount = 8 },
        { name = "coin_silver", amount = 6 },
        { name = "coin_gold", amount = 4 },
        { name = "diamond", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs granite or economy needs marble",
                "return=skipped unless site has meal",
                "consume=meal",
                "sleep=duration:30s",
                "call=trade_granite_copper",
                "sleep=duration:30s",
                "call=trade_granite_diamond"
            }
        },
        trade_granite_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs granite",
                "callworker=find_pole",
                "return=failed unless site has coin_copper:5",
                "consume=coin_copper:2",
                "callworker=purchase_granite_copper",
                "produce=granite:6",
                "sleep=duration:30s",
            }
        },
        trade_granite_diamond = {
            -- TRANSLATORS: Completed/Skipped/Did not start trading because ...
            descname = _("trading"),
            actions = {
                "return=skipped unless economy needs granite",
                "callworker=find_pole",
                "return=failed unless site has diamond:2",
                "consume=diamond:2",
                "callworker=purchase_granite_diamond",
                "produce=granite:12",
                "sleep=duration:30s",
            }
        },
    },
}

pop_textdomain()
