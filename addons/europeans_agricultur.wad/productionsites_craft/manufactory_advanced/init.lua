push_textdomain("europeans_tribe.wad", true)

dirname = path.dirname(__file__)

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
        { name = "coal", amount = 12 },
        { name = "metal_alloy", amount = 12 },
        { name = "blackwood", amount = 16 },
        { name = "cloth", amount = 8 },
        { name = "rubber", amount = 8 },
        { name = "leather", amount = 8 },
    },

    programs = {
        main = {
            -- TRANSLATORS: Completed/Skipped/Did not start working because ...
            descname = _"working",
            actions = {
                "call=processing_metal_alloy",
                "call=processing_blackwood",
                "call=processing_metal_alloy",
                "call=processing_blackwood",
                "call=processing_metal_alloy",
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
                "call=producing_armor_advanced",
                "call=producing_boots_advanced",
            }
        },
        producing_armor_wooden = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a wooden armor because ...
            descname = pgettext("europeans_building", "making a wooden armor"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs armor_wooden",
                "return=skipped when economy needs boots_wooden and not economy needs armor_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs armor_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs armor_wooden",
                "consume=blackwood:2 cloth:2 rubber,leather:2",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
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
                "return=skipped when economy needs armor_wooden and not economy needs boots_wooden",
                "return=skipped when economy needs helmet_wooden and not economy needs boots_wooden",
                "return=skipped when economy needs spear_wooden and not economy needs boots_wooden",
                "consume=blackwood:2 cloth:2 rubber,leather:2",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
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
                "consume=blackwood:2 rubber,leather:2",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
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
                "consume=blackwood:2",
                "playsound=sound/atlanteans/saw/benchsaw priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_wooden:2"
            }
        },
        producing_armor_advanced= {
            -- TRANSLATORS: Completed/Skipped/Did not start tailoring a suit of advanced armor because ...
            descname = pgettext("europeans_building", "tailoring a suit of advanced armor"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs boots_advanced",
                "return=skipped when economy needs cloth and not economy needs armor_advanced",
                "return=skipped when economy needs rubber and not economy needs armor_advanced",
                "return=skipped when economy needs armor_wooden and not economy needs armor_advanced",
                "return=skipped when economy needs boots_wooden and not economy needs armor_advanced",
                "return=skipped when economy needs helmet_wooden and not economy needs armor_advanced",
                "return=skipped when economy needs spear_wooden and not economy needs armor_advanced",
                "return=skipped when economy needs boots_advanced and not economy needs armor_advanced",
                "consume=blackwood:2 cloth:2 leather,rubber:2",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=armor_advanced:2"
            }
        },
        producing_boots_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start making advanced boots because ...
            descname = pgettext("europeans_building", "making advanced boots"),
            actions = {
                "return=skipped when economy needs blackwood and not economy needs boots_advanced",
                "return=skipped when economy needs cloth and not economy needs boots_advanced",
                "return=skipped when economy needs rubber and not economy needs boots_advanced",
                "return=skipped when economy needs armor_wooden and not economy needs boots_advanced",
                "return=skipped when economy needs boots_wooden and not economy needs boots_advanced",
                "return=skipped when economy needs helmet_wooden and not economy needs boots_advanced",
                "return=skipped when economy needs spear_wooden and not economy needs boots_advanced",
                "return=skipped when economy needs armor_advanced and not economy needs boots_advanced",
                "consume=blackwood:2 cloth:2 leather,rubber:2",
                "playsound=sound/mill/weaving priority:90%",
                "animate=working duration:4m",
                "produce=boots_advanced:2"
            }
        },
        processing_metal_alloy = {
            -- TRANSLATORS: Completed/Skipped/Did not start processing metal_alloy for input wares because ...
            descname = pgettext("europeans_building", "processing metal_alloy to create tools and weapons"),
            actions = {
                "call=producing_buckets",
                "call=producing_basket",
                "call=producing_felling_ax",
                "call=producing_scythe",
                "call=producing_pick",
                "call=producing_hammer",
                "call=producing_saw",
                "call=producing_shovel",
                "call=producing_shield_advanced",
                "call=producing_spear_advanced"
            }
        },
        producing_basket = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a basket because ...
            descname = pgettext("europeans_building", "making baskets"),
            actions = {
                "return=skipped unless economy needs basket",
                "consume=blackwood:2 coal metal_alloy",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=basket:3"
            }
        },
        producing_buckets = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pair of buckets because ...
            descname = pgettext("europeans_building", "making buckets"),
            actions = {
                "return=skipped unless economy needs buckets", 
                "consume=blackwood:2 coal metal_alloy",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=buckets:3"
            }
        },
        producing_felling_ax = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a felling ax because ...
            descname = pgettext("europeans_building", "making felling axes"),
            actions = {
                "return=skipped unless economy needs felling_ax", 
                "consume=blackwood:2 coal metal_alloy",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=felling_ax:3"
            }
        },
        producing_hammer = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a hammer because ...
            descname = pgettext("europeans_building", "making hammers"),
            actions = {
                "return=skipped unless economy needs hammer", 
                "consume=blackwood:2 coal metal_alloy",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=hammer:3"
            }
        },
        producing_pick = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a pick because ...
            descname = pgettext("europeans_building", "making picks"),
            actions = {
                "return=skipped unless economy needs pick", 
                "consume=blackwood:2 coal metal_alloy",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=pick:3"
            }
        },
        producing_saw = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a saw because ...
            descname = pgettext("europeans_building", "making saws"),
            actions = {
                "return=skipped unless economy needs saw", 
                "consume=blackwood:2 coal metal_alloy",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=saw:3"
            }
        },
        producing_scythe = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a scythe because ...
            descname = pgettext("europeans_building", "making sycthes"),
            actions = {
                "return=skipped unless economy needs scythe", 
                "consume=blackwood:2 coal metal_alloy",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=scythe:3"
            }
        },
        producing_shovel = {
            -- TRANSLATORS: Completed/Skipped/Did not start making a shovel because ...
            descname = pgettext("europeans_building", "making shovels"),
            actions = {
                "return=skipped unless economy needs shovel", 
                "consume=blackwood:2 coal metal_alloy",
                "playsound=sound/smiths/toolsmith priority:50% allow_multiple",
                "animate=working duration:3m",
                "produce=shovel:3"
            }
        },
        producing_shield_advanced = {
            -- TRANSLATORS: Completed/Skipped/Did not start forging an advanced shield because ...
            descname = pgettext("europeans_building", "forging an advanced shield"),
            actions = {
                "return=skipped when economy needs metal_alloy and not economy needs shield_advanced", 
                "return=skipped when economy needs spear_advanced and not economy needs shield_advanced", 
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
                "return=skipped when economy needs shield_steel and not economy needs spear_advanced", 
                "consume=blackwood:2 coal metal_alloy",
                "playsound=sound/smiths/smith priority:50% allow_multiple",
                "animate=working duration:4m",
                "playsound=sound/smiths/sharpening priority:90%",
                "produce=spear_advanced:2"
            }
        }
    }
}

pop_textdomain()
