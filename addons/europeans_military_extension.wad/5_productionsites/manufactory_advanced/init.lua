push_textdomain("europeans_tribe.wad", true)

-- dirname = path.dirname(__file__)
dirname = "tribes/buildings/productionsites/empire/weaponsmithy/"

wl.Descriptions():new_productionsite_type {
    name = "europeans_manufactory_advanced",
    -- TRANSLATORS: This is a building name used in lists of buildings
    descname = pgettext("europeans_building", "Advanced Big Manufactory"),
    icon = dirname .. "menu.png",
    
    animation_directory = dirname,
    spritesheets = {
        idle = {
            frames = 1,
            rows = 1,
            columns = 1,
            hotspot = { 48, 65 },
        },
        build = {
            frames = 4,
            columns = 4,
            rows = 1,
            hotspot = { 48, 65 },
        },
        unoccupied = {
            frames = 1,
            rows = 1,
            columns = 1,
            hotspot = { 48, 65 },
        },
        working = {
            fps = 2,
            frames = 20,
            columns = 10,
            rows = 2,
            hotspot = { 48, 65 },
        },
    },

    size = "big",
    destructible = true,
    
    aihints = {
        very_weak_ai_limit = 1,
        weak_ai_limit = 2,
        normal_ai_limit = 3,
    },
    
    working_positions = {
        europeans_worker_advanced = 2,
        europeans_worker_basic = 2,
    },
    
    inputs = {
        { name = "blackwood", amount = 16 },
        { name = "armor", amount = 16 },
        { name = "cloth", amount = 12 },
        { name = "leather", amount = 12 },
        { name = "rubber", amount = 12 },
        { name = "coal", amount = 12 },
        { name = "metal_alloy", amount = 12 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=processing_metal_alloy",
                "call=processing_cloth",
                "call=processing_blackwood",
                "call=processing_metal_alloy",
                "call=processing_cloth",
                "call=processing_blackwood",
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
                "return=skipped when economy needs armor and not economy needs armor_wooden",
                "return=skipped when economy needs armor_processed and not economy needs armor_wooden",
                "return=skipped when economy needs armor_compressed and not economy needs armor_wooden",
                "return=skipped when economy needs armor_advanced and not economy needs armor_wooden",
                "consume=blackwood armor",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=armor_wooden:2"
            }
        },
        producing_boots_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden boots because ...
            descname = pgettext("europeans_building", "making a pair of wooden boots"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs boots_wooden",
                "return=skipped when economy needs cloth and not economy needs boots_wooden",
                "return=skipped when economy needs boots_sturdy and not economy needs boots_wooden",
                "return=skipped when economy needs boots_swift and not economy needs boots_wooden",
                "return=skipped when economy needs boots_advanced and not economy needs boots_wooden",
                "consume=blackwood",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:2m",
                "consume=cloth",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:2m",
                "produce=boots_wooden:2"
            }
        },
        producing_helmet_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden helmet because ...
            descname = pgettext("europeans_building", "making a wooden helmet"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs helmet_wooden",
                "return=skipped when economy needs armor_wooden and not economy needs helmet_wooden",
                "return=skipped when economy needs boots_wooden and not economy needs helmet_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs helmet_wooden",
                "consume=blackwood",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=helmet_wooden:2"
            }
        },
        producing_spear_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a wooden spear because ...
            descname = pgettext("europeans_building", "forging a wooden spear"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs spear_wooden",
                "return=skipped when economy needs armor_wooden and not economy needs spear_wooden",
                "return=skipped when economy needs boots_wooden and not economy needs spear_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs spear_wooden",
                "consume=blackwood",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_wooden:2"
            }
        },
        processing_cloth = {
            -- TRANSLATORS: Completed/Skipped/Did not start processing reed or cottion for input wares because ...
            descname = pgettext("europeans_building", "processing cloth to create tools and armor"),
            actions = {
                "call=producing_armor_processed",
                "call=producing_boots_sturdy",
                "call=producing_armor_compressed",
                "call=producing_boots_swift",
                "call=producing_armor_advanced",
                "call=producing_boots_advanced",
            }
        },
        producing_armor_processed = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring processed armor because ...
            descname = pgettext("europeans_building", "tailoring processed armor"),
            actions = {
                "return=skipped when economy needs armor and not economy needs armor_processed",
                "return=skipped when economy needs armor_wooden and not economy needs armor_processed",
                "return=skipped when economy needs armor_compressed and not economy needs armor_processed",
                "return=skipped when economy needs armor_advanced and not economy needs armor_processed",
                "consume=armor:3",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=armor_processed:2"
            }
        },
        producing_armor_compressed = {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a suit of chain armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of chain armor"),
            actions = {
                "return=skipped when economy needs armor and not economy needs armor_compressed",
                "return=skipped when economy needs armor_wooden and not economy needs armor_compressed",
                "return=skipped when economy needs armor_processed and not economy needs armor_compressed",
                "return=skipped when economy needs armor_advanced and not economy needs armor_compressed",
                "consume=armor:4",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=armor_compressed:2"
            }
        },
        producing_armor_advanced= {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a suit of advanced armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of advanced armor"),
            actions = {
                "return=skipped when economy needs armor and not economy needs armor_advanced",
                "return=skipped when economy needs armor_wooden and not economy needs armor_advanced",
                "return=skipped when economy needs armor_processed and not economy needs armor_advanced",
                "return=skipped when economy needs armor_compressed and not economy needs armor_advanced",
                "consume=armor:6",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=armor_advanced:2"
            }
        },
        producing_boots_sturdy = {
            -- TRANSLATORS: Completed/Skipped/Did not start making study boots because ...
            descname = pgettext("europeans_building", "making study boots"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs boots_sturdy",
                "return=skipped when economy needs cloth and not economy needs boots_sturdy",
                "return=skipped when economy needs rubber and economy needs leather and not economy needs boots_sturdy",
                "return=skipped when economy needs boots_wooden and not economy needs boots_sturdy",
                "return=skipped when economy needs boots_swift and not economy needs boots_sturdy",
                "return=skipped when economy needs boots_advanced and not economy needs boots_sturdy",
                "consume=blackwood",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:2m",
                "consume=cloth leather,rubber",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:2m",
                "produce=boots_sturdy:2"
            }
        },
        producing_boots_swift = {
            -- TRANSLATORS: Completed/Skipped/Did not start making swift boots because ...
            descname = pgettext("europeans_building", "making swift boots"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs boots_swift",
                "return=skipped when economy needs cloth and not economy needs boots_swift",
                "return=skipped when economy needs rubber and economy needs leather and not economy needs boots_swift",
                "return=skipped when economy needs boots_wooden and not economy needs boots_swift",
                "return=skipped when economy needs boots_sturdy and not economy needs boots_swift",
                "return=skipped when economy needs boots_advanced and not economy needs boots_swift",
                "consume=blackwood",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:2m",
                "consume=cloth leather,rubber:2",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:2m",
                "produce=boots_swift:2"
            }
        },
        producing_boots_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start making advanced boots because ...
            descname = pgettext("europeans_building", "making advanced boots"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs boots_advanced",
                "return=skipped when economy needs cloth and not economy needs boots_advanced",
                "return=skipped when economy needs rubber and economy needs leather and not economy needs boots_advanced",
                "return=skipped when economy needs boots_wooden and not economy needs boots_advanced",
                "return=skipped when economy needs boots_sturdy and not economy needs boots_advanced",
                "return=skipped when economy needs boots_swift and not economy needs boots_advanced",
                "consume=blackwood",
                "playsound=sound/sawmill/sawmill priority:40% allow_multiple",
                "animate=working duration:2m",
                "consume=cloth:2 leather,rubber:2",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:2m",
                "produce=boots_advanced:2"
            }
        },
        processing_metal_alloy = {
            -- TRANSLATORS: Completed/Skipped/Did not start processing metal_alloy for input wares because ...
            descname = pgettext("europeans_building", "processing metal_alloy to create tools and weapons"),
            actions = {
                "call=producing_helmet_mask",
                "call=producing_spear_advanced",
                "call=producing_shield_steel",
                "call=producing_ax_broad",
                "call=producing_shield_advanced",
                "call=producing_sword_broad",
            }
        },
        producing_helmet_mask = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a mask because ...
            descname = pgettext("europeans_building", "forging a mask"),
            actions = {
                "return=skipped when economy needs metal_alloy and not economy needs helmet_mask", 
                "return=skipped when economy needs sword_broad and not economy needs helmet_mask", 
                "return=skipped when economy needs ax_broad and not economy needs helmet_mask", 
                "return=skipped when economy needs spear_advanced and not economy needs helmet_mask", 
                "return=skipped when economy needs shield_advanced and not economy needs helmet_mask", 
                "return=skipped when economy needs shield_steel and not economy needs helmet_mask", 
                "consume=coal metal_alloy",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "produce=helmet_mask:2"
            }
        },
        producing_shield_steel = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a steel shield because ...
            descname = pgettext("europeans_building", "forging a steel shield"),
            actions = {
                "return=skipped when economy needs metal_alloy and not economy needs shield_steel", 
                "return=skipped when economy needs sword_broad and not economy needs shield_steel", 
                "return=skipped when economy needs ax_broad and not economy needs shield_steel", 
                "return=skipped when economy needs spear_advanced and not economy needs shield_steel", 
                "return=skipped when economy needs shield_advanced and not economy needs shield_steel", 
                "return=skipped when economy needs helmet_mask and not economy needs shield_steel", 
                "consume=coal metal_alloy",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "produce=shield_steel:2"
            }
        },
        producing_shield_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced shield because ...
            descname = pgettext("europeans_building", "forging an advanced shield"),
            actions = {
                "return=skipped when economy needs metal_alloy and not economy needs shield_advanced", 
                "return=skipped when economy needs sword_broad and not economy needs shield_advanced", 
                "return=skipped when economy needs ax_broad and not economy needs shield_advanced", 
                "return=skipped when economy needs spear_advanced and not economy needs shield_advanced", 
                "return=skipped when economy needs shield_steel and not economy needs shield_advanced", 
                "return=skipped when economy needs helmet_mask and not economy needs shield_advanced", 
                "consume=coal metal_alloy:2",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "produce=shield_advanced:2"
            }
        },
        producing_spear_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced spear because ...
            descname = pgettext("europeans_building", "forging an advanced spear"),
            actions = {
                "return=skipped when economy needs metal_alloy and not economy needs spear_advanced", 
                "return=skipped when economy needs sword_broad and not economy needs spear_advanced", 
                "return=skipped when economy needs ax_broad and not economy needs spear_advanced", 
                "return=skipped when economy needs shield_advanced and not economy needs spear_advanced", 
                "return=skipped when economy needs shield_steel and not economy needs spear_advanced", 
                "return=skipped when economy needs helmet_mask and not economy needs spear_advanced", 
                "consume=blackwood coal metal_alloy",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_advanced:2"
            }
        },
        producing_ax_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broad ax because ...
            descname = pgettext("europeans_building", "forging a broad ax"),
            actions = {
                "return=skipped when economy needs metal_alloy and not economy needs ax_broad", 
                "return=skipped when economy needs sword_broad and not economy needs ax_broad", 
                "return=skipped when economy needs spear_advanced and not economy needs ax_broad", 
                "return=skipped when economy needs shield_advanced and not economy needs ax_broad", 
                "return=skipped when economy needs shield_steel and not economy needs ax_broad", 
                "return=skipped when economy needs helmet_mask and not economy needs ax_broad", 
                "consume=blackwood coal metal_alloy",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=ax_broad:2"
            }
        },
        producing_sword_broad = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging a broadsword because ...
            descname = pgettext("europeans_building", "forging a broadsword"),
            actions = {
                "return=skipped when economy needs metal_alloy and not economy needs sword_broad", 
                "return=skipped when economy needs ax_broad and not economy needs sword_broad", 
                "return=skipped when economy needs spear_advanced and not economy needs sword_broad", 
                "return=skipped when economy needs shield_advanced and not economy needs sword_broad", 
                "return=skipped when economy needs shield_steel and not economy needs sword_broad", 
                "return=skipped when economy needs helmet_mask and not economy needs sword_broad", 
                "consume=blackwood coal metal_alloy:2",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=sword_broad:2"
            }
        }
    }
}

pop_textdomain()
