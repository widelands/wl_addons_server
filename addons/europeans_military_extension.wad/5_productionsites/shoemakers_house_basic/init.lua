push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/metal_workshop/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_shoemakers_house_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Shoemakers House"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    animations = {
        idle = {
            hotspot = { 57, 76 },
        },
        unoccupied = {
            hotspot = { 57, 76 },
        },
    },
    spritesheets = {
        working = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 57, 64 }
        },
        build = {
            frames = 4,
            rows = 2,
            columns = 2,
            hotspot = { 57, 64 }
        }
    },
    
    size = "medium",
    enhancement = {
        name = "europeans_shoemakers_house_advanced",
        enhancement_cost = {
            brick = 2,
            grout = 2
        },
        enhancement_return_on_dismantle = {
            granite = 2
        }
    },
    buildcost = {
        granite = 3,
        planks = 3
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
        { name = "blackwood", amount = 4 },
        { name = "balsa", amount = 4 },
        { name = "cloth", amount = 4 },
        { name = "leather", amount = 2 },
        { name = "rubber", amount = 2 }
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=produce_boots_wooden",
                "sleep=duration:30s",
                "call=produce_boots_sturdy",
                "return=skipped"
            }
        },
        produce_boots_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden boots because ...
            descname = pgettext("europeans_building", "making a pair of wooden boots"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs boots_wooden",
                "return=skipped when economy needs balsa and not economy needs boots_wooden",
                "return=skipped when economy needs cloth and not economy needs boots_wooden",
                "return=skipped when economy needs boots_sturdy and not economy needs boots_wooden",
                "consume=blackwood balsa",
                "playsound=sound/atlanteans/saw/sawing priority:60% allow_multiple",
                "animate=working duration:5m",
                "consume=cloth",
                "playsound=sound/barbarians/weaver priority:90% allow_multiple",
                "animate=working duration:5m",
                "produce=boots_wooden:2"
            }
        },
        produce_boots_sturdy = {
            -- TRANSLATORS: Completed/Skipped/Did not start making study boots because ...
            descname = pgettext("europeans_building", "making study boots"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs boots_sturdy",
                "return=skipped when economy needs balsa and not economy needs boots_sturdy",
                "return=skipped when economy needs cloth and not economy needs boots_sturdy",
                "return=skipped when economy needs leather and not economy needs boots_sturdy",
                "return=skipped when economy needs boots_wooden and not economy needs boots_sturdy",
                "consume=blackwood balsa",
                "playsound=sound/atlanteans/saw/sawing priority:60% allow_multiple",
                "animate=working duration:4m",
                "consume=cloth leather,rubber",
                "playsound=sound/barbarians/weaver priority:90% allow_multiple",
                "animate=working duration:6m",
                "produce=boots_sturdy:2"
            }
        }
    },
}

pop_textdomain()
