push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

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
         basename = "idle", -- TODO(GunChleoc): No animation yet.
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
    enhancement = {
        name = "europeans_trainingscamp_level_1",
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
    buildcost = {
        blackwood = 2,
        planks = 2,
        reed = 2,
        granite = 2,
        quartz = 1,
        diamond = 1,
        gold = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 1,
        quartz = 1,
        diamond = 1,
        scrap_metal_mixed = 1
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        --normal_ai_limit = 4,
    },

    working_positions = {
        europeans_trainer_basic = 1
    },

    inputs = {
        { name = "europeans_recruit", amount = 2 },
        { name = "coin_wood", amount = 2 },
        { name = "quartz", amount = 2 },
        { name = "diamond", amount = 2 }
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
                "consume=coin_wood quartz,diamond",
                "animate=working duration:180s",
                "recruit=europeans_soldier"
            }
        },
    },
}

pop_textdomain()

