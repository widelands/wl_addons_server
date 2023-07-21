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
    destructible = true,
    
    enhancement = {
        name = "europeans_trainingscamp_normal",
        enhancement_cost = {
            blackwood = 3,
            cloth = 3,
            grout = 3,
            marble_column = 1,
            quartz = 1
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 3,
            granite = 3,
            marble = 1,
            quartz = 1
        },
    },
    buildcost = {
        log = 4,
        reed = 4,
        granite = 4,
        marble_column = 1,
        quartz = 1
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 2,
        marble = 1,
        quartz = 1
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
        { name = "spear_wooden", amount = 2 },
        { name = "helmet_wooden", amount = 2 },
        { name = "armor_wooden", amount = 2 },
        { name = "boots_wooden", amount = 2 },
        { name = "coin_wood", amount = 4 }
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
                "return=failed unless site has boots_wooden",
                "return=failed unless site has armor_wooden",
                "return=failed unless site has helmet_wooden",
                "return=failed unless site has spear_wooden",
                "return=failed unless site has coin_wood:2",
                "consume=europeans_recruit",
                "consume=boots_wooden",
                "animate=working duration:20s",
                "consume=armor_wooden",
                "animate=working duration:20s",
                "consume=helmet_wooden",
                "animate=working duration:20s",
                "consume=spear_wooden",
                "animate=working duration:20s",
                "consume=coin_wood:2",
                "animate=working duration:20s",
                "recruit=europeans_soldier"
            }
        },
    },
}

pop_textdomain()

