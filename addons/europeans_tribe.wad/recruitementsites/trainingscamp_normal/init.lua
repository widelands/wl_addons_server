push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_trainingscamp_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Trainingscamp"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = {50, 56}
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = {50, 56}
      },
    },
    spritesheets = {
      build = {
         hotspot = {50, 56},
         frames = 3,
         columns = 1,
         rows = 3
      }
    },
    
    size = "big",
    enhancement = {
        name = "europeans_trainingscamp_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble_column = 2,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2,
            scrap_metal_mixed = 1
        },
    },
    
    aihints = {},

    working_positions = {
        europeans_trainer_normal = 1,
        europeans_trainer_basic = 1
    },

    inputs = {
        { name = "europeans_recruit", amount = 4 },
        { name = "coin_wood", amount = 4 },
        { name = "quartz", amount = 4 },
        { name = "diamond", amount = 4 }
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=recruit_soldier",
                "return=skipped"
            }
        },
        recruit_soldier = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting soldier"),
            actions = {
                "return=skipped unless economy needs europeans_soldier",
                "consume=europeans_recruit",
                "consume=coin_wood diamond",
                "animate=working duration:80s",
                "recruit=europeans_soldier",
                "consume=europeans_recruit",
                "consume=coin_wood quartz",
                "animate=working duration:80s",
                "recruit=europeans_soldier"
            }
        },
    },
}

pop_textdomain()

