push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_trainingscamp_level_4",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Trainingscamp Level 4"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    -- TODO(Nordfriese): Make animations.
    animations = {
      idle = {
         hotspot = {51, 71}
      },
      working = {
         basename = "idle", -- TODO(GunChleoc): No animation yet.
         hotspot = {51, 71}
      },
    },

    spritesheets = {
      build = {
         hotspot = {51, 71},
         frames = 3,
         columns = 1,
         rows = 3
      }
    },

    size = "big",

    aihints = {},

    working_positions = {
        europeans_trainer_advanced = 1
    },

    inputs = {
        { name = "europeans_recruit", amount = 4 },
        { name = "meal", amount = 4 },
        { name = "wine", amount = 4 },
        { name = "spear_wooden", amount = 4 },
        { name = "armor", amount = 4 },
        { name = "quartz", amount = 4 },
        { name = "diamond", amount = 4 }
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
                "consume=armor spear_wooden meal wine diamond",
                "animate=working duration:60s",
                "recruit=europeans_soldier",
                "consume=europeans_recruit",
                "consume=armor spear_wooden meal wine quartz",
                "animate=working duration:60s",
                "recruit=europeans_soldier"
            }
        },
         recruit_trainer= {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting trainer"),
            actions = {
                "return=skipped unless economy needs europeans_trainer_advanced",
                "consume=europeans_recruit",
                "consume=armor spear_wooden meal wine quartz,diamond",
                "animate=working duration:120s",
                "recruit=europeans_trainer_advanced"
            }
        },
    },
}

pop_textdomain()
