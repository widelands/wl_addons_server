push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/barbarians/warmill/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_manufactory_basic",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Basic Big Manufactory"),
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
        build = {
            frames = 5,
            rows = 3,
            columns = 2,
            hotspot = { 57, 76 }
        },
        working = {
            fps = 10,
            frames = 20,
            rows = 5,
            columns = 4,
            hotspot = { 57, 76 }
        },
    },
   
    size = "big",
    destructible = true,
    
    enhancement = {
        name = "europeans_manufactory_advanced",
        enhancement_cost = {
            brick = 3,
            grout = 3
        },
        enhancement_return_on_dismantle = {
            granite = 3
        }
    },
    
    buildcost = {
        granite = 4,
        planks = 4
    },
    return_on_dismantle = {
        scrap_wood = 4,
        granite = 3,
        scrap_metal = 1
    },

    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },
    
    working_positions = {
        europeans_worker_advanced = 1,
        europeans_worker_basic = 2
    },
    
    inputs = {
        { name = "blackwood", amount = 12 },
        { name = "ironwood", amount = 8 },
        { name = "balsa", amount = 8 },
        { name = "armor", amount = 8 },
        { name = "cloth", amount = 8 },
        { name = "leather", amount = 8 },
        { name = "rubber", amount = 8 },
        { name = "coal", amount = 8 },
        { name = "metal_alloy", amount = 8 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=processing_metal_alloy",
                "call=processing_metal_alloy",
                "call=processing_blackwood",
                "call=precessing_armor",
                "call=processing_metal_alloy",
                "call=processing_metal_alloy",
                "call=processing_blackwood",
                "call=precessing_armor",
                "return=skipped"
            }
        },
        processing_blackwood = {
            -- TRANSLATORS: Completed/Skipped/Did not start processing blackwood for input wares because ...
            descname = pgettext("europeans_building", "processing blackwood to create tools and weapons"),
            actions = {
                "call=producing_armor_wooden",
                "call=producing_boots_wooden",
                "call=producing_helmet_wooden",
                "call=producing_spear_wooden",
            }
        },
        producing_armor_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden armor because ...
            descname = pgettext("europeans_building", "making a wooden armor"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs armor_wooden",
                "return=skipped when economy needs balsa and not economy needs armor_wooden",
                "return=skipped when economy needs armor and not economy needs armor_wooden",
                "return=skipped when economy needs armor_processed and not economy needs armor_wooden",
                "consume=blackwood balsa armor",
                "playsound=sound/atlanteans/saw/sawing priority:60% allow_multiple",
                "animate=working duration:6m",
                "playsound=sound/barbarians/weaver priority:90% allow_multiple",
                "produce=armor_wooden:2"
            }
        },
        producing_boots_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden boots because ...
            descname = pgettext("europeans_building", "making a pair of wooden boots"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs boots_wooden",
                "return=skipped when economy needs balsa and not economy needs boots_wooden",
                "return=skipped when economy needs armor_wooden and not economy needs boots_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs boots_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs boots_wooden",
                "consume=blackwood balsa",
                "playsound=sound/atlanteans/saw/sawing priority:60% allow_multiple",
                "animate=working duration:3m",
                "playsound=sound/barbarians/weaver priority:90% allow_multiple",
                "consume=cloth",
                "animate=working duration:3m",
                "produce=boots_wooden:2"
            }
        },
        producing_helmet_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
            descname = pgettext("europeans_building", "making a wooden helmet"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs helmet_wooden",
                "return=skipped when economy needs ironwood and not economy needs helmet_wooden",
                "return=skipped when economy needs armor_wooden and not economy needs helmet_wooden",
                "return=skipped when economy needs boots_wooden and not economy needs helmet_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs helmet_wooden",
                "consume=blackwood ironwood",
                "playsound=sound/atlanteans/saw/sawing priority:60% allow_multiple",
                "animate=working duration:6m",
                "playsound=sound/barbarians/blackwood priority:60% allow_multiple",
                "produce=helmet_wooden:2"
            }
        },
        producing_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = pgettext("europeans_building", "forging a wooden spear"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs spear_wooden",
                "return=skipped when economy needs ironwood and not economy needs spear_wooden",
                "return=skipped when economy needs armor_wooden and not economy needs spear_wooden",
                "return=skipped when economy needs boots_wooden and not economy needs spear_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs spear_wooden",
                "consume=blackwood ironwood",
                "playsound=sound/atlanteans/saw/sawing priority:60% allow_multiple",
                "animate=working duration:6m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_wooden:2"
            }
        },
        precessing_armor = {
            -- TRANSLATORS: Completed/Skipped/Did not start processing basic armor for input wares because ...
            descname = pgettext("europeans_building", "processing basic armor to create advanced armor"),
            actions = {
                "call=producing_armor_processed",
                "call=producing_boots_sturdy",
            }
        },
        producing_armor_processed = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring processed armor because ...
            descname = pgettext("europeans_building", "tailoring processed armor"),
            actions = {
                "return=skipped when economy needs armor and not economy needs armor_processed",
                "return=skipped when economy needs armor_wooden and not economy needs armor_processed",
                "consume=armor:3",
                "playsound=sound/barbarians/weaver priority:90% allow_multiple",
                "animate=working duration:6m",
                "produce=armor_processed:2"
            }
        },
        producing_boots_sturdy = {
            -- TRANSLATORS: Completed/Skipped/Did not start making study boots because ...
            descname = pgettext("europeans_building", "making study boots"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs boots_sturdy",
                "return=skipped when economy needs cloth and not economy needs boots_sturdy",
                "return=skipped when economy needs leather and not economy needs boots_sturdy",
                "return=skipped when economy needs boots_wooden and not economy needs boots_sturdy",
                "consume=blackwood",
                "playsound=sound/atlanteans/saw/sawing priority:60% allow_multiple",
                "animate=working duration:2m",
                "consume=cloth leather,rubber",
                "playsound=sound/barbarians/weaver priority:90% allow_multiple",
                "animate=working duration:4m",
                "produce=boots_sturdy:2"
            }
        },
        processing_metal_alloy = {
            -- TRANSLATORS: Completed/Skipped/Did not start processing metal_alloy for input wares because ...
            descname = pgettext("europeans_building", "processing metal_alloy to create tools and weapons"),
            actions = {
                "call=producing_helmet_mask",
                "call=producing_spear_advanced",
            }
        },
        producing_helmet_mask = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
            descname = pgettext("europeans_building", "forging a mask"),
            actions = {
                "return=skipped unless economy needs helmet_mask", 
                "consume=coal metal_alloy",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:6m",
                "produce=helmet_mask:2"
            }
        },
        producing_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = pgettext("europeans_building", "forging an advanced spear"),
            actions = {
                "return=skipped unless economy needs spear_advanced", 
                "consume=blackwood coal metal_alloy",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:6m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_advanced:2"
            }
        },
    }
}

pop_textdomain()
