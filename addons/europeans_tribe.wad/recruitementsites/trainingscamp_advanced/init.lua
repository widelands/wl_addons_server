push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_trainingscamp_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Trainingscamp"),
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
    destructible = true,

    aihints = {},

    working_positions = {
        europeans_trainer_advanced = 1,
        europeans_trainer_normal = 1
    },

    inputs = {
        { name = "europeans_recruit", amount = 8 },
        { name = "spear_wooden", amount = 8 },
        { name = "helmet_wooden", amount = 8 },
        { name = "armor_wooden", amount = 8 },
        { name = "boots_wooden", amount = 8 },
        { name = "coin_wood", amount = 12 },
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
                "consume=armor_wooden boots_wooden helmet_wooden spear_wooden",
                "consume=coin_wood:2",
                "animate=working duration:60s",
                "recruit=europeans_soldier",
                "consume=europeans_recruit",
                "consume=armor_wooden boots_wooden helmet_wooden spear_wooden",
                "consume=coin_wood:2",
                "animate=working duration:60s",
                "recruit=europeans_soldier",
                "sleep=duration:30s",
                "consume=europeans_recruit",
                "consume=armor_wooden boots_wooden helmet_wooden spear_wooden",
                "consume=coin_wood:2",
                "animate=working duration:60s",
                "recruit=europeans_soldier",
                "consume=europeans_recruit",
                "consume=armor_wooden boots_wooden helmet_wooden spear_wooden",
                "consume=coin_wood:2",
                "animate=working duration:60s",
                "recruit=europeans_soldier"
            }
        },
    },
}

pop_textdomain()
