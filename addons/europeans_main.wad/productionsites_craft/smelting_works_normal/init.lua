push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

wl.Descriptions():new_productionsite_type {
    name = "europeans_smelting_works_normal",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Normal Smelting Works"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 62, 76 },
      },
      working = {
         basename = "idle",
         hotspot = { 62, 76 },
      }
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_smelting_works_advanced",
        enhancement_cost = {
            planks = 2,
            brick = 2,
            marble = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2,
            marble = 2,
            scrap_iron = 1
        }
    },

    aihints = {},

    working_positions = {
        europeans_worker_normal = 1,
        europeans_worker_basic = 1
    },

    inputs = {
        { name = "coal", amount = 8 },
        { name = "ore", amount = 8 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=smelting_ore",
                "return=skipped"
            }
        },
        smelting_ore = {
            -- TRANSLATORS: Completed/Skipped/Did not start smelting ore because ...
            descname = pgettext("europeans_building", "smelting ore"),
            actions = {
                "return=skipped when economy needs coal and not economy needs iron",
                "consume=ore:4 coal:4",
                "playsound=sound/metal/fizzle priority:15% allow_multiple",
                "animate=working duration:2m",
                "playsound=sound/metal/ironping priority:60%",
                "animate=working duration:2m",
                "playsound=sound/metal/ironping priority:60%",
                "produce=iron:4"
            }
        }
    },
}

pop_textdomain()
