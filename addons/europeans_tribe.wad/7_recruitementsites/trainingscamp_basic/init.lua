push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_trainingscamp_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Trainingscamp"),
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
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "europeans_recruit", amount = 2 },
        { name = "armor", amount = 2 },
        { name = "rubber", amount = 2 },
        { name = "cloth", amount = 2 },
        { name = "metal_alloy", amount = 2 },
        { name = "gold", amount = 2 }
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
                "return=failed unless site has armor",
                "return=failed unless site has rubber",
                "return=failed unless site has cloth",
                "return=failed unless site has metal_alloy",
                "return=failed unless site has gold",
                "consume=europeans_recruit",
                "consume=armor",
                "animate=working duration:10s",
                "consume=rubber",
                "animate=working duration:10s",
                "consume=cloth",
                "animate=working duration:10s",
                "consume=metal_alloy",
                "animate=working duration:10s",
                "consume=gold",
                "animate=working duration:5s",
                "recruit=europeans_soldier"
            }
        },
    },
}

pop_textdomain()

