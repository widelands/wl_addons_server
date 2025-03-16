push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/helmsmithy/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_tailors_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Tailors House"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
      idle = {
         hotspot = { 65, 83 },
      },
      unoccupied = {
         hotspot = { 65, 83 },
      },
    },
    spritesheets = {
      build = {
         frames = 4,
         rows = 2,
         columns = 2,
         hotspot = { 65, 83 }
      },
      working = {
         fps = 20,
         frames = 20,
         rows = 5,
         columns = 4,
         hotspot = { 65, 83 }
      },
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_tailors_house_advanced",
        enhancement_cost = {
            brick = 2,
            grout = 2,
            planks = 2
        },
        enhancement_return_on_dismantle = {
            scrap_wood = 2,
            granite = 2
        },
    },
    buildcost = {
        granite = 3,
        log = 3,
        reed = 3
    },
    return_on_dismantle = {
        scrap_wood = 3,
        granite = 2
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },

    working_positions = {
        europeans_worker_basic = 2
    },

    inputs = {
        { name = "armor", amount = 8 },
        { name = "blackwood", amount = 4 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_armor_wooden",
                "sleep=duration:30s",
                "call=produce_armor_processed",
                "return=skipped"
            }
        },
        produce_armor_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden armor because ...
            descname = pgettext("europeans_building", "making a wooden armor"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs armor_wooden",
                "return=skipped when economy needs armor and not economy needs armor_wooden",
                "return=skipped when economy needs armor_processed and not economy needs armor_wooden",
                "consume=blackwood armor",
                "playsound=sound/atlanteans/saw/sawing priority:60% allow_multiple",
                "animate=working duration:10m",
                "playsound=sound/barbarians/weaver priority:90% allow_multiple",
                "produce=armor_wooden:2"
            }
        },
        produce_armor_processed = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring processed armor because ...
            descname = pgettext("europeans_building", "tailoring processed armor"),
            actions = {
                "return=skipped when economy needs armor and not economy needs armor_processed",
                "return=skipped when economy needs armor_wooden and not economy needs armor_processed",
                "consume=armor:3",
                "playsound=sound/barbarians/weaver priority:90% allow_multiple",
                "animate=working duration:10m",
                "produce=armor_processed:2"
            }
        }
    },
}

pop_textdomain()
