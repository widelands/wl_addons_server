push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_trainingscamp_level_1",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Trainingscamp Level 1"),
    icon = dirname .. "menu.png",

    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 62, 73 },
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = { 62, 73 },
      }
    },

    size = "big",
    enhancement = {
        name = "europeans_trainingscamp_level_2",
        enhancement_cost = {
            planks = 1,
            cloth = 1,
            granite = 1,
            gold = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 1,
            granite = 1,
            scrap_metal_mixed = 1
        },
    },
    
    aihints = {},

    working_positions = {
        europeans_trainer_basic = 1
    },

    inputs = {
        { name = "europeans_recruit", amount = 3 },
        { name = "ration", amount = 3 },
        { name = "beer", amount = 3 },
        { name = "spear_wooden", amount = 3 },
        { name = "tabard", amount = 3 },
        { name = "quartz", amount = 3 },
        { name = "diamond", amount = 3 }
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=recruit_soldier",
                "call=recruit_trainer",
                "return=skipped"
            }
        },
        recruit_soldier = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting soldier"),
            actions = {
                "return=skipped unless economy needs europeans_soldier",
                "consume=europeans_recruit",
                "consume=tabard spear_wooden ration beer diamond",
                "animate=working duration:90s",
                "recruit=europeans_soldier",
                "consume=europeans_recruit",
                "consume=tabard spear_wooden ration beer quartz",
                "animate=working duration:90s",
                "recruit=europeans_soldier"
            }
        },
        recruit_trainer= {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting trainer"),
            actions = {
                "return=skipped unless economy needs europeans_trainer_basic",
                "consume=europeans_recruit",
                "consume=tabard spear_wooden ration beer quartz,diamond",
                "animate=working duration:180s",
                "recruit=europeans_trainer_basic"
            }
        },
    },
}

pop_textdomain()
