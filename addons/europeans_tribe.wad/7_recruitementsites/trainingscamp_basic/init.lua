push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/barracks/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_trainingscamp_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Trainingscamp"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = {55, 49}
      },
      working = {
         basename = "idle",
         hotspot = {55, 49}
      }
    },
    spritesheets = {
      build = {
         hotspot = {55, 49},
         frames = 3,
         columns = 1,
         rows = 3
      }
    },
    
    size = "big",
    destructible = true,
       
    buildcost = {
        granite = 4,
        log = 4,
        reed = 2,
        marble = 1,
        marble_column = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 2,
        marble = 2
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_recruit = 2
    },

    inputs = {
        { name = "europeans_recruit", amount = 6 },
        { name = "armor", amount = 6 },
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
                "return=failed unless site has armor",
                "return=failed unless site has coin_copper",
                "consume=europeans_recruit",
                "consume=armor",
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
                "return=failed unless site has armor:2",
                "return=failed unless site has coin_silver",
                "consume=europeans_recruit:2",
                "consume=armor",
                "animate=working duration:15s",
                "consume=armor",
                "animate=working duration:15s",
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
                "return=failed unless site has armor:3",
                "return=failed unless site has coin_gold",
                "consume=europeans_recruit:3",
                "consume=armor",
                "animate=working duration:10s",
                "consume=armor",
                "animate=working duration:10s",
                "consume=armor",
                "animate=working duration:10s",
                "consume=coin_gold",
                "animate=working duration:5s",
                "recruit=europeans_soldier:3"
            }
        },
    },
}

pop_textdomain()

