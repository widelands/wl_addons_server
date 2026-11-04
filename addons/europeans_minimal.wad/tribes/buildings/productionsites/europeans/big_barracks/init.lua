push_textdomain("europeans_tribe.wad", true)

local dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_big_barracks",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Big Barracks"),
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
        log = 2,
        granite = 4,
        ironwood = 2,
        clay = 2,
        reed = 3,
        balsa = 2,
        marble = 2,
        quartz = 2
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 3,
        marble = 1,
        clay = 1,
        reed = 1,
        quartz = 1
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        prohibited_till = 1800
    },

    working_positions = {
        europeans_recruit = 2
    },

    inputs = {
        { name = "europeans_recruit", amount = 6 },
        { name = "coin_copper", amount = 2 },
        { name = "coin_silver", amount = 2 },
        { name = "coin_gold", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=recruit_soldier_gold",
                "sleep=duration:30s",
                "call=recruit_soldier_silver",
                "sleep=duration:30s",
                "call=recruit_soldier_copper",
                "return=skipped"
            }
        },
        recruit_soldier_copper = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting soldier with copper coin"),
            actions = {
                "return=skipped unless economy needs europeans_soldier",
                "return=failed unless site has coin_copper",
                "consume=europeans_recruit",
                "animate=working duration:25s",
                "consume=coin_copper",
                "animate=working duration:5s",
                "recruit=europeans_soldier"
            }
        },
        recruit_soldier_silver = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting soldier with silver coin"),
            actions = {
                "return=skipped unless economy needs europeans_soldier",
                "return=failed unless site has coin_silver",
                "consume=europeans_recruit:2",
                "animate=working duration:30s",
                "consume=coin_silver",
                "animate=working duration:5s",
                "recruit=europeans_soldier:2"
            }
        },
        recruit_soldier_gold = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting soldier with gold coin"),
            actions = {
                "return=skipped unless economy needs europeans_soldier",
                "return=failed unless site has coin_gold",
                "consume=europeans_recruit:3",
                "animate=working duration:35s",
                "consume=coin_gold",
                "animate=working duration:5s",
                "recruit=europeans_soldier:3"
            }
        },
    },
}


pop_textdomain()

