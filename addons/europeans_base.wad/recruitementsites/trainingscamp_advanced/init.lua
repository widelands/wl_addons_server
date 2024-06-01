push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_trainingscamp_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Trainingscamp"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = {51, 71}
      },
      working = {
         basename = "idle",
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
        { name = "europeans_recruit", amount = 4 },
        { name = "spear_wooden", amount = 4 },
        { name = "helmet_wooden", amount = 4 },
        { name = "armor_wooden", amount = 4 },
        { name = "boots_wooden", amount = 4 }
    },
    
    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=pausing_production_for_inputs",
                "sleep=duration:10s",
                "call=recruit_soldier",
                "return=skipped"
            }
        },
        pausing_production_for_inputs = {
            -- TRANSLATORS: Completed/Skipped/Did not start pausing production for tools because ...
            descname = pgettext("europeans_building", "pausing production for waiting for inputs"),
            actions = {
                "return=skipped when not economy needs spear_wooden and not economy needs helmet_wooden and not economy needs armor_wooden and not economy needs boots_wooden",
                "sleep=duration:10m",
            }
        },
        recruit_soldier = {
            -- TRANSLATORS: Completed/Skipped/Did not start recruiting soldier because ...
            descname = pgettext("europeans_building", "recruiting soldier"),
            actions = {
                "return=skipped unless economy needs europeans_soldier",
                "return=failed unless site has boots_wooden:2",
                "return=failed unless site has armor_wooden:2",
                "return=failed unless site has helmet_wooden:2",
                "return=failed unless site has spear_wooden:2",
                "consume=europeans_recruit",
                "consume=boots_wooden",
                "animate=working duration:10s",
                "consume=armor_wooden",
                "animate=working duration:10s",
                "consume=helmet_wooden",
                "animate=working duration:10s",
                "consume=spear_wooden",
                "animate=working duration:10s",
                "recruit=europeans_soldier",
                "sleep=duration:10s",
                "consume=europeans_recruit",
                "consume=boots_wooden",
                "animate=working duration:10s",
                "consume=armor_wooden",
                "animate=working duration:10s",
                "consume=helmet_wooden",
                "animate=working duration:10s",
                "consume=spear_wooden",
                "animate=working duration:10s",
                "recruit=europeans_soldier",
            }
        },
    },
}

pop_textdomain()
